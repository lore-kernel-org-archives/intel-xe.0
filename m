Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74191C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 13:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AA710E061;
	Fri, 22 Mar 2024 13:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQUHV8Lz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC5B10E061
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 13:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711115858; x=1742651858;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AZkJlrsyYp7+lJqa0PbA1HhagKnczSrKXCXhCq/knT4=;
 b=eQUHV8LzHTeSAc2GUs7M7BcFWJkjDnf8RF7ZDtd41TK+ymKzMSxYTXoS
 1wn0ULuf+jED73iHZ6l0cF40T1dvXjsdS4+2T3YJXukW2xB6fK1g3wcwS
 Tak0yjulXkZ5JYlHcCku8SsruC97JZz3LkL3BqBmzhuBCvAPBkB2PXEVy
 GapaKsMv7ZGmKHXKWuBRDumVRNz1OAGoFK3pQMd/hjh7DA/lDjtEamn1/
 qDJMmwNdOWXnyAz7WGhgdM7x0MC+GrzJdy/j9koDd6ip6KHgUUgDsNRlu
 ydDBk6nsHQOABsVSieG2Fc4MdnjOUii5JX6wFHMYf4LcdFWiOgK6oFqN/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17558325"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="17558325"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 06:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15345377"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 06:57:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 06:57:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 06:57:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 06:57:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fr//i3u9hKUzx3vk/YByp4QKqhhBafmfaq2aw4Kc79vP3QfcnaNjYUxbSOXYtpV3L/3CqRq7cUEQ/V8rBrjpKpbPAb3I4CrZML9dtx0+8UyEkLNtuI0/gh6oQKKefbLsKJ6EXa7kBq3wsrTlfNBvtjhWp+sGXjRb3g9kPp42V0HGjju6WQRcRt43SzGY/D8FFlHofHayL7olQIPZwtT5OmgFoSQQiD9jjHCuPh9TzahKYNPdOTMUg81MoTIrNO5vBSBOT40KSKrzOjAuj5PhysmMGsaabDHv/t5wWxrPaPeWfi2Z8E8JoSk3AkLrTCuZORn5ecswplIR/gp2/3+YRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZkJlrsyYp7+lJqa0PbA1HhagKnczSrKXCXhCq/knT4=;
 b=lkW1KQhmrKGEpka2HDHxQBX4T+IvPJ24igLdV+yecZCQVIdd5kUJKtSEZpXcvEZUHP9KZH/SvL6nlNerIV8+FrDAaxNMAjuf4cqUPAd3rL2YddtZZzB5RijvnFBMzu4YsPE1vu16Tq8DYOPx9CJhkbDu9EwK8pIYPK9PaF+sTnfIseb2Lhv19bNidxgHxT6cW9Un0udvR8lIKwbNa7kfWEfv8OSchQMepPANDsWWLzgqyF5J25Ia2+m95FZBhaOxCm3c7teRqFRrHL8E3NJn+/fVFgC+olp3D4Y9M/8eTEM6xlvF48WLnX/Y+Zl6KwKx4sNewCJWBOqAbNxGstWWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB7309.namprd11.prod.outlook.com (2603:10b6:8:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 13:57:33 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::c563:8fb8:d95:71ac%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 13:57:32 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe_devcoredump: Check NULL before dereferencing
Thread-Topic: [PATCH v3] drm/xe/xe_devcoredump: Check NULL before dereferencing
Thread-Index: AQHafAtQZ/eeG/Aa5EeQ7IEwlbac5bFDyaqA
Date: Fri, 22 Mar 2024 13:57:32 +0000
Message-ID: <24c1facddb694a5b500a180ba9e19c23eae47607.camel@intel.com>
References: <20240322035810.3347272-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240322035810.3347272-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB7309:EE_
x-ms-office365-filtering-correlation-id: c31a3f84-8b62-4eaf-e120-08dc4a780583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mrUg3TaxqSZtIGUVE/dwoJPQYON4EpS2hZ5AxkJSTYWobY7hsbn+cFsAjN7XN24QzurXifJg7kOOYvdmJvsUjXJx4W4h3RFePz31FmCthq/wsZinHVaaaVpYWzeVp3SNIdCReIBqCvqUw3HiziNWfhzEfukqu+NMRXSXg9jdj+RfE04lou2W/rjVbE70UG9t+OnKq80pD2NkSrcem4+lHGSS5pQKGotPL+0zq0Y2kKM6mmaXRbsF8K8AbCkooUX+nc0gKlAe7rZDpEzj86tTRD90sSxlyRAteBVYNwEsav9bjFy2LunJ2l4FvDMz0RXMikDqpjVIP7aaBj/S1SWB6squ3gzyhMWAtGpxOeQX0yoG12AMIbj6CiTUeIB4LU+q3v3qTPHkxCLdt0wQetpEKJoP/ayNWtbx6aY3jwzOkXEgtVAowA1nM+mc0RQ/d9nXZkgG3Pc7bdQgW89618f2pGUdawfaAhCSsW4h7l7X5JJI2dzOkjO05OyZ2iFmBa5V9fsARPqf7c2c6EslUNk45xFlsc9HTiW0N442yeNzjAvnn9MF1wr4IEWzN6EnHzPfbVvL9KNpNOSmCmmTwn0oifDyGPRv6xdXJdmznJnHOdF36qJU+WN6ARfvJb2BclngeEjYWgjnYvNDInjOVPLjfcQyrTECngfJZTazpBttQQxIwgLXR4cRf0uSJyLbzCP1Q+Dqv6Ad11CuOjGkmLh+lq9U5Uphbm22zm19oNuo0I8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3YwUWE5SXdLb05qS21UeHJINS83QllxQWRhTnc5c2IvYlBGTGUrRmNqSXFC?=
 =?utf-8?B?Mko3ZUZzTEZsTTlZaDVFSlB5UnFlaVV2UUQrNmgzZHExLzgwWThGRVlGMERz?=
 =?utf-8?B?N1RFOVNyWWlrai82R0hEZndoRTdFUXF4QjYvRXRRVWtWUG9WbUUzTzI3Umpi?=
 =?utf-8?B?KzhXTlZGU2I4QVM1T1BQUTNJdVc2cWw1a2xBV2NDNmpLa0M5T2JWWEtvOTNF?=
 =?utf-8?B?ay8rQ2draDVtU1ZCcEZQNldCVG1xWm1FNGc5bDRQb0wxekJZMkE1aGp3QWpL?=
 =?utf-8?B?bVBjWlhLSWxiMm0rMFhzVUJjUldUOW9WZGxZbWp1YW45bG14K3dUbTEwT2tz?=
 =?utf-8?B?cTlpSXVKdHh4cndCWE5IdGZyNjdPa1l4R0MxbzRuN3ZuYzlLUXh1Mm9yM1d1?=
 =?utf-8?B?Q0lEYkJlMWY1cWtyOHpvbCswMlhMbjk4Q1NBeDZxK00yaFoxa2xONXh3eGEw?=
 =?utf-8?B?cnloZ1ZWN1pHaWRmcDdCWGFxZFAzbHdWV0Q1NEIrYzgxQXVuM3pTYXZ6WDZh?=
 =?utf-8?B?dGZXUnJuN2pNOEM4Y0RNbWtTTzdrMFBQUW96U0Y5amRhbm9hUm1DWEhRY0to?=
 =?utf-8?B?NDFiV2t6YlBXcjhrWEo1Rmh6aTU4a0pWdU5LVW5tenVlVmZpeHhrV2JnY3k5?=
 =?utf-8?B?SkVTQmpOcGlpOWl4V3dEU1BOalI5MDFHMHJNVXZVYjNsWUF5SkdlS2JHc3VW?=
 =?utf-8?B?N2IyY2FIUjI4cWJRT2prcEdYMXNvdFRQVW1WWEtLdm5xY2N4QmFxTW5ZcGpk?=
 =?utf-8?B?YmRQMkRQK2RuenZpMENWOWNyS3pXRVltWHBUa1RZRkJ2aVBNQXRkNW5Xa3ow?=
 =?utf-8?B?clBVZkRZYzYrN2lzYk1oQjNNb2E0V0Rzb3Y2MU1DMjg2L0JDNFp5Q3BYb0ZV?=
 =?utf-8?B?SHBOQ3d0ZHRpNGJVTzFyQ21OUTFBZ1hDLzJSMVJvWDlUVmhualVyWE5SK2NJ?=
 =?utf-8?B?Ri9NditpK3ZjdjVMN0VFZkZ2cGllTi9wcnlkTE5pS28rUWxDamZNYzI0TUxP?=
 =?utf-8?B?Nm52MnpTQktwVHVOVkxLUElRcmdnQzJ0TnhCMENtZHd4akdzYnRvNzUranZN?=
 =?utf-8?B?c29ZNUVLU1VxMTNORkc5M1QxOUd1Y1lMM3JBTDlmenJHOTVZakhDczZTQUFO?=
 =?utf-8?B?YUNMQWhwcnFZa1NBTGc5NTlJWU5KVVFGKzlkNnVQR1ZpODhoUjNTR2E0bnhK?=
 =?utf-8?B?NWUwVE9JTmdvY2Y4Q3IvclVUSisyMCtqV2RUWXNjSVdPcERWUE9VdFczMlp6?=
 =?utf-8?B?cmFFaTJOaFRodGowZHpsYmZtMnBhTGxvbkE4RzlCQ1kvM2pRbmozVENzc2JP?=
 =?utf-8?B?SUl0M08zUGpoNzNtclFDYXh3dFhpMXY5TFdvUEd5b2pIMmkwOW5pajlUM1E0?=
 =?utf-8?B?NUZvYWwvUDB0S2h5Y3kxK1I2YlNLQWpOZ1dFL0JPU1Azbm51Q1pOVFFyYzFE?=
 =?utf-8?B?ekJ3L1FZZ2hYWHRQVkVrUzY1SkdVdmptZTVzamxteVNqQ0ZubkpsM0crVmlk?=
 =?utf-8?B?czRiQUxsVGFTRVhGMFFjZHVlNURyL1Q5VUtoLzJjTG5WT21uQm5kZy9USnlR?=
 =?utf-8?B?OFZ2eFZjUGVZbm1ZUzZ1NWpmS0FodzR2M01yU0J6Smlqbjl3SlZwNmZJcUNH?=
 =?utf-8?B?YmxRNFA3RGo2cHU2VnBhaUhDa0J3S0hPQ0ZGUWc2aHBHdWZ1MzlMSnQ4dWp1?=
 =?utf-8?B?c3pFNHB1VVFURURsQ2FnMEEvWEZhbDB3c1JvWG90TXpJMWhOZ3JnaWJmZlFO?=
 =?utf-8?B?STcycGhzTVRBRm1lazZ4ODFSZ2E2Yk92ZVVFd2x5OEFiNE11L1Q5OHpRQ2Fy?=
 =?utf-8?B?K3FyWFcvL2N5V2lXYVFVSGk0ZFYzeUJOS1l3WEx4MGcrVWYrTU9ka3FsNll3?=
 =?utf-8?B?VTRWVjlhRlZSaTUxdlE2dUthZU1MYjN2b3NmQnVVaVJ2c0k2ZVpUYjJ3cmlC?=
 =?utf-8?B?bmJ4bVViZUE4UHJBS1RIM1VnKzFNaTBKZW9SRlB3QWtHZXpJN1BmZFBaNnc1?=
 =?utf-8?B?VVl5a0lZZUN3L0tuUjlkdlpzS3NrVUJjUncxN2FDMDZiVmRWUEYvcy9BM0dx?=
 =?utf-8?B?d3BXKytRaTBNamVzTHlhS0ZEMGJTcWkrUEsyZTZDNTY2VFRIcGNQM3VjWXFG?=
 =?utf-8?B?dklyMG9hckY3NzZsNW1PbzJnSWM5bU52aFJtSTEwbTJ2WE9QMlFidmk2NFdh?=
 =?utf-8?B?dXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88E2F8C331F85D47A4A695589A4D110A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31a3f84-8b62-4eaf-e120-08dc4a780583
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 13:57:32.8687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6Ti9mTpK4uynYFDQ5pASLgVCTFV6VrVfXRR5HZZN8kkAfu7qXZFlM18WByxrUc+BXQi5KuGao6EikWGMz28Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7309
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

T24gRnJpLCAyMDI0LTAzLTIyIGF0IDA5OjI4ICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkg
d3JvdGU6DQo+IERlcmVmZXJlbmNlICdjb3JlZHVtcCcgdG8gYWNjZXNzICd4ZV9kZXZjb3JlZHVt
cF9zbmFwc2hvdCcgb25seSBpZg0KPiAnY29yZWR1bXAnIGlzIG5vdCBOVUxMLA0KPiANCj4gdjIN
Cj4gLSBGaXggY29tbWl0IG1lc3NhZ2VzLg0KPiANCj4gdjMNCj4gLSBEZWZpbmUgdmFyaWFibGVz
IGJlZm9yZSBjb2RlLihBc2h1dG9zaC9Kb3NlKQ0KPiANCj4gQ2M6IEFzaHV0b3NoIERpeGl0IDxh
c2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+DQo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxq
b3NlLnNvdXphQGludGVsLmNvbT4NCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5w
cmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogUm9kcmlnbyBWaXZpIDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZjb3JlZHVtcC5jIHwgMTMgKysrKysrKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3Jl
ZHVtcC5jDQo+IGluZGV4IDdkM2FhNmJkMzUyNC4uNWI3YmUzYjViOTA2IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiBAQCAtNzcsMTcgKzc3LDIyIEBAIHN0YXRpYyBz
c2l6ZV90IHhlX2RldmNvcmVkdW1wX3JlYWQoY2hhciAqYnVmZmVyLCBsb2ZmX3Qgb2Zmc2V0LA0K
PiAgCQkJCSAgIHNpemVfdCBjb3VudCwgdm9pZCAqZGF0YSwgc2l6ZV90IGRhdGFsZW4pDQo+ICB7
DQo+ICAJc3RydWN0IHhlX2RldmNvcmVkdW1wICpjb3JlZHVtcCA9IGRhdGE7DQo+IC0Jc3RydWN0
IHhlX2RldmljZSAqeGUgPSBjb3JlZHVtcF90b194ZShjb3JlZHVtcCk7DQo+IC0Jc3RydWN0IHhl
X2RldmNvcmVkdW1wX3NuYXBzaG90ICpzcyA9ICZjb3JlZHVtcC0+c25hcHNob3Q7DQo+ICsJc3Ry
dWN0IHhlX2RldmljZSAqeGU7DQo+ICsJc3RydWN0IHhlX2RldmNvcmVkdW1wX3NuYXBzaG90ICpz
czsNCj4gIAlzdHJ1Y3QgZHJtX3ByaW50ZXIgcDsNCj4gIAlzdHJ1Y3QgZHJtX3ByaW50X2l0ZXJh
dG9yIGl0ZXI7DQo+ICAJc3RydWN0IHRpbWVzcGVjNjQgdHM7DQo+ICAJaW50IGk7DQo+ICANCj4g
LQkvKiBPdXIgZGV2aWNlIGlzIGdvbmUgYWxyZWFkeS4uLiAqLw0KPiAtCWlmICghZGF0YSB8fCAh
Y29yZWR1bXBfdG9feGUoY29yZWR1bXApKQ0KPiArCWlmICghY29yZWR1bXApDQo+ICsJCXJldHVy
biAtRU5PREFUQTsNCj4gKw0KPiArCXhlID0gY29yZWR1bXBfdG9feGUoY29yZWR1bXApOw0KPiAr
CWlmICgheGUpDQo+ICAJCXJldHVybiAtRU5PREVWOw0KDQp0aGlzIGlzIHJlYWwgYnVnPyBiZWNh
dXNlIEkgY2FuJ3Qgc2VlIGhvdyB0aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCB3aXRoIGEgbnVsbCBk
YXRhLg0KDQppZiB5ZXMuLi4NCg0KaWYgY29yZWR1bXAgaXMgbm90IG51bGwgdGhpcyB3aWxsIG5l
dmVyIHJldHVybiAtRU5PREVWLg0KDQp3b3VsZCBkcm9wIGl0IGFuZCByZXR1cm4gRU5PREVWIGlu
IHRoZSBjaGVjayBhYm92ZS4NCg0KPiAgDQo+ICsJc3MgPSAmY29yZWR1bXAtPnNuYXBzaG90Ow0K
PiArDQo+ICAJLyogRW5zdXJlIGRlbGF5ZWQgd29yayBpcyBjYXB0dXJlZCBiZWZvcmUgY29udGlu
dWluZyAqLw0KPiAgCWZsdXNoX3dvcmsoJnNzLT53b3JrKTsNCj4gIA0KDQo=
