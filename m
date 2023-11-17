Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6970C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 14:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D75010E04C;
	Fri, 17 Nov 2023 14:26:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4180410E04C
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700231164; x=1731767164;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YiMP1L6C+eB9etP+lJb1HXbe07+m30ajmkqnM5iA8iI=;
 b=LVZXIJVxZztS7KI9clvQkfDD/oQiphpBaDJyAwbPNJKSwp83RrjVdRDj
 8OSxDXojburS1IaQ5p1utxx0BnAGdO+qjyGJMLhbUvvYvAhYJDnVAt4tS
 lRvt3280X2bqyIDkYEDahwt81vCekl1oRMBnSeEfeIm+s3cKRLDx/GGg2
 tAVcx0JT0TqnaqsuinTBmzO5JUoax7CNSrUnJf/IL4nX2vV9nYLOU4BRN
 02NsW3EYVyR9zFPRs9a+gc2B06RGIxeyoMWbCpVCED4FC0q4RWy056MCV
 hOZqujzEi3HLM+Tgc90IoKcHPDkD6mLnXHFUVETqsvExW1SIk708vOIjl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="457803378"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="457803378"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 06:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="765648773"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="765648773"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 06:26:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 06:26:02 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 06:26:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 06:26:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 06:26:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kaq2ZpskgIWXWQbLTuY1hE8W9CZUKX1esN6dEFS51EBKJ+muagIb/JwAbimX8bBq0tNCOCPwjplL40gm1SyDO5LyP8rUOyJAdUr6lQm4sGkgm0XuE7BpOLKAdu9xIZn8OXQXfr0+nQDZNJ5vkp7ohmKCLHe7Z2wHav13wE4JzFGbVKZJTYJeMIWoTQtpgX0hVNz7w0Y8QgjQXVGzJ5YDipcT+e8RWKSKIVP3IeODiji3+QN1GgTNpF0zFDxGAgp9D/7rVURaMPVr7g72c88D3AYkpVEFbAspfcdeWh4T/fg4CsPxI7+2CCYzFp9g2afbfCuK5IvgopehA1bqRlQn4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiMP1L6C+eB9etP+lJb1HXbe07+m30ajmkqnM5iA8iI=;
 b=MzHiZPvuVcbFymorkc8xoimb0RCYbtwu68ydqKcNFXiMzYhkOL5XfbldRpWFMSTBVPZ/tXcQNlkcwCNFmahLjbgqNkhaikQlzjh7CEgjlnaf3nLB8Say910sSqsaM6q2TbBbB0MWVnz/GtAF+et8jkYQSaA8nCat5FKeyCwNOJVTXOai8gedfEcnYWNqWdxvAS8m+m9YOREmeNlfGbA82UyVroohnhqeTLII22exBE2AcyYdX8btePh9UNCfSEz8W5tFDl6OlMz+3glLxxWoMVGqsp6H6fIrLcoSK2NKKQ9dUUS8ODZ/nV87V/kymeSPs2eVseQ3r0gk73tiYs8NCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 14:25:57 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 14:25:56 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [PATCH] drm/xe/uapi: Fix various struct padding for 64b alignment
Thread-Index: AQHaGQtxMIFWRmO8akedoaehp+s4NLB+kdsA
Date: Fri, 17 Nov 2023 14:25:56 +0000
Message-ID: <3c708b258b65451b231c5671fcb605d777b5b250.camel@intel.com>
References: <838c405290912bb923c44b061d0eca4ca347f07a.camel@intel.com>
 <20231117040625.40843-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231117040625.40843-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB6218:EE_
