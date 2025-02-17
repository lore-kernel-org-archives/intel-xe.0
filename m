Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98335C0219E
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 10:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB8B10E410;
	Mon, 17 Feb 2025 10:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FmVC+sWq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4336410E40F
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Feb 2025 10:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739787921; x=1771323921;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ALX8A9SpCC+bNtZmPF2QSUewGIzkivm5itOOGtioz/M=;
 b=FmVC+sWqocJOgU3VEjl4VvXnCF3FXBK4MMiVmiXiEcyqW88uqT9UfKx4
 9c8rUddh9l6z4dfxEU+Al42Xs7bUMG3jT+eVIuOlsF37pdeLLQy7gKd1I
 UqRoItE2i9ZAxeAhlJhUxN9a0y4f3oUhdPDd9+YQVhbJ8YzjOWVN/HmNt
 fNvrMN4arW8L8agn4D94V1mNSNkxO+DFpCfzi0/ERcWlWwWnLtvhS2AwH
 nOtcAm6i8Y5+g+GGO4Z2eZ5dwjA6qMuJjlfv4THE9RHWKc3kvIVQkGuKQ
 tKj7TegqlUov93kxVatApqV/GRcgplK6zWtNiweuJaRa7sIJIvCTA1u0f Q==;
X-CSE-ConnectionGUID: kCTf2K58QQem9P6urYm8gg==
X-CSE-MsgGUID: Bkgll1IaT2KjDG1xuktKSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="65819613"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="65819613"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 02:25:21 -0800
X-CSE-ConnectionGUID: F7DHWih8QCSw7dqsUax7Ow==
X-CSE-MsgGUID: mzHgQcKyTimTmyeSExSLog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118221271"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 02:25:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 02:25:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 02:25:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 02:25:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZb/G4iqwsJdGZZ99gMsifSMnzhRHCEfA6bH5AkU/FzQWzT6uOuNkYiWVCcKL1SuIIvs9/xe7UZO8IeZgWp0+vc0yGGlxbGlGrSvJSOqFjihGVR6hTfZ/xL/yqyfSjUENmKLgCG7WswTlQFln1S+j/kkcMtsDXZq4lRKhzJiB9PQth88Y4tvL/3CoaTZxS3E9EMj3x57K/KOez4+M+P8wUCVkY0djM8jPdfr3wekh9vxygsH1BKu1+Xl2jDicDd6CDHKQmIBQTa5GA5O+0iZwy6gDzcRSL3FRvg2j1myw1lhQw2V0k6CflG3S2VMU4nWu9KETBYSo40Q15giTgy5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/f2gnL5W71D6jeS8O5WITqL2z9+LrcUX3mh2KvCz0A=;
 b=wRxXwD9wDDNtUxJtrXgnLLMa3fEQUwn421GQxtTpFqQTBiOfCMOWxvHhQ1sOvsaHtEqXYlPD7Hp6Auj/I1W9LeAdZ8UhXekUDoii1VY8F1Sejyt0amPhStZuLNVm+QceF2AMgtDIDn9PCpA/v7qEr5a5uPp3sCSIV3LvEGT+fpm+QgsVTr3pfFYbY0vrq7d2x69VMOADi/uuXWOpI3FSyOa8Dgky8kbvG6Zzdw/Kb/l/ZbMd9JQG6pgBdkudXLTOrENDWAj42OGrujauqXgI6JCaHfNklhY5XTmpAf5xMv+zKxsAeV2/oDuIa9If7Fv6R0iffu7G2Tj3WT4uYYIE8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 10:25:16 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea%5]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 10:25:16 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Morek, Szymon"
 <szymon.morek@intel.com>, "Souza, Jose" <jose.souza@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH V8] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Topic: [PATCH V8] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Index: AQHbeSfPkeaJxXMMxUmqg4V+9XZbz7NLWiEA
