Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4228FC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 15:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0895E1131C5;
	Tue, 30 Jan 2024 15:01:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452431131B2
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706626864; x=1738162864;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jFTkyCksaHBftZukC11q5TtL5Fokfbttuj1cot2RnYc=;
 b=Z6Atw/qEPXeZC+0pqeo9WpZ5oo6XkZUOG+POss21jdPP3/o5e2GXvTY3
 1UY2ky+drjTkwT4WO1fpqU5olCx8ZIWtrELrT5Q3JF1hUh7hiBNVpc8Y6
 PD0N7yMge8xcM+i2Hi1caU26mJGBb6q3Hg4v/54bPAW+LgwWGkp88Fxwp
 N9Zf4t7CwF1WrtATqcEdUvmZc1Y6BmW6EwkcX/rdoSsujkGs0BGtaiiTA
 sIbJzkizQq6QB8h6v/40BTla7BDPijR0fLtPynjPvbBhsFON6FVOmk0Ms
 oMnNdTt2IeRFUcO1LcfWqpc4r1XNHB0QqGmgI4ZDUMlBYoBTKGVm/1lGC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393733111"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="393733111"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 07:01:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="961306132"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="961306132"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 07:01:03 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 07:01:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 07:01:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 07:01:02 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 07:01:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNOgjjpd/gF6ixx2WDx913tJ5O4qUTKbvJVKcorqcL8YKD/uKEH1PkfG0gOTQSz+67cFM50jTRanjHKSokwLGZi6CHq1tt9bFUPibcEv0fsxC79O8bHMSWsKjIQ4QpRBAjwJXByh/Yu8oWAPsfV3ixAtB84IB9908hVY0vFt8Wv8umFsz5hN/Vxu2UxFalvGQ1ovVHFSZBBJlGJ4zvSfV8BakyYqTEQ2yhoLH1mjqFCWfhiTCy/MEH/JPZRdokLl9+jOdbIWf0KSmDMvB2abybfwN2jZSfpW5Jdyvrty+H9+pWU9RBEH7rCVKVAsHRz+Z8i1HXuN9paDHgrXl+GGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFTkyCksaHBftZukC11q5TtL5Fokfbttuj1cot2RnYc=;
 b=brnAe7LkfmsYq5SjPy9bOh2dtPV8Ww+4vxF4o40tUdCCsRbUINgJWVWzGORWUyM8Oyul8SJ880US3Vv8P4jehCTr2Pz/sQImlkdu3bZ7qaCyW7StEey7xnmnPwIsoich297UjlDVsO6OoaGRmSwUOfiCnWHb7bcetczjaY1Yj7Uf7CbQhzUOyXkt6+abtJaYjlS/91+J3/oSVDDeAAp13vX3hgIg3fyAaiWvhePhmJjAOBktqXqLrGhDvRlS/LFgn56nddg76eJBbJy9O3FhMqRI0hStfjcN+icPDB7HRnyuYY4yh/4c4DTVi0/v6Z2V5NVYvlKaxZV4zHxhtFdboQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SJ2PR11MB8300.namprd11.prod.outlook.com (2603:10b6:a03:548::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 15:01:00 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 15:01:00 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>, "Musial, Ewelina"
 <ewelina.musial@intel.com>
Subject: RE: [RFC 34/34] drm/xe: Enable D3Cold on 'low' VRAM utilization
Thread-Topic: [RFC 34/34] drm/xe: Enable D3Cold on 'low' VRAM utilization
Thread-Index: AQHaUJbZcyp5kRcuY0m+/bYw2gJjbLDwt5GAgAByTYCAAUzG0A==
Date: Tue, 30 Jan 2024 15:01:00 +0000
Message-ID: <CY5PR11MB6211F0E4DADE56FA638E6A88957D2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-35-rodrigo.vivi@intel.com>
 <edf5e029-a310-4bd5-ac06-8d42dd389c9a@intel.com>
 <f45349d57090d1ccdb22acbd94963a104afded9e.camel@intel.com>
In-Reply-To: <f45349d57090d1ccdb22acbd94963a104afded9e.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SJ2PR11MB8300:EE_
x-ms-office365-filtering-correlation-id: 0aa0408e-1a71-47e4-fbf9-08dc21a4457b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lHz0LVTurcT5FjZUsaBwyR/H5lY4sYFS9E65o/e5WQ6f3JQOgaEgpkhPBOEaO03aAvhIsBS4rlQFePmf4VBGbvjXs1ApZLOvWVvyVDv4Xdh8Es7X+emq8+21Rb2Nfq3IZeLho+Rxm7D6D9E2gWrePQtGy+cU35k5uBKPycEeo5OBkuI/E1hT7VoW08KUmSLGb12YqyXpd7vzdDhkqJBPUfdN2nvuPM5FpUZo8puhECZR0THmm/RXEP1fhpD3VcylK1FmmVPcYLhCgGVlGiG3Oly7JTcXe0vubMhp1plAn/BaWto8VaToo/jxyNIzfX/bPbV2PKOc/xeagJv3pPyMRmyL4TVpZVg+iQw/IrDYxQTO78SOe7BimjSgqFDVZpSOgYc4Gfa13Y/mqxSTeAZTdWciYe4rb3nFnP3z2M5MLxt1Ofx93m7dF6u7bY7ermuLje9RBLW0civ19tRBscKMkKtW+VahhW4PRnniVHcKA+IXbVHmVT9S05VlEXuYvyAGHdwJqvan/N16GT5k5AIf7i+/8r/BEIf894krS/d8XCpLdFun5unJsr4IHnlby+zkDBmPJ/jEUcGw6v7BQKbL4FQQp3LgcjRXOTlIojLC79ne/UsABxiHk5G+M80fEQfus32FULIJUx0/bqtlEyEdNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(41300700001)(55016003)(6636002)(38070700009)(316002)(64756008)(66476007)(76116006)(9686003)(478600001)(6506007)(7696005)(53546011)(83380400001)(71200400001)(38100700002)(82960400001)(122000001)(66446008)(33656002)(2906002)(86362001)(110136005)(66556008)(66946007)(5660300002)(8676002)(8936002)(52536014)(32563001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTVueUZnYnlNU0hvVWczMktpUmxaNG1qRFRqaTIzRjR0OG45VFFWMGJSRVRH?=
 =?utf-8?B?NnRVSTNsdFZoMldHV0VIRGZhOEpIRFRaK0I5ZVFPdnpiRzRqYWdNMklKaklY?=
 =?utf-8?B?SGFwWHNQYzBKbWZ4b0duZDZLSmJOMWtYVXlFNnl6RjNZbVRSU24xQlEzVDhu?=
 =?utf-8?B?NjA5WHVnaEp1eDRVV1puMDMxcUJVK21GZVpQeTdRME12cFpnWWxqNlh6Tlg2?=
 =?utf-8?B?TE00TTROckU2NkhERGVQWG5oTWE2NUg5ZHplbkZLNlJkbkZ2cmlQeHcyVjdl?=
 =?utf-8?B?Y3dWYWFoNGRIcTlpYzExRkp4Y0lEemRLT2hGb1F3TXRiU3AySWhWUVpPcWVw?=
 =?utf-8?B?Y1ZuME4yVms2cjlTMEpTc0kzNmg3aENLN04vWERLd3IxL0ZvUWZveUx5UHg3?=
 =?utf-8?B?aVZpak5ZcHNWcUVrOU5wYjJwWG54dUlFTVFoRERKeTFtYVZSQkdhbEhsYTR5?=
 =?utf-8?B?Sk5ROG1Nb1NDQVNPNHBJendjT3YwZlZjZG5wVm9lQzFwdXF4cGVXaWlLTXZE?=
 =?utf-8?B?cDl1WDBFRzNGUjJTQVhaN3BJUmFPOWFLUm9DNE5KOU9oQTM1dWcyeEZYZ0Ex?=
 =?utf-8?B?ZHpsMHZPL3BMcG9DY2dlaE9HOVRLdldPUGdjVmJnQThpY0gvbWFic3BOZFJ2?=
 =?utf-8?B?T3F0T1hkVGgvM3NLYXBnQ1hxeGZEU211OXJZL0wrU2FTc1lRajExeEhyVndK?=
 =?utf-8?B?SzBvTVZ5YkhhYUVUcXE5YTliMXlHUFpBaVREVEN6UGdIUWg5QzFaTE9lM2Iy?=
 =?utf-8?B?WGpkZUsxTGhqRlZMRlJsWjNJYnQ5UzMxRnljaUgxdXE4WmVpc0VWWDY4QnRk?=
 =?utf-8?B?SnNjRkc1Y1VVYkZvK1J6aHRYR0JEN041ZWY2VTB0N3ZTNGlsajh0VWFYdVc1?=
 =?utf-8?B?WHJMbnhzTGFLams0Vi85WE5uMExpRWxraml1V3ZzNTZxT1RmVDVLVlVobkRh?=
 =?utf-8?B?OFlPcnNZWEx4d0FqVGxiVmpTdEZTSkNKVmFiU3J2ZmlSeEwrNmVHV0hTWUxI?=
 =?utf-8?B?VWMydXNIeXFqRHUvZS9EQVRtMlVNMnNTeFZHWGM3UTJjTjlWU0FsRXdTejJN?=
 =?utf-8?B?ak5XVHY1b0o5aGtEb2tQK3VLNXVwUnBvdVNxaGx1Vm1hS2xqRExNcUh5VmhM?=
 =?utf-8?B?M2VJUW1nRFNheUpaUFpCN0puK1U3VjkwOW9zNG1IbFl4Q1luVzJJaHVUUWtY?=
 =?utf-8?B?SlRPamoyblM4OXlpRGdRTVNnSHg1ajFsSUdoUHQza0I2YVQreFZIa2RtY1Fk?=
 =?utf-8?B?cEhkT2UxbzdiQlRtVHpYZC9FYWN0ZEs0dTI4K2d6cUNaOUI4dzQ3TEc5Wkhw?=
 =?utf-8?B?Yk13OFZkdTNHWlovTENvQkpKY01aa0tXYmpmYmpiRm5YZkZrRCtHdUk3VkZ3?=
 =?utf-8?B?R0VOVHM4NTRXS2dsdythMUdCSVV4TU50TllsNENqVzRLNVVGUmlZSmUwWHhH?=
 =?utf-8?B?R2tqTnVnQTd6YUhNZUlVR245OWk2dHdvbm5MWUxzdXBPcDdmektWRm5FQmRN?=
 =?utf-8?B?MVM5ekdKamJ6bHFEeHFjMjZYOHBUL1hkbWVUVkUrUlh5NFZ4TnN0R2JsaTdL?=
 =?utf-8?B?NUltUjd4RG5vWFlkZHBQR2QwQXN2d1BaT3B0VUNoNmcrZllNM3JESjVpQ3lJ?=
 =?utf-8?B?M2FVamkzSGYwV1U2bmhrQW11ek4xQnRXcmgyellpN3BPb1pDUkVGaVBFNWpa?=
 =?utf-8?B?SzZRdGsxQW1jcWl3YnpPdUdack50aXdkQW4xUUNLSG9PdUJ0VnVMUjNGdHpm?=
 =?utf-8?B?NHR2Z2dOSTZzblI0elBiNG9aRzhUbWlvRk1uZHlPRkpMMllKNFNoWHc4U2JT?=
 =?utf-8?B?Q2w1bDl5S296VVljMmhIK0hNZm5CVWZ4SEJWTEVDN21KNGpkQmRlUXIxd3py?=
 =?utf-8?B?YlVHZjErdUFnN2wvRDY0TlhpM2ZRdmJwSGFDbkJXY2RyTTZ0SXdEUlFlNDFM?=
 =?utf-8?B?cE1LZVZyZmpabCtlaGQxOGo4L1ZiSWdCVkNibXR0cFd5ekZrcEJ5WnVsQ09N?=
 =?utf-8?B?clNrdUhKR0JheW9VY2JBbTJST3dqMFF2ZmQ5NjdsdFJyT0xFT2J6Y09XZnF0?=
 =?utf-8?B?ZTRTbmM5ZkUwWTZGR1lZbithVXh3NFJrY2ZHT2VWK0VjaEFMdEJxekZndk1n?=
 =?utf-8?Q?uxrSibAH3rQvNYIRMgOk23qnO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa0408e-1a71-47e4-fbf9-08dc21a4457b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 15:01:00.3501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDVQqMOVnorWYRkOwouSm3wAwc0JTUQb0rSo7EFov/pBSF+dmPOLy2pcjWACx2FdHMX1hlzYxVWwDVKPUw1Gzpc0F0x/aeEotdY1YJh4wls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8300
X-OriginatorOrg: intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2aSwgUm9kcmlnbyA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAzMCwgMjAy
NCAxMjozMSBBTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBLbm9wLCBS
eXN6YXJkIDxyeXN6YXJkLmtub3BAaW50ZWwuY29tPjsNCj4gR3VwdGEsIEFuc2h1bWFuIDxhbnNo
dW1hbi5ndXB0YUBpbnRlbC5jb20+OyBBdWxkLCBNYXR0aGV3DQo+IDxtYXR0aGV3LmF1bGRAaW50
ZWwuY29tPjsgTXVzaWFsLCBFd2VsaW5hIDxld2VsaW5hLm11c2lhbEBpbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUkZDIDM0LzM0XSBkcm0veGU6IEVuYWJsZSBEM0NvbGQgb24gJ2xvdycgVlJB
TSB1dGlsaXphdGlvbg0KPiANCj4gT24gTW9uLCAyMDI0LTAxLTI5IGF0IDEyOjEyICswMDAwLCBN
YXR0aGV3IEF1bGQgd3JvdGU6DQo+ID4gT24gMjYvMDEvMjAyNCAyMDozMCwgUm9kcmlnbyBWaXZp
IHdyb3RlOg0KPiA+ID4gTm93IHRoYXQgd2UgZWxpbWluYXRlZCBhbGwgdGhlIG1lbV9hY2Nlc3Mg
Z2V0L3B1dCB3aXRoIGl0cyBsb2NraW5nDQo+ID4gPiBpc3N1ZXMgZnJvbSB0aGUgaW5uZXIgY2Fs
bHMgb2YgbWlncmF0aW9uLCB3ZSBjYW4gYWxsb3cgRDNDb2xkLg0KPiA+ID4NCj4gPiA+IEVuYWJs
ZSBpdCB3aGVuIFZSQU0gdXRpbGl6YXRpb24gaXMgbG93ZXIgdGhlbiAzMDBNYi4gT24gaGlnaGVy
DQo+ID4gPiB1dGlsaXphdGlvbiB3ZSBvbmx5IGFsbG93IEQzaG90IHNvIHdlIGRvbid0IGluY3Jl
YXNlIHNvIG11Y2ggdGhlDQo+ID4gPiBsYXRlbmN5IG9uIHJ1bnRpbWUgcmVzdW1lIGR1ZSB0byB0
aGUgbWVtb3J5IHJlc3RvcmF0aW9uLg0KPiA+DQo+ID4gTm90ZSB0aGF0IG5vdGhpbmcgaW4gQ0kg
aXMgZDNjb2xkIGNhcGFibGUgaXQgc2VlbXMsIHNvIHRoZXkgd2lsbCBuZXZlcg0KPiA+IHRyaWdn
ZXIgdGhpcyBwYXRoIEFGQUlLLiBBbGwgcGxhdGZvcm1zIHJldHVybjoNCj4gPg0KPiA+IFtkcm06
eGVfcGNpX3Byb2JlIFt4ZV1dIGQzY29sZDogY2FwYWJsZT1ubw0KPiANCj4gQnVtbWVyLi4uIDov
DQo+IA0KPiA+DQo+ID4gSXMgdGhhdCBhIGJ1Zywgb3IgcGVyaGFwcyB0aGVyZSBpcyBzb21ldGhp
bmcgZWxzZSBuZWVkZWQ/IA0KPiANCj4gTm8sIGl0IGlzIG5vdCBhIGJ1ZywgaXQgaXMgYSBsaW1p
dGF0aW9uIGluIHRoZSBERzIgcGFydHMgdGhhdCB3ZSBoYXZlIGluIG91ciBDSS4NCj4gQW5zaHVt
YW4sIGRvIHlvdSBrbm93IGV4YWN0bHkgd2h5IHRoZXNlIENJIHBhcnRzIGFyZSBsaWtlIHRoaXM/
IGFuZCB3aGF0DQo+IHNob3VsZCB3ZSBwdXQgYXMgYSByZXF1aXJlbWVudCBmb3Igb3VyIENJIHRv
IGdldCBwYXJ0cyB0aGF0IGRvIHN1cHBvcnQNCj4gRDNDb2xkPw0KVGhlcmUgYXJlIGNvdXBsZSBw
cmUtcmVxdWlzaXRlICBmcm9tIGNhcmQgYW5kIEhvc3QuDQpQQ0llIENhcmQgOiBQTUMgLSBQb3dl
ciBNYW5hZ2VtZW50IENhcGFiaWxpdGllcyAob2Zmc2V0ID0gMikNCmJpdCgxNSkgMSBYWFhYYiAt
IFBNRSMgY2FuIGJlIGFzc2VydGVkIGZyb20gRDNjb2xkDQoNCkhvc3Q6DQpBQ1BJIF9wcjMgcmVz
b3VyY2VzLCB3aGljaCBkZXBlbmRzIG9uIEJJT1MuDQpJIGhhdmUgbm90aWNlZCB0aGF0IGlmIEFD
UEkgRDNDT0xEIGlzIGRpc2FibGVkIGZyb20gQklPUywgd2UgZG9uJ3Qgc2UgX3ByMyByZXNvdXJj
ZXMuIFNvIHdlIG5lZWQgdG8gcmV2aWV3IHRoZSBIb3N0IEJJT1Mgc2V0dGluZ3MgaW4gQ0kNCg0K
UHJvYmFibHkgd2Ugc2hvdWxkIGFkZCB0aGUgZHJtX2RiZyBsb2cgZm9yIGJvdGggb2YgdGhpcyBy
ZXF1aXJlbWVudCA/DQogICAgICAgIGlmICghcGNpX3BtZV9jYXBhYmxlKHJvb3RfcGRldiwgUENJ
X0QzY29sZCkgfHwgIXBjaV9wcjNfcHJlc2VudChyb290X3BkZXYpKQ0KICAgICAgICAgICAgICAg
IHJldHVybiBmYWxzZTsNClRoYW5rcywNCkFuc2h1bWFuIEd1cHRhLg0KPiANCj4gPiAgTWFpbiBx
dWVzdGlvbg0KPiA+IGlzIGhvdyB0byBnZXQgQ0kgdGVzdCBjb3ZlcmFnZSBmb3IgdGhpcyBoZXJl
Lg0KPiANCj4gV2VsbCwgdGhhdCdzIHRyaWNreSBhbnl3YXlzLiBUaGVyZSBhcmUgbWFueSBvdGhl
ciBmYWN0b3JzIHRoYXQgY2FuIGJsb2NrDQo+IEQzY29sZCB1bmRlcm5lYXRoLiBUbyB2YWxpZGF0
ZSBoZXJlIHNvbWV0aW1lcyBJIG5lZWQgdG8gZm9yY2UgdGhlIHJwbSBhdXRvDQo+IGZvciBhbGwg
dGhlIGRldmljZXMgaW4gdGhlIHNhbWUgcm9vdCBwb3J0LiBXZSBoYXZlIGEgdG9vbCBpbiBJR1Qg
dG8gZG8gdGhhdC4uLg0KPiBwcm9iYWJseSBuZWVkIHNvbWUgYWRhcHRhdGlvbiB0byB4ZS4NCj4g
DQo+IEJ1dCB3ZWxsLCB0aGVyZSdzIG5vIHJlbGlhYmxlIHdheSB0byBlbnN1cmUgdGhhdCB0aGUg
ZW50aXJlIENJIHJ1bnMgd2l0aCBhbHdheXMNCj4gZW50ZXJpbmcgRDNDb2xkLiBVbmxlc3Mgd2Ug
Y2FuIG1ha2UgdGhhdCB0b29sIGFuZCByZXF1ZXN0IENJIGZvbGtzIHRvIGVuc3VyZSBhDQo+IHBy
ZS1zY3JpcHQgYmVmb3JlIGV2ZXJ5IHJ1biBvbiBERzI/DQo+IA0KPiA+DQo+ID4gPg0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+
ID4gLS0tDQo+ID4gPiDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uaCB8IDcgKy0tLS0tLQ0K
PiA+ID4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQ0K
PiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uaCBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5oDQo+ID4gPiBpbmRleCAwYWU0ZjZhNjBjNmQuLmJjNmJk
MmEwMTE4OSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5oDQo+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uaA0KPiA+ID4gQEAgLTgsMTIgKzgs
NyBAQA0KPiA+ID4NCj4gPiA+IMKgICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ID4g
Pg0KPiA+ID4gLS8qDQo+ID4gPiAtICogVE9ETzogVGhyZXNob2xkID0gMCB3aWxsIGJsb2NrIEQz
Q29sZC4NCj4gPiA+IC0gKsKgwqDCoMKgwqDCoCBCZWZvcmUgd2UgY2FuIG1vdmUgdGhpcyB0byBh
IGhpZ2hlciB2YWx1ZSAobGlrZSAzMDApLCB3ZQ0KPiA+ID4gbmVlZCB0bzoNCj4gPiA+IC0gKsKg
wqDCoMKgwqDCoMKgwqDCoMKgIDEuIHJld3JpdGUgdGhlIFZSQU0gc2F2ZSAvIHJlc3RvcmUgdG8g
YXZvaWQgYnVmZmVyDQo+ID4gPiBvYmplY3QgbG9ja3MNCj4gPiA+IC0gKi8NCj4gPiA+IC0jZGVm
aW5lIERFRkFVTFRfVlJBTV9USFJFU0hPTEQgMCAvKiBpbiBNQiAqLw0KPiA+ID4gKyNkZWZpbmUg
REVGQVVMVF9WUkFNX1RIUkVTSE9MRCAzMDAgLyogaW4gTUIgKi8NCj4gPiA+DQo+ID4gPiDCoCBz
dHJ1Y3QgeGVfZGV2aWNlOw0KPiA+ID4NCg0K