x-ms-office365-filtering-correlation-id: d76e9016-633e-4fd1-5b46-08dbe7791d25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 671A32JIqzHUdQvTDpm49agOskmsle0hnD/Qd9gq5ondWg/SZp5ASCk+vrR/uv41+BoCCGMAP0lSW9hCb/3yRoiF0wjW6NIXLX7G9mqy0vxhK2ytrDOqRKIvNjY8fKoigKUXYEmx9I/vYne8YfV456iS9NTMSJvf7YXYLMeKjUGFxe335aLqkHitaMXHeRNrpVpUZCmgUhj4uGJm4wprxSnrfZXge04be9kqU+kRHIV21MS9xiUeA1bnqAnnii21h2SPqyCBrTZ7x4vj0u3QGwubDXy+jHH7eaj2npsNrlbQtgHiRtaBDMJMTzRVZ32AB9yLiXiRDkG7+BMP3Rde/IECa7xjsCrnz6A11RIGHxZ+f6q15D1W+8W+3D/7OgZh892VhA8NbtzzDkGOiPs2V0XjWWAo6rVYmEOxuNkJ67nmCvE+sbvQeuWZAXNOt3/VN/cfNQv/pla+MYA+CpWk83y6PPf+7NS8P2+ZKHVCVVuoG/EMBwUE+K3MnO1NB5H6upl5bksIWnY2fXROmCjk91Y2Xcqrasx2tK6rSknrZDlL1awJ9hvzWBACbJVlX4BdVXOluFwnRizZUDOR+vQvtCYAOIQLWnFszgR4bl6ZxcAqUoSNp9qAZSLt3dxF0tSX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(366004)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(76116006)(91956017)(66476007)(110136005)(66556008)(64756008)(54906003)(38100700002)(122000001)(38070700009)(6506007)(66946007)(66446008)(86362001)(82960400001)(6636002)(83380400001)(36756003)(26005)(6512007)(2616005)(71200400001)(2906002)(4001150100001)(316002)(6486002)(107886003)(8676002)(41300700001)(8936002)(4326008)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGdHZWRpTTFWYjdEUEpKZjMxczlKK05uR05iUUVJY3dRdDlLWjhsQTJsT1Zp?=
 =?utf-8?B?SjE1OHF1RWU3Q2NvSm5qNU1lcnBhOVdqb0ZjRUtKZkJCcmR0aUVtSTdNU1hI?=
 =?utf-8?B?VmZkTE45czZ4SUE4Vm1wTEhhdVZUVncwdzJ1Wlp4cXhkcEpuTVB2Rks4YTNS?=
 =?utf-8?B?SktkczJCYTk2ODdKWDRGaElmV0s2bkpjY20zeW92V29ZVEllVTdEN3RLbGk5?=
 =?utf-8?B?eTV1YTF2ZnlRQkQ0SUVUYndiV1ZvVGk2dXdMMTBFRFQ0V3VJWHRDamNIWUhy?=
 =?utf-8?B?SHQ4MTd6aVQyejR0ck9iQmJBMmtKdFNybXhzV1gwOGJ5WHFKek0xRTBTYjNu?=
 =?utf-8?B?Ynp0Uy9jRmJkVG9IajZPTW45YkkzVkZDT0FYSHgzOWFLUjdudkJYdjFZMVNQ?=
 =?utf-8?B?N2xydnpKTnlSNnRNSk1udEF5M0pLU29yQ2o0aDczUVJIQTFmaytibER6bm5K?=
 =?utf-8?B?ZG5RUzRiRDBZampnNk1VUmdMNXA4emdYMThncGlvZWpPV0Q3ZTMvbmhOaWNi?=
 =?utf-8?B?dU91MFlXRXV6aEJDMWpmWWplazFPR3NNbGZpcGlmamI5UGg5M3RWbjZTZ3pV?=
 =?utf-8?B?d0hYYzlVWnJaaGg3WjQyS2dLSEZPazlKb0tjcTFFVnZVWXhmVFdya0JHNEJw?=
 =?utf-8?B?NzZneGE1b2FNdkhmWkoxOGNEbWM3OE1oRTVDSTlaMWN1bFBQbkFmci9jdWN4?=
 =?utf-8?B?MFJ4VFViVWVTMlVlTHBoRkFiQVdJWjR5Q0pRYjYyZEorcENnVmZoWitqM3Nt?=
 =?utf-8?B?RExFWHhCTUhUNnlJWnlhaWZBYzV1djYrWXVuTTlkeE1JRE84N2VsajNQL01P?=
 =?utf-8?B?ZDZyL3lTTk0zZENmaEgxZFRHdXdXbzd2VlYzaXo1WStyOFpSN3ZMLzhRMEJK?=
 =?utf-8?B?OWY3TjhDY2tlQWhFOGFUN043akxRZUNFakJ3TUVhU0t6VHRERHZZS2o1YmVy?=
 =?utf-8?B?NENUSHdlOFpMbG55MFB2TS9ib2Jpb3J4cGlWVzY4c1MyK2p3cXliTUt4V05I?=
 =?utf-8?B?L3BvaTZ5Ukd3VlpaK3d3UCtqQVVsUEFXZGVpZG81UTlLSjVZa3lOZkEyWWZG?=
 =?utf-8?B?M016VFZicGo3eXZtNVJtTDFzS2twYnZxVUtTeS9zcUNDdmY2cW0zV2JQUjQ5?=
 =?utf-8?B?NndYOGZ0YlJCQ3hvb1A2UHFNQ3JZQzhNZzFEKzVZOC9hd0pTNUgwUEZDWDN3?=
 =?utf-8?B?aXB5a3ZaZWp3Ty8rcXJtakRJdU4rb2hCUjkwakxWVEpJYVpyeS9ISFArcjYz?=
 =?utf-8?B?M2NLMkRXazlka2lMdGdaeXhkczA2VWNkT3haaHdTYUpxZENwVktYVTZzWXds?=
 =?utf-8?B?MTFkbmZ4TXpHb2V2MDB2ZE5SNmlYMDUzNEVBVnJqcUJuQis2Sk5PM0hzVklk?=
 =?utf-8?B?Y3NSNkRFUjJUaW9HZ1k5K3pxL0lZYlQrZVdmbWtrSkhIRkNSU1pRQ1NVQ29R?=
 =?utf-8?B?MjRRbkEzdE1sSy90U01kSy9PTFBFSVpUaG9rMlZFSWxoTWFPVFVQenNBeXV0?=
 =?utf-8?B?NzJqVkQxQno2N2QvNmdEcStCWGZhVE15UkZjZUpkOG5wNEo3WGl2blFyTllO?=
 =?utf-8?B?RTI1SXZLUjZ3UjlBSW16M2hsSE0xTFBQSGtHTmdjekp1VzZ0NjdCeUNnQUoz?=
 =?utf-8?B?SjE1SFFyZitYbWd6Qjg2YkF2alJuOW5aMHp4U0UrdElUcC9GZituSUhoOUJt?=
 =?utf-8?B?OHFUdENaMlluUktuQi9lMUg0enprNG9yZU1zb2dVbUJSejdScERKdXc2NnRU?=
 =?utf-8?B?MlVvdmswRjJyeUY4cmQ4amtiTy85b1VsYUhvYVpUZHpEQ0ZXa1EyMEZrNmpi?=
 =?utf-8?B?NkErL08yMWxjNjhCc2hGQ2lPcUgrQUJvd0QwSEJ0TnRVSDNrc0ZXT1I2YTZD?=
 =?utf-8?B?MnRDRFhoWjI5TjdRSWc3ekNGS2I3Y3BHZWNyOHUxZXloVFlJQU41ZjlNdTh2?=
 =?utf-8?B?SWdFWXA4c0pYcFBtSlRZTi94Q25xeXNqQSswdk5FaVdSQ21ZYVJwMkhnQTBp?=
 =?utf-8?B?bEJ5T3JNQ1Ntbis1Sng1aWoyTFlaZEFWd0hlWmkvK1N3NUNYbG9XZlZLVjZ3?=
 =?utf-8?B?M3V1Y2ViUUc4UWZXNk9adjRBZ2VDbW9iVnhsbnZvbjBpKzVGYjJzYVVOZ2Ez?=
 =?utf-8?B?SmdDMHQwdGpJL1ZwQUZMRXlTYytJWnN4VEdjZEpvbEVYWVliNUMyVy9vWnFR?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5CBC2E1260E5846AF206F4EEFEB36A0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d76e9016-633e-4fd1-5b46-08dbe7791d25
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 14:25:56.8569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G/uXrMxW5B5GsvasSuEgUZViNBQ9XQOdoUyTWuiq1HKNKHNblnbpFDKy9+xOLLpGYFocBdBWf4VN7sBZ2cNRsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6218
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Fix various struct padding for
 64b alignment
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTE2IGF0IDIzOjA2IC0wNTAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IExldCdzIHJlc3BlY3QgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2JvdGNoaW5nLXVwLWlvY3Rscy5y
c3QNCj4gYW5kIGFkZCB0aGUgcHJvcGVyIHBhZGRpbmcgZm9yIGEgNjRiIGFsaWdubWVudCB3aXRo
IGFsbCBhcw0KPiB3ZWxsIGFzIGFsbCB0aGUgcmVxdWlyZWQgY2hlY2tzIGFuZCBzZXR0aW5ncyBm
b3IgdGhlIHBhZHMNCj4gYW5kIHRoZSByZXNlcnZlZCBlbnRyaWVzLg0KPiANCj4gQ2M6IEZyYW5j
b2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gQ2M6IEpvc8OpIFJvYmVy
dG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBDYzogTWF0dCBSb3BlciA8bWF0
dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9x
dWVyeS5jIHwgIDYgKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICB8ICA3
ICsrKysrKysNCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgIHwgMTQgKysrKystLS0t
LS0tLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IGluZGV4IDgzOGYwMzc5NTg0MS4uNzdjM2Fm
ZWFmNGI2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBAQCAtMjc3LDYgKzI3Nyw3IEBA
IHN0YXRpYyBpbnQgcXVlcnlfbWVtX3JlZ2lvbihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAlp
ZiAocGVyZm1vbl9jYXBhYmxlKCkpDQo+ICAJCXVzYWdlLT5tZW1fcmVnaW9uc1swXS51c2VkID0g
dHRtX3Jlc291cmNlX21hbmFnZXJfdXNhZ2UobWFuKTsNCj4gIAl1c2FnZS0+bnVtX21lbV9yZWdp
b25zID0gMTsNCj4gKwl1c2FnZS0+cGFkID0gMDsNCj4gIA0KPiAgCWZvciAoaSA9IFhFX1BMX1ZS
QU0wOyBpIDw9IFhFX1BMX1ZSQU0xOyArK2kpIHsNCj4gIAkJbWFuID0gdHRtX21hbmFnZXJfdHlw
ZSgmeGUtPnR0bSwgaSk7DQo+IEBAIC0zMzUsNiArMzM2LDcgQEAgc3RhdGljIGludCBxdWVyeV9j
b25maWcoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5ICpx
dWVyeSkNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ICANCj4gIAljb25maWctPm51bV9wYXJhbXMg
PSBudW1fcGFyYW1zOw0KPiArCWNvbmZpZy0+cGFkID0gMDsNCj4gIAljb25maWctPmluZm9bRFJN
X1hFX1FVRVJZX0NPTkZJR19SRVZfQU5EX0RFVklDRV9JRF0gPQ0KPiAgCQl4ZS0+aW5mby5kZXZp
ZCB8ICh4ZS0+aW5mby5yZXZpZCA8PCAxNik7DQo+ICAJaWYgKHhlX2RldmljZV9nZXRfcm9vdF90
aWxlKHhlKS0+bWVtLnZyYW0udXNhYmxlX3NpemUpDQo+IEBAIC0zNzcsNiArMzc5LDggQEAgc3Rh
dGljIGludCBxdWVyeV9ndF9saXN0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgZHJtX3hl
X2RldmljZV9xdWVyeSAqcXVlcnkNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ICANCj4gIAlndF9s
aXN0LT5udW1fZ3QgPSB4ZS0+aW5mby5ndF9jb3VudDsNCj4gKwlndF9saXN0LT5wYWQgPSAwOw0K
PiArDQo+ICAJZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkgew0KPiAgCQlpZiAoeGVfZ3RfaXNfbWVk
aWFfdHlwZShndCkpDQo+ICAJCQlndF9saXN0LT5ndF9saXN0W2lkXS50eXBlID0gRFJNX1hFX1FV
RVJZX0dUX1RZUEVfTUVESUE7DQo+IEBAIC0zOTIsNiArMzk2LDggQEAgc3RhdGljIGludCBxdWVy
eV9ndF9saXN0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVy
eSAqcXVlcnkNCj4gIAkJCQlCSVQoZ3RfdG9fdGlsZShndCktPmlkKSA8PCAxOw0KPiAgCQlndF9s
aXN0LT5ndF9saXN0W2lkXS5mYXJfbWVtX3JlZ2lvbnMgPSB4ZS0+aW5mby5tZW1fcmVnaW9uX21h
c2sgXg0KPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0ubmVhcl9tZW1fcmVnaW9uczsNCj4gKwkJ
bWVtc2V0KGd0X2xpc3QtPmd0X2xpc3RbaWRdLnJlc2VydmVkLCAwLA0KPiArCQkgICAgICAgc2l6
ZW9mKGd0X2xpc3QtPmd0X2xpc3RbaWRdLnJlc2VydmVkKSk7DQo+ICAJfQ0KPiAgDQo+ICAJaWYg
KGNvcHlfdG9fdXNlcihxdWVyeV9wdHIsIGd0X2xpc3QsIHNpemUpKSB7DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5j
DQo+IGluZGV4IGY4NTU5ZWJhZDliYy4uNmUwOTg1NWYxZTJmIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0u
Yw0KPiBAQCAtMjg1MCw2ICsyODUwLDkgQEAgc3RhdGljIGludCB2bV9iaW5kX2lvY3RsX2NoZWNr
X2FyZ3Moc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJaW50IGVycjsNCj4gIAlpbnQgaTsNCj4g
IA0KPiArCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPnJlc2VydmVkWzBdIHx8IGFyZ3MtPnJl
c2VydmVkWzFdKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gIAlpZiAoWEVfSU9DVExf
REJHKHhlLCBhcmdzLT5leHRlbnNpb25zKSB8fA0KPiAgCSAgICBYRV9JT0NUTF9EQkcoeGUsICFh
cmdzLT5udW1fYmluZHMpIHx8DQo+ICAJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+bnVtX2Jp
bmRzID4gTUFYX0JJTkRTKSkNCj4gQEAgLTI5NjYsNiArMjk2OSwxMCBAQCBpbnQgeGVfdm1fYmlu
ZF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbGUpDQo+ICAJaWYgKGVycikNCj4gIAkJcmV0dXJuIGVycjsNCj4gIA0KPiArCWlmIChY
RV9JT0NUTF9EQkcoeGUsIGFyZ3MtPnBhZCkgfHwNCj4gKwkgICAgWEVfSU9DVExfREJHKHhlLCBh
cmdzLT5yZXNlcnZlZFswXSB8fCBhcmdzLT5yZXNlcnZlZFsxXSkpDQo+ICsJCXJldHVybiAtRUlO
VkFMOw0KPiArDQo+ICAJaWYgKGFyZ3MtPmV4ZWNfcXVldWVfaWQpIHsNCj4gIAkJcSA9IHhlX2V4
ZWNfcXVldWVfbG9va3VwKHhlZiwgYXJncy0+ZXhlY19xdWV1ZV9pZCk7DQo+ICAJCWlmIChYRV9J
T0NUTF9EQkcoeGUsICFxKSkgew0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9k
cm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5kZXggODYxMGFjNDYxNjE5Li43
NzdkMjU2NGJjZGYgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4g
KysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAtMzg0LDYgKzM4NCw4IEBAIHN0
cnVjdCBkcm1feGVfZ3Qgew0KPiAgCV9fdTE2IHRpbGVfaWQ7DQo+ICAJLyoqIEBndF9pZDogVW5p
cXVlIElEIG9mIHRoaXMgR1Qgd2l0aGluIHRoZSBQQ0kgRGV2aWNlICovDQo+ICAJX191MTYgZ3Rf
aWQ7DQo+ICsJLyoqIEBwYWQ6IE1CWiAqLw0KPiArCV9fdTE2IHBhZFszXTsNCj4gIAkvKiogQGNs
b2NrX2ZyZXE6IEEgY2xvY2sgZnJlcXVlbmN5IGZvciB0aW1lc3RhbXAgKi8NCj4gIAlfX3UzMiBj
bG9ja19mcmVxOw0KPiAgCS8qKg0KPiBAQCAtNjYyLDkgKzY2NCw2IEBAIHN0cnVjdCBkcm1feGVf
dm1fYmluZF9vcCB7DQo+ICAJICovDQo+ICAJX191MzIgb2JqOw0KPiAgDQo+IC0JLyoqIEBwYWQ6
IE1CWiAqLw0KPiAtCV9fdTMyIHBhZDsNCj4gLQ0KPiAgCXVuaW9uIHsNCj4gIAkJLyoqDQo+ICAJ
CSAqIEBvYmpfb2Zmc2V0OiBPZmZzZXQgaW50byB0aGUgb2JqZWN0LCBNQlogZm9yIENMRUFSX1JB
TkdFLA0KPiBAQCAtNzQ0LDkgKzc0Myw2IEBAIHN0cnVjdCBkcm1feGVfdm1fYmluZCB7DQo+ICAJ
LyoqIEBudW1fYmluZHM6IG51bWJlciBvZiBiaW5kcyBpbiB0aGlzIElPQ1RMICovDQo+ICAJX191
MzIgbnVtX2JpbmRzOw0KPiAgDQo+IC0JLyoqIEBwYWQ6IE1CWiAqLw0KPiAtCV9fdTMyIHBhZDsN
Cj4gLQ0KPiAgCXVuaW9uIHsNCj4gIAkJLyoqIEBiaW5kOiB1c2VkIGlmIG51bV9iaW5kcyA9PSAx
ICovDQo+ICAJCXN0cnVjdCBkcm1feGVfdm1fYmluZF9vcCBiaW5kOw0KPiBAQCAtNzYxLDEyICs3
NTcsMTIgQEAgc3RydWN0IGRybV94ZV92bV9iaW5kIHsNCj4gIAkvKiogQG51bV9zeW5jczogYW1v
dW50IG9mIHN5bmNzIHRvIHdhaXQgb24gKi8NCj4gIAlfX3UzMiBudW1fc3luY3M7DQo+ICANCj4g
LQkvKiogQHBhZDI6IE1CWiAqLw0KPiAtCV9fdTMyIHBhZDI7DQo+IC0NCj4gIAkvKiogQHN5bmNz
OiBwb2ludGVyIHRvIHN0cnVjdCBkcm1feGVfc3luYyBhcnJheSAqLw0KPiAgCV9fdTY0IHN5bmNz
Ow0KPiAgDQo+ICsJLyoqIEBwYWQ6IE1CWiAqLw0KPiArCV9fdTY0IHBhZDsNCj4gKw0KPiAgCS8q
KiBAcmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+ICAJX191NjQgcmVzZXJ2ZWRbMl07DQo+ICB9Ow0K
DQoNCkZvdW5kIG1vcmUgaXNzdWVzLCB3aXRoIHRoaXMgTEdUTToNCg0KDQpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaCBiL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmgNCmlu
ZGV4IDM5ZGE0YjA4MTgyLi4yZWI2ZWYyMjVhOCAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvZHJtLXVh
cGkveGVfZHJtLmgNCisrKyBiL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmgNCkBAIC0xNzcsOCAr
MTc3LDYgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9tZW1fcmVnaW9uIHsNCiAgICAgICAgICogYSB1
bmlxdWUgcGFpci4NCiAgICAgICAgICovDQogICAgICAgIF9fdTE2IGluc3RhbmNlOw0KLSAgICAg
ICAvKiogQHBhZDogTUJaICovDQotICAgICAgIF9fdTMyIHBhZDsNCiAgICAgICAgLyoqDQogICAg
ICAgICAqIEBtaW5fcGFnZV9zaXplOiBNaW4gcGFnZS1zaXplIGluIGJ5dGVzIGZvciB0aGlzIHJl
Z2lvbi4NCiAgICAgICAgICoNCkBAIC0zNDcsOSArMzQ1LDExIEBAIHN0cnVjdCBkcm1feGVfcXVl
cnlfZ3Qgew0KICAgICAgICAvKiogQGd0X2lkOiBVbmlxdWUgSUQgb2YgdGhpcyBHVCB3aXRoaW4g
dGhlIFBDSSBEZXZpY2UgKi8NCiAgICAgICAgX191MTYgZ3RfaWQ7DQogICAgICAgIC8qKiBAcGFk
OiBNQlogKi8NCi0gICAgICAgX191MTYgcGFkWzNdOw0KKyAgICAgICBfX3UxNiBwYWRbMl07DQog
ICAgICAgIC8qKiBAY2xvY2tfZnJlcTogQSBjbG9jayBmcmVxdWVuY3kgZm9yIHRpbWVzdGFtcCAq
Lw0KICAgICAgICBfX3UzMiBjbG9ja19mcmVxOw0KKyAgICAgICBfX3UzMiBwYWQyOw0KKw0KICAg
ICAgICAvKioNCiAgICAgICAgICogQG5lYXJfbWVtX3JlZ2lvbnM6IEJpdCBtYXNrIG9mIGluc3Rh
bmNlcyBmcm9tDQogICAgICAgICAqIGRybV94ZV9xdWVyeV9tZW1fcmVnaW9ucyB0aGF0IGlzIG5l
YXIgdGhlIGN1cnJlbnQgZW5naW5lcyBvZiB0aGlzIEdULg0KQEAgLTYyMCw2ICs2MjAsOCBAQCBz
dHJ1Y3QgZHJtX3hlX3ZtX2JpbmRfb3Agew0KICAgICAgICAgKi8NCiAgICAgICAgX191MzIgb2Jq
Ow0KDQorICAgICAgIF9fdTMyIHBhZDsNCisNCiAgICAgICAgdW5pb24gew0KICAgICAgICAgICAg
ICAgIC8qKg0KICAgICAgICAgICAgICAgICAqIEBvYmpfb2Zmc2V0OiBPZmZzZXQgaW50byB0aGUg
b2JqZWN0LCBNQlogZm9yIENMRUFSX1JBTkdFLA0KQEAgLTY3OCw2ICs2ODAsOCBAQCBzdHJ1Y3Qg
ZHJtX3hlX3ZtX2JpbmRfb3Agew0KICAgICAgICAgKi8NCiAgICAgICAgX191MzIgcHJlZmV0Y2hf
bWVtX3JlZ2lvbl9pbnN0YW5jZTsNCg0KKyAgICAgICBfX3UzMiBwYWQyOw0KKw0KICAgICAgICAv
KiogQHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KICAgICAgICBfX3U2NCByZXNlcnZlZFsyXTsNCiB9
Ow0KQEAgLTY5OSwyMCArNzAzLDIwIEBAIHN0cnVjdCBkcm1feGVfdm1fYmluZCB7DQogICAgICAg
IC8qKiBAbnVtX2JpbmRzOiBudW1iZXIgb2YgYmluZHMgaW4gdGhpcyBJT0NUTCAqLw0KICAgICAg
ICBfX3UzMiBudW1fYmluZHM7DQoNCi0gICAgICAgdW5pb24gew0KLSAgICAgICAgICAgICAgIC8q
KiBAYmluZDogdXNlZCBpZiBudW1fYmluZHMgPT0gMSAqLw0KLSAgICAgICAgICAgICAgIHN0cnVj
dCBkcm1feGVfdm1fYmluZF9vcCBiaW5kOw0KLQ0KLSAgICAgICAgICAgICAgIC8qKg0KLSAgICAg
ICAgICAgICAgICAqIEB2ZWN0b3Jfb2ZfYmluZHM6IHVzZXJwdHIgdG8gYXJyYXkgb2Ygc3RydWN0
DQotICAgICAgICAgICAgICAgICogZHJtX3hlX3ZtX2JpbmRfb3AgaWYgbnVtX2JpbmRzID4gMQ0K
LSAgICAgICAgICAgICAgICAqLw0KLSAgICAgICAgICAgICAgIF9fdTY0IHZlY3Rvcl9vZl9iaW5k
czsNCi0gICAgICAgfTsNCi0NCiAgICAgICAgLyoqIEBudW1fc3luY3M6IGFtb3VudCBvZiBzeW5j
cyB0byB3YWl0IG9uICovDQogICAgICAgIF9fdTMyIG51bV9zeW5jczsNCg0KKyAgICAgICB1bmlv
biB7DQorICAgICAgICAgIC8qKiBAYmluZDogdXNlZCBpZiBudW1fYmluZHMgPT0gMSAqLw0KKyAg
ICAgICAgICBzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmRfb3AgYmluZDsNCisNCisgICAgICAgICAgLyoq
DQorICAgICAgICAgICAqIEB2ZWN0b3Jfb2ZfYmluZHM6IHVzZXJwdHIgdG8gYXJyYXkgb2Ygc3Ry
dWN0DQorICAgICAgICAgICAqIGRybV94ZV92bV9iaW5kX29wIGlmIG51bV9iaW5kcyA+IDENCisg
ICAgICAgICAgICovDQorICAgICAgICAgIF9fdTY0IHZlY3Rvcl9vZl9iaW5kczsNCisgICAgICAg
fTsNCisNCiAgICAgICAgLyoqIEBzeW5jczogcG9pbnRlciB0byBzdHJ1Y3QgZHJtX3hlX3N5bmMg
YXJyYXkgKi8NCiAgICAgICAgX191NjQgc3luY3M7DQoNCllvdSBjYW4gdmVyaWZ5IGl0IHdpdGgg
cGFob2xlLCBtYXliZSB3ZSBjb3VsZCBoYXZlIHRoYXQgcnVubmluZyBpbiBDSSBzbyB3ZSBkb24n
dCBicmVhayBpdCBhbnltb3JlLg0KDQoNCg==