Date: Mon, 17 Feb 2025 10:25:16 +0000
Message-ID: <BN9PR11MB5275F9144BEBFF9811B799EEE7FB2@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20250207061223.2072753-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250207061223.2072753-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|MW4PR11MB6911:EE_
x-ms-office365-filtering-correlation-id: 05d17be3-9b01-4026-ab56-08dd4f3d5f63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?qDIJ3LhphMruwSTE4JmM1Q/UohkgaihvTXTcTiY7TG/9rZK531MErcK3iAvq?=
 =?us-ascii?Q?EwzpVxrScDsHVx8iuXnTMr6YAzJTwJRa8QtRaRsXGl3lZQUSStQwzujL1xng?=
 =?us-ascii?Q?sFTCfhfEa5BR+RrjDqq1wyXc7lUo2bpETZDnKI6TryTtQeZij3f1PEcgDjJC?=
 =?us-ascii?Q?PMiS8tnR1BVFaei8JtjMHJYKSAobz0wzkFyPt3Wsbv09oiJPbUM2NJLItyKt?=
 =?us-ascii?Q?Ukcb6Jud104yftX3FH3aN4dQJzm+R/te0N5iDbyURpNf5nDVeK43NrDA/5OJ?=
 =?us-ascii?Q?oaX9dUhsRP3rsdtVN6lEGbmdw7h/CcezVUVeod5rAwmk0tQ89zxmnt0ixmJ2?=
 =?us-ascii?Q?5TEEOUzY8AabAsNjq74ojOMv0TeeTQSO+5hPFIo4h+DF/N0m+k/09wUJ0uYp?=
 =?us-ascii?Q?0dIall8mUKhQ7SfSLBzpsr2XGXnooLL75IFBQGk3tiNu1iIWc2Ezo1CMa2wA?=
 =?us-ascii?Q?X9RH2qQXphcDwxhtwvcFMSa5eLi1fa/727EzglZuX7+48+YVoEmlvY/kcRRv?=
 =?us-ascii?Q?K4/RzGQKXnNTYk57/9frd+BwlEEAw/NFTzNyvQ/xHr1a039NDwHUHfzqJ/fG?=
 =?us-ascii?Q?XLWKUGCn7GDsgVumvHnLcGf7ZI8arwJfvhwtqR1zVltpiNTrO5I01+EWx6/q?=
 =?us-ascii?Q?FPC/ctKT9kGpRN+el0HAL7E7K4+R/J7pyMUlqG1GRS9BBDMaNd13zkQgC8Cy?=
 =?us-ascii?Q?T/ZnjC6pg581DwgAaZjjCCCG6oJMglQVPv3h/TEF2viHZAwVeejCspSYGDup?=
 =?us-ascii?Q?K1wiDSkbFzRikfoIHkJoIARG6kIzKVxbq9gS+O0WWybgqLC7D3JKnqCa2L5a?=
 =?us-ascii?Q?qC3qjvrTU3RsBIbxraytxHwDjfmqOBBIM4+ForOFUt0HQM0KJXEaGZ+R98DY?=
 =?us-ascii?Q?NcWv2N6UL1H4iWoqsl7uQcvR9EfFZHtsTeW+VFUQ9JLSjxpJ8LFxkPVC2rOs?=
 =?us-ascii?Q?o6p5hJSwEZsPtfaBmh+TEHPZf7U1sVWi48MY247sATp/Fn+B/jBmcDtaSRFr?=
 =?us-ascii?Q?5bkJ3FxWZa8/OeL1WfPd9a0Qr1UBHtZjAcoibXoRjHV6lpSjvII/Uck71Ry6?=
 =?us-ascii?Q?c8SLWH/jDWJb0RSI+EMua1J+Z1o/V4up5gbOBygrRhL43MRDJJuuAUBBjefe?=
 =?us-ascii?Q?ecuQwPFBA85qE/Chy+9tn725qcbIqPjkmb4aKxiaieaeXnKOEHEMEhoG00t+?=
 =?us-ascii?Q?3MlGTDyev9xMfSHi8jAq7XIAoRBjbdftm/sGeydPVgGt1S2hmhqiNng+tFrm?=
 =?us-ascii?Q?KKRmi8dEroO+hnYogNaKLtIUij8vpuc+/0JJ43hh2Vvq7d5nTUPq1FCKzYil?=
 =?us-ascii?Q?wDOteS7R4YR4pzU+Q60h0mdKawcQQFfznFFmjSVoAKvCV+tKIzszpgVzAK3w?=
 =?us-ascii?Q?jCXBozTLWxnFuQpQyqIdDfWLB95gzHodeS6xYrZIPq6UgrjyVw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vQP9taapPrlpWF+PS4xkf+oU5W5vqL8PMwj243B3T4hxQ5I5NhaTyEcoHpvk?=
 =?us-ascii?Q?C9iuwTiYq3x+H3w8arE6KKDWlKF8nHqubhopmWqq/6vMRB2SkSQ76VKR/FPG?=
 =?us-ascii?Q?VEJ8j7RL4z6MrBpo7DSdJ9PbsPObsAxeAIN9RPKXYj2mB9AG9jIT/Pv0a0hG?=
 =?us-ascii?Q?xuMP3ndvgLeCBlwavsAr1Vfxg+lKYIwSQFC9XHM1V2f+Pyj6ef4QDMmy0Kml?=
 =?us-ascii?Q?7V137BbuO6OUg7nq6Ca7YYkRrkcq6bzF+r89fh6zvNWvwLars3fNrz+tsArI?=
 =?us-ascii?Q?18mgd0iD1D9bARNDSf2GrUqNcmKjL+33EY2hyMT18bPZHzxQDHeSUtMg/AFb?=
 =?us-ascii?Q?Q7zTseQgacf64E1B/eltkmTMBemElWnfqBXMOcxU/AEHMUAtL5U58X5GC447?=
 =?us-ascii?Q?aovsXl6cVjzs68k067gdfPx/UHwzTusHbA62TwumSUVSDt/0Bn4ZqJqVTAtc?=
 =?us-ascii?Q?cCicA68vyfgePhVygXWJEpV4vB6hpGeWyy0/7SmXxzuT7A63t5BieZHFEdLT?=
 =?us-ascii?Q?vqvZoxDrZl8KgEIWc76sOrbLsUCEOmiFz/wzJNOvexxlVDAH7OLWVA2E3k4H?=
 =?us-ascii?Q?YL1uDLF0B99VlVs6GjUbL1RkYlm9h2Erh7jLxpN7zfEblXvrYYREHeVBj0gd?=
 =?us-ascii?Q?ENZ5y4r5HhOQlDev4paxE9jP7RzLuOiMuMNsuAHsxCgEcsT51Wu17w75gZuY?=
 =?us-ascii?Q?vzdHR92DwU8GjfakSevBTgzkLXVzHQWQo5PQJd6115AjoreqT14Zcj3aCLQ/?=
 =?us-ascii?Q?WP3kLP9duEsUxxWk8Su37pWyR3d51CxKTet+12g2KE62bK1BKvxDeLzf5tYb?=
 =?us-ascii?Q?OIefWKgCDLjUY6nIEm6I6+0S2vw4l2JWtYwqQ8McInKgQ6m5Nph1rmFurUhg?=
 =?us-ascii?Q?xcw/NR58xclvkgx/v9BE66uHkAtMosxWVkJP/VXnvX7MMk4ojPHMYKcgPFIS?=
 =?us-ascii?Q?Kf7L5rSHPyCT814FQdK3KR1EP8WXFnbplO5oX91a8Str4gCRm36603NcSjQK?=
 =?us-ascii?Q?RFXg3CDS3nEPgfMgcXEb7BnKeh2EoumVvZOJlGByQ6X8Bdt+i/NE2mZm5Qrd?=
 =?us-ascii?Q?Ho6jP1Y9lMJFQdwCyd9z/XNtcKIOyqNKBEmTtZJSSl6iG+cAf2wAt7Mmwu2r?=
 =?us-ascii?Q?PT+HqXX9l8qQKFW9v67CTymnRCqyL42wGAd7HFVfxdnu66e/9a1aOJDASQRk?=
 =?us-ascii?Q?CkMq6NnlqqMbOK0s/YTX9OB6W57n4QRK5FSCm20dyBSlRWh3yhFl+CMW5fB9?=
 =?us-ascii?Q?SkA/vNluq90oVA7IF975NqJIekN4WbDtrTV+mKMhfYQriIaffsqyOLPq4WH+?=
 =?us-ascii?Q?jH6O2DB5jClwsyWRGNT2D4wefUzyRsh4uo+mmgR1OpIM5y8HJyMv5fgvvFJp?=
 =?us-ascii?Q?NJ9zGKmUwT3dVfdop3/LWozeMH75ev0WkYrS3gmvjB6jXinH4pfGncfPY4GO?=
 =?us-ascii?Q?/dR22littrmYA2VUsHlL5qkqipVLuIJkJ+cHchoOlowFKXFmRk364YGLoubJ?=
 =?us-ascii?Q?BLt24zh89jo2c9wrvnC91Buychcp9bCpoWDripuFn7e884EbOiS5e0/XGOzE?=
 =?us-ascii?Q?ADf11u4+Xw2y/hv10AdwTXotGQv0xUYvUGWcoDvo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d17be3-9b01-4026-ab56-08dd4f3d5f63
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 10:25:16.8136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPTDOAIfDHfQIC9PU88fCvK9SpaPbYIORXK3BnaJEX0lqDoRePq35Bsg5jlf/orC+ZoRmLHhsQCZ0WzfhR7oFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
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

