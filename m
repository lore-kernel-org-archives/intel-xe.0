Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BA7C27C41
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 22:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DD210E3DB;
	Wed, 16 Aug 2023 22:16:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3A810E3DB
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 22:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692224196; x=1723760196;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2rUrwvsLNoI7tyb6mlOFMlngCY/piZsR5cRCzoI1VWY=;
 b=jsIvPfBvLVnXG5PptBfr7oBpc4f98DckAmFYacwsRhdP742FK9zOZtTA
 0hmYlerA7teG/07vj4f8+8gzmEMLr63TS8KVOF5od8QC7VnTKtgI5GSu1
 Bmda7XIqQbEmh9+SEdMKvL4YLGUqTW3L1N5hBMzRJOb2UhEPyPIfkBKRC
 4h4KTkt9UKWZwqoAVcbIxzOmB3Vpxn23ZWdggYjBz37jbkUSgTsZWzG89
 7oEmS+vY1O71BfH+FiyPJzPlUq+7umcad0ela/ijh23v1X00lUain6tI8
 bSi7YRHbw0nEQyhns3Tw3EpkHKV+Ehf6E70hFreNdr7BpulzPQ7fXPPgu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352969806"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="352969806"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 15:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980881751"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="980881751"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2023 15:16:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 15:16:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 15:16:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 15:16:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 15:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWHVR+mywTblbQdFJxy5ElFVJQV5v0hN93Q7t+uM3Dkvbx9FS5tKbPDfc3YVrrvyHZ0ML4PJGtZpCHcWIr/bJdf/EZAwLiKBE8Egu0lz0enQMxkqg0ANPGm3HPs8OYPeDLhfEj5NZJPDwTmDNnipW4fGzQBVRNYoONXhKg8DtWT/Kz7gNFC6I0aW5m01FId17O6PEfVD4q/0hZFlQ1HUYo88XwYdmghhlfOBkadAlMI3AOD9rDEwsFh9epMJzsFoEVQJO/lDNTg9YEs6XzkuvSEAn8XeTQEstkexSP9U+rd6TMRZ2abL24YnjKhzixkb3EOVBal8Hndcep/9XVunLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rUrwvsLNoI7tyb6mlOFMlngCY/piZsR5cRCzoI1VWY=;
 b=X4yYA1WbLX4YsGCGc5WhpcEY7ync9Zwc4xsC6l1R1zj3JoSg/nFAvV9+P75yrGOcFE1zV9S7UguNXWIIqpbNdF21yXA6sEDNeApF9o4PjAhUgA5wX7ydMHpkY9geyLLLtgjYtTbMWBKf96LSXz87wCY+XFXNXvLniUn1QhF5mOY03VNTU85bmLJBls+r/wQkXw6p3GBzvvgbsGeCjz6JTYOlnL3bWbngObqHD/izdpNH/IVLElrtukhZWJPfiAWoMCbi2bjQpfydLTUZtsS2jc+e5DFEGnbkjftXcKo8d7Ll5cw1NmH4qDMN+o0nK+wTvXemQpCR7x33PmphiCazeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB7173.namprd11.prod.outlook.com (2603:10b6:208:41b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 22:16:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 22:16:33 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Yu, Effie" <effie.yu@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Zhang, Carl" <carl.zhang@intel.com>,
 "Hazubski, Filip" <filip.hazubski@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Thread-Topic: [PATCH v2 3/4] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
Thread-Index: AQHZz6f7FWbXvmdtkUyx9X2L5aM5rq/tf00A
Date: Wed, 16 Aug 2023 22:16:32 +0000
Message-ID: <c5182c38944d33bc2d379116c55c10d8bff2db55.camel@intel.com>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
 <20230814223734.375449-4-umesh.nerlige.ramappa@intel.com>
 <4793cb528b5977e3bca6fe9d2883fbd8acd68625.camel@intel.com>
 <ZNvGn7kpYmtDMrH6@orsosgc001.jf.intel.com>
In-Reply-To: <ZNvGn7kpYmtDMrH6@orsosgc001.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|IA1PR11MB7173:EE_
x-ms-office365-filtering-correlation-id: 3796ace1-5fef-4162-88ea-08db9ea672bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SC8y0jm+PzKQfdZ4sTuinsgA9bXyrsZ5mgXnBihXNgczPooryBRDUkWVHjWOTpsqJhxKnJYxdHSyVLIasqF/106lSjM9RfJf3pcnfI3vfNTt+jkbIs8bUJOwBr+G0e21w6OKgozW8dRlB8jsug6nH38R4Ngn8jtXUvwTGViMN8FyUXvNd0yN8Esys5KpwfWcB/LFeSNfldLoIKP0J2wZo9MuJ2sg2K1yKpyaEvN7Cnzj7FJsh0cUWPRV95GIGP5+LFoeq6JBn0wUufH2jUTE9b+j94sIZvTqFCfVHjj1BjJ8IIAwF+LuG3eOtJwQyJV/MzrZ6MJIl6bgvQUb9IIbp5iqW6QhHcFNJdPYw2kIaQrU94hkbAXSYi8qzPrioS7lD439gk/H3K+8jsK1xYyj5cGHGKVxzP9CvU+LG5+F9bAoIAxSnkAakikLRFddDrMEsreLDNh1KWMTYHNcWahzxbMZ7DWoQEySED3tn5eCQZ03JkwCvdyPJ7NRjSLXn36120beq9VrW25JUmbw9Y83lg5he9wRMSyxrIpYbo7wVZFCEIDoWz4x1ukdqsBNO7qWBn/IctGYoIE3hArXHD35pUMy5ZDJ8lQrUAv0cNvODsYhgxsxGo8Pc+4mALmZDVZGYAREYMNXK1coSj5wHhu4Og==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(316002)(921005)(54906003)(6636002)(76116006)(66946007)(91956017)(66556008)(66476007)(64756008)(110136005)(66446008)(122000001)(5660300002)(41300700001)(38100700002)(38070700005)(8676002)(4326008)(8936002)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(36756003)(6506007)(71200400001)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjVaRzlrNFhTdTdLNkhFWnpiV1JmODZwLzNxSlpWVVc5OGsrR0I3QmZlUEFs?=
 =?utf-8?B?UmFBbHIxU3RCbkg3M04xZm9RMG11TzQ2eGZUd0toWHZUa2RwWjh3aGZLVE91?=
 =?utf-8?B?dGVpaXRoYzNDWnRKWFU0WWhscnJFYW9YZWtFdXgxVnZ1bktFYzdoZGUxU2E5?=
 =?utf-8?B?Zm95K0xZZzVCdkVqWUk4Z1FKQk5qS1d2ZTdWV21vYmRGNThkOWxRUFc1a0g1?=
 =?utf-8?B?b2tQN2Q0YS84ZmZxYnNoUFNVZG1zTmk3S2N4ZDdkZUZlZGI3cTJZNFFGYTFM?=
 =?utf-8?B?QUsxeHBhc0pISzB3QWsyMXNESVQ2alRLUVZHUFkzQmxnWkppc29SeW9DcDk4?=
 =?utf-8?B?M28xanpGQkF1dG91UTVaZHNFUFlvQVc3VmJDNVBWRTltblR0ZzlSOHdEMzd6?=
 =?utf-8?B?cFNFbVFCRVMvWVV2UVhXNEcyQzBLZXNVbjVFZjlpeXVwbmxUNURZNFA5d2RR?=
 =?utf-8?B?TmVHd3hra2UyaFYrdVRaRnhENVBVdk1ZWExCanBTMWZOVG9LcjRxOG9WNHcz?=
 =?utf-8?B?eDFqV05kMktKVWdFcWJQMTNVY1ZCajczSEZDcFY0YzJXVlRiRkNqanhsb2VN?=
 =?utf-8?B?ejkweEVOcDlWcGgyWmFNVU8wdlF5Y0Y2ZUo5VnZUT1hzcU5YY2FDRFZzZjlu?=
 =?utf-8?B?S3dXRnFFTytCSDcxYW1UVHNnVmd0VGVHdkh4WW9hTnFjMUYrTVJLZ3RiRCs3?=
 =?utf-8?B?WDc0SmVQRmNPZzd4UUlFVjAvRHJDUHIweFR6clFGWnlKM09hMUxJeDZuUXJz?=
 =?utf-8?B?QWFZcjVCempBemVSTVFjd2FZTzB2NlhiOWxSbGxnQ0JkUlNtSGZaci9Nc1dn?=
 =?utf-8?B?UDA0Ri9SV1RvQ1hpd2l0d0ppQjA4cEpoRGhuTnZtUUwzWGpSclBzZUtnWEdC?=
 =?utf-8?B?NzBqd0V0T3pDbDh3bHZoOHp1VlBlUjBXM3N4U0pKTEhXSWNiWURVdXZlTUlE?=
 =?utf-8?B?ZmlPMExFWTZRcWtsZHBoYm80dzVFZnR1VURJbG5PWld4Z3dEQ3AvU2Qwd25O?=
 =?utf-8?B?MDd0WUUvakRsTlhjWnh3M3NGRVRnWUhyZlNUdE1CVmhZa0tYWjFxY0RkaFl0?=
 =?utf-8?B?ZkZsTldtaW1CNVhzcVMwWWFia1Q4Ym9YZmZpV1pQQ1VRdDlzTE9yZ2tJQlNz?=
 =?utf-8?B?M20vaXRpalpaUVh4Tnh6d2VMRFVpeUFQNlBiaFRGTVpPRjBNeHB2ZVJnSkc5?=
 =?utf-8?B?blhZNENNR20zZlFxVmVudXM2QzNGU1J4UUw4dmhYbTI1dU5BVFlURmJxQWlV?=
 =?utf-8?B?T2hTZlJoallma0VZNE9LSDlZK0ZCRUhjY2V5RUw5OGdDWENTVWRFZWR0TXAr?=
 =?utf-8?B?Q2FjM0VwWFBIWitLSG84Nk9Ud0ZMTmVTYStFbGxsZ3ltUXZhdm9LNjNBT0lC?=
 =?utf-8?B?MHF4RVVmTUlacHZPZWpqbXE4SW9lWE1lNUxDeVgxQVJPTjg4WUgwSmN5bnJ4?=
 =?utf-8?B?T25GVVpEck5VVVg2NGszRDF3ejBKdld4Y2NZS0pVLzhXeFE1Q2krYzd1cTEz?=
 =?utf-8?B?UXp1RVQyVDFSbWdoc3NDKzlNUFB1MXp4TXMyWmpqRTFuTWs1aTVxcGc2V2lp?=
 =?utf-8?B?ZFpqTTE5aVUrR1h6SzNqY3dwM1ZycjBla1ExWk5OZmV4ZmVLQUhxWk50bnF2?=
 =?utf-8?B?eERTeTZnSVJqWHFkdjZSejF3bUpMUmxoQlpZaGJBbHd4SEorM0RzWk9ZQ0p5?=
 =?utf-8?B?eFdxUlBobkZTNkk2T1ZldWNoMjBUVy9RQVIzU2NjZE1pR3FaZWRDZW1VYlQx?=
 =?utf-8?B?bVlsQjdydzVNV3pVN3BJd3NMMnJMTG9jVHJVMmNLU0xOTmtta2JJWU1oK2Vw?=
 =?utf-8?B?a1U0aHZ4QlV3NGRNcEhZMUd5MW5VYUpuN01ISitTNzlVY2d1c3ltQ2NsWXEy?=
 =?utf-8?B?YXVkUjEwTFpaYmRXTmZBUDhOa1NzamRxR00wNnlnNUpkWW82L2llTXAvVVly?=
 =?utf-8?B?eGs0TXV3OGZjbUhiZjJwb04rRDhXNzArd1l0R2FIMk5kOGtLd2lKK1UxaGZn?=
 =?utf-8?B?ek9UbHBZMEx6K1UvQm5XT09EeWFzUDBwMHZFdmNWVks3RWNkM20xeWcyWFkv?=
 =?utf-8?B?cHZxWkthUFhLVHdhQ2pOUFpPTlpBdXBzeDFrT1RINTN4ZHhyWkUwNEhxcGll?=
 =?utf-8?B?YW9odGsrR1FmeDc0S2lZRStkdGF5SkluVEpxTWZFanZta1ZCNFZNZkxtWElB?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <690101C6A449DB4DA4C9A30CFF92A55B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3796ace1-5fef-4162-88ea-08db9ea672bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 22:16:32.9511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4qPMDfikvb5DLTGbY5I1ZUMaXeweN2EnNN1fpm/OZeTL/a5eE7joUmAfr6Kj1Zl7GHUiYtHNfQ+OR73t3Usq9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7173
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
Cc: "lionel.g.landwerlin@linux.intel.com"
 <lionel.g.landwerlin@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCk9uIFR1ZSwgMjAyMy0wOC0xNSBhdCAxMTo0MCAtMDcwMCwgVW1lc2ggTmVybGlnZSBSYW1h
cHBhIHdyb3RlOg0KPiBIaSBNYXR0LCBSb2RyaWdvLA0KPiANCj4gSSBoYXZlIGEgdUFQSSBjaGFu
Z2UgaGVyZSB0aGF0IGJyZWFrcyBVTURzLiBIb3cgZG8gSSBsYW5kIHRoaXMgYW5kDQo+IHdoYXQg
DQo+IFVNRHMgc2hvdWxkIEkgaW5mb3JtIGZvciB1cGRhdGluZyB4ZV9kcm0uaD8NCg0KV2UgbmVl
ZCB0byBlbnN1cmUgdGhhdCB3ZSBhcmUgaW4gc3luYyB3aXRoIGFsbCB0aGUgVU1EIGNvbnRhY3Rz
DQooYXMgbGlzdGVkIGluIG91ciBpbnRlcm5hbCBnZngtbGludXggcGFnZSkNCg0KQ2M6IEpvc2Ug
U291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KQ2M6IEZpbGlwIEhhenVic2tpIDxmaWxpcC5o
YXp1YnNraUBpbnRlbC5jb20+DQpDYzogQ2FybCBaaGFuZyA8Y2FybC56aGFuZ0BpbnRlbC5jb20+
DQpDYzogRWZmaWUgWXUgPGVmZmllLnl1QGludGVsLmNvbT4NCkNjOiBLYW1pbCBLb25pZWN6bnkg
PGthbWlsLmtvbmllY3pueUBpbnRlbC5jb20+DQoNCkFsc28sIGVuc3VyZSB0aGF0IGFsbCB0aGUg
Y29tcG9uZW50cyBoYXZlIHRoZWlyIGltcGxlbWVudGF0aW9uDQpyZWFkeSB0byBiZSBhYmxlIHRv
IHB1c2ggYWxsIHNpbXVsdGFuZW91c2x5IGluIHRoZSBsZWFzdCBkaXNydXB0aXZlDQp3YXkuDQoN
Ck5lZWRsZXNzIHRvIHNheSwgYnV0IG1heWJlIHdvcnRoLCB0aGF0IHdlIGFyZSBvbmx5IGRvaW5n
IHRoaXMNCmJlY2F1c2Ugd2UgYXJlIG91dCBvZiB0cmVlIHlldC4gV2Ugd29uJ3QgYmUgYWJsZSB0
byBicmVhayBpdA0KYWdhaW4gc29vbiB3aGVuIHdlIGFyZSBpbiB0cmVlLg0KDQo+IA0KPiBUaGFu
a3MsDQo+IFVtZXNoDQo+IA0KPiBPbiBUdWUsIEF1ZyAxNSwgMjAyMyBhdCAwNzowMzo0MkFNIC0w
NzAwLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjMtMDgtMTQgYXQgMTU6Mzcg
LTA3MDAsIFVtZXNoIE5lcmxpZ2UgUmFtYXBwYSB3cm90ZToNCj4gPiA+IHN0cnVjdCBkcm1feGVf
ZW5naW5lX2NsYXNzX2luc3RhbmNlIG1pZ2h0IGdldCBwYWRkZWQgZm9yIDY0LWJpdA0KPiA+ID4g
YWxpZ25tZW50IGJhc2VkIG9uIGNvbXBpbGVyIHVzZWQuIFNpbmNlIGVuZ2luZSBpbmZvcm1hdGlv
biBpcw0KPiA+ID4ga21hbGxvY2VkDQo+ID4gPiBpbiB0aGUgcXVlcnkgYW5kIGRybV94ZV9lbmdp
bmVfY2xhc3NfaW5zdGFuY2UgbWF5IGJlIHBhZGRlZCwgaXQNCj4gPiA+IGNvdWxkDQo+ID4gPiBw
b3RlbnRpYWxseSBsZWFrIHNvbWUga2VybmVsIG1lbW9yeSB0byB1c2VyLg0KPiA+ID4gDQo+ID4g
PiBBZGQgYSByc3ZkIGZpZWxkIHRvIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNl
IHRvIG1ha2UNCj4gPiA+IGl0DQo+ID4gPiA2NC1iaXQgYWxpZ25lZCBhbmQgemVybyBvdXQgdGhl
IGZpZWxkIGJlZm9yZSByZXR1cm5pbmcgdG8gdXNlci4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogVW1lc2ggTmVybGlnZSBSYW1hcHBhDQo+ID4gPiA8dW1lc2gubmVybGlnZS5yYW1hcHBh
QGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVl
cnkuYyB8IDcgKysrKystLQ0KPiA+ID4gwqBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5owqDCoMKg
wqAgfCAxICsNCj4gPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcXVlcnkuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiA+ID4g
aW5kZXggOTlhNDgwMGM3YzUzLi5iOWQ1NjUyNjRjZWIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3F1ZXJ5LmMNCj4gPiA+IEBAIC02NSw3ICs2NSw3IEBAIHN0YXRpYyBpbnQgcXVlcnlfZW5n
aW5lcyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4g
DQo+ID4gPiAtwqDCoMKgwqDCoMKgwqBod19lbmdpbmVfaW5mbyA9IGttYWxsb2Moc2l6ZSwgR0ZQ
X0tFUk5FTCk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBod19lbmdpbmVfaW5mbyA9IGt6YWxsb2Mo
c2l6ZSwgR0ZQX0tFUk5FTCk7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFod19lbmdpbmVf
aW5mbykNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9N
RU07DQo+ID4gPiANCj4gPiA+IEBAIC03OCw3ICs3OCwxMCBAQCBzdGF0aWMgaW50IHF1ZXJ5X2Vu
Z2luZXMoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfdG9fdXNlcl9lbmdp
bmVfY2xhc3NbaHdlLQ0KPiA+ID4gPmNsYXNzXTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGh3X2VuZ2luZV9pbmZvW2ldLmVuZ2luZV9pbnN0
YW5jZSA9DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaHdlLT5sb2dpY2FsX2luc3RhbmNlOw0KPiA+ID4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBod19lbmdpbmVfaW5mb1tp
KytdLmd0X2lkID0gZ3QtPmluZm8uaWQ7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGh3X2VuZ2luZV9pbmZvW2ldLmd0X2lkID0gZ3QtPmluZm8u
aWQ7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGh3X2VuZ2luZV9pbmZvW2ldLnJzdmQgPSAwOw0KPiA+ID4gKw0KPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpKys7DQo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiA+IA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlm
IChjb3B5X3RvX3VzZXIocXVlcnlfcHRyLCBod19lbmdpbmVfaW5mbywgc2l6ZSkpIHsNCj4gPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiBiL2luY2x1ZGUv
dWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+IGluZGV4IDg2ZjE2ZDUwZTljYy4uNTNjZDU3MzQyNjIw
IDEwMDY0NA0KPiA+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gKysr
IGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gQEAgLTc1Myw2ICs3NTMsNyBAQCBz
dHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSB7DQo+ID4gPiANCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBfX3UxNiBlbmdpbmVfaW5zdGFuY2U7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
X191MTYgZ3RfaWQ7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBfX3UxNiByc3ZkOw0KPiA+IA0KPiA+
IEkgZG9uJ3QgdGhpbmsgdGhpcyBjaGFuZ2Ugc2hvdWxkIGJlIGZpeHVwLCBhcyB0aGlzIGJyZWFr
cyB0aGUgdUFQSS4NCj4gPiBQbGVhc2UgcGluZyB0aGUgUm9kcmlnbywgTWF0dCBCcm9zdC4uLiBh
Ym91dCB3aGF0IHdlIHNob3VsZCBkbw0KPiA+IGhlcmUuDQo+ID4gQnV0IGF0IGxlYXN0IHlvdSBu
ZWVkIHRvIHN5bmMgd2l0aCBvdGhlciBVTUQgY29udGFjdHMgYWJvdXQgbGFuZGluZw0KPiA+IHRo
aXMgY2hhbmdlIGF0IHRoZSBzYW1lIHRpbWUgVU1EcyB1cGRhdGUgdGhlaXIgeGVfZHJtLmguDQo+
ID4gDQo+ID4gPiDCoH07DQo+ID4gPiANCj4gPiA+IMKgc3RydWN0IGRybV94ZV9leGVjX3F1ZXVl
X2NyZWF0ZSB7DQo+ID4gDQoNCg==
