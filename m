Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94667E732D0
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 20:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481EA10E0AE;
	Thu, 28 Sep 2023 20:02:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C303810E0AE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 20:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695931360; x=1727467360;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=1iC3LUxqoleUJhOf6wTBBZzPIL2J7w8hkULYjxAZbCM=;
 b=kgbisOUxb3S5wQP18ZejCyNOmJkwVSvPWigxmxg1jc0wUElhMCp+7Zka
 oJel57lvLq9BJGpLsU7y98HSEvRxP4gW8hbbO4xFfsOsWLkGNdP30EWHV
 kZn+0kYHSrSrA/t6CuJS83TaqTPExJv0/QhYP2LVezH0v7pNXTx+pzNI8
 pYVdNnWhyFlhHC9SkxLUtPDOgWL3Prg/00kdnex/9MOPm9uamjspmhsXY
 PvndwtI12P+NGzgXGkm0f74Ot7gZwwr2f/mN1oBsbnMATh30cke9bEDsK
 Gg7+VT8YhQ48pU1MSDkCOiVCbE2llYexjQwpRlD46Kz7sXhMzGbjbs8Rj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413074155"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="413074155"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 13:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="743195913"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="743195913"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 13:02:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 13:02:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 13:02:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 13:02:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AN81h4SblRqfhWNtmf9YVY8dHyaieVPUfOkc8sGMMwyZgVQHSO5GobjNMNH5byOCy+hTlvLXPSAgADOoyrZpLnf8YT3UqCRurKUkbhkufV4uW5RDJQuW0XIa6qxIiIWGxWb1njNX1SyJWL6tKvI+Fi4Q8Z5eh4TRhqpQsqEplRGABZDlF1RDGfMvWOtMpPK7Y0gjVMUzQSi1CKjuR+zDiSikhWqz0+7kciaH9K+x53jNqxqG8iBPFDgLHk+hNzM7cr2WiMsmcD4Hv0qhrw46dArmXlpOBfiZ18iuGy/l8p37X3X2PcscVSZGRaYTplPLHZrdvnoJJ7OxzO9wYX7epA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iC3LUxqoleUJhOf6wTBBZzPIL2J7w8hkULYjxAZbCM=;
 b=ej6d8GoIo+VBJc4U8LlnCtJCfdF8jXsOCWp/wPkiNXFAEYeikbt/aqngYR/4pvYDMzlEqGPQUwz7J7LH96BEuRXG8Vd8cM1uWF/tprw+/dHcQLL2OO4vP02DzuP9N0vXR4190MiCmG2yVwsUGrMUiDqFIAaTucy/aW6FOXZAp85QpawHXV+K8lBgRv8R34L3lmYHUsaFHqw2GEcpWZSilAa4kRGp/gYd7jjQ9YqeTPDgqV38dQE1hm7UMU/e8pyLfqwTSZR6KPM6SVz40NC9pbpt2tJ5ji67MYIVYaBu262du5pfDoSjy3T456NdjyBCysedLQgV7kPuC6waF12+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB6526.namprd11.prod.outlook.com (2603:10b6:8:8d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Thu, 28 Sep
 2023 20:02:37 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 20:02:37 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [PATCH v6 0/5] PAT and cache coherency support
Thread-Index: AQHZ8fNnV1Vj2nKJaUeYB0ZRPvsdzbAwo3GAgAAGGQA=
Date: Thu, 28 Sep 2023 20:02:36 +0000
Message-ID: <884909b490ab1d6e170a3a9a33cc65a7326411b2.camel@intel.com>
References: <20230928100537.392675-7-matthew.auld@intel.com>
 <b70464b0c79eb96f4dea3b7dcd232feffd48804f.camel@intel.com>
In-Reply-To: <b70464b0c79eb96f4dea3b7dcd232feffd48804f.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB6526:EE_
x-ms-office365-filtering-correlation-id: e33fd860-519b-4783-f085-08dbc05ddc73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6oXEx2PLTO9m/ThmZ/cqUANWJQ+SeSP06qWSN88Zs0EUeJEwPaVESVihD2aejjXY12l3z0I7RRoI9Ctb42DetXKMZq+SYtnTPRC5PK+kUPr/LAoOH8/g0WPyUDHk8do0m41XOWA68XsApC1T8WUa0tHEOLh+BrIr+loyoJcznZsuTEYjK+ijGyVaQQizi1qBdTf5G3hEWgsOrowIYY/GPAQJpiNP6rSzRGAy35tgxIBJC9JE6eN83L8xAMhB2nCKYVVc3ceRJBdlMunrfB6eiRiQ1ny20Abrz5FRTVimBi7xJfJWuIxqIhuUedJNgo2bd4yk9hcqHU2TQARHJ+9jjohmXx3jzeU8K8iVTOinMb2uzM5vLTrSVZFC0xD6pkqqj0r8wr7zMoaXH3BgFnaQlb4KEHH2oMt1S/At4mRG9EkMl9QjPdi6At6eX2vmeklzATMeN+T2lHc0yPHpFhXMFq2v4gFRdXDRDE7pzw7JnFJppZVFEPG95zvVYp7LBb3vmBz3A969ELggt1JJ0CMatu8grRJzD96YFOzQfWutPPwOIrjfQ1cL0KsGQR+Zst0F2uGN+Oobr4MjmAb5GpQw589ilwUEoiuwXXA1kvPELKgyNqK/OOqO0540TJpjV+kICGWOyCIVHKlpbWWOAAorHA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(39860400002)(376002)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(86362001)(6486002)(6512007)(6506007)(2906002)(966005)(36756003)(2616005)(478600001)(71200400001)(8936002)(82960400001)(38100700002)(83380400001)(38070700005)(66946007)(122000001)(5660300002)(41300700001)(76116006)(316002)(26005)(66446008)(8676002)(91956017)(110136005)(64756008)(66476007)(66556008)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXErWWF5UzhLOC9oZUFzVHdiMkF1S0lKejlIZnR4RjN3ZGVkc2N4cVlLekgz?=
 =?utf-8?B?SG5TUnJPK0NEaFFjVWVDU0JqVWs4WHBhUlhEZ2cvbm5Hc21WcVZqMHdNSWlO?=
 =?utf-8?B?bXc3cUpUdzVGTnR2VEZIU1hya1N3citlQjhleHRhZW5rTVNtR0xlSE14QThj?=
 =?utf-8?B?azcyZHVUbjcyUUt5dXEwVnRrenZsVnRDbmpuWjR0T3RXd1V3RVlYYUs1SzVk?=
 =?utf-8?B?SXVRbHFtcTlPZkFBOHVEQjA1UFlvSUFNaG5tRG1iN05lUmZQZE1QdWR3V3Zq?=
 =?utf-8?B?T0VrWkUxL25yTmtrOU9SS0QxRDVhNTZrYVAzRHNuOVBWeXVENnM4Tm9acTd6?=
 =?utf-8?B?V3hmV2tBN3ZHdTlHV0lWMlhPd0xlSGZLdk92dDE2SzFlOFpQMHdPRXpRemUx?=
 =?utf-8?B?dzBGQ2VicXYyQndObkpQMkdZNHI4blB5aE9zM2krNWlqT2MzdUNhazZlaTha?=
 =?utf-8?B?TTN3RWxOZ2IxeSszRVQxb3RITkVBK1haUXlPOHAyNmtXKzhTNTVsRmwwMGNM?=
 =?utf-8?B?bVFEQTNqT0ozN3pRSTlaVjgyWFpUa1BLbnpubEU0WmlaVXBFdXR0YXQ0Q1Ri?=
 =?utf-8?B?M3NZdFIvTS9kR1pCWjE2dmhTcEpHQzBTaEx4Tm0yVDlUR0ZLWjN3ZG1nOGRP?=
 =?utf-8?B?b3dkTWFJcjd5ZWhCMHhBcFJSSGRaYndsRnpQeTE5dm5wZGl4SDZwUjMrMkUy?=
 =?utf-8?B?TTkrQTQ1b3NSTzd4STRFdm1BVWZsV3dIKzlIeGZlL2FXeVY5aFo5dm9tWmZB?=
 =?utf-8?B?MmVScUJ4dXRTVzRTeFA3MnJoWmlXNVY2eU9XT2g1RzB1b0FvNGtLQXI4cWlL?=
 =?utf-8?B?VUt4L2t4bTVGYUlOSUdJWmpZdTFQaXlhczVLWEVwNzBNQ01zamJobk12QjNN?=
 =?utf-8?B?czZVWDFTbm03NkZFc3ZNV3BXOGhETitzVzZlU095OWdBbnp2UzY0RXZWNHl2?=
 =?utf-8?B?d1BCakl0M0NRL1ZPRW05elg2bCtoUXlUemxMN2djZ1F2S1pwcnlXQUhSa3A3?=
 =?utf-8?B?Nm5CdGNhcHd3SUFscHIyR1RKM3JBUnVZbnBLbHVFQ3lGZUxnTVlnaEZ4UWIz?=
 =?utf-8?B?Mnd2c1NNYVFQZ2dZOWNVRUhCek1OQmdWKzRVU1RjNHV6alBvdHhidk1aVjN0?=
 =?utf-8?B?RHdLSVdDbEZDQjluRGhjZSs2UVVZOXY3UWlyVlphd3NWZ1NPMFdxVDNjak9k?=
 =?utf-8?B?Ymk4ZFcrT0IzUUhoMDQxMHpoaGlTaFZvczZNSjBJcldKa0RLaDdFcFJsYzIx?=
 =?utf-8?B?dmI3ZEhIcVd4cE5OSmJybVMxa0V1UForL25JbUFCbFBiakwxZDVhZS84NkZR?=
 =?utf-8?B?OTByRW5jT3lEQlU2L05LaDg4bkRmUlVwQXFSeSs0YjArTWlmWUppZnkxTkw3?=
 =?utf-8?B?cEFRdS9lSkF6WDBCYys1TGxNUzlYTDZqM3piM3dKblFDaDBaWkd6ZGVFZTI3?=
 =?utf-8?B?S1FXRHAzUFd1OHhkRWNjUFMvTWxvY0syWEtPVW93UmpoVEl3cjhYb1JsK0Zj?=
 =?utf-8?B?SnZhVXlDa1BLdFk4Zk9sZFRhU3lRTWl4aUF5S1RxamNuZFBZZVV2ekxLYmxL?=
 =?utf-8?B?TGVnN3p0VUduUVlOTEw4b2JWRWtmT2c4UXA0RmVvTGFLb3cxL1RZMkpUa3lL?=
 =?utf-8?B?a1YwbHdITHdKVm5BK0tEOUFsbjJncWs0TTZLdFkvZ1VCdU1JM3FYQWZndGI2?=
 =?utf-8?B?VU90aVJxMFZ1R1VTMGRhVUhxdndnUFFzMkdPdzBmcmExNTZOWEtQUXJXSWJp?=
 =?utf-8?B?MldyQ3BRMHZRakxhZlk0QjNpaFAvWk5QVnZ2OHRqOGYzQ1NDdS9WL08zZWdL?=
 =?utf-8?B?ODVPZHFjcUhkTE5PNTFCbDNZVXQ0MUVaMnZNcDdHVSsvL3JRclJ0cjVEL0cy?=
 =?utf-8?B?Q0U4UUdqZW1BSkFsSytLc2N3a1c1VGhnSUpTWEdEekZkOEFHZ2k2bVdaQko4?=
 =?utf-8?B?YWhDTDV2ckF5R3RKUTBGVDM4UG5LbXd1anVOTHlyUG1Tc3BsU0NDeW00cm1I?=
 =?utf-8?B?U3cwb1pONTRucnR2LzBxcEVCdUNwUFBkc1kzOVBLSy9DeXRaaEExdzlvbml0?=
 =?utf-8?B?SGE1Wll6T2VqOExEY3RaYUFvUVBmNDh6dnRPUFNlZTdabzcwbE9DOVdqMkdy?=
 =?utf-8?B?Y3daOHVpODIxMVhFSmVReThaRE9YbEpGR0lzaFBvbW1IUy8vd1RnaVEycnJC?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F09BD1CA49735C4DB04DE3A5921B5BD6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33fd860-519b-4783-f085-08dbc05ddc73
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2023 20:02:36.5556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2kMv3FU5Vlu8Wzp3SV6kD7Y0wRMAaIBecMq5o/mJEshg28zMkq6RR4yrTN/3Iu0rBcKTpzO/5ztSisOXJq6Zwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6526
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 0/5] PAT and cache coherency support
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA5LTI4IGF0IDEyOjQwIC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBPbiBUaHUsIDIwMjMtMDktMjggYXQgMTE6MDUgKzAxMDAsIE1hdHRoZXcgQXVs
ZCB3cm90ZToNCj4gPiBCcmFuY2ggYXZhaWxhYmxlIGhlcmU6DQo+ID4gaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL213YS9rZXJuZWwvLS90cmVlL3hlLXBhdC1pbmRleD9yZWZfdHlwZT1o
ZWFkcw0KPiA+IA0KPiA+IEdvYWwgaGVyZSBpcyB0byBhbGxvdyB1c2Vyc3BhY2UgdG8gZGlyZWN0
bHkgY29udHJvbCB0aGUgcGF0X2luZGV4IHdoZW4gbWFwcGluZw0KPiA+IG1lbW9yeSB2aWEgdGhl
IHBwR1RULCBpbiBhZGR0aW9uIHRvIHRoZSBDUFUgY2FjaGluZyBtb2RlLiBUaGlzIGlzIHZlcnkg
bXVjaA0KPiA+IG5lZWRlZCBvbiBuZXdlciBpZ3B1IHBsYXRmb3JtcyB3aGljaCBhbGxvdyBpbmNv
aGVyZW50IEdUIGFjY2Vzcywgd2hlcmUgdGhlDQo+ID4gY2hvaWNlIG92ZXIgdGhlIGNhY2hlIGxl
dmVsIGFuZCBleHBlY3RlZCBjb2hlcmVuY3kgaXMgYmVzdCBsZWZ0IHRvIHVzZXJzcGFjZQ0KPiA+
IGRlcGVuZGluZyBvbiB0aGVpciB1c2VjYXNlLiAgSW4gdGhlIGZ1dHVyZSB0aGVyZSBtYXkgYWxz
byBiZSBvdGhlciBzdHVmZiBlbmNvZGVkDQo+ID4gaW4gdGhlIHBhdF9pbmRleCwgc28gZ2l2aW5n
IHVzZXJzcGFjZSBkaXJlY3QgY29udHJvbCB3aWxsIGFsc28gYmUgbmVlZGVkIHRoZXJlLg0KPiA+
IA0KPiA+IFRvIHN1cHBvcnQgdGhpcyB3ZSBhZGRlZCBuZXcgZ2VtX2NyZWF0ZSB1QVBJIGZvciBz
ZWxlY3RpbmcgdGhlIENQVSBjYWNoZQ0KPiA+IG1vZGUgdG8gdXNlIGZvciBzeXN0ZW0gbWVtb3J5
LCBpbmNsdWRpbmcgdGhlIGV4cGVjdGVkIEdQVSBjb2hlcmVuY3kgbW9kZS4gVGhlcmUNCj4gPiBh
cmUgdmFyaW91cyByZXN0cmljdGlvbnMgaGVyZSBmb3IgdGhlIHNlbGVjdGVkIGNvaGVyZW5jeSBt
b2RlIGFuZCBjb21wYXRpYmxlIENQVQ0KPiA+IGNhY2hlIG1vZGVzLiAgV2l0aCB0aGF0IGluIHBs
YWNlIHRoZSBhY3R1YWwgcGF0X2luZGV4IGNhbiBub3cgYmUgcHJvdmlkZWQgYXMNCj4gPiBwYXJ0
IG9mIHZtX2JpbmQuIFRoZSBvbmx5IHJlc3RyaWN0aW9uIGlzIHRoYXQgdGhlIGNvaGVyZW5jeSBt
b2RlIG9mIHRoZQ0KPiA+IHBhdF9pbmRleCBtdXN0IGJlIGF0IGxlYXN0IGFzIGNvaGVyZW50IGFz
IHRoZSBnZW1fY3JlYXRlIGNvaGVyZW5jeSBtb2RlLiBUaGVyZQ0KPiA+IGFyZSBhbHNvIHNvbWUg
c3BlY2lhbCBjYXNlcyBsaWtlIHdpdGggdXNlcnB0ciBhbmQgZG1hLWJ1Zi4NCj4gPiANCj4gPiB2
MjoNCj4gPiAgIC0gTG9hZHMgb2YgaW1wcm92ZW1lbnRzL3R3ZWFrcy4gTWFpbiBjaGFuZ2VzIGFy
ZSB0byBub3cgYWxsb3cNCj4gPiAgICAgZ2VtX2NyZWF0ZS5jb2hfbW9kZSA8PSBjb2hfbW9kZShw
YXRfaW5kZXgpLCByYXRoZXIgdGhhbiBpdCBuZWVkaW5nIHRvIG1hdGNoDQo+ID4gICAgIGV4YWN0
bHkuIFRoaXMgc2ltcGxpZmllcyB0aGUgZG1hLWJ1ZiBwb2xpY3kgZnJvbSB1c2Vyc3BhY2UgcG92
LiBBbHNvIHdlIG5vdw0KPiA+ICAgICBvbmx5IGNvbnNpZGVyIENPSF9OT05FIGFuZCBDT0hfQVRf
TEVBU1RfMVdBWS4NCj4gPiB2MzoNCj4gPiAgIC0gUmViYXNlLiBTcGxpdCB0aGUgcHRlX2VuY29k
ZSgpIHJlZmFjdG9yaW5nLCBwbHVzIHZhcmlvdXMgc21hbGxlciB0d2Vha3MgYW5kDQo+ID4gICAg
IGZpeGVzLg0KPiA+IHY0Og0KPiA+ICAgLSBSZWJhc2Ugb24gTHVjYXMnIG5ldyBzZXJpZXMuDQo+
ID4gICAtIERyb3AgVUMgY2FjaGUgbW9kZS4NCj4gPiAgIC0gcy9zbWVtX2NwdV9jYWNoaW5nL2Nw
dV9jYWNoaW5nLy4gSWRlYSBpcyB0byBtYWtlIFZSQU0gV0MgZXhwbGljaXQgaW4gdGhlDQo+ID4g
ICAgIHVhcGksIHBsdXMgbWFrZSBpdCBtb3JlIGZ1dHVyZSBwcm9vZi4NCj4gPiB2NToNCj4gPiAg
IC0gUmViYXNlLCBwbHVzIHNvbWUgc21hbGwgdHdlYWtzIGFuZCBmaXhlcy4NCj4gPiB2NjoNCj4g
PiAgIC0gQ0kgaG9va3MgZml4ZXMgKyBjaGVja3BhdGNoLg0KPiA+IA0KPiANCj4gV2l0aCBjb21t
ZW50IGluIHBhdGNoIDMvNiBmaXhlZCB0aGlzIHNlcmllcyBpczoNCj4gUmV2aWV3ZWQtYnk6IEpv
c8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBUZXN0ZWQtYnk6
IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQpIZXJlIHRo
ZSBNZXNhIGltcGxlbWVudGF0aW9uOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVz
YS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvMjU0NjINCg0KPiANCj4gVGhhbmsgeW91DQoNCg==
