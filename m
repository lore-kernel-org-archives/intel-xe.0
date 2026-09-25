Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC26C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 11:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD1C10F9F2;
	Fri, 25 Sep 2026 11:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDkkiEvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0AC10F9EB;
 Fri, 25 Sep 2026 11:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790334421; x=1821870421;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=gV7+x1isOsHuVmrfuUDnhdOW+PA4CelSnbURihXCUhc=;
 b=oDkkiEvG3Ot5fYJc2NpmwcxnUvXu45cQxDgEWwboblkZUJ4+y0dUNyEg
 wn3dM6wBWdTVvf3meOw+Qm/bT2vaazAwAWL/LhT3me/vUrZf43pJjm+Gv
 KcppgkLmlrKlRFF2gRNZjGhGqC1lucDj8+V8XibDB8s/S+YQLuzUTL6mY
 fxQRNA473naw6htWhRSxBBS8ZSpwmIHa85WDeWPjBOm74+KtBYnguPPwh
 wjIgR9wBdj93lhEUoiF2ZYRokTuipSaCzTQUkY8xmKvBoAOKkx+QjAs2O
 3rzkw4y5xw8tsQfikZxhyqmdMXUbjmL4OwtZ+iWOhKEclFhOqtLySul9B Q==;
X-CSE-ConnectionGUID: bT/wTFUiS7uomH1gzGulFQ==
X-CSE-MsgGUID: /UQ8+YGvR/O7JURV3QDd0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90337593"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90337593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:07:00 -0700
X-CSE-ConnectionGUID: 0+MEggd9QT2Qr+125geIfQ==
X-CSE-MsgGUID: qunPUmlRTWOaAqzrTdH6sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="277692161"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:07:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:06:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 04:06:59 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivHWCvaKcSz1s9umPye2/TnNEfHGC9bqw4fBDQnJJv+ZlYSvwDbcI+drRs243r5EeW6fbjULV/no7bI0Vxgr2eyTzW0qfTOXRt38JrKxXhf/ASXAEP71cRkTa+8u5lAHk8MpMJTjVQGAfpREFfo2LIdYROQiEb5facnrWygOKN6U49+T5YcD1RigZ2hkT6TPSHmUGo40eh35EXBQEoKz0zFh0jmjmWUtNHmcProy6KyI+Px71SX74Joh7sAcRl0C6cIACvo+vwNz9yKJBQVIPzpSoEIA9tW8mZohznf2rIClZqJqsNTH+yzrfimhe52Tc/IK182gYIOxqnDFZ5dvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gV7+x1isOsHuVmrfuUDnhdOW+PA4CelSnbURihXCUhc=;
 b=Bbp3uGvTbBkdz4FBHnWL2+8IInOAJ3f1Fv/5fOyfziizowJcVIFZPtRQKje+tcfmv5/lWDdqy5pxmgXKkzVxNLRDQ19iWH45PMu3TlAB97XQIt1vCLPvTDDBgeOVP8TMcrugFF/ep0mzqbhWfQPFkQDaKOmXOyhhAwovWVO1gowxViZv3Ij0lCMrLQTXP/R/n+5GMbb6cXnu2BwSi4QMH493ex9h+Ngtc4eRjk6VMLvHpKA9P09scJWEVvBXVrnrS9unt84+6LfoVVJdHWpbnJe4VrKc/aeCysiWZjVXEV31X9EZN9cXRlpvNYKpeTB93s7qDHUs3glxwE5cbdQ4Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DSWPR11MB9870.namprd11.prod.outlook.com (2603:10b6:8:4e2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.19; Fri, 25 Sep 2026 11:06:56 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:06:56 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/psr: Allow Panel Replay and PSR2 with joiner
Thread-Topic: [PATCH] drm/i915/psr: Allow Panel Replay and PSR2 with joiner
Thread-Index: AQHdS1MR5URgBBYjjkOSqQdVUGvGLLbfJUsA
Date: Fri, 25 Sep 2026 11:06:56 +0000
Message-ID: <0e3a5c8d0ce949af917011f3b6329ce66c95a382.camel@intel.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
 <20260923115941.746934-5-mika.kahola@intel.com>
In-Reply-To: <20260923115941.746934-5-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DSWPR11MB9870:EE_
x-ms-office365-filtering-correlation-id: a57e439c-2834-4aa9-2b77-08df1af51ccd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|4143699003|6133799003|10067099003|260925021311599003|3023799007|260925021911599003|22082099003|18002099003|260925022911599003|38070700021;
x-microsoft-antispam-message-info: FVnFLRupgyboFrEdrBIoXrdvFAX3LxoKBJQRlF6Yxp6E07Drv+D9h90TFu3p7nqZjQp9vlTr9k0fIJ8JCfW4bV405kmAHyy62OyQnge9Lkr6snJAwKkoghGtNxWiYIDaj0DnGDBYkKcWEWqCVhoGM4/0GWTUZ8QmUJED7HAfJ6Hjt1T9qQVdlKJcDrYOVzCt7DoHSfZ7sNWMDiDPBS4iIyxDssWPoQKyEfklxRWZLjaUJHj3a80HEDXxaoyoUKcqBgHoVu1LD3Vpi8zJ8dXdK0zFT96iwEGYo80gTWXgsU8EEmDzpMMGFZ2cl0QKS0yiSz3YKkYPpRJbZQyqOcIuPZgilvC2559zR4a6vFKy8AOQx0/b+TartGJ5gdEj3DuTbE52EEtZkA72m+B5HYV4zhtjGbEwqNFYb/luQFGimbQ3h+kuqLC4SGzfn/bIy3fX0whlYQ3b/7Itp7Av46qw7KlCoyZEm8xBt9gLmwVffhBRw6PYWd5C7DHtMkSbwiWqjtgH1+zIo6lkutdtJOHRhSctwfoUFgkZjn7fOV+A1YfeYBDXi2W3kMy2D1MwE2tARs5exjyq7lgNTf8VM3X7QMj0QQZs1skb665tK83X5jKEpRifEScfWYjvhwP3BUC/wvGalzCP3vQTDW1XeCBu0OB2p1x+BkRnO9CM19C+JdFPF/gCkwVf2cFHE+I0hhceLrAWrZA8Sfk3UTBO7OSVT0q9GMRaphX6p8Mx6351I+4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(260925021311599003)(3023799007)(260925021911599003)(22082099003)(18002099003)(260925022911599003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3dveElnTUhOZnRnWTZ2M0VYN3FqSzZTcXROalNJZXUwQlR3V2NHUUMxZ1A1?=
 =?utf-8?B?UStBbzU2dFVnMnZ3UHY1amxyTGJhMGZScUR3ZXNHV3ZzdE9PWWdqa2drZkR2?=
 =?utf-8?B?SlZwK3JIanI3LzViTTNvSmsvTlY3MTg1aDk4WXpVNEhEUEovNjMrWUpNWjVr?=
 =?utf-8?B?NXM5Sjh3WXNBazJHMjh1Q1NnUGtwWStxMk14OWlGcUVwWWFMTStkWjFGdVh5?=
 =?utf-8?B?QVVhd1BxYnV4bUZYMlF3R2FDWkU1QVFaNXp0dE5PWVFXanpiM2F0ZjFnaWEz?=
 =?utf-8?B?SzU4WmlDN3AyWHVVTlFFK2gyVU5YbGFrdytrT0w0c2JUbks3T2Rlak1wK2Vj?=
 =?utf-8?B?czdJbEU4MlNCVE9VS0ZKd0pNMURPY0tISW1KeXdaVitEbVVyai9sZkU1VVR6?=
 =?utf-8?B?YVZhcFdNbDE0aDh1M1NqSEhNL2JHYURMTUVIeERVSWpxaU5rVGVvSkw4aGNZ?=
 =?utf-8?B?NGRuUjNSZkY5OHFmK3V4TkZBWkt6czk5ajdhZFhGamdaeW00aFpWR2lmRUlo?=
 =?utf-8?B?ajRGRUtqamg0WmdTM0RnK1NXdkdEMk1oSzNuR1hSdGtWOXhHY2pIS01tUFds?=
 =?utf-8?B?Q2FZNkVsNVJ5dEdPb1d5MGh3bng4MHJFN0hNWGtyL2dKNVRSNmhiTmFmbm1I?=
 =?utf-8?B?ZG5hSDZ0eXh5Y2grZkVrcXA2Mkd6SFp3YmVyMVhvUkVzL0tNZkY5RkNNZUN5?=
 =?utf-8?B?M3ZQbCtuOHJ3WFg0SDJOeWI2ZjJDY280VWJzbGJpNlloaThQV3hnbVVCOC95?=
 =?utf-8?B?UGpUdEdZQ2RsME9Ud09DMTB4RWl2Tm1wa0RyeC9MWXF4ajV0SlRaK2RqTkM2?=
 =?utf-8?B?UkdLenFFZ2dKdWZMN1NBNi9SRTFFcGNoNDNIQWRpUUtsZ25qUjAzQkhNcUlw?=
 =?utf-8?B?aWVlYlZlMnpzT2N2ZnM0NVNuR2xzRDlXUE1RT1ExV1VGeXVHU2p3R3lQOFNH?=
 =?utf-8?B?K3pxWVZiaGl5NndGcWc3MlhsSEdpRlZKdjhpVElTSWJDM2NwT3hYajZ2MzNu?=
 =?utf-8?B?YUZQVjhqSGphMjJtenBQNVl0d1ZudUxTSEo3ZWM5amlZUHJxODA4WmppR09m?=
 =?utf-8?B?d2xna1pUbEh6UEYwaG8vb05uQ0c1cU1GcWh5MVlMQ1pMVzFFMTNGYStjQ0dW?=
 =?utf-8?B?WVRKQlRhMHhDODNOY1A4ekNUZ2VlbWRkcitHWnY4Y2t0a0c0YzFOUHE5WWdZ?=
 =?utf-8?B?aXN2SlFkMldGWlJBTHpnYnFvVzdUK0FFOXVNdTR6OXFySXNlRjJDeEp6Qjk5?=
 =?utf-8?B?czRTTnBiOENRYTVOOTRkU2FpSHlIV29RVjVXMmFhUjFHZSs0a1pRTjgyK3V4?=
 =?utf-8?B?ZWplM1drMmY3eHpjd1N2QUlTNWhtMjlpRkJYeDJoaTNuZFVTWmZHWHhYK3Jl?=
 =?utf-8?B?QzkzempCdlJLMEltODUzK3NnTk0yNllubEMxR0wzSEhzclQ4ZndTT3JhNFRN?=
 =?utf-8?B?bVd6UlBBK0pOeitKK041TnlMc0l4TnE5eEV0UnNsTlN2eWdIeTJQMStweFpQ?=
 =?utf-8?B?Vmp4MFFkb0c1WHErMGhtMzNockdQaElCTGFGampnbXFJUTN4bCtkZ0dSbkI5?=
 =?utf-8?B?V1B5YTZhVTltTndqejlDVnh0WkpmUkV1ZEV1MHNvMjZBNDRUV3gyZFpXaEVj?=
 =?utf-8?B?QXUvc2RCbFJnUUJsRkp4Sy9GcVBiQVJkNEVHWk9nK096ZXBkWVlocTVuaGEy?=
 =?utf-8?B?bkwwVzAyUWRmOHlZR1VmaUVXM0cvWTN2QWR6dkRnN3NEaUs5Q2pET0F0bi84?=
 =?utf-8?B?eHBVODg1eFpFL1hLKzVueUZXTnBiNnVNakpRUFNzbUM1OHNLWDJWL0JrMi9w?=
 =?utf-8?B?eVFySFdlQjB5QVg3MG5hQ2NjcytwcDBYT0ZRYWM1Y2JMKzlvOE9CcUhMWGtL?=
 =?utf-8?B?SjhVb0tjMTBZS0YvQkxYNlRrOFpqVVNwNGg0U3RPMlNjaUl5MEJaUjdOQm5X?=
 =?utf-8?B?RFJZYkpWOXZtOS9MOGYwYjRmVzIzOXlYVVduZDVhamM2eTZhRXdablh1QTlu?=
 =?utf-8?B?eXFwaFZ3WGJraFhNV2psbGtVem12VHk3L3FKUUxjaGlrZXhDQVlQQTg3bGFX?=
 =?utf-8?B?VUZ1ME5vZnhQQkUxdkwzMG1pQnZ6WVpZazkrTGUvYU8wcVZZaXhPZnpnQUQy?=
 =?utf-8?B?R09USmJnelk2VGkrTndRSGwvUlprYStvcm14RU52Ukk0bjN2TE1GcXRCQWEv?=
 =?utf-8?B?ay9SYzNXS2psMHlTV0ErcjVoT3pRY0l2Unlhak0yODVTd1A0MkFjUzJEc2U0?=
 =?utf-8?B?YzZWc3U5RlFJSXhrSUgrNDJxeVRFc0N6amJmVFhmdmpmK2hpRzI4ZkZUWXh3?=
 =?utf-8?B?cXBWSTYvRWFBT1RXRDlNcXlDdHJWMkZMZ210bTRQdHJFbnh3YndhTTJ5bnlx?=
 =?utf-8?Q?VfLm4dRwAQzlqcpA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A64C7DA6DD9B0A4D89191E2117947C9A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: euYuKqS3pUl8IGbZjYYrRKJ2ayKqzQ5+ojWbCxFHXjkej1gGl67/cEg3w0Kjzrlr4uUszS1wBaoVf648UjqBQCs39nsCfmNxtdkZYnu6hjJYotzunqo41jWJTvAxDcy8z6ZRX5vlkCDVwDB5XorkVDpzuCI4hXJ3dcFC6PnvX9GAHEfGi/jmldb/hQ133+A5uIKANpUCG4sAq3mppNh/bfcJVtjs8SKfF8AEUNp0wShspq9/2e3S6gNgX2IovlHCFpfQeJAxRq+Q0A7KARD/msUMHMIFA7cCf1St7XOHTS849la/HE7/EpPe0PcMB23Y1hD8yMjJeu191qSim3V8ZQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57e439c-2834-4aa9-2b77-08df1af51ccd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 11:06:56.2375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O33ME/aTPt5CISRVA/a8WzZoLd1pVGO9nx6sySfOCESzFrmzfobf3v6jlBX6fcvN5ruYdXCelreESxe9K2WGKGJg3krU65IHcqXtcHEjReE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9870
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

T24gV2VkLCAyMDI2LTA5LTIzIGF0IDExOjU5ICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
RWFjaCBqb2luZWQgcGlwZSBoYXMgaXRzIG93biBQU1IgcmVnaXN0ZXIgYmxvY2ssIHNvIFBhbmVs
IFJlcGxheSBhbmQNCj4gUFNSMiBzZWxlY3RpdmUgdXBkYXRlIHdvcmsgd2l0aCB0aGUgcGlwZSBB
L0Igam9pbmVyLiBQbGFpbiBQU1IxIGRvZXMNCj4gbm90LCBrZWVwIHJlamVjdGluZyB0aGF0Lg0K
PiANCj4gQXNzaXN0ZWQtYnk6IENvcGlsb3Q6Y2xhdWRlLW9wdXMtNQ0KPiBTaWduZWQtb2ZmLWJ5
OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jIHwgNzMgKysrKysrKysrKysrKysrKysr
KystLQ0KPiAtLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX3Bzci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3Iu
Yw0KPiBpbmRleCA0NzQzYjViOTE3NDMuLmM4MzAzMzJiMzNmMiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IEBAIC0xNTg3LDYgKzE1ODcsNTAgQEAg
c3RhdGljIGJvb2wgaW50ZWxfcHNyMl9jb25maWdfdmFsaWQoc3RydWN0DQo+IGludGVsX2RwICpp
bnRlbF9kcCwNCj4gwqAJcmV0dXJuIHRydWU7DQo+IMKgfQ0KPiDCoA0KPiArLyoNCj4gKyAqIEpv
aW5lciBuZWVkcyBhIHBlci1waXBlIFBTUi9QYW5lbCBSZXBsYXkgcmVnaXN0ZXIgYmxvY2ssIG9u
bHkNCj4gKyAqIHN1cHBvcnRlZCBvbiBwaXBlIEEvQi4NCj4gKyAqLw0KPiArc3RhdGljIGJvb2wg
cHNyX2pvaW5lcl9jb25maWdfdmFsaWQoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gKwkJ
CQnCoMKgwqAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUsDQo+
ICsJCQkJwqDCoMKgIGNvbnN0IGNoYXIgKndoYXQpDQo+ICt7DQo+ICsJc3RydWN0IGludGVsX2Rp
c3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGludGVsX2RwKTsNCj4gKw0KPiArCWlm
ICghY3J0Y19zdGF0ZS0+am9pbmVyX3BpcGVzKQ0KPiArCQlyZXR1cm4gdHJ1ZTsNCj4gKw0KPiAr
CWlmIChjcnRjX3N0YXRlLT5qb2luZXJfcGlwZXMgJiB+KEJJVChQSVBFX0EpIHwgQklUKFBJUEVf
QikpKQ0KPiB7DQo+ICsJCWRybV9kYmdfa21zKGRpc3BsYXktPmRybSwNCj4gKwkJCcKgwqDCoCAi
JXMgbm90IGVuYWJsZWQsIGpvaW5lciBvbmx5IHN1cHBvcnRlZA0KPiBvbiBwaXBlIEEvQlxuIiwg
d2hhdCk7DQo+ICsJCXJldHVybiBmYWxzZTsNCg0KUFNSIGFuZCBlRFAgUGFuZWwgUmVwbGF5IGFy
ZSByZXN0cmljdGVkIHRvIHBpcGUgQSBhbmQgcGlwZSBCIGdlbmVyYWxseQ0Kbm90IHNwZWNpZmlj
IHRvIGpvaW5lci4gU2VlIHRhYmxlIGluIEJzcGVjIDY4OTIwLiBEUCBQYW5lbCBSZXBsYXkgZG8N
Cm5vdCBoYXZlIHRoaXMgcmVzdHJpY3Rpb24uIFBhbmVsIFJlcGxheSByZXN0cmljdGlvbiBpcyBo
YW5kbGVkIGluDQpfcGFuZWxfcmVwbGF5X2NvbXB1dGVfY29uZmlnLiBQU1IgZG9lc24ndCBzZWVt
IHRvIGhhdmUgdGhpcyBjaGVjayBhdA0KYWxsLiBJIGRvbid0IGtub3cgaWYgaXQncyBldmVuIHBv
c3NpYmxlIHRvIGhhdmUgZURQIG9uIHBpcGUgQz8gSnVzdA0KcXVlc3Rpb25pbmcgaWYgdGhpcyBj
aGVjayBtYWtlcyBzZW5zZSBiZWluZyBqb2luZXIgc3BlY2lmaWM/IEFyZSB5b3UNCnRhcmdldGlu
ZyB0byBoYW5kbGUgc2NlbmFyaW8gd2hlcmUgcHJpbWFyeSBwaXBlIGhhcyBwc3IvcGFuZWwgcmVw
bGF5LA0KYnV0IHNlY29uZGFyeSBkb2Vzbid0Pw0KDQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIHRy
dWU7DQo+ICt9DQo+ICsNCj4gKy8qDQo+ICsgKiBQU1IyIHNlbGVjdGl2ZSBmZXRjaCBhbmQgUGFu
ZWwgUmVwbGF5IFNlbGVjdGl2ZSBVcGRhdGUgc2hhcmUgdGhlDQo+IHNhbWUNCj4gKyAqIGpvaW5l
ciBsaW1pdHMsIHBsdXMgbm8gdW5jb21wcmVzc2VkIGpvaW5lciBjb25maWd1cmF0aW9uIGluIFlV
Vg0KPiA0OjI6MC4NCj4gKyAqLw0KPiArc3RhdGljIGJvb2wgcHNyMl9qb2luZXJfY29uZmlnX3Zh
bGlkKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ICsJCQkJwqDCoMKgwqAgY29uc3Qgc3Ry
dWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUpDQoNClJlbmFtZSB0aGlzIGFzIHNl
bF91cGRhdGVfam9pbmVyX2NvbmZpZ192YWxpZC4gcHNyMiBpcyBwc3IyIGJ1dA0Kc2VsX3VwZGF0
ZSBtYXkgYmUgcGFuZWwgcmVwbGF5IG9yIHBzcjIuIFRoZXJlIGlzIHN0aWxsIHNvbWUgb2xkIGNv
ZGUNCm5vdCBmb2xsb3dpbmcgdGhpcywgYnV0IGxldCdzIG5vdCBhZGQgbW9yZS4NCg0KQlIsDQpK
b3VuaSBIw7ZnYW5kZXINCg0KPiArew0KPiArCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5
ID0gdG9faW50ZWxfZGlzcGxheShpbnRlbF9kcCk7DQo+ICsNCj4gKwlpZiAoIXBzcl9qb2luZXJf
Y29uZmlnX3ZhbGlkKGludGVsX2RwLCBjcnRjX3N0YXRlLA0KPiAiU2VsZWN0aXZlIHVwZGF0ZSIp
KQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4gKwlpZiAoY3J0Y19zdGF0ZS0+am9pbmVyX3Bp
cGVzICYmICFjcnRjX3N0YXRlLQ0KPiA+ZHNjLmNvbXByZXNzaW9uX2VuYWJsZSAmJg0KPiArCcKg
wqDCoCBjcnRjX3N0YXRlLT5vdXRwdXRfZm9ybWF0ID09DQo+IElOVEVMX09VVFBVVF9GT1JNQVRf
WUNCQ1I0MjApIHsNCj4gKwkJZHJtX2RiZ19rbXMoZGlzcGxheS0+ZHJtLA0KPiArCQkJwqDCoMKg
ICJTZWxlY3RpdmUgdXBkYXRlIG5vdCBlbmFibGVkLA0KPiB1bmNvbXByZXNzZWQgam9pbmVyIGRv
ZXMgbm90IHN1cHBvcnQgWVVWIDQ6MjowXG4iKTsNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArCX0N
Cj4gKw0KPiArCXJldHVybiB0cnVlOw0KPiArfQ0KPiArDQo+IMKgc3RhdGljIGJvb2wgaW50ZWxf
c2VsX3VwZGF0ZV9jb25maWdfdmFsaWQoc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNf
c3RhdGUsDQo+IMKgCQkJCQnCoCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZQ0KPiAqY29ubl9z
dGF0ZSkNCj4gwqB7DQo+IEBAIC0xNTk0LDYgKzE2MzgsOSBAQCBzdGF0aWMgYm9vbA0KPiBpbnRl
bF9zZWxfdXBkYXRlX2NvbmZpZ192YWxpZChzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19z
dGF0ZSwNCj4gwqAJc3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9IGludGVsX2F0dGFjaGVkX2Rw
KGNvbm5lY3Rvcik7DQo+IMKgCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50
ZWxfZGlzcGxheShpbnRlbF9kcCk7DQo+IMKgDQo+ICsJaWYgKCFwc3IyX2pvaW5lcl9jb25maWdf
dmFsaWQoaW50ZWxfZHAsIGNydGNfc3RhdGUpKQ0KPiArCQlnb3RvIHVuc3VwcG9ydGVkOw0KPiAr
DQo+IMKgCWlmIChIQVNfUFNSMl9TRUxfRkVUQ0goZGlzcGxheSkgJiYNCj4gwqAJwqDCoMKgICFp
bnRlbF9wc3IyX3NlbF9mZXRjaF9jb25maWdfdmFsaWQoaW50ZWxfZHAsIGNydGNfc3RhdGUpDQo+
ICYmDQo+IMKgCcKgwqDCoCAhSEFTX1BTUl9IV19UUkFDS0lORyhkaXNwbGF5KSkgew0KPiBAQCAt
MTczMyw2ICsxNzgwLDkgQEAgc3RhdGljIGJvb2wgX3BhbmVsX3JlcGxheV9jb21wdXRlX2NvbmZp
ZyhzdHJ1Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwNCj4gwqAJCXJldHVybiBm
YWxzZTsNCj4gwqAJfQ0KPiDCoA0KPiArCWlmICghcHNyX2pvaW5lcl9jb25maWdfdmFsaWQoaW50
ZWxfZHAsIGNydGNfc3RhdGUsICJQYW5lbA0KPiBSZXBsYXkiKSkNCj4gKwkJcmV0dXJuIGZhbHNl
Ow0KPiArDQo+IMKgCWNydGNfc3RhdGUtPmxpbmtfb2ZmX2FmdGVyX2FzX3NkcF93aGVuX3ByX2Fj
dGl2ZSA9DQo+IGNvbXB1dGVfbGlua19vZmZfYWZ0ZXJfYXNfc2RwX3doZW5fcHJfYWN0aXZlKGNv
bm5lY3Rvcik7DQo+IMKgCWNydGNfc3RhdGUtPmRpc2FibGVfYXNfc2RwX3doZW5fcHJfYWN0aXZl
ID0NCj4gY29tcHV0ZV9kaXNhYmxlX2FzX3NkcF93aGVuX3ByX2FjdGl2ZShjb25uZWN0b3IpOw0K
PiDCoA0KPiBAQCAtMTg4NiwxNyArMTkzNiw2IEBAIHZvaWQgaW50ZWxfcHNyX2NvbXB1dGVfY29u
ZmlnKHN0cnVjdCBpbnRlbF9kcA0KPiAqaW50ZWxfZHAsDQo+IMKgCQlyZXR1cm47DQo+IMKgCX0N
Cj4gwqANCj4gLQkvKg0KPiAtCSAqIEZJWE1FIGZpZ3VyZSBvdXQgd2hhdCBpcyB3cm9uZyB3aXRo
IFBTUitqb2luZXIgYW5kDQo+IC0JICogZml4IGl0LiBQcmVzdW1hYmx5IHNvbWV0aGluZyByZWxh
dGVkIHRvIHRoZSBmYWN0IHRoYXQNCj4gLQkgKiBQU1IgaXMgYSB0cmFuc2NvZGVyIGxldmVsIGZl
YXR1cmUuDQo+IC0JICovDQo+IC0JaWYgKGNydGNfc3RhdGUtPmpvaW5lcl9waXBlcykgew0KPiAt
CQlkcm1fZGJnX2ttcyhkaXNwbGF5LT5kcm0sDQo+IC0JCQnCoMKgwqAgIlBTUiBkaXNhYmxlZCBk
dWUgdG8gam9pbmVyXG4iKTsNCj4gLQkJcmV0dXJuOw0KPiAtCX0NCj4gLQ0KPiDCoAkvKiBPbmx5
IHVzZWQgZm9yIHN0YXRlIHZlcmlmaWNhdGlvbi4gKi8NCj4gwqAJY3J0Y19zdGF0ZS0+cGFuZWxf
cmVwbGF5X2RzY19zdXBwb3J0ID0gY29ubmVjdG9yLQ0KPiA+ZHAucGFuZWxfcmVwbGF5X2NhcHMu
ZHNjX3N1cHBvcnQ7DQo+IMKgCWNydGNfc3RhdGUtPmhhc19wYW5lbF9yZXBsYXkgPQ0KPiBfcGFu
ZWxfcmVwbGF5X2NvbXB1dGVfY29uZmlnKGNydGNfc3RhdGUsIGNvbm5fc3RhdGUpOw0KPiBAQCAt
MTkwOCw2ICsxOTQ3LDE0IEBAIHZvaWQgaW50ZWxfcHNyX2NvbXB1dGVfY29uZmlnKHN0cnVjdCBp
bnRlbF9kcA0KPiAqaW50ZWxfZHAsDQo+IMKgCQlyZXR1cm47DQo+IMKgDQo+IMKgCWNydGNfc3Rh
dGUtPmhhc19zZWxfdXBkYXRlID0NCj4gaW50ZWxfc2VsX3VwZGF0ZV9jb25maWdfdmFsaWQoY3J0
Y19zdGF0ZSwgY29ubl9zdGF0ZSk7DQo+ICsNCj4gKwkvKiBQbGFpbiBQU1IxIGlzIG5vdCBzdXBw
b3J0ZWQgd2l0aCBqb2luZXIuICovDQo+ICsJaWYgKGNydGNfc3RhdGUtPmpvaW5lcl9waXBlcyAm
JiAhY3J0Y19zdGF0ZS0NCj4gPmhhc19wYW5lbF9yZXBsYXkgJiYNCj4gKwnCoMKgwqAgIWNydGNf
c3RhdGUtPmhhc19zZWxfdXBkYXRlKSB7DQo+ICsJCWRybV9kYmdfa21zKGRpc3BsYXktPmRybSwN
Cj4gKwkJCcKgwqDCoCAiUFNSIGRpc2FibGVkLCBQU1IxIG5vdCBzdXBwb3J0ZWQgd2l0aA0KPiBq
b2luZXJcbiIpOw0KPiArCQljcnRjX3N0YXRlLT5oYXNfcHNyID0gZmFsc2U7DQo+ICsJfQ0KPiDC
oH0NCj4gwqANCj4gwqB2b2lkIGludGVsX3Bzcl9nZXRfY29uZmlnKHN0cnVjdCBpbnRlbF9lbmNv
ZGVyICplbmNvZGVyLA0KPiBAQCAtNDcyOCw2ICs0Nzc1LDEwIEBAIHZvaWQgaW50ZWxfcHNyX2Nv
bXB1dGVfY29uZmlnX2xhdGUoc3RydWN0DQo+IGludGVsX2RwICppbnRlbF9kcCwNCj4gwqAJCWNy
dGNfc3RhdGUtPmhhc19zZWxfdXBkYXRlID0gZmFsc2U7DQo+IMKgCQljcnRjX3N0YXRlLT5lbmFi
bGVfcHNyMl9zdV9yZWdpb25fZXQgPSBmYWxzZTsNCj4gwqAJCWNydGNfc3RhdGUtPmVuYWJsZV9w
c3IyX3NlbF9mZXRjaCA9IGZhbHNlOw0KPiArDQo+ICsJCS8qIFBsYWluIFBTUjEgaXMgbm90IHN1
cHBvcnRlZCB3aXRoIGpvaW5lci4gKi8NCj4gKwkJaWYgKGNydGNfc3RhdGUtPmpvaW5lcl9waXBl
cykNCj4gKwkJCWNydGNfc3RhdGUtPmhhc19wc3IgPSBmYWxzZTsNCj4gwqAJfQ0KPiDCoA0KPiDC
oAkvKiBXYV8xODAzNzgxODg3NiAqLw0KDQo=
