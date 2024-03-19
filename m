Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7ACC54E60
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 09:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051CF10E9D4;
	Tue, 19 Mar 2024 09:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EeCmP1tk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C01610E9D4
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 09:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710840353; x=1742376353;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NPTTyzf///oVELrZuGC0uUer4a6EzLlpHx+13WxHPfA=;
 b=EeCmP1tkv5HAnv8nTXAz3Y56Ac+p4oTC9l+IHGIfZjlflP7jAxyYWxP5
 6Y6lGQsgn8hR66lnRppYnbwcCWnCa+KJ8/IAKSuGBzDQgjT/v92vp6Mz+
 rl+VkbFEKTsfcORevRUv+5iRNG/4mBtjh2CrDTR0Aa5OfFxh11Q5WuVnW
 FGWqIu1hV28ZlbT/L2NCKZ5I53g2TwXJBHd+qUAL1k7c1GI/p23oaik0q
 NoPFtv17sQ9wk0oG29FQfcpC/BJjHuXhCse7Owj0TJIzLpQYvw+wuJg29
 kdpZZDslQpz6Jeqpq2DrpPPloNs3M+YBtslGQus8WwyKfTSJMpARl4JCL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5561518"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5561518"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="14403294"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 02:25:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 02:25:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 02:25:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 02:25:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 02:25:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pd+ygXvpaHq9DYbI5uNCmRLrFBT96NkQ5KLBi0A1alfBw2NiBvXL5f/BnKlpwCAKQC73wfR82VpOc/TwUhvYaQKi1oHnv7Rp2xU9OGefvfYYgtbHoMmQwbWWcSmx6bc73I6eK3NQguS7Sb4X6dH5YEElEbX970P0v4ASwlG345WfS9bBPIEXxUewR5izbgEjWTgtrFKRs/N37KWEQE7JFERA02Dliuv3acgbfWHBVGSYbRuRPjDs8JoEAfkcPaFyql++qLglW8a9qtzkz+13rPz7xm9XY3KOPiaW/7pMzTybfFdQBTBS1BqHhh5SAH1zD+G3wQ5MNfx5gL4af7XdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPTTyzf///oVELrZuGC0uUer4a6EzLlpHx+13WxHPfA=;
 b=Lmnk5uDzsAQNMeSdYHRNXqIM0LokV+jJmw0c4yp3QSMFdWMKqbC4aJDhRN36N9qdH6yTDFSCa4noxkaPzKn2G15mSmpdX3AHzJucpZbeDDgkdNt20ssyRxdadK3+a0Nr4mLLgcXXuq4LlPrYpUdMkzjF8qh/ZXIZVHQorZATk7Qo6CH6L75h8X23/L1C8k9NgVuHxjtu2ZKSt6ayN0TwPnYjvYBUKrpLBIHCfwMijrrvPHhcMkkj0AwgmuS8ZGZ9H3DyNuSUEckEzvDzk733LMMw7i8HU1swCLvYto3glFzWYw1Q9nm68OmmE3vQWaseu3GGSptXpMXqn63+yzMfnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 PH7PR11MB7606.namprd11.prod.outlook.com (2603:10b6:510:271::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.11; Tue, 19 Mar 2024 09:25:48 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::81be:4798:fcb1:288c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::81be:4798:fcb1:288c%3]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 09:25:48 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Zeng, 
 Oak" <oak.zeng@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 2/8] drm/xe/svm: Add DRM_XE_SVM kernel config entry
Thread-Topic: [PATCH 2/8] drm/xe/svm: Add DRM_XE_SVM kernel config entry
Thread-Index: AQHaeacoXdVsK6+IWE22J5XH+Ay4p7E+y4uA
Date: Tue, 19 Mar 2024 09:25:48 +0000
Message-ID: <b467523d7a1e3153f01e6a1b036f5db2ac5760ea.camel@intel.com>
References: <20240319025511.1598354-1-oak.zeng@intel.com>
 <20240319025511.1598354-3-oak.zeng@intel.com>
