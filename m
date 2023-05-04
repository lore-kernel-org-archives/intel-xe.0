Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E342AC77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 12:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD6310E467;
	Thu,  4 May 2023 12:52:06 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCC310E467
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 12:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683204725; x=1714740725;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9zLsvu3NtqurhqgubbfyM/DZyTJxA6iVuzwnZHt/foA=;
 b=clzWZhpcO+AlrLc7MQdEIIiVI2Df0P/t+srwGWqcNb2zszQUmow8x7OJ
 3bi1ItSshjUk9ZHYUAdkZ3j8Vlv8RIQKDcyEXaC/LHdDP+C/7GB1F4dSJ
 Jkx3gJCd2ej6FeCQi5B40vetGOJRwHNDOWm6QL+8ABA0idpol/eNGrfoG
 BO1LvDzJVTgc/7xxxaxHzvdUpSYA1SJTUF3WdzDZbzG6arknCQjTO4KzD
 p9PGNxp3URy0kNmqAV+eYs1ZokWYDQGHVaHHXICPHyZW+0g2J5mxSvgda
 rIOWks3PwTlrew/TnCVnTaw8vOYApWoaS9hz5v1vEsVhuLVr4d4qWU9no Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="414392193"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="414392193"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 05:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="871339841"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="871339841"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 04 May 2023 05:51:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 05:51:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 05:51:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 05:50:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i++A95wn97AKQ3Bm9t66M9t2iXOBOFB/xg9jf7wdkJODSxwak+YKgq2/p+wKJ0yOIm0a7qABxKpD14gu0PADqq79qpz81U0pXN/ne6sv32twjnDC3xpZ7ztMRi67luXLwhK1Te2CHSnQQMUh4SqSTiWRwTT1bbJAZWvE16Pe+nfKCNIbi4yKP0QxcZNabuPxoPMwLE8pCXWM9Firj2vxkNlwGpKf39dZYW8h8YBk+cW+Lue/WYpNLW68xFZH+E1U30e2OFDgiytR2MC8diUJ+01SDN38x4re9HpX3Eb6KBAjEzH08Y9y1YMk/VIH9YdcfRX16rTDwgjStr2XD4ILrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zLsvu3NtqurhqgubbfyM/DZyTJxA6iVuzwnZHt/foA=;
 b=OdjByN71EsoQTVASLpkzR8d3pmMMioeBBNWfwPAu12WRLhlgNHJceu058g4qOLomEtqqY9AtYuOQnMw+zpNVW5CyyRthNpvvkUoNBM95wzUDXR82zg+Nk0+IclCnyBJ4Dq+E+GVthnclyVs0WrWAvF9m5Xa7/9/9UcEXG55OwKz6d6SFMmD3AIQagQ7q/bIWsEuImOqnHyFEHTf5WoC9qq6o4WAE4C2VlIbUl/TMqgAMN5PmExUt/yY2Wi+NVgBGlQbG6t5r8Xm5Vwc9KrEUewiMEWM4m63Ogo/WkckOQ55To31lVml+9ZAX1LNm2EIwlfREdlQd9GvcEXUqKOIEvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB7496.namprd11.prod.outlook.com (2603:10b6:510:280::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 12:50:53 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43%7]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 12:50:53 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [PATCH 3/3] drm/xe: Add sysfs entry to report per gt memory size
Thread-Index: AQHZfnnDu6tcmDiJ7EG0YpJDJ7WEya9KDzaAgAABrfA=
Date: Thu, 4 May 2023 12:50:53 +0000
Message-ID: <SJ1PR11MB6204AEC32DEE34A64BB33A7D816D9@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <20230504112020.300498-4-tejas.upadhyay@intel.com>
 <7aa6147f-752b-27b1-9f4c-667a3d457b51@intel.com>
