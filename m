Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0F606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TbUjpN3W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BE310F28E;
	Mon,  9 Nov 2026 13:01:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F185410E8B7;
 Mon,  9 Nov 2026 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794229290; x=1825765290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=znV7TruHbGLZ0elTaNvpWxMPPQi64UND1Hrq5IsQrpk=;
 b=TbUjpN3WoNVftRKnHP2m3a1FExAxQFDfgIfoxc9ILjbwBMp2QgwPXX6i
 JZ6Sr5G5BbXFhSNhixd8QusGJrNcLbpcFLGXNJ0vCY0AM+qTtZi9pxOVM
 NUY7F8s8Gi1ILdNeOs8bdSVhAcOkOEpiEf+PdN0tgAsZYzA6y5WEq104O
 ue1Ap2t7Ruw58aGBN18y2PaCZJlzdM+SNA4ddfzIumMv14O8BY6Sd2U5N
 SANSraxI9qb5k7VAb+Lala42BQ00KrjZyVTVTHQiqegdoHi991MO2n5h4
 77EvFQnrG/NuigrNzNR4MfpHjdYERmjamuMqm9kuVsAD+WxwJnu1SzTz+ g==;
X-CSE-ConnectionGUID: tAqoRbUfSn2K8rN8MxHkMA==
X-CSE-MsgGUID: Jg15ms3qSlCeoC7dAVPYjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2990113"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2990113"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 05:01:29 -0800
X-CSE-ConnectionGUID: Os3LETdASWKGprzsjkLKXw==
X-CSE-MsgGUID: pnDQmRSJTjKbqTWFSwnwbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8194806"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 05:01:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 05:01:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 05:01:29 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 05:01:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nm65rwPvnl6Fza/tM0QVd3Y0fw4VnG2X275syZlJZJBC2GHMo/y+Tey73IJkpFehDmmR6x57KYaA8im9FuUs8XTDoZDZ3fKM2zSboKKTs8QhRQb6cveQhbg5dxP21NJXXvy4vtngzj6VHapUjsjPWIRRF6yERuJXtZTAs6a7vZzSV1QLcRp7GoiLK/k56VeHUdOjIs9VO/yu/yJC5bNjM2zZ3RjMGU/4vs1N5klIyqU16U1f6dFp5wEwys1e+NEoK8wm+dU0biHXWo+awvayF+AfQCar5+T1zI6pVUHYIytGrLTTjgppEINs+4EQYNuV71IRF4aASvpGaWwOnl0Ffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znV7TruHbGLZ0elTaNvpWxMPPQi64UND1Hrq5IsQrpk=;
 b=DykQClt6E/ksmnc0BzVvp7JaIjA+xFwTwEc1Y1JtRkQzY7P+Qn+g3LRRnUgFTJENAru3Uoc+3PzKA5VdrmxZU6m6ZdzfCeEfNRpBu8fdijhOfIN3k9zntJxdziTERv8CW0uJPxvdcCS3CIWL0Y7HfPLY+ETO089PQ8t65Jp8M/lFgehq4ro5vf3UOdoA6+HCnnDw31a/oeKTRxCggNl4bG76XA4CqIh6QkqCsrZtnWbOwiutWiad9B/K8582EITk13A8yWSb58OyojU034ThIRR6P9e0tL6MKsmvz51Y26l5LQ+vgG7S1SScGZ04Pg7T1QOhc72zppUu5fKjsWHZXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by CH3PR11MB8362.namprd11.prod.outlook.com
 (2603:10b6:610:175::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:01:25 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 13:01:25 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: Limit the eDP joiner to the pipe A and
 B pair
Thread-Topic: [PATCH] drm/i915/display: Limit the eDP joiner to the pipe A and
 B pair
Thread-Index: AQHdbdL7JOhmZTxcMk2/3vI98dCcTrchKleAgASNgrA=
Date: Mon, 9 Nov 2026 13:01:24 +0000
Message-ID: <DS4PPF69154114FE3CFA8AA660E177FD133EF732@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261106094113.2917630-1-mika.kahola@intel.com>
 <au3xT5fiaiEdpIN-@intel.com>
In-Reply-To: <au3xT5fiaiEdpIN-@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|CH3PR11MB8362:EE_
x-ms-office365-filtering-correlation-id: 214a61e1-97f5-422f-d4f5-08df3e618f97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: nkWg/9JklbLiZMTGoHunCljB9+pQ9RE1ipA46F4Wopz0cB3fz/iOGaM3u/CFKx8ZtyzhqJLf7aPdABcptFtiJ8G/1hbZrZ2EX6GjzCYdiJiKRL+KceBk6wYrO7ztn/uimX3+QDS3gBLqTin7BXrE7b9G1v1kV1ZX5YTPfbNrPlm7lvok/H0dM6RVKdsqE4XeVxj/3RwArkFkO/cgFOg+5oSh0kuWXCzhGnfueK1xU0ZUB7+YJIfjOczd6U78Bt2boMFTIGAiKcrfl3cx7dfb6eej97Z52on6gc9rjETLgJZNM5rH3IGA79Qtab5dxvKXXd8t4Nx9Z55tV6jQve9OBmJxYLjnZiZKTlLSSg5jg+JNSvdoPO1GxM9PSOi8EczrRsJxYp7DzZeerc0+z5th+gqNPabRfqlO0tmHuHoOwU6CjCgyaaoegYEl9EHMu+/IFGtB19P3sX7rivG0gnx0bXPBN6yvsuNb0MpTZJlnOQbHyjBq092HhAtT7ngq9dh7SRBKuxVfITk/TyofbqKbgJRQHvIQSa2Q+nx5lw0F+ZQLCy6NDcgcgwxlm4T5Dco35rBVftWdurbhjg+/ehvVwo9aFWMSkXYNKVwkUsL6StY8NPq35VN94d9eCsMVOGu22ay75jYKWDdWOi2ML57xIeWPmZZuCjwXGNxhCj1Bw0Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkxqYkxhRDk2NFNCdUpQdnMwSEM2MXl6M2VNOHlqMlZwemdHRmpxT0pmYzBS?=
 =?utf-8?B?ZkJjcUxhbWVoaDlRNDlyN1kwb0NwYnRXYytMaDV1TkxaTGw2Tm5vZjJKZCtS?=
 =?utf-8?B?NjJyRVhzSFFtWTl1NFl5V2ZQeCtiUEx4NE5EZndkZ0IrZDdjN085a0djUnd6?=
 =?utf-8?B?dUlhNUwzb1o3c3plR2ZGaHJXUCtWWGtNSEhDV1FweUwxU3RKbE1NUCt3VTQ3?=
 =?utf-8?B?ME5vWlZZTWMvZW9ZQkJ4ZVE4S3I2VUdBYWhWbmpybXZuU2t2bVZXTVp3amJT?=
 =?utf-8?B?d0Y5V29sc1lEcnRCelcrSG9jRERWZDNZa3NKRnpiTFNqc2lZY2tWNVF1UXRN?=
 =?utf-8?B?L0gvcG1Za0NNd2NuZnY5TWxobkltd3RUMlQ5TlkxV2VQL3p1T1Fod1p3TS9O?=
 =?utf-8?B?dk1PQkNKellFRTI3MTFCdjBkT2FDcnl4dW1EeS9OM0ZLbjYzWGFzN2pHMHE3?=
 =?utf-8?B?WnhhcWpDWjhCU3NqdVhYZ3RUQnpodWt0QThwWTA4SzNxZTkzcVI2Y0M4cE1o?=
 =?utf-8?B?VGg3eEFXMXhwZ1RFUVNSZlJKVnZGSzk3SmR0QlljNlZybzJhNnN5Q1lnaEpL?=
 =?utf-8?B?K0QralBkMHBkOU1MT3Z5Y08wSGlMYm5sRGlXK3pRWm1wZE9ua2JrMGNuZUIw?=
 =?utf-8?B?MlpJdjZxTDNJMWZhUDh4bG9Lc08vMFBVRG5DRGFsL0VDZTlrK3NHQzdFOENK?=
 =?utf-8?B?MGZSZzhwbEVkbVh6WnNxaWxkUXRKUXlEc3RGcG5rQ3NteVRncTBVVWtXWmVZ?=
 =?utf-8?B?YmcxQ0ppWWZWVjZOajFkVDNNcjlSZHRPR21WUGFnVktJL0kyWVVtdTBneEJi?=
 =?utf-8?B?R3dEVER2b2FSd1FZRUxSS1VxT1dmUGlkdVljRitaMkRvbUF4ZUVDZ3pKN3ZK?=
 =?utf-8?B?dUQ5U3lJOVNSbW51YVVwdFlOOE4xSzZIV0gxV3VPMkliMWwxL0ozdjVKQVMy?=
 =?utf-8?B?MUl6Vkt1OHRqbEE5UnRES0laL2pNTlpKYzVLQkhseXFnRlF5YmQ5YVRPWDIv?=
 =?utf-8?B?ajlYcHJxZGZoV1I2Z3RqN2dmWGdXeFZnZnM4UHRqYmw4NHRWR1JSeGFuKzd6?=
 =?utf-8?B?dXJDV0FJWDBKVXk4RUFkRUU3aWxZWkRkd1lDcFp6UGw2cFRJdnhTblRwQi9G?=
 =?utf-8?B?WHEyRm8xb2srWS9zMWxSREJvRjBhZXdCbm02MXczVmh4L2dXcHBoTjd2M3pQ?=
 =?utf-8?B?SlByOWI3eGpCMmNvYkhvaW1BdjlGbEk3VVlCc3VFYndYZHpHNFZQZDdURllF?=
 =?utf-8?B?b3U3WldDN2dHb2U3TFJJeCtTSmtFSC85TUJWa1ZVM1lIUlJ5UTBkRUUwbjVB?=
 =?utf-8?B?bFBZWVlCSEpVVXVsckYyUndJTVR6dzRrRU5PcFVEb1IveElESURsNGZ5YkVh?=
 =?utf-8?B?d3N2bTE5NHpYcUJFdHI0dUtWTVg4VCtnNHRXd0JtTlpZVFFBOEh6dDRHS0tN?=
 =?utf-8?B?VFBUenNmS084T3JZTXlic1J0UkpMK1cxcFIzczUyMk9ldFUzT3k1UUpXeW1K?=
 =?utf-8?B?L1Z0dTc1amtEbzZRclFFREFHb3JDYkJIVUw3TisyTlFEMXJZTU92OGpJUFFm?=
 =?utf-8?B?NTN5aEtjU1lJcHA3RkU1V2FRYWcyY0dZV2NRNHhWKzN3UUpiYXJNcHd3Zldi?=
 =?utf-8?B?ZWNmeEVhSFo1SW9VQ01DWlV2TnExVzQzUzZKekJVS3Bja1NHWGJ5T25kMGQw?=
 =?utf-8?B?ZGtJRVgydzlucDYreWtEcTZidlRsRGp6cVhzQWNTUWl1ZjlrUzdLYmNrQWhR?=
 =?utf-8?B?dHV0MGhNY1dCS09XUDUvSkc0UXJjK09OOWtaSHpwNkRpN3A5aVI2ZkY4K3Fx?=
 =?utf-8?B?aTM3dGh1cFk5dmZNeFhHZXhLWEpxWDQ5UWw0bkcyY2ZubXQxNFdsWUdRL3k1?=
 =?utf-8?B?eHFzUWJYTEt6Um9lYnh6VWt3WWVQYWU3VFB6UHBuSmVZTU9NTHRBL251TjAx?=
 =?utf-8?B?NWhSWFdGVTVOVnJoTGpCcGZGWG1wbml0RFplZExrSDlQNXEwdlpQYnl6TWZq?=
 =?utf-8?B?OTVLazI3ZzRsUzRteWZYa0IyOVlmNmRBTHBlSitjQk5iVDJnN21IeEFjaG5B?=
 =?utf-8?B?bnlBd2pOejBYWjQwWFBhWWdTUGZIOHhCODVaTmxFbU1RNVhQRzQwSHY2QlRV?=
 =?utf-8?B?RTRLc2U2VjlYWGFxclB2RWVtbjZ6SjFzU2FZVUFNRGpITWh3UXBzRUE5WG5Y?=
 =?utf-8?B?SzVxTGU2RUt0cXZ3SEFIWU9KbndPQUZzVVFvTmY4VC9kQkt6dHFQbGo1dWV2?=
 =?utf-8?B?amVpdUpCdVBCcTlGaFY3WUk5clArSUFDc3dCdTAvZ3hkMCsvbjhDUjZPWHpN?=
 =?utf-8?B?dkplTHhoWk44M2JjU0k0WWMyZjlORHRKVUdxalRYRWIyOVhOODlKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FNxrgPHWJxoavvXSUvYBD82OO5VxOLtMew5JEAWnV9UFhXwAoqxUlaP5Qo28wK9+LmsH+2QkXcKQ+cfhlWVetyM7WB0FPpuO0Fl3eo6utarmsetNdUT6zyEOfZOMU7ik+N+d6EQv6hhuUIc7/xaVmJ7CCvrlCW4FOmRP/owseGz+xnbQ24+p/UziukdRAVyNHh4uIMa8UYLLCn1PayFHTrPX/cQFJOf3AfLu4Mh85vPXjQdNjvuSJAlqjgwtepfhT+Rw71KTFHYkForRTAN4ehXSIMoKfqrKpunD5BTCNh773bqWp3Rq44B0+EtMM9+ToiY83SFo6bZl3anr5KBqdw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214a61e1-97f5-422f-d4f5-08df3e618f97
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 13:01:25.1685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pyGQl3NCJSy3ohbFbajBSqJDP+hIs1HRm/Tx+sZmxqt6WbSu01zAksnjaRNn2IbyTbZ/vL7iguyyjxQoTqL5OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIDYgTm92ZW1iZXIg
MjAyNiAxNy4yNQ0KPiBUbzogS2Fob2xhLCBNaWthIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQo+
IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2k5MTUvZGlzcGxheTogTGlt
aXQgdGhlIGVEUCBqb2luZXIgdG8gdGhlIHBpcGUgQSBhbmQgQiBwYWlyDQo+IA0KPiBPbiBGcmks
IE5vdiAwNiwgMjAyNiBhdCAwOTo0MToxM0FNICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
PiBlRFAgb25seSB3b3JrcyBqb2luZWQgYXMgdGhlIHBpcGUgQSBhbmQgQiBwYWlyLCBvdGhlciBj
b25zZWN1dGl2ZSBwYWlycw0KPiA+IGZhaWwgdG8gY29tZSB1cC4NCj4gDQo+IFRoZXJlIGlzIG5v
IHN1Y2ggcmVzdHJpY3Rpb24uIEp1c3QgdHJpZWQgaXQgb24gYSBQVEwgaGVyZSBhbmQgaXQgd29y
a3MNCj4ganVzdCBmaW5lLg0KDQpZZXMsIHlvdSdyZSByaWdodC4gSSBkb3VibGUgY2hlY2tlZCB0
aGUgc3BlYy4gSWYgUFNSMiBpcyBvbiB0cmFuc2NvZGVyIEEgaXQgY2FuIGRyaXZlIHBpcGUgQSBh
bmQgQi4gSWYgUFNSMiBpcyBvbiB0cmFuc2NvZGVyIEIgaXQgY2FuIGRyaXZlIHBpcGUgY29tYmlu
YXRpb24gQiBhbmQgQy4NCg0KTGV0J3MgaWdub3JlIHRoaXMgcGF0Y2guIFRoZXJlIGlzIGEgbGlt
aXRhdGlvbiBvbiBBK0IgcGlwZSBwYWlyIGluIHRoaXMgcGF0Y2gNCmh0dHBzOi8vcGF0Y2h3b3Jr
LmZyZWVkZXNrdG9wLm9yZy9wYXRjaC83NjI1MDYvP3Nlcmllcz0xNzY3MTQmcmV2PTENCg0Kd2hp
Y2ggbmVlZHMgdG8gYmUgbGlmdGVkIHRvIHN1cHBvcnQgQitDIHBpcGUgcGFpci4NCg0KVGhhbmtz
IGZvciB0aGUgcmV2aWV3IQ0KDQo+IA0KPiA+IEtlZXAgdGhlIGVEUCBqb2luZXIgcHJpbWFyeSBv
biBwaXBlIEEuIERQIGFuZCB1bmpvaW5lZA0KPiA+IGVEUCBhcmUgdW5hZmZlY3RlZC4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyB8IDIx
ICsrKysrKysrKysrKysrKystLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RwLmMNCj4gPiBpbmRleCBlZjE2NGE3OTc2MTguLmIzNTlhNjZhMDE4ZiAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gPiBAQCAtMTM2
MiwxNiArMTM2MiwyNyBAQCBzdGF0aWMgaW50IGludGVsX2RwX21zb19waXhlbF9jbG9jayhzdHJ1
Y3QgaW50ZWxfZHAgKmludGVsX2RwLCBpbnQgcGl4ZWxfY2xvY2spDQo+ID4gIAlyZXR1cm4gcGl4
ZWxfY2xvY2sgLyBpbnRlbF9kcC0+bXNvX2xpbmtfY291bnQ7DQo+ID4gIH0NCj4gPg0KPiA+ICsv
KiBlRFAgY2FuIG9ubHkgYmUgam9pbmVkIGFzIHRoZSBwaXBlIEEgYW5kIEIgcGFpci4gKi8NCj4g
PiArc3RhdGljIHU4IGludGVsX2RwX2pvaW5lcl92YWxpZF9wcmltYXJ5X3BpcGVfbWFzayhzdHJ1
Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiA+ICsJCQkJCQkgIGludCBudW1fam9pbmVkX3BpcGVz
KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVs
X2Rpc3BsYXkoaW50ZWxfZHApOw0KPiA+ICsJdTggcGlwZV9tYXNrID0gaW50ZWxfam9pbmVyX3Zh
bGlkX3ByaW1hcnlfcGlwZV9tYXNrKGRpc3BsYXksIG51bV9qb2luZWRfcGlwZXMpOw0KPiA+ICsN
Cj4gPiArCWlmIChudW1fam9pbmVkX3BpcGVzID4gMSAmJiBpbnRlbF9kcF9pc19lZHAoaW50ZWxf
ZHApKQ0KPiA+ICsJCXBpcGVfbWFzayAmPSBCSVQoUElQRV9BKTsNCj4gPiArDQo+ID4gKwlyZXR1
cm4gcGlwZV9tYXNrOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMNCj4gPiAgYm9vbCBpbnRl
bF9kcF9jYW5fam9pbihzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiA+ICAJCSAgICAgICBp
bnQgbnVtX2pvaW5lZF9waXBlcykNCj4gPiAgew0KPiA+IC0Jc3RydWN0IGludGVsX2Rpc3BsYXkg
KmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGludGVsX2RwKTsNCj4gPiAtDQo+ID4gIAlpZiAo
bnVtX2pvaW5lZF9waXBlcyA+IDEgJiYgIWludGVsX2RwX2hhc19qb2luZXIoaW50ZWxfZHApKQ0K
PiA+ICAJCXJldHVybiBmYWxzZTsNCj4gPg0KPiA+IC0JcmV0dXJuIGludGVsX2pvaW5lcl92YWxp
ZF9wcmltYXJ5X3BpcGVfbWFzayhkaXNwbGF5LCBudW1fam9pbmVkX3BpcGVzKTsNCj4gPiArCXJl
dHVybiBpbnRlbF9kcF9qb2luZXJfdmFsaWRfcHJpbWFyeV9waXBlX21hc2soaW50ZWxfZHAsIG51
bV9qb2luZWRfcGlwZXMpOw0KPiA+ICB9DQo+ID4NCj4gPiAgYm9vbCBpbnRlbF9kcF9kb3RjbGtf
dmFsaWQoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksDQo+ID4gQEAgLTMwODMsNyArMzA5
NCw2IEBAIGludGVsX2RwX2NvbXB1dGVfbGlua19jb25maWcoc3RydWN0IGludGVsX2VuY29kZXIg
KmVuY29kZXIsDQo+ID4gIAkJCSAgICAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5f
c3RhdGUsDQo+ID4gIAkJCSAgICAgYm9vbCByZXNwZWN0X2Rvd25zdHJlYW1fbGltaXRzKQ0KPiA+
ICB7DQo+ID4gLQlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3Bs
YXkoZW5jb2Rlcik7DQo+ID4gIAlzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YyA9IHRvX2ludGVsX2Ny
dGMoY3J0Y19zdGF0ZS0+dWFwaS5jcnRjKTsNCj4gPiAgCXN0cnVjdCBpbnRlbF9jb25uZWN0b3Ig
KmNvbm5lY3RvciA9DQo+ID4gIAkJdG9faW50ZWxfY29ubmVjdG9yKGNvbm5fc3RhdGUtPmNvbm5l
Y3Rvcik7DQo+ID4gQEAgLTMwOTksNyArMzEwOSw4IEBAIGludGVsX2RwX2NvbXB1dGVfbGlua19j
b25maWcoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIsDQo+ID4NCj4gPiAgCWZvcl9lYWNo
X2pvaW5lcl9jYW5kaWRhdGUoY29ubmVjdG9yLCBhZGp1c3RlZF9tb2RlLCBudW1fam9pbmVkX3Bp
cGVzKSB7DQo+ID4gIAkJLyogSWYgdGhlIHBpcGUgY2FuJ3QgYmUgYSBqb2luZXIgcHJpbWFyeSwg
c2tpcCBlYXJseS4gKi8NCj4gPiAtCQlpZiAoIShpbnRlbF9qb2luZXJfdmFsaWRfcHJpbWFyeV9w
aXBlX21hc2soZGlzcGxheSwgbnVtX2pvaW5lZF9waXBlcykgJiBCSVQoY3J0Yy0+cGlwZSkpKQ0K
PiA+ICsJCWlmICghKGludGVsX2RwX2pvaW5lcl92YWxpZF9wcmltYXJ5X3BpcGVfbWFzayhpbnRl
bF9kcCwgbnVtX2pvaW5lZF9waXBlcykgJg0KPiA+ICsJCSAgICAgIEJJVChjcnRjLT5waXBlKSkp
DQo+ID4gIAkJCWNvbnRpbnVlOw0KPiA+DQo+ID4gIAkJLyoNCj4gPiAtLQ0KPiA+IDIuNDMuMA0K
PiANCj4gLS0NCj4gVmlsbGUgU3lyasOkbMOkDQo+IEludGVsDQo=
