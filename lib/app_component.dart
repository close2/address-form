// Copyright (c) 2017, cl. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:address_form/address.dart';
import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

import 'package:address_form/addr_component/addr_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [materialDirectives, AddrComponent],
  providers: const [materialProviders],
)
class AppComponent {
  //Address addr = new Address.withName('test1');
  Address addr = new Address();
}