In-Reply-To: <7aa6147f-752b-27b1-9f4c-667a3d457b51@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB7496:EE_
x-ms-office365-filtering-correlation-id: a760e3ec-758d-493f-fbae-08db4c9e3214
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8fiFlU7cvqIfF7Ayt7Jg9ICcUT2CirAI8hBW+OSO6EdQxUcWC4JX/ZoKL9yFt9IqA2ECrFyI9iY7jHiAD/ENbwBs7bbGDvq9iAu1HB5D/drVHr4dakae6cm/SimNnR3a7jwIQ9X6vpIlxzVAkKDKLssPoa/cjWQOdcXtpgCBGoznZGLseJr4nrckT8tv6wL0Qv4dKsSms/6O7ffBZtlNTMhsrGFpbQ6kw6YXziYjW0Xj5KJXy54Sq1hkF/qYZaFesnbzwHwR1ZhFQiTp/+3MP9eLMhR6nA7bX2QG06FCWZioMAJtlOnHAPdIpO+d9jDplTjiit2IGZ5GTg1vpsq4Nt+4drLCs+BjwPVojiSCyvfIlGBXLATcwfcH2Ja4bEuprZzeS61uQnLuSaGBMrcb/jbX8iljPDwnytkREMa+fkJUDRx2oc5HjuFr2idMhVzZotLN1MgC0+SOtBui60cNgHYdwcBvI47EdGNl1Z8XLgFsGme4OTW7J4IIaruOiNTV8yKsZbBwN9v8abvZjkJfUaNm0tin2a12lpNNQbhjhZa+dDweY0mdI+eD5lP0RF1Or98lf6nJN+G3D4m3J1w0hZ/KfJovf6KOmeQ9PvSmQ3Xb940D/hqZBOkVCm6c6l1J
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(33656002)(122000001)(5660300002)(38100700002)(52536014)(2906002)(55016003)(38070700005)(316002)(86362001)(8676002)(8936002)(64756008)(66476007)(66446008)(66946007)(66556008)(41300700001)(82960400001)(6636002)(83380400001)(76116006)(186003)(6506007)(9686003)(53546011)(7696005)(478600001)(110136005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFNHYVIraVVMRTRqSEJSVDc3RndHU01WQUJ2allhYzBmNjZLNllqWXpqdWRp?=
 =?utf-8?B?NCtod0U5M21maURVTWFjTE9QcXFSUnEvZXZGMnBtZllGcyszUlFON0JOMEZF?=
 =?utf-8?B?QzNycXFVYzFIV1l4MWI5WFdSbUZLbXUrU3pkK21oaGlOTEQrL21IbDJucEFS?=
 =?utf-8?B?NTlhN0VUTy9oT0czeS9NdWRNZTRVTXhGbEVDTlE5RFlCVUhYSlBsYmZSRHhM?=
 =?utf-8?B?Q2MxYkc5YlgyWE1qNm1JaVA3QW82ZVRzbXpsTElYSnpJWUZvVnpMMXFiaG4r?=
 =?utf-8?B?aG02MFNuLzJEdHFzSnFWTlFTL2o3TWpuMVRzOVByajNCVTUvS2ltVnJSR3J1?=
 =?utf-8?B?S0pUL24zNmFrY1lxUFFQSzBOUkpGNE5DUm5TUHFqVDVPRXNLVE9OeU0zMW4w?=
 =?utf-8?B?azgyNnpEY2s5WXN0bzNNNGh3ZnlxL3dJNTFkZVZYMkVPREJNNlkrY3JVd3o3?=
 =?utf-8?B?L3VXM3RVdTNHQTk3KzhHbUYyVStmZGUySjExQTBCWXhONE9DeHBVQ0d1QU5n?=
 =?utf-8?B?NmFsWmNib20zYWNZOFlBZFRZenJCWkIyTmxDNDBmck5Ub3BqS3lhWEhDVytH?=
 =?utf-8?B?SEZBVTk4ZSsyaFc4OUhqSkx0TVl0Ym5QNE9NbCs4ZWNieFQweWwvRE04azJN?=
 =?utf-8?B?WmFOWCs5R0RLRVZnOGplaWZBeDlEZVFFOTVFRGFZcm5YN3dTSzdER1QzOFdF?=
 =?utf-8?B?QURVaEg1WWVWZ3c4cWdXUlRWUUlEdkhTYk84c2RpZTFLYVVBazBkYWVudnpY?=
 =?utf-8?B?T3pLMXNlNHVLZGZ5dWhyS20yQnR2cTYzLzlWczlHZm5heWVzQUNuNDB6VVVO?=
 =?utf-8?B?VEszYzY2MnFTMmI2aUwwSXdXWmRiTXp1UFJLZmhFK05wa3pVODdjY1dheFM5?=
 =?utf-8?B?bjZnTzcxKzdPTUVySjByQW9TdkFxMHE5VGEreFUzNG9FejAxM0VvK203anlV?=
 =?utf-8?B?dVpJNkxYREx5MjVEYTVxQ0U4akdYS08rQkNtRTd5VU9VLzU3cmRFaXVRSXZF?=
 =?utf-8?B?MzYrM2ROS29oZHB4cHVCbXZPbzhrRVZoQ2FEcFRMRyt1SERNb0wyRmJ4MW1p?=
 =?utf-8?B?YkxTcVJOUEMySGMzZWY1ZWFIYTVLS3RSOVl0aHNtc2JDOGp1REgrSldTdGJh?=
 =?utf-8?B?R2NwSWxTOFdvNFR3WUtlWkJYYjdDU3ZBUTBSN0E0T0RoK2ZDWHozMCtCdGs5?=
 =?utf-8?B?NThtQkhJWXVDeWNLMTgrTGRYZG80Z0pXQmRFdG1WcThad0lHL010eEgxMFBI?=
 =?utf-8?B?OTNWR0ZpUDRQT2hHeERydlN2UUJLVHNVWEdqWGVlL0k2VzNzVHE0ZVlpUGVG?=
 =?utf-8?B?RHVwRERzUXBCZXgwQVpUU0RuSkZJYWs1TDI3VjRZVExTY2V0T29kelpwUmUy?=
 =?utf-8?B?b0pxN0VzRFp0djBjZ3BRL0d0WGp6YmM3SFY2KzJrcHhWODFJYVBrY3JYb2tX?=
 =?utf-8?B?eGczWjlJZkU0Z2kveVBuc0c1YUpHSStLanJCdnVZUWg4cE1kcDdoV0JCUm1O?=
 =?utf-8?B?U0FoRVV5MTBrTkxna0hGVnJ2Tms4dERpcDN1NjEvTU8zbGlIMmsyN0VNeUI0?=
 =?utf-8?B?VzdYR21PTTVPQXlndmZsWllTNm81WnJ5SFpQYlJuZXJoV2J1U1F4bzl5MFZo?=
 =?utf-8?B?ZThhNnZEdnAxZ290Vjl3S2Y3VkpkWnlGa2hTM0JFUEUrWUFxVUI2R2I1TnlW?=
 =?utf-8?B?VWx0QUY0T0NtOTMvWDhaUmpaMStCSEVRNXh3dm92VlRoS29CK0tMYVpBTUVP?=
 =?utf-8?B?ZUZjNnA0dVRlUWlqSTJJbmRFbTZXeTlTdHllUUY5aHFVcEZHZnd0SnhLTGJN?=
 =?utf-8?B?Yy9IUENIWVFVcVhRMmIrK1FFMnl3WnAxMFY5VVViajlaNzRMMTc0TDQzc1dq?=
 =?utf-8?B?cjg4ckRpM2tDTlpWcjJnTng1d2NUQjlVQ2ppNkFHQkdzKzIxZnlIU2RDY28r?=
 =?utf-8?B?Rk5INjVQaHlKQjMwSHpKb1BQZzMwV2M3d1BoR1BEVTVsZ0xJdG9zMTluNlRQ?=
 =?utf-8?B?bXBqTFBBMXBadGp1ZzBIQWVRWWVnNmlBVEJXOVMyOVhFbjNHVklQKzRMZU5w?=
 =?utf-8?B?WGxneXlvcmI4cThPcW9MaERocktCRnAxYnFFZ3ZaWmhscFRXQ1pDUjArbUVT?=
 =?utf-8?B?dTZaUzhzNW1KN1FoNzRQTkkwT2tQY2FMK2VxQys1YXdtNnhRSjZYMmtkd0c3?=
 =?utf-8?Q?iD3CFV3g3NnJkyuewfXWWAYeFxzDEfM1avkx6kmtiq6X?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a760e3ec-758d-493f-fbae-08db4c9e3214
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 12:50:53.1352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sqoM8NcWThLuABitEZ9X2nio0mb5XLsOgtaUQB3KbpFemyhLGnVzgs6Lw2QY5qbyaSKMvY3Xx5PvB6+G2B6l3A68qQyEI3/jW7sY9nLsEMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7496
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per gt
 memory size
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWRkYW1zZXR0eSwgQXJh
dmluZCA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE1h
eSA0LCAyMDIzIDY6MTQgUE0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlA
aW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgVml2aSwgUm9k
cmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzNd
IGRybS94ZTogQWRkIHN5c2ZzIGVudHJ5IHRvIHJlcG9ydCBwZXIgZ3QgbWVtb3J5DQo+IHNpemUN
Cj4gDQo+IA0KPiANCj4gT24gMDQtMDUtMjAyMyAxNjo1MCwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6
DQo+ID4gQWRkIHN5c2ZzIGVudHJ5IHRvIHJlYWQgcGVyIGd0IHBoeXNpY2FsIG1lbW9yeSBpbiB0
b3RhbCBpbmNsdWRpbmcNCj4gPiBzdG9sZW4gbWVtb3J5Lg0KPiA+DQo+ID4gQ2M6IEFyYXZpbmQg
SWRkYW1zZXR0eSA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggfCAgMiArDQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zeXNmcy5jICAgICB8IDc0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3N5c2ZzLmggICAgIHwg
IDEgLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaCAgICAgfCAgNyArKysN
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uYyAgICAgICAgIHwgIDEgKw0KPiA+ICA1
IGZpbGVzIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBpbmRleCA4ODk4YWVh
NGJjMmIuLmY2YjY4YTNjNmVlYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlX3R5cGVzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
X3R5cGVzLmgNCj4gPiBAQCAtMjU0LDYgKzI1NCw4IEBAIHN0cnVjdCB4ZV9kZXZpY2Ugew0KPiA+
ICAJLyoqIEBndDogZ3JhcGhpY3MgdGlsZSAqLw0KPiA+ICAJc3RydWN0IHhlX2d0IGd0W1hFX01B
WF9HVF07DQo+ID4NCj4gPiArCXN0cnVjdCBrb2JqZWN0ICpzeXNmc19ndDsNCj4gPiArDQo+ID4g
IAkvKioNCj4gPiAgCSAqIEBtZW1fYWNjZXNzOiBrZWVwIHRyYWNrIG9mIG1lbW9yeSBhY2Nlc3Mg
aW4gdGhlIGRldmljZSwNCj4gcG9zc2libHkNCj4gPiAgCSAqIHRyaWdnZXJpbmcgYWRkaXRpb25h
bCBhY3Rpb25zIHdoZW4gdGhleSBvY2N1ci4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0X3N5c2ZzLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zeXNm
cy5jDQo+ID4gaW5kZXggYzAxY2M2ODkwNThjLi5iMTMzZGQ3YjlkMzEgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3N5c2ZzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3Rfc3lzZnMuYw0KPiA+IEBAIC0yOSwxMiArMjksNzYgQEAgc3RhdGljIHZv
aWQgZ3Rfc3lzZnNfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLA0KPiB2b2lkICphcmcpDQo+
ID4gIAlrb2JqZWN0X3B1dChndC0+c3lzZnMpOw0KPiA+ICB9DQo+ID4NCj4gPiArdHlwZWRlZiBz
c2l6ZV90ICgqc2hvdykoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0
ZQ0KPiA+ICsqYXR0ciwgY2hhciAqYnVmKTsNCj4gPiArDQo+ID4gK3N0cnVjdCB4ZV9leHRfYXR0
ciB7DQo+ID4gKwlzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBhdHRyOw0KPiA+ICsJc2hvdyB4ZV9z
aG93Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIHNzaXplX3QNCj4gPiAreGVfc3lzZnNf
c2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBj
aGFyDQo+ID4gKypidWYpIHsNCj4gPiArCXNzaXplX3QgdmFsdWU7DQo+ID4gKwlzdHJ1Y3QgeGVf
ZXh0X2F0dHIgKmVhID0gY29udGFpbmVyX29mKGF0dHIsIHN0cnVjdCB4ZV9leHRfYXR0ciwNCj4g
PiArYXR0cik7DQo+ID4gKw0KPiA+ICsJLyogRklYTUU6IFdhXzE2MDE1NDk2MDQzIEhvbGQgZm9y
Y2V3YWtlIG9uIEdUMCAmIEdUMSB0bw0KPiBkaXNhbGxvdyByYzYgKi8NCj4gPiArCXZhbHVlID0g
ZWEtPnhlX3Nob3coZGV2LCBhdHRyLCBidWYpOw0KPiA+ICsNCj4gPiArCXJldHVybiB2YWx1ZTsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHNzaXplX3QNCj4gPiArYWRkcl9yYW5nZV9zaG93
KHN0cnVjdCBkZXZpY2UgKmtkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPiA+
ICtjaGFyICpidWYpIHsNCj4gPiArCXN0cnVjdCB4ZV9ndCAqZ3QgPSBrb2JqX3RvX2d0KCZrZGV2
LT5rb2JqKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIlcGFcbiIsICZn
dC0+bWVtLmFjdHVhbF9waHlzaWNhbF9tZW0pOyB9DQo+ID4gKw0KPiA+ICsjZGVmaW5lIFhFX0RF
VklDRV9BVFRSX1JPKF9uYW1lLCBfc2hvdykgXA0KPiA+ICsJc3RydWN0IHhlX2V4dF9hdHRyIGRl
dl9hdHRyXyMjX25hbWUgPSBcDQo+ID4gKwl7IF9fQVRUUihfbmFtZSwgMDQ0NCwgeGVfc3lzZnNf
c2hvdywgTlVMTCksIF9zaG93fQ0KPiANCj4gaSBkbyBub3Qgc2VlIHRoZSB1c2Ugb2YgdGhpcy4N
Cj4gPiArDQo+ID4gK3N0YXRpYyBYRV9ERVZJQ0VfQVRUUl9STyhhZGRyX3JhbmdlLCBhZGRyX3Jh
bmdlX3Nob3cpOw0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGUgKmFk
ZHJfcmFuZ2VfYXR0cnNbXSA9IHsNCj4gPiArCS8qIFRPRE86IFJlcG9ydCBhbnkgb3RoZXIgSEJN
IFNwYXJpbmcgc3lzZnMgcGVyIGd0PyAqLw0KPiA+ICsJJmRldl9hdHRyX2FkZHJfcmFuZ2UuYXR0
ci5hdHRyLA0KPiA+ICsJTlVMTA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArdm9pZCB4ZV9ndF9zeXNm
c19yZWdpc3Rlcl9tZW0oc3RydWN0IHhlX2d0ICpndCwgc3RydWN0IGtvYmplY3QNCj4gPiArKnBh
cmVudCkgew0KPiA+ICsJLyogRklYTUU6IENoZWNrIGhhc19tZW1fc3BhcmluZyBoZXJlICovDQo+
ID4gKw0KPiA+ICsJaWYgKHN5c2ZzX2NyZWF0ZV9maWxlcyhwYXJlbnQsIGFkZHJfcmFuZ2VfYXR0
cnMpKQ0KPiA+ICsJCWRybV9lcnIoJmd0X3RvX3hlKGd0KS0+ZHJtLA0KPiA+ICsJCQkiU2V0dGlu
ZyB1cCBzeXNmcyB0byByZWFkIHRvdGFsIHBoeXNpY2FsIG1lbW9yeSBwZXINCj4gdGlsZQ0KPiA+
ICtmYWlsZWRcbiIpOyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IGtvYmplY3QgKnhlX3Nl
dHVwX2d0X3N5c2ZzKHN0cnVjdCBrb2JqZWN0ICpwYXJlbnQpIHsNCj4gPiArCXJldHVybiBrb2Jq
ZWN0X2NyZWF0ZV9hbmRfYWRkKCJndCIsIHBhcmVudCk7IH0NCj4gPiArDQo+ID4gIGludCB4ZV9n
dF9zeXNmc19pbml0KHN0cnVjdCB4ZV9ndCAqZ3QpICB7DQo+ID4gLQlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSBndF90b194ZShndCktPmRybS5kZXY7DQo+ID4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9
IGd0X3RvX3hlKGd0KTsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmtkZXYgPSB4ZS0+ZHJtLnByaW1h
cnktPmtkZXY7DQo+ID4gIAlzdHJ1Y3Qga29ial9ndCAqa2c7DQo+ID4gIAlpbnQgZXJyOw0KPiA+
DQo+ID4gKwkvKiBDcmVhdGUgc3lzZnMgZGlyIG9ubHkgZm9yIHByaW1hcnkgR1QgdG8gYXZvaWQg
ZHVwICovDQo+ID4gKwlpZiAoIWd0LT5pbmZvLmlkKSB7DQo+ID4gKwkJeGUtPnN5c2ZzX2d0ID0g
eGVfc2V0dXBfZ3Rfc3lzZnMoJmtkZXYtPmtvYmopOw0KPiANCj4gaSdtIG5vdCBzdXJlIGlmIHdl
IGV2ZXIgd2FudGVkIHRvIGNyZWF0ZSBhIHRvcCBsZXZlbCBHVCBmb2xkZXINCj4gDQo+IEByb2Ry
aWdvLCBhbnkgdGhvdWdodHM/DQo+IA0KPiA+ICsJCWlmICgheGUtPnN5c2ZzX2d0KSB7DQo+ID4g
KwkJCWRybV9lcnIoJnhlLT5kcm0sDQo+ID4gKwkJCQkiZmFpbGVkIHRvIHJlZ2lzdGVyIEdUIHN5
c2ZzIGRpcmVjdG9yeVxuIik7DQo+ID4gKwkJCXJldHVybiAwOw0KPiA+ICsJCX0NCj4gPiArCX0N
Cj4gPiArDQo+ID4gIAlrZyA9IGt6YWxsb2Moc2l6ZW9mKCprZyksIEdGUF9LRVJORUwpOw0KPiA+
ICAJaWYgKCFrZykNCj4gPiAgCQlyZXR1cm4gLUVOT01FTTsNCj4gPiBAQCAtNDIsNyArMTA2LDcg
QEAgaW50IHhlX2d0X3N5c2ZzX2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gPiAgCWtvYmplY3Rf
aW5pdCgma2ctPmJhc2UsICZ4ZV9ndF9zeXNmc19rb2JqX3R5cGUpOw0KPiA+ICAJa2ctPmd0ID0g
Z3Q7DQo+ID4NCj4gPiAtCWVyciA9IGtvYmplY3RfYWRkKCZrZy0+YmFzZSwgJmRldi0+a29iaiwg
Imd0JWQiLCBndC0+aW5mby5pZCk7DQo+ID4gKwllcnIgPSBrb2JqZWN0X2FkZCgma2ctPmJhc2Us
IHhlLT5zeXNmc19ndCwgImd0JWQiLCBndC0+aW5mby5pZCk7DQo+ID4gIAlpZiAoZXJyKSB7DQo+
ID4gIAkJa29iamVjdF9wdXQoJmtnLT5iYXNlKTsNCj4gPiAgCQlyZXR1cm4gZXJyOw0KPiA+IEBA
IC01MCw5ICsxMTQsMTUgQEAgaW50IHhlX2d0X3N5c2ZzX2luaXQoc3RydWN0IHhlX2d0ICpndCkN
Cj4gPg0KPiA+ICAJZ3QtPnN5c2ZzID0gJmtnLT5iYXNlOw0KPiA+DQo+ID4gKwlndC0+c3lzZnNf
ZGVmYXVsdHMgPSBrb2JqZWN0X2NyZWF0ZV9hbmRfYWRkKCIuZGVmYXVsdHMiLCBndC0+c3lzZnMp
Ow0KPiANCj4gd2hhdCBpcyB0aGUgdXNlIG9mIGRlZmF1bHRzPz8NCg0KTm8gdXNlLiBUaGVyZSBp
cyBubyB1c2UgSSBzYXcgaW4gaTkxNSBhcyB3ZWxsLiBCdXQgbWF5IGJlIGZvciBzb21lIGZ1dHVy
ZSB1c2UgaXQgaXMga2VwdC4gT3IgSSBtaXNzZWQgc29tZXRoaW5nLiBJZiB3YW50IHRvIHJlbW92
ZSwgY2FuIGJlIHJlbW92ZWQgb24gb2JqZWN0aW9ucy4NCg0KVGhhbmtzLA0KVGVqYXMNCj4gDQo+
IFRoYW5rcywNCj4gQXJhdmluZC4NCj4gPiArCWlmICghZ3QtPnN5c2ZzX2RlZmF1bHRzKQ0KPiA+
ICsJCWRybV9lcnIoJnhlLT5kcm0sICJmYWlsZWQgdG8gY3JlYXRlIGd0IHN5c2ZzIC5kZWZhdWx0
c1xuIik7DQo+ID4gKw0KPiA+ICAJZXJyID0gZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KCZndF90
b194ZShndCktPmRybSwgZ3Rfc3lzZnNfZmluaSwNCj4gZ3QpOw0KPiA+ICAJaWYgKGVycikNCj4g
PiAgCQlyZXR1cm4gZXJyOw0KPiA+DQo+ID4gKwl4ZV9ndF9zeXNmc19yZWdpc3Rlcl9tZW0oZ3Qs
IGd0LT5zeXNmcyk7DQo+ID4gKw0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3N5c2ZzLmgNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9zeXNmcy5oDQo+ID4gaW5kZXggZWNiZmNjNWM3ZDQyLi5hODA3OGM1OTky
YmQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3N5c2ZzLmgNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3lzZnMuaA0KPiA+IEBAIC0xNSw1ICsx
NSw0IEBAIGtvYmpfdG9fZ3Qoc3RydWN0IGtvYmplY3QgKmtvYmopICB7DQo+ID4gIAlyZXR1cm4g
Y29udGFpbmVyX29mKGtvYmosIHN0cnVjdCBrb2JqX2d0LCBiYXNlKS0+Z3Q7ICB9DQo+ID4gLQ0K
PiA+ICAjZW5kaWYgLyogX1hFX0dUX1NZU0ZTX0hfICovDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfdHlwZXMuaA0KPiA+IGluZGV4IDQ3ZjA1OWJiOGM2ZC4uNTYxNWYyZDY1OTk2IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgNCj4gPiBAQCAtMTM4LDYgKzEzOCwxMSBAQCBz
dHJ1Y3QgeGVfZ3Qgew0KPiA+ICAJICogb2JqZWN0cyAodmlydHVhbCBzcGxpdCkNCj4gPiAgCSAq
Lw0KPiA+ICAJc3RydWN0IHsNCj4gPiArCQkvKioNCj4gPiArCQkgKiBAYWN0dWFsX3BoeXNpY2Fs
X21lbTogVHJhY2sgYWN0dWFsIExNRU0gc2l6ZQ0KPiA+ICsJCSAqIGluY2x1ZGluZyBzdG9sZW4g
bWVtDQo+ID4gKwkJICovDQo+ID4gKwkJcmVzb3VyY2Vfc2l6ZV90IGFjdHVhbF9waHlzaWNhbF9t
ZW07DQo+ID4gIAkJLyoqDQo+ID4gIAkJICogQHZyYW06IFZSQU0gaW5mbyBmb3IgR1QsIG11bHRp
cGxlIEdUcyBjYW4gcG9pbnQgdG8gc2FtZQ0KPiBpbmZvDQo+ID4gIAkJICogKHZpcnR1YWwgc3Bs
aXQpLCBjYW4gYmUgc3Vic2V0IG9mIGdsb2JhbCBkZXZpY2UgVlJBTSBAQCAtDQo+IDMyNCw2DQo+
ID4gKzMyOSw4IEBAIHN0cnVjdCB4ZV9ndCB7DQo+ID4NCj4gPiAgCS8qKiBAc3lzZnM6IHN5c2Zz
JyBrb2JqIHVzZWQgYnkgeGVfZ3Rfc3lzZnMgKi8NCj4gPiAgCXN0cnVjdCBrb2JqZWN0ICpzeXNm
czsNCj4gPiArCS8qIHN5c2ZzIGRlZmF1bHRzIHBlciBndCAqLw0KPiA+ICsJc3RydWN0IGtvYmpl
Y3QgKnN5c2ZzX2RlZmF1bHRzOw0KPiA+DQo+ID4gIAkvKiogQG1vY3M6IGluZm8gKi8NCj4gPiAg
CXN0cnVjdCB7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMgaW5kZXggMmMzNWExYjc5YmU3Li5i
YzA1YjZjMGNlZmINCj4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21t
aW8uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMNCj4gPiBAQCAtMjk2
LDYgKzI5Niw3IEBAIGludCB4ZV9tbWlvX3Byb2JlX3ZyYW0oc3RydWN0IHhlX2RldmljZSAqeGUp
DQo+ID4gIAkJaWYgKGVycikNCj4gPiAgCQkJcmV0dXJuIGVycjsNCj4gPg0KPiA+ICsJCWd0LT5t
ZW0uYWN0dWFsX3BoeXNpY2FsX21lbSA9IHRpbGVfc2l6ZTsNCj4gPiAgCQlndC0+bWVtLnZyYW0u
aW9fc3RhcnQgPSB4ZS0+bWVtLnZyYW0uaW9fc3RhcnQgKw0KPiB0aWxlX29mZnNldDsNCj4gPiAg
CQlndC0+bWVtLnZyYW0uaW9fc2l6ZSA9IG1pbl90KHU2NCwgdnJhbV9zaXplLCBpb19zaXplKTsN
Cj4gPg0K