>> Allow user to provide a low latency hint. When set, KMD sends a hint to =
GuC which results in special handling for that process.
>> SLPC will ramp the GT frequency aggressively every time it switches to t=
his process.
>>=20
>> We need to enable the use of SLPC Compute strategy during init, but it w=
ill apply only to processes that set this bit during process creation.
>>=20
>> Improvement with this approach as below:
>>=20
>> Before,
>>=20
>> :~$ NEOReadDebugKeys=3D1 EnableDirectSubmission=3D0 clpeak --kernel-late=
ncy
>> Platform: Intel(R) OpenCL Graphics
>>   Device: Intel(R) Graphics [0xe20b]
>>     Driver version  : 24.52.0 (Linux x64)
>>     Compute units   : 160
>>     Clock frequency : 2850 MHz
>>     Kernel launch latency : 283.16 us
>>=20
>> After,
>>=20
>> :~$ NEOReadDebugKeys=3D1 EnableDirectSubmission=3D0 clpeak --kernel-late=
ncy
>> Platform: Intel(R) OpenCL Graphics
>>   Device: Intel(R) Graphics [0xe20b]
>>     Driver version  : 24.52.0 (Linux x64)
>>     Compute units   : 160
>>     Clock frequency : 2850 MHz
>>=20
>>     Kernel launch latency : 63.38 us
>>=20
>> UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
>> UMD Mesa PR :  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests=
/33214
>>=20
>> v8(Vinay):
>>   - Add separate example for using low latency hint
>> v7(Jose):
>>   - Update UMD PR
>>   - applicable to all gpus
>> V6:
>>   - init flags, remove redundant flags check (MAuld)
>> V5:
>>   - Move uapi doc to documentation and GuC ABI specific change (Rodrigo)
>>   - Modify logic to restrict exec queue flags (MAuld)
>> V4:
>>   - To make it clear, dont use exec queue word (Vinay)
>>   - Correct typo in description of flag (Jose/Vinay)
>>   - rename set_strategy api and replace ctx with exec queue(Vinay)
>>   - Start with 0th bit to indentify user flags (Jose)
>> V3:
>>   - Conver user flag to kernel internal flag and use (Oak)
>>   - Support query config for use to check kernel support (Jose)
>>   - Dont need to take runtime pm (Vinay)
>> V2:
>>   - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hi=
nt(Szymon)
>>   - Add motivation to description (Lucas)
>>=20
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>  Documentation/gpu/drm-uapi.rst                | 18 ++++++++++++++++
>>  drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
>>  drivers/gpu/drm/xe/xe_exec_queue.c            | 10 ++++++---
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 ++
>>  drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc_submit.c            |  8 +++++++
>>  drivers/gpu/drm/xe/xe_query.c                 |  2 ++
>>  include/uapi/drm/xe_drm.h                     | 21 ++++++++++++++++++-
>>  8 files changed, 76 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi=
.rst index b75cc9a70d1f..234c38ef26e3 100644
>> --- a/Documentation/gpu/drm-uapi.rst
>> +++ b/Documentation/gpu/drm-uapi.rst
>> @@ -583,3 +583,21 @@ dma-buf interoperability
>> =20
>>  Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for  =
information on how dma-buf is integrated and exposed within DRM.
>> +
>> +Low latency hint by user
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> +
>> +Allow users to provide a hint to kernel for cases demanding low latency=
 profile.