In-Reply-To: <20240319025511.1598354-3-oak.zeng@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 (3.50.3-1.fc39) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|PH7PR11MB7606:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Iq2YAlqvGeGjSAi/DIR3+TixQ52NfXw7Hr8cc2dPV9RpHTA+HMrZbKHl7gXtNHz3jhMqoZJRgvYcUonpcGSE4eAF+65Gxdb7yWb2zv2JXjeN53suFwvECPcEXyHvxjUG+bWdzlLd7a1/e0Sf7ey2YcH7wHyzmgzw5M4Ltu+Nc1/jLi8xe0lscnDZJi/EfthtAhwSGSPb2GUkPkMhEHutyVrI8xp/CXkYO89XzxhVIJz+hOp8BOOqb6ZBd78nTcDvCxIF0fi0merLtdaH8kilv8BhXlgwvzvSgrQyBHO82MOPVvkmBGyvBSClCcgHBvZOI22coB3DK7AcaPhdobuwtmNzmxBc7xWeVB6tzfLj8AahjzuZiwieNpw+zzqpS1Tx9ohbO+sCC4GAu7GqY3yDYY7MC+1CeMz8xtc483OhOLKoKPThDj3s4Oa9382Pkd2A3FYtjhm2xqfIj3ZIAM9+SkLVnEuwq6aVsGSqJATpgNHb19mqjSr3QIEZQLfZWx0MdcTs96scTDlqHLvoARU9ftLY5nZqrC35NbiWhsj8oGwEJLMQo+Gve7I08OVdJZOe/yRurmf2OxMIhqRMtjbUCU1JjwRPdvxVBX4JQB0jVvbLPaJnXy0BM8ETS/Ldqxvz6aIWjoZTNyWDFfjfDx+o5USlmnywYz/ySEbBFRRsCZk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTdteHpSbTExKzFlYjQ2ZENvV010R3hCTkNMa2NkRTJHVitUdUhjeVkwUWh3?=
 =?utf-8?B?NzlOWitDdE1CZlpXR29aRVpQRytPN0RxRXBpZFkvbVB5a2NORXFvcHk3bEFt?=
 =?utf-8?B?ZUtxTVhGYXh1QWlicjRSRHFxNHNBdHcwRmpwenJPd3ZDVlhwRDE0ZnNwQTNZ?=
 =?utf-8?B?b2hVMHZ6c1RUeVU2UUJXdnVGejZxaXEyNnhzSkZWVFh0NlJWejZpd3FrVFRV?=
 =?utf-8?B?ZTYwUE9ydnhIZ0dvdGNvY2ViOW9hTVJzTE9EbGhpUzhhekxmWFUvMTRZaFJa?=
 =?utf-8?B?Rjd5KzQ5UldNNm1JdmgwbWZaYTBnT0ZieVhKRW5JZnp5anFyaCsxcFRNcGhQ?=
 =?utf-8?B?dWJrTUFDaCsvTTN2NFdscC9meE1BVzVOT0NLaGY1QzRKV01uWnBWQUR4aWtV?=
 =?utf-8?B?RWU0WkREc0pBcG1lNjFTdGJsMVI3OUc1diszaitwUk5wWUJENCs2M29WZEUr?=
 =?utf-8?B?NFhDNHNOWFN1aEcwMWZNSTFMbWxzYm1PaG1BNnhBS3BwQ0ErNWtKY3d3Y2ww?=
 =?utf-8?B?SG40dWg2eEdmeVpFWXp4ZVJBK3JaVUJzc2Z0cmZONHFQVWJYYU1kZHlPTW92?=
 =?utf-8?B?YVRCZWIzKy9WVThhM0RudGJYWEVRb1lQYzhmMklJTGtPdXhrVTJ4SHlobnRa?=
 =?utf-8?B?SWhveEdPUXZ6SmlBUWhkUWloNG54QUN2UzBiNWJqUHJpQ2N4NG1RNjh6WmpW?=
 =?utf-8?B?blZXVE5zMmZwZ3l6VDlwUVMyTHY1U2NlRm9LbVNhWS82c2JwT2U3N3lWbzZn?=
 =?utf-8?B?WFc2M1RJaEpLbEF6Q3JzMWh2bXFzMzZWZjkvRXE3ejcvRDd0QVM2Y2R4RlFx?=
 =?utf-8?B?OHg1cEljS1VNRDJHNjZFbXhlRG0wdm55eGVuZ1dUSDZHYmZ6cXlrT2dhUVpp?=
 =?utf-8?B?OGxUdDRrL1hKdkdlWFN2MkhnT1RJemk2NDJmMjNQN3FwQnRBcmRpd0hFRnFW?=
 =?utf-8?B?aVI1ME9hNVlDVG12bW9VRXk0L0NtTmZQVXc0c3FDeFVCTVZ0WDJKRjNwdm4v?=
 =?utf-8?B?dkUwblRDMVprL2YzZVprQ3ltWVU5K0syZis1YlR5R2lRdmo4S2grbUlYZ0d5?=
 =?utf-8?B?YzdaRm13STN3eEtjWlU5MXNNSXVnaUJFTXBwK3M3R3I5ODZJbS9BM0VocHJC?=
 =?utf-8?B?bU91VUQ5QUZBR3huZldPWU52RXpBVjZpdXNONjcyc3NMa0FEUTU2YlJCQjd3?=
 =?utf-8?B?SUJQQWs5d3FEY3crakJ4dWVkMWQxNEZSd0VaSGsvOXM4ODhkZ05EelpaanFD?=
 =?utf-8?B?TU8yMEJCcU9PdmY1bTgra0FoQnpwWFR1dGxRMkJGNUlZa3d5WTRJcmhLenFU?=
 =?utf-8?B?a2d2cmJQYW9ZclJnQi9RMFJkRjJvM3g4UWNxOFdFN2hnMVhWakVyTUFHelBk?=
 =?utf-8?B?c3VQZXFyOUF4cXpTN3BXZGxka3k4Yk1ZT2ZTSGlRU1BCRWV1OEw0WEttR0ZZ?=
 =?utf-8?B?eWtRSSsrNjdiWUpKZElJQm05VDlnN0xERjBhWWRzNFpoWGp2NXA5cjdQTms2?=
 =?utf-8?B?dFZjZFd2OFlISW42UHlKVU91cFdmV3hFUmxIWkhWZyt0dkc4dVcwZXNxc3VU?=
 =?utf-8?B?VWhTbmV0MVFMcFNicUpmbExmK3F5Z3RBeG5tUTVpbFU3QlAvWnpsakw1RUZE?=
 =?utf-8?B?bTU2RGZSMFNvS3ZXMWtsQzZVRkQ2VkNLZkdhcXg0SXRKRm14NTA5YlRNWk0w?=
 =?utf-8?B?Z0dWMUVyQ1dRbFFmWTFBb3BnM0tSTHNsYW1hd3NsZTVmVGowaFJjWnNXRnlR?=
 =?utf-8?B?TStnVEtrRmI0TFhKRFNGSmpNZ1hqTHJMVWVPaWxoemp6RUdiby8wMlF0ODBr?=
 =?utf-8?B?OVc1RDRpSFNjblBIK0RoRG9FQnN2UStIZzFVSGhUTEo5djRvaU8veG45Wmto?=
 =?utf-8?B?SVBTdm94Q2g0ZHBUWEdzUjQ5QmZTeVFaelhwR1g3alJ5a0szY3k3N2xhRjVO?=
 =?utf-8?B?eGcvMTJwNUVkRkN5aTdrQW1QbURUbStxRUhiZWUwQjlBMGVKS01sUlZyMWhP?=
 =?utf-8?B?UGNsdk9kMEdxNGtySWt5SFNzNkhSZDl5MzlKMStPNHdTd3J3cG9NaG9IcGhq?=
 =?utf-8?B?MW4wOW03WlRZZDJJVmVVZzd2S1R1TUJZcXdhTW1Qa3c2STR3U3N3dEJDeHd0?=
 =?utf-8?B?ejl0bWF2NkNpT1d0L3lQaVdVREdhbEZxalVaNGtFenA1VE02andqMldGeFVy?=
 =?utf-8?Q?qhi//Pf613+IDP5JeKJIBEWxcigu2uSpu6vMuEbagPbN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2695B4AC5D4A049973D8EB157793214@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d36a94-4d4c-47b3-8e7f-08dc47f68ffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 09:25:48.2977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hcU2udUGxRTfjzkNkgmhDp2VmQe4uDUXkdXNuCW2uJkHdJSbAv5DSMp6kMXNl4EuZNaWS/Tji2aahD2TgKfkqV5V7W86dNObEYVJ9u+EQRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7606
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

