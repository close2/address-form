// Copyright (c) 2017, cl. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:address_form/address.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:angular2_components/src/utils/disposer/disposer.dart';

const CUSTOM_VALUE_ACCESSOR =
    const Provider(NG_VALUE_ACCESSOR, useExisting: AddrComponent, multi: true);

@Component(
  selector: 'addr-form',
  styleUrls: const ['addr_component.css'],
  templateUrl: 'addr_component.html',
  directives: const [materialDirectives],
  providers: const [
    DeferredValidator,
    const Provider(NG_VALIDATORS,
        useExisting: DeferredValidator, multi: true),
    materialProviders,
    NG_VALUE_ACCESSOR,
    CUSTOM_VALUE_ACCESSOR,
    FORM_DIRECTIVES
  ],
)
@Injectable()
class AddrComponent implements ControlValueAccessor<Address> {
  var _disposer = new Disposer.oneShot();
  var _onChange = (_) {};

  ControlGroup formModel;

  @Input()
  Address addr = new Address();

  AddrComponent(FormBuilder fb,
      DeferredValidator dv) {
    formModel = fb.group({
      "cName": ['', Validators.required],
      "cStreet": ['']
    });

    var errorsFn = (_) {
      final errors = <String, dynamic>{};
      formModel.controls.forEach((cName, cControl) => errors.addAll(cControl.errors ?? {}));
      return errors;
    };
    dv.add(errorsFn);
    _disposer.addFunction(() {
      // Kill the validator's handle on the input so that it can be GC'ed
      dv.remove(errorsFn);
    });
  }

  void onChange(var what) {
    print('OnChange called');
    _onChange(addr);
  }

  @override
  void registerOnChange(fn(Address value)) {
    _onChange = fn;
  }

  @override
  void registerOnTouched(fn()) {
    // not implemented
  }

  @override
  void writeValue(Address newAddr) {
    addr = newAddr ?? new Address();
  }
}
