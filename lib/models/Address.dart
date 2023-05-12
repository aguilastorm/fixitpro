/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Address type in your schema. */
@immutable
class Address extends Model {
  static const classType = const _AddressModelType();
  final String id;
  final String? _street;
  final String? _country;
  final String? _city;
  final String? _state;
  final String? _zipCode;
  final User? _user;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  AddressModelIdentifier get modelIdentifier {
      return AddressModelIdentifier(
        id: id
      );
  }
  
  String get street {
    try {
      return _street!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get country {
    try {
      return _country!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get city {
    try {
      return _city!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get state {
    try {
      return _state!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get zipCode {
    return _zipCode;
  }
  
  User? get user {
    return _user;
  }
  
  const Address._internal({required this.id, required street, required country, required city, required state, zipCode, user}): _street = street, _country = country, _city = city, _state = state, _zipCode = zipCode, _user = user;
  
  factory Address({String? id, required String street, required String country, required String city, required String state, String? zipCode, User? user}) {
    return Address._internal(
      id: id == null ? UUID.getUUID() : id,
      street: street,
      country: country,
      city: city,
      state: state,
      zipCode: zipCode,
      user: user);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Address &&
      id == other.id &&
      _street == other._street &&
      _country == other._country &&
      _city == other._city &&
      _state == other._state &&
      _zipCode == other._zipCode &&
      _user == other._user;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Address {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("street=" + "$_street" + ", ");
    buffer.write("country=" + "$_country" + ", ");
    buffer.write("city=" + "$_city" + ", ");
    buffer.write("state=" + "$_state" + ", ");
    buffer.write("zipCode=" + "$_zipCode" + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Address copyWith({String? street, String? country, String? city, String? state, String? zipCode, User? user}) {
    return Address(
      id: id,
      street: street ?? this.street,
      country: country ?? this.country,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      user: user ?? this.user);
  }
  
  Address.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _street = json['street'],
      _country = json['country'],
      _city = json['city'],
      _state = json['state'],
      _zipCode = json['zipCode'],
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'street': _street, 'country': _country, 'city': _city, 'state': _state, 'zipCode': _zipCode, 'user': _user?.toJson()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'street': _street, 'country': _country, 'city': _city, 'state': _state, 'zipCode': _zipCode, 'user': _user
  };

  static final QueryModelIdentifier<AddressModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<AddressModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField STREET = QueryField(fieldName: "street");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField STATE = QueryField(fieldName: "state");
  static final QueryField ZIPCODE = QueryField(fieldName: "zipCode");
  static final QueryField USER = QueryField(
    fieldName: "user",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Address";
    modelSchemaDefinition.pluralName = "Addresses";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Address.STREET,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Address.COUNTRY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Address.CITY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Address.STATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Address.ZIPCODE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Address.USER,
      isRequired: false,
      targetNames: ['userAddressesId'],
      ofModelName: 'User'
    ));
  });
}

class _AddressModelType extends ModelType<Address> {
  const _AddressModelType();
  
  @override
  Address fromJson(Map<String, dynamic> jsonData) {
    return Address.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Address';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Address] in your schema.
 */
@immutable
class AddressModelIdentifier implements ModelIdentifier<Address> {
  final String id;

  /** Create an instance of AddressModelIdentifier using [id] the primary key. */
  const AddressModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'AddressModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is AddressModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}