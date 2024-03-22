Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B697C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 17:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59EA10E723;
	Fri, 22 Mar 2024 17:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kR0bCLlp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3297112636
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711127642; x=1742663642;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ElimNU5q7V3OQ6SN3+aQZdKRmIXXG7WN8xqMDOLErgU=;
 b=kR0bCLlpDOUuvmo5UUeVfytnobT8q7CkSw7jFh2ZUQ9dRbV8KLr8l172
 qJaiD9dyV7Iu4h4hxUC1GiRavfzotmckYNJupCAYCKFsPCFrenj38hgiR
 4MQXBlvjlVp6VUHw53/OAWtxhwKcKNRtjXORdw/ZoKCCKGdMBHnoa3Os5
 mJqMjNCHQkLT/XzLfUEnzHw7zvl+YW6I6FO3mb2KX0szE2VA9cylTs/2B
 TzVlV+cXZxSRwwu4YjHQe84zijyYMrzoBgo15fC7RfzFV5eI+QHToYumx
 VBZQJ1obCiwInpdumzEgddtN0XCFPUgHdBcAYIfDYMDY471icN35T5Dk0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6051174"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6051174"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 10:14:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="45956466"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 10:14:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:14:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:14:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 10:14:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 10:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbvDEPFu0w4Q4dZwgdXxNFCTpAlf9YMGmQSR5zsMwybC6EoaRsJ/URW12thminIXTSr6FaPdWqB0Ka/VSorqByfk8sRKzERQLQzHWQllxUjAU6qwE+IbEzQMe11mxGQ2wVzPhXqahkTdsQWeN5SX/Y16N5TCUkLUZKKbpZ6WMvqwVHB+kCWWyp8TLf9D6JyuEEpE8vW5V2T3tl2SoLq1DK+VgsxZ99AeWnG3nuFOTmeQ7Q89UGdkz51YExkgMZWjkkn3giDy7DQpFMgfFrXcADZKQ4wNz/2f9wAlDid/3BJor+0RTIgide59fxuff9/1hbWpo/CzR00VNvvYrorISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElimNU5q7V3OQ6SN3+aQZdKRmIXXG7WN8xqMDOLErgU=;
 b=S2HLJJ7E5Q+63QvOoI7y4W4ZufPGmBILhliAijGZt5Asui/Az1pNsJGfWIF4IeYSG/Iig68n8N5v3dwfwQa3k8/6Bl7V5q8hbJKyLmcG51YQ1vtPoXSd2nM1dqqe6Ua/33jHkeESaVhkrBHF7FyqUtrHJBezD9utMOFT/HkNKO4qa0nfd+8tfNSSh365q3jK0VbNlroA9tHpueezLSbHaIcz6DwjIUpTWrwXlyLTy5MNlfUG1zA7wzFqTgoIIHK3bgnE4JKgf94s7MbhNjVmsYF/YUvs73+IA/qX0b835SmS3ejCc7qH8Qshmot9uWS6KJK0QewoSNdyBVkiPkguGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 17:13:59 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 17:13:59 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4] drm/xe/xe_devcoredump: Check NULL before dereferencing
Thread-Topic: [PATCH v4] drm/xe/xe_devcoredump: Check NULL before dereferencing
Thread-Index: AQHafHwBz4MR7zZ1nkmcfUht7L9CB7FD/62A
Date: Fri, 22 Mar 2024 17:13:59 +0000
Message-ID: <414f736aecac2231ec61e19c9e3f2e3099aa712a.camel@intel.com>
References: <20240322172447.3372167-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240322172447.3372167-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA0PR11MB4669:EE_
x-ms-office365-filtering-correlation-id: 58a946a9-2f33-45ea-378a-08dc4a9376b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qjErYAgRcmGwubTextlAhSt1lkc/tQF2okrevP+Ynqt55wmHop9ROF1zQGqIdCEgIYnkJq4ntxjhlu1fcuqKp8la/fORQD2HRmNNPe4k5rawjfcqMAHX5uqg8KSau6tQLxyX4TKiy7d7AU1Z7F5b8Qxv2tdDjWPpxpOMowySbXy2u1K7msMvo5V6XNos2rxXnF/MDdnNgJ55aMwFLAqwO+G7zrZZA9PPk0DwBvyxGxoKxsAiNQhj3tGzvqdCYkuCgcwhD+n6tGixjVbm89wB0TNcfoeT3hHODYuw3enGaeM31sJuKXQcht9J+CiAWA8XdCHyfJZ/aHsRYZ6SulboKiAAaGePJ/BU9M6KX/6xmNf3H4LtBhrMB9dDGi6AufvX4o/+TAGLcEiTNN3eYCvBwvcFmI3YlWKOyAyWlbMgCvgaxlBUbLZUO+mufg2i2UhhgcAcq406vs3L3Zu0yAxKxQUSCP8CVwDkYs/Qrey7XGJ7z6rjcm38h+T4xPvs0jWMulr++LxR43Lc6yqT8ANzuPxg/ZYrTgiI7gmYU9kwG3Z3DWZVmcDOLN/ltfNs9qYWJpnpE44WAuxlsBJssqn1NaNaQogaeYLUIntAR/8Q1+7QqGhNwiir+zlgeoppHvS9Yr8NQz/j43SaS3NQEW02pLnkfNtp1Or6+H3MgFL26gzlllHCuf5tG5EQ7+jeaPrEmmIGCaehvQujJTzAGhI1TQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnRSU0hBbXJlZk5aRXRXbU1xYnVwY2NtSFFtZFA3SktlS1BYbmI5UGV3RjVr?=
 =?utf-8?B?akdoVGtMV0R1L2lUV1pGcEFCeFVjZzVLc2UwLzI4bkY0dTdSU3p1b3BiWWN3?=
 =?utf-8?B?ZFBRYmdnRFErdGZyaC9lcWpLYU1sUjk2Uk1VbUNQTDg1eGhITUNYOWUzLzFJ?=
 =?utf-8?B?blJCb0VOYjRDdGxSZWhtSmRkb0J6eGtrTDB5YVdMRG9QTTBRTEY5YVYzbXFr?=
 =?utf-8?B?bEoyeDlMVldFRGJhSEg5WnRyTmxtVmpDL09ERWoxZXR0K3lqamFSSHI0ckpN?=
 =?utf-8?B?L3YxQVVSeWZscUlwalFOeTJQcHZ6bDZmanhxL3lvenlodUl0akVjTFJiT1lM?=
 =?utf-8?B?R2cya3BkZThBaVp5Ym0vRUdlSFV1T1ArVEh5MEc0OTdmV3UyeTNQcVB0bzZY?=
 =?utf-8?B?Y0NBdmx1Si83RjJkbjNZTlQxYzZPcHp3YXRWSnBjTHM5a3R1QUdpUFovSjFM?=
 =?utf-8?B?bHZ3UnVZRDRUQTJDTFd5Z3Nid0V2U0FieFgzMFBTTkdqQklaRFVBZFJ0UC9O?=
 =?utf-8?B?Y3VmWTFmQ0s4S2ZGazR5aldNZEVQT0l4MkRJYXJRM1VlOVk0T3NDK0NYOG4z?=
 =?utf-8?B?bTM3Q0JUZEVyeHlHRVl1SXMza3hMbjdaSzhTaFVRT1hNSEYyWFVjOUdpbDhi?=
 =?utf-8?B?eVFiR1hxRk90clRhb014a0RUNVBGZUhWSjNsTGJzaXZTVVJ4SnA4eFRUTUQ4?=
 =?utf-8?B?SC9EYWxMZmZOZHU5RmNNNGlmNnlibDZjRHFxUWlBOTFnY2ZUZW84R1AwOStB?=
 =?utf-8?B?dnBURUlUWkdVeDduZkFBTG5od3B6Si9GcGxXQ2tabnNPTHpaRDhrZUs4ckFv?=
 =?utf-8?B?SWpDY2FGMHBBa2pRQWFIT3IzT2xOSk9RejJVTERrRjk5RlNyRFF4Tkd2MlhQ?=
 =?utf-8?B?cFpJOVJtVDRQdjNQSlNJK0JvTDB0Ym1Ic25mMG9jSmZIV0V1NlR0L0RnK1ZU?=
 =?utf-8?B?ZnIzTXU3NEppREhWdFZDVEY0MFZhczFkTStjSHUzRWRYWWEzbnorSWlKbk5K?=
 =?utf-8?B?dk1OMVh5c0diNTBnNDBWbDBHSWxWUk1FSUpqWTFuNzllWnNsWC9VaEpFT2dn?=
 =?utf-8?B?ODJ4UzJicnhGUi9DcVo1NDhNMHgvbFhiNUswRnRSU2hhaDQrT3hDdkVqNVVq?=
 =?utf-8?B?Tlh1OWdrcnIyZ29DcXUyTGZQbTA1WFNQRUFyUGFndVpGeXIvQjFqajZ6VkR6?=
 =?utf-8?B?UFgydkhNN1JNVG8wcXEwVHV2WVJHd1lwYXM1VHYvV1dFWlJtcjZBRkViczU1?=
 =?utf-8?B?eVBXQWtXMThVYWVuV0dMY01hK3ZKd0FLeFdJWGhudUM5OHZidHM4YXhvaE1X?=
 =?utf-8?B?VmFIRGpIVXNVWlhMVFFOMmJrRW00TlpxQ0RpaSszQ25HdWVETjl5NTIvd3FM?=
 =?utf-8?B?L1JSdW1YY0I0KytyN3JOb2MrYnZib20rVjl0ZjF4emRRY25icmZacUxzeUJC?=
 =?utf-8?B?QlljOHdiT215cjlrRkhpNEI3L0k1WEFETm1FcFZUclNreHRtMDJrQ0crSExG?=
 =?utf-8?B?cHFuZTNNRlN1cWU4cGRhSjg4amZ6c0p4NDMzTEJ0MHh1UDhycldLUllubXBt?=
 =?utf-8?B?V0g0cTBKa1Z4ZUpCUmwrU3Jzd3N0RndOMEgzKzlnRjF0ZUdSZHRVOU9UVHBl?=
 =?utf-8?B?dzl1b0JjbC9Ta1JJMTJIT3l0VmRmWklRYVlJbVZsQUM2S0tIdEhtQTkzOEwy?=
 =?utf-8?B?b2lobG5HTWJ5MUFDVmtuc1FudzFoMGxxL1lsYzhXT2FWVHg2dENHNndBZVdx?=
 =?utf-8?B?TUVHVXdiWk1GK3JYcGZoZnUrRjk5OS84RURkVmxtaWVrbTFZSUhrbWI5c1Zm?=
 =?utf-8?B?bGs4ZE1ZRzJlcHdqWnVBSnc5ekoxK2ZtU2hZUk1QaUdEczg2aEx3TUYyaldq?=
 =?utf-8?B?dWNkUFdseGhCcHBDcHdCYnUyM1VSVjg5YUp5ZlQwQ09PdlMvNFp6L1lvYUNU?=
 =?utf-8?B?Z2k2eGdsdHMrMTlwMnNLWXc0WXFYOVJyeHlnTG9MVWZqUmE3R2l6Z2pBOTli?=
 =?utf-8?B?TW9EOUR1bVM4MnlSOHAwa2c0aHlpNHJIejNtdjZxTDcvRjVDd0dGMUtNb1p4?=
 =?utf-8?B?ZEdERlgvMUFZTmFjL251TlRCb2pyU2I4VTNPSHUwcHZhWlpKVEhLK20wNUhN?=
 =?utf-8?B?Vm8zemdlaTE2NzZpZkVnckZuNXlZQVh3bWdiT3cwSEh6MnEyamJBelF1cmVy?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44528EFD23535C42976D68ECE577F315@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a946a9-2f33-45ea-378a-08dc4a9376b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 17:13:59.2035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aNwx7lzjOTg698CeLR3z5grpjH1909IBYQ9gRzi3iz4wCFDKuT72UoPs1HKcP9wrSIaNpxWsosqtqlN4Ts32sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
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

T24gRnJpLCAyMDI0LTAzLTIyIGF0IDIyOjU0ICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkg
d3JvdGU6DQo+IERlcmVmZXJlbmNlICdjb3JlZHVtcCcgdG8gYWNjZXNzICd4ZV9kZXZjb3JlZHVt
cF9zbmFwc2hvdCcgb25seSBpZg0KPiAnY29yZWR1bXAnIGlzIG5vdCBOVUxMLA0KPiANCj4gdjIN
Cj4gLSBGaXggY29tbWl0IG1lc3NhZ2VzLg0KPiANCj4gdjMNCj4gLSBEZWZpbmUgdmFyaWFibGVz
IGJlZm9yZSBjb2RlLihBc2h1dG9zaC9Kb3NlKQ0KPiANCj4gdjQNCj4gLSBEcm9wIHJldHVybiBj
aGVjayBmb3IgY29yZWR1bXBfdG9feGUuIChKb3NlL1JvZHJpZ28pDQo+IA0KPiBDYzogQXNodXRv
c2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0QGludGVsLmNvbT4NCj4gQ2M6IEpvc8OpIFJvYmVydG8g
ZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBDYzogUm9kcmlnbyBWaXZpIDxyb2Ry
aWdvLnZpdmlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBIaW1hbCBQcmFzYWQgR2hpbWly
YXkgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBSb2Ry
aWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jIHwgMTAgKysrKysrLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZjb3JlZHVtcC5jDQo+IGluZGV4IDNhNjI2M2VjZmYwMS4uYTk1MTA0M2IyOTQz
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiBAQCAtNzcsMTcgKzc3
LDE5IEBAIHN0YXRpYyBzc2l6ZV90IHhlX2RldmNvcmVkdW1wX3JlYWQoY2hhciAqYnVmZmVyLCBs
b2ZmX3Qgb2Zmc2V0LA0KPiAgCQkJCSAgIHNpemVfdCBjb3VudCwgdm9pZCAqZGF0YSwgc2l6ZV90
IGRhdGFsZW4pDQo+ICB7DQo+ICAJc3RydWN0IHhlX2RldmNvcmVkdW1wICpjb3JlZHVtcCA9IGRh
dGE7DQo+IC0Jc3RydWN0IHhlX2RldmljZSAqeGUgPSBjb3JlZHVtcF90b194ZShjb3JlZHVtcCk7
DQo+IC0Jc3RydWN0IHhlX2RldmNvcmVkdW1wX3NuYXBzaG90ICpzcyA9ICZjb3JlZHVtcC0+c25h
cHNob3Q7DQo+ICsJc3RydWN0IHhlX2RldmljZSAqeGU7DQo+ICsJc3RydWN0IHhlX2RldmNvcmVk
dW1wX3NuYXBzaG90ICpzczsNCj4gIAlzdHJ1Y3QgZHJtX3ByaW50ZXIgcDsNCj4gIAlzdHJ1Y3Qg
ZHJtX3ByaW50X2l0ZXJhdG9yIGl0ZXI7DQo+ICAJc3RydWN0IHRpbWVzcGVjNjQgdHM7DQo+ICAJ
aW50IGk7DQo+ICANCj4gLQkvKiBPdXIgZGV2aWNlIGlzIGdvbmUgYWxyZWFkeS4uLiAqLw0KPiAt
CWlmICghZGF0YSB8fCAhY29yZWR1bXBfdG9feGUoY29yZWR1bXApKQ0KPiArCWlmICghY29yZWR1
bXApDQo+ICAJCXJldHVybiAtRU5PREVWOw0KPiAgDQo+ICsJeGUgPSBjb3JlZHVtcF90b194ZShj
b3JlZHVtcCk7DQo+ICsJc3MgPSAmY29yZWR1bXAtPnNuYXBzaG90Ow0KPiArDQo+ICAJLyogRW5z
dXJlIGRlbGF5ZWQgd29yayBpcyBjYXB0dXJlZCBiZWZvcmUgY29udGludWluZyAqLw0KPiAgCWZs
dXNoX3dvcmsoJnNzLT53b3JrKTsNCj4gIA0KDQo=