SGksIE9haywNCg0KT24gTW9uLCAyMDI0LTAzLTE4IGF0IDIyOjU1IC0wNDAwLCBPYWsgWmVuZyB3
cm90ZToNCj4gRFJNX1hFX1NWTSBrZXJuZWwgY29uZmlnIGVudHJ5IGlzIGFkZGVkIHNvDQo+IHhl
IHN2bSBmZWF0dXJlIGNhbiBiZSBjb25maWd1cmVkIGJlZm9yZSBrZXJuZWwNCj4gY29tcGlsYXRp
b24uDQoNClBsZWFzZSB1c2UgaW1wZXJhdGl2ZSBsYW5ndWFnZSBpbiBjb21taXQgbWVzc2FnZXMu
DQoNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPG9hay56ZW5nQGludGVsLmNvbT4N
Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhDQo+IDxuaXJhbmph
bmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5h
IFZpc2h3YW5hdGhhcHVyYQ0KPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+
DQo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gQ2M6IFRo
b21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT4NCj4gQ2M6IEJyaWFu
IFdlbHR5IDxicmlhbi53ZWx0eUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS9LY29uZmlnwqDCoCB8IDIxICsrKysrKysrKysrKysrKysrKysrKw0KPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV90aWxlLmMgfMKgIDQgKysrKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9LY29u
ZmlnIGIvZHJpdmVycy9ncHUvZHJtL3hlL0tjb25maWcNCj4gaW5kZXggMWE1NTZkMDg3ZTYzLi5l
MjQ0MTY1NDU5YzUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9LY29uZmlnDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9LY29uZmlnDQo+IEBAIC04Myw2ICs4MywyNyBAQCBj
b25maWcgRFJNX1hFX0ZPUkNFX1BST0JFDQo+IMKgCcKgIDQ1NzEuDQo+IMKgDQo+IMKgCcKgIFVz
ZSAiISoiIHRvIGJsb2NrIHRoZSBwcm9iZSBvZiB0aGUgZHJpdmVyIGZvciBhbGwga25vd24NCj4g
ZGV2aWNlcy4NCj4gK2NvbmZpZyBEUk1fWEVfU1ZNDQo+ICsJYm9vbCAiRW5hYmxlIFNoYXJlZCBW
aXJ0dWFsIE1lbW9yeSBzdXBwb3J0IGluIHhlIg0KPiArCWRlcGVuZHMgb24gRFJNX1hFDQo+ICsJ
ZGVwZW5kcyBvbiBBUkNIX0VOQUJMRV9NRU1PUllfSE9UUExVRw0KPiArCWRlcGVuZHMgb24gQVJD
SF9FTkFCTEVfTUVNT1JZX0hPVFJFTU9WRQ0KPiArCWRlcGVuZHMgb24gTUVNT1JZX0hPVFBMVUcN
Cj4gKwlkZXBlbmRzIG9uIE1FTU9SWV9IT1RSRU1PVkUNCj4gKwlkZXBlbmRzIG9uIEFSQ0hfSEFT
X1BURV9ERVZNQVANCj4gKwlkZXBlbmRzIG9uIFNQQVJTRU1FTV9WTUVNTUFQDQo+ICsJZGVwZW5k
cyBvbiBaT05FX0RFVklDRQ0KPiArCWRlcGVuZHMgb24gREVWSUNFX1BSSVZBVEUNCj4gKwlkZXBl
bmRzIG9uIE1NVQ0KPiArCXNlbGVjdCBITU1fTUlSUk9SDQo+ICsJc2VsZWN0IE1NVV9OT1RJRklF
Ug0KPiArCWRlZmF1bHQgeQ0KPiArCWhlbHANCj4gKwnCoCBDaG9vc2UgdGhpcyBvcHRpb24gaWYg
eW91IHdhbnQgU2hhcmVkIFZpcnR1YWwgTWVtb3J5IChTVk0pDQo+ICsJwqAgc3VwcG9ydCBpbiB4
ZS4gV2l0aCBTVk0sIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBpcyBzaGFyZWQNCj4gKwnCoCBiZXR3
ZWVuIENQVSBhbmQgR1BVLiBUaGlzIG1lYW5zIGFueSB2aXJ0dWFsIGFkZHJlc3Mgc3VjaA0KPiAr
CcKgIGFzIG1hbGxvYyBvciBtbWFwIHJldHVybnMsIHZhcmlhYmxlcyBvbiBzdGFjaywgb3IgZ2xv
YmFsDQo+ICsJwqAgbWVtb3J5IHBvaW50ZXJzLCBjYW4gYmUgdXNlZCBmb3IgR1BVIHRyYW5zcGFy
ZW50bHkuDQo+IMKgDQo+IMKgbWVudSAiZHJtL1hlIERlYnVnZ2luZyINCj4gwqBkZXBlbmRzIG9u
IERSTV9YRQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmMNCj4gaW5kZXggZjFjNGY5ZGU1MWRmLi5iNTJh
MDBhNmI1ZDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGUuYw0KPiBAQCAtMTU5LDcgKzE1OSw5IEBA
IHN0YXRpYyBpbnQgdGlsZV90dG1fbWdyX2luaXQoc3RydWN0IHhlX3RpbGUNCj4gKnRpbGUpDQo+
IMKgICovDQo+IMKgaW50IHhlX3RpbGVfaW5pdF9ub2FsbG9jKHN0cnVjdCB4ZV90aWxlICp0aWxl
KQ0KPiDCoHsNCj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfU1ZNKQ0KPiDCoAlzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSA9IHRpbGVfdG9feGUodGlsZSk7DQo+ICsjZW5kaWYNCg0KQXZvaWQg
dXNpbmcgY29uZGl0aW9uYWwgY29tcGlsYXRpb24gaW4gdGhpcyB3YXkgaW5zaWRlIGZ1bmN0aW9u
cyBpZg0KcG9zc2libGUsIHBsZWFzZSBzZWUgYmVsb3c6DQoNCj4gwqAJaW50IGVycjsNCj4gwqAN
Cj4gwqAJeGVfZGV2aWNlX21lbV9hY2Nlc3NfZ2V0KHRpbGVfdG9feGUodGlsZSkpOw0KPiBAQCAt
MTc3LDggKzE3OSwxMCBAQCBpbnQgeGVfdGlsZV9pbml0X25vYWxsb2Moc3RydWN0IHhlX3RpbGUg
KnRpbGUpDQo+IMKgDQo+IMKgCXhlX3RpbGVfc3lzZnNfaW5pdCh0aWxlKTsNCj4gwqANCj4gKyNp
ZiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfU1ZNKQ0KPiDCoAlpZiAoeGUtPmluZm8uaGFzX3Vz
bSkNCg0KQ291bGQgYmU6DQoJaWYgKElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9TVk0pICYmIHRp
bGVfdG9feGUodGlsZSktDQo+aW5mby5oYXNfdXNtKQ0KDQovVGhvbWFzDQoNCg0KPiDCoAkJeGVf
ZGV2bV9hZGQodGlsZSwgJnRpbGUtPm1lbS52cmFtKTsNCj4gKyNlbmRpZg0KPiDCoGVycl9tZW1f
YWNjZXNzOg0KPiDCoAl4ZV9kZXZpY2VfbWVtX2FjY2Vzc19wdXQodGlsZV90b194ZSh0aWxlKSk7
DQo+IMKgCXJldHVybiBlcnI7DQoNCg==