>> +
>> +user need to indicate low latency hint with flag while creating exec=20
>> +queue as mentioned below,
>> +
>> +     struct drm_xe_exec_queue_create exec_queue_create =3D {
>> +          .flags =3D DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT
>> +          .extensions =3D 0,
>> +          .vm_id =3D vm,
>> +          .num_bb_per_exec =3D 1,
>> +          .num_eng_per_bb =3D 1,
>> +          .instances =3D to_user_pointer(&instance),
>> +     };
>> +     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu=
/drm/xe/abi/guc_actions_slpc_abi.h
>> index 85abe4f09ae2..b28c8fa061f7 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> @@ -174,6 +174,9 @@ struct slpc_task_state_data {
>>  	};
>>  } __packed;
>> =20
>> +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
>> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
>> +
>>  struct slpc_shared_data_header {
>>  	/* Total size in bytes of this shared buffer. */
>>  	u32 size;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_=
exec_queue.c
>> index 6051db78d706..f68b597f5270 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -605,11 +605,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *=
dev, void *data,
>>  	struct xe_tile *tile;
>>  	struct xe_exec_queue *q =3D NULL;
>>  	u32 logical_mask;
>> +	u32 flags =3D 0;
>>  	u32 id;
>>  	u32 len;
>>  	int err;
>> =20
>> -	if (XE_IOCTL_DBG(xe, args->flags) ||
>> +	if (XE_IOCTL_DBG(xe, args->flags &=20
>> +~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
>>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>  		return -EINVAL;
>> =20
>> @@ -626,6 +627,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *de=
v, void *data,
>>  	if (XE_IOCTL_DBG(xe, eci[0].gt_id >=3D xe->info.gt_count))
>>  		return -EINVAL;
>> =20
>> +	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
>> +		flags |=3D EXEC_QUEUE_FLAG_LOW_LATENCY;
>> +
>>  	if (eci[0].engine_class =3D=3D DRM_XE_ENGINE_CLASS_VM_BIND) {
>>  		if (XE_IOCTL_DBG(xe, args->width !=3D 1) ||
>>  		    XE_IOCTL_DBG(xe, args->num_placements !=3D 1) || @@ -634,8 +638,8=
 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>> =20
>>  		for_each_tile(tile, xe, id) {
>>  			struct xe_exec_queue *new;
>> -			u32 flags =3D EXEC_QUEUE_FLAG_VM;
>> =20
>> +			flags |=3D EXEC_QUEUE_FLAG_VM;
>>  			if (id)
>>  				flags |=3D EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>> =20
>> @@ -682,7 +686,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *de=
v, void *data,
>>  		}
>> =20
>>  		q =3D xe_exec_queue_create(xe, vm, logical_mask,
>> -					 args->width, hwe, 0,
>> +					 args->width, hwe, flags,
>>  					 args->extensions);
>>  		up_read(&vm->lock);
>>  		xe_vm_put(vm);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/=
xe/xe_exec_queue_types.h
>> index 6eb7ff091534..cc1cffb5c87f 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -85,6 +85,8 @@ struct xe_exec_queue {
>>  #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
>>  /* kernel exec_queue only, set priority to highest level */
>>  #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
>> +/* flag to indicate low latency hint to guc */
>> +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>> =20
>>  	/**
>>  	 * @flags: flags for this exec queue, should statically setup aside fr=
om ban diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_=
guc_pc.c index 02409eedb914..25040efa043f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -995,6 +995,17 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>>  	return ret;
>>  }
>> =20
>> +static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val) {
>> +	int ret =3D 0;
>> +
>> +	ret =3D pc_action_set_param(pc,
>> +				  SLPC_PARAM_STRATEGIES,
>> +				  val);
>> +
>> +	return ret;
>> +}
>> +
>>  /**
>>   * xe_guc_pc_start - Start GuC's Power Conservation component
>>   * @pc: Xe_GuC_PC instance
>> @@ -1054,6 +1065,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>  	}
>> =20
>>  	ret =3D pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>> +	if (ret)
>> +		goto out;
>> +
>> +	/* Enable SLPC Optimized Strategy for compute */
>> +	ret =3D pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>> =20
>>  out:
>>  	xe_force_wake_put(gt_to_fw(gt), fw_ref); diff --git a/drivers/gpu/drm/=
xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 913c74d6e2ae..f2ce3086838c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -15,6 +15,7 @@
>>  #include <drm/drm_managed.h>
>> =20
>>  #include "abi/guc_actions_abi.h"
>> +#include "abi/guc_actions_slpc_abi.h"
>>  #include "abi/guc_klvs_abi.h"
>>  #include "regs/xe_lrc_layout.h"
>>  #include "xe_assert.h"
>> @@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struc=
t exec_queue_policy *policy,  MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum,=
 EXECUTION_QUANTUM)  MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPT=
ION_TIMEOUT)  MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>> +MAKE_EXEC_QUEUE_POLICY_ADD(slpc_exec_queue_freq_req, SLPM_GT_FREQUENCY)
>>  #undef MAKE_EXEC_QUEUE_POLICY_ADD
>> =20
>>  static const int xe_exec_queue_prio_to_guc[] =3D { @@ -414,14 +416,20 @=
@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>>  	struct exec_queue_policy policy;
>>  	enum xe_exec_queue_priority prio =3D q->sched_props.priority;
>>  	u32 timeslice_us =3D q->sched_props.timeslice_us;
>> +	u32 slpc_exec_queue_freq_req =3D 0;
>>  	u32 preempt_timeout_us =3D q->sched_props.preempt_timeout_us;
>> =20
>>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>> =20
>> +	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>> +		slpc_exec_queue_freq_req |=3D SLPC_CTX_FREQ_REQ_IS_COMPUTE;
>> +
>>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>>  	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_gu=
c[prio]);
>>  	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
>>  	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeou=
t_us);
>> +	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
>> +							     slpc_exec_queue_freq_req);
>> =20
>>  	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
>>  		       __guc_exec_queue_policy_action_size(&policy), 0, 0); diff --gi=
t a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c index 042=
f87a688e7..102923d3dc74 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -336,6 +336,8 @@ static int query_config(struct xe_device *xe, struct=
 drm_xe_device_query *query)
>>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =3D
>>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
>> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=3D
>> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
>>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =3D
>>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] =3D xe->info.va_bits; diff -=
-git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index 892f54d3=
aa09..7f8a51fa54a3 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
>>   *
>>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>>   *      has usable VRAM
>> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the =
device
>> + *      has low latency hint support
>>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>>   *    required by this device, typically SZ_4K or SZ_64K
>>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address =
@@ -409,6 +411,7 @@ struct drm_xe_query_config {
>>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
>>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>> @@ -1204,6 +1207,21 @@ struct drm_xe_vm_bind {
>>   *     };
>>   *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>>   *
>> + *     Allow users to provide a hint to kernel for cases demanding low =
latency profile.
>> +
>> + *     user need to indicate low latency hint with flag while creating =
exec queue
>> + *     as mentioned below,
>> + *
>> + *     struct drm_xe_exec_queue_create exec_queue_create =3D {
>> + *          .flags =3D DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT
>> + *          .extensions =3D 0,
>> + *          .vm_id =3D vm,
>> + *          .num_bb_per_exec =3D 1,
>> + *          .num_eng_per_bb =3D 1,
>> + *          .instances =3D to_user_pointer(&instance),
>> + *     };
>> + *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
>> + *
>>   */
>>  struct drm_xe_exec_queue_create {
>>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>> @@ -1222,7 +1240,8 @@ struct drm_xe_exec_queue_create {
>>  	/** @vm_id: VM to use for this exec queue */
>>  	__u32 vm_id;
>> =20
>> -	/** @flags: MBZ */
>> +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
>> +	/** @flags: flags to use for this exec queue */
>>  	__u32 flags;
>> =20
>>  	/** @exec_queue_id: Returned exec queue ID */
>> --
>> 2.43.0

Acked-by: Michal Mrozek <michal.mrozek@intel.com>


