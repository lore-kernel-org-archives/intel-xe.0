Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C29606A324
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 04:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h9fBPP9G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F4C10E196;
	Tue,  3 Nov 2026 04:27:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0B710E196;
 Tue,  3 Nov 2026 04:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793680057; x=1825216057;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qIfrXWu5e4SaRY9mb9oGQTbo0Vrl3JCS39AYIw9ehT4=;
 b=h9fBPP9GPr3ouee8QcqtP1HdD7E8z0WD5Dt6Lcg2c2CcSLFuCamldKES
 UOKYBbxk2YVa5cruweoaIjcww+xsd8ElO8TIXFAC0/AatQG4TKUjVVnez
 V2bCLNMjyEjHIxyo9TKErs4LNpzJWy2+Ouk+XAKb9JxCetdKVmJ3VuLgf
 9zGQ9rNabGMiyMYlHuZW5oU+NyHdpLdnIPuu+38/tWdqkdMYP3ayDtig6
 lTBBI4BebcGexhy5zeEXA3fOHMFd60rIZT9gJtBWovKsiD05w4WyHGI/T
 TW3jFbNq4U67oSfS3p/p1NjkjhUEXFSknmBPT0Td6wj9ZIpAE8VOjiEPH w==;
X-CSE-ConnectionGUID: Jg7vtONnSuWNy9mb5vlmNA==
X-CSE-MsgGUID: TQAPKzdMR+GZagQn+otoKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2270594"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2270594"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:27:36 -0800
X-CSE-ConnectionGUID: NaE0ehEWSKSB71CAQh4Hyg==
X-CSE-MsgGUID: hK50OTnrTcidQB6p7ole0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6643488"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:27:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 20:27:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 20:27:34 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 20:27:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAHWp+vXO0QwyzRoorC/MunAtyOLm0ZW551VeGmLyz+iYWSUr3O6sV/GcHlN3QjZyU88csci2OsnkyEaGlIOWJVI6lXfC8BK0az2m2YJB/H1aNESriAs6MM8yUec5f5wj90nQAGaesv+e65Wd80U81/LwqdGtC1coq/RE2e5z7MQV6pI3Izk9svybPoakAjt1cfg8zfdKP+5jcPMF1juCTrAhSzZd4du3fMxMfcQikQMQtUgCEnMijpjiHD/maNxNaSSNP+/y5ksyQ/sommXbZvrEa9IjaQ4mqRmUUPlZ2ipwu6RhjPg6R/JnAP/PtWexrlQIgYMhXjtAtzeARDWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIfrXWu5e4SaRY9mb9oGQTbo0Vrl3JCS39AYIw9ehT4=;
 b=aLna1urnFB7jDkl5hUDjOYgK92/NFmX44xgxnDkau9nzSFpVoWvfo8YrWfHn/aCcGQuh3EkCkpM8jshWjl76fOJWe25d25dofuXrcZa+9q0O7uIZuyBi2xmtrfuJWUJOuSVB6sCxnMoRUApjsFnTD0XgevfPdpO/tmAOa4EnelKVI5hcYMPdhhLmdF3qxAmjD5qaREZvIOUauPDw125KRdfoPQi4FP0WVrsO07U+lV7PUbI9zABsUMQYDAwfO+j09YRZp6jKO+Fvhd7kYx0dhrtLMoormgoSNwLErB/wgcFm+huUg5ih5kkCPInQAKkm2LeQgiKCRo1LiSf6NOjfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by LY0PR11MB527130.namprd11.prod.outlook.com
 (2603:10b6:404:232::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 04:27:27 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 04:27:27 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 08/10] drm/i915: Document timing generator start/stop
 behaviour on HSW+
Thread-Topic: [PATCH 08/10] drm/i915: Document timing generator start/stop
 behaviour on HSW+
Thread-Index: AQHdaJMv3TImFkve7kSJ0BaZBdH8bLcbxXvQ
Date: Tue, 3 Nov 2026 04:27:27 +0000
Message-ID: <DS4PPFE901A304F572A2D7AAD81F56F4292E3692@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20261030171327.29829-9-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|LY0PR11MB527130:EE_
x-ms-office365-filtering-correlation-id: 3c2dfbaf-a973-4bac-6e3f-08df3962c496
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|22082099003|18002099003|261102123227099003|3023799007|38070700021|56012099006|4143699003|11063799006|261022105027099003|261026121527099003|261022075727099003|261026140227099003|261009223027099003|261028144727099003|261021121427099003|261021123027099003;
x-microsoft-antispam-message-info: LTlTiYqRTRUzGi0dSAPt9k6hkmdzUso80enHX9WYhNiVDjbRyWgqwp3OXnwg7eikjembvrBK9kGmZEP5/4W9CDw1Ptxk0AFWAZWnEedZCNLwfa9AF/fYf/XhgJCvwKofijmx3C6sOp6h1HJuBVQMZDEjfXiZbhiKnLBvppFQRcR5+xYxi/sKPTcAcd8z95rFhihBV7Kyq8ldDRIt2e2zH0aNYvWriiF1fp1MHGdELVRczY6/WVgZMQz0ZWKISise/VGR/1MRS4Jw+SD+Qt7YyJVx12gIPMFI7b0z//kRAdjwfdNwlcxHx9sgwla57EcNoecwUpBgvXfimAQmObe+U+hY21/YOF+oKs5YsHUUV7BNa0LOBKLIGz9oshP2kg9E//dUecZAah7a5bVcUCv413mNBehIu/Y3/HJ1HyDXUnvQ9rgu4nG6AdwvXtxfW2Qgd2mUePdd6T57fBhI3HhYDUJ6JdBgv8gwWKDUM8fnG4ZggsVfUQADQxjHduKSQrXaByNijPrKSOlfzthacmCYwsw1C3O9fPb8aLejdYS5BZGemZuccgxSy7S7qHv3FVpTiLcJgsXZdVzbL46ozGgyHHhN2Ni4dsRze/3xvE+QA81FBz4XyY5kIPoers0lzUpWZP9AQzK59oEdf67JlpZ3SyiJLC+fCJuNfVszQwqR8L/supuaqBivJmA5puVOFEaAsmc3mkxVYb5oIvi3KPojeMAmga1Hs3z/lSzfWQXPNa8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(261102123227099003)(3023799007)(38070700021)(56012099006)(4143699003)(11063799006)(261022105027099003)(261026121527099003)(261022075727099003)(261026140227099003)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Um5IMkQxVGlxUDFEYkhscUdLU1pPcm0rWEgyY3JKSkNnKzVaRHBtVGliYlVh?=
 =?utf-8?B?L1ZLRXZLWXk4TU1KeVdKeWpyNWhiaXc3NnNxZ1ZDTUU3RlVqd0IraFVhdXdu?=
 =?utf-8?B?aUxUdTMzMVoyZnFxRDgwNlFxTjNPcGlkOTRKcFFBV2xDY29SSVFoZU9IeUlQ?=
 =?utf-8?B?dTZLWFZmdkJlZC9ZazY1QVV0VnBUVG0zZG9VT0tHNHNPdkg3YkR2Sk1tK1BN?=
 =?utf-8?B?Rk43Rkt0SHpTbERxS3JDcXdFVUI2K2JPN3dodnFaUEJpaUl0a1IvSjgzSzk4?=
 =?utf-8?B?WGR6dVBrNFlaNWdYSTg5VG0xRmtNdHh3enZxMEM2ZmZwZnVqd2dQemRKWmt6?=
 =?utf-8?B?SzBDS05OcDdOWkJPc0lCWGlLb2xnbXllU1JidnBpZUU4VEpLY3dLcUVWZjFO?=
 =?utf-8?B?Tlo4M3NqVy9POG9GcDI4TXRSUmFzcnFqWlZvRjFDcVRUT2hweGhNZGNURmlZ?=
 =?utf-8?B?L08vZTI0ZDg1eGNNdnhZTGFWNmQrV2dZclBLb25uWDlaQVFBckJlci9ub1Bn?=
 =?utf-8?B?WVdsSG1lZHplT2ZVM2J3ODdUS2drUTB5WGkwZkgwNmM0anFDUjZrVkFjSUY2?=
 =?utf-8?B?K0EyS2NVdzBiZkY3aDFLY21jSFVYTXc2dFFwNUxDUEgzWXc1UWFNZTBjYTlK?=
 =?utf-8?B?ckI3TmNxa3o3NXFXOXZxZXhvRnpiSnJkM1d4YURaY3Y1cW1DWlhsVVZDWDlM?=
 =?utf-8?B?ejNrSGpqc041V2pLTmpzeWhtMEFQczFoMUEwaXFtWTQ2N0EzSUloQm1TaHVi?=
 =?utf-8?B?NVNLSkhxTXVuZ0ZQVTY1OVhQc0VPMkpwNHRmejNQWmtnQ2djazNsSGZCRUZQ?=
 =?utf-8?B?VGwrQW9mTm42TWxmbUdPenpVU1BEbjRBUE5jSGxiMkt1T2RRa3RGRjhxaGF2?=
 =?utf-8?B?enhGY2JnQ2Z4Ym5oNUFjNllhbTVOWnFBYkxPamtoSVczWjA0OTJONFY5ZjF3?=
 =?utf-8?B?NUVOa1hOT0lWYzgwaWswN2Iyb0hsUEtqNEcxV1Z1SjJQR1NOVkJkbDNkRnFL?=
 =?utf-8?B?a3BJTEQ0K21tcFd1RHpKMFB4Uk1aTDFyWlc4MUthYTd2UFhJWTdzMVNMaUp2?=
 =?utf-8?B?UDViM0ZYcUEzRk93bEtkc2pZN24xRktLaHJPL3RoSWxwbFhsQjJ6eGxOT1Z0?=
 =?utf-8?B?RWVuc21KeGhzL2dscFhmajIxT2lhSTVaMkNUYXE4RWFSZmpHa0lVMXZ1Q1NS?=
 =?utf-8?B?aCtXVjZXZXpkUGNiYWl2UHlhaVNhRGh1clpCbzJ1T1UwNjkzYWl2OE9IRVZr?=
 =?utf-8?B?eEUvcVROYnNkeTVCU1Q1NXc1YXJobUdtcHNNREJTUFhLVUhYUGdzWlZ3WG92?=
 =?utf-8?B?aStCdGVkdzAzbGwwZWkrS3BRdFJ5a204Slk2eW9rK080cm04c25YYUtIN1pE?=
 =?utf-8?B?Q2hnUmlHR1UwaWUxM0ZaSHIzcU5ucHFMZlJrQ2QrOTJ1N2ppeExIR2NKakdl?=
 =?utf-8?B?a3RkUnZWei9mNkp4T0IxYnpZcmpqZVNqbTZNNlFRN1pob0hDZG5vaytkRE1l?=
 =?utf-8?B?VStnZnlvcG5qY1h6VFdkemltcThMSFgyYkY2TVRjSTgxNHA1UjEyUGhCbFc2?=
 =?utf-8?B?YVJXcEc4dTlLYUQ5RXhLSnh4bDFBMm11Y1RCeEQxK1hNb1VRcVdHc1BxYUkz?=
 =?utf-8?B?dFBnbE1KQTZ3VnYrV2dieVozZ2FkRVl4YnZqWW5XcmJpSnhjQ2lodU1RMThl?=
 =?utf-8?B?di91d0NZMUxxelIrOWE5NFNUR1ViV2Z4K1ArTU5PTWdiOU5ITkJhdTQzRlVv?=
 =?utf-8?B?azdma01SZG14NUNXSHUwK0hKbkZ3a0c3c25uZnlWSzNTTVVkTHEzcE82bHpO?=
 =?utf-8?B?Ui9HaUtCMDhhRm5nbzNUVkM1bUFKOTB6dFQzVWxDamwyL0VzdGhPUkpZMjl4?=
 =?utf-8?B?d0NrcUZldEtTQzd4SDZKVDlIT21tV2IzVFRmZ0cyWTdLeVM2cVpPU2JsY01P?=
 =?utf-8?B?K0hYTnd4Z2s1ck1DQ3phT2NmU2VrdG5VZmcrbGhEbndFandqREhpc3RIR2g0?=
 =?utf-8?B?ZXZRZkR6TXBmdTBBYndqVGx6RUl6b0IyY0FxY09DTFhjcWs2bUp4dG84L2Ry?=
 =?utf-8?B?NUZNVFZ5ZCtoTVZIc2hFbWplNzY1Tk56MHp3Q3k5YjYzYkNzYnlxM0hZdnRl?=
 =?utf-8?B?UUFodmo1MnFYT2RRQllQdVpWYnltb2VFYlV5TUNxYUdkYm1CRUhValRONGQ1?=
 =?utf-8?B?MlI2RmdPbUlyNVhCellPZU9zdTZLS29qVWI3Tmdib01vL0pYb1M3QzcwaFA1?=
 =?utf-8?B?bi8veUNtTzNNbVRoVHVDbXlaeXh2M1MwdjlCMXZhbi9SQjhIZ1h0TDhZZWVX?=
 =?utf-8?B?alR4N1l5SzV6WFJOYkhxMllxbW1JODNiV2NtWU5pdHVkYktwcjEwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: at9uiMyYgCA0P8RHBprshebWzRV6rihgjBD1JHvmYbssWXIi3grjxWgDkx9hgsfKdVNTkHgy//INs4BaiVpBfQsHZuj//RnzQ54FqGmyLlc6tgcBxEhYLOuN4YYsJd+S+jaekKe2A9GF6oHTwxdPrX8Wucwh8FK1zdxquzSMFtxkodlnhMc3rKNG80SLK7JTD4bteZpUIt97YB5XpTorTSSHWIv8pW8gKH5RZOtqbzAF/3WEF97A/kBOpJfJZcrmJkjt7OhEwcQbBAdxmzRCFkluwBSa0Vq+IOgso4wj7UjGwiI9laI1OyZXDNJNlA40URReMyYQKChPmbA4pSsiJw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2dfbaf-a973-4bac-6e3f-08df3962c496
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 04:27:27.7302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNvnID8YJVnBugtJH1mujmuBsqOtyKZGK67ZWuoBP+hd9wB7FIh0doP4bMVeeKk7w8hP4YE7ir8f7koTxgwTWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR11MB527130
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

PiBTdWJqZWN0OiBbUEFUQ0ggMDgvMTBdIGRybS9pOTE1OiBEb2N1bWVudCB0aW1pbmcgZ2VuZXJh
dG9yIHN0YXJ0L3N0b3ANCj4gYmVoYXZpb3VyIG9uIEhTVysNCj4gDQo+IEZyb206IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBEb2N1bWVudCB0
aGUgSFNXKyB0aW1pbmcgZ2VuZXJhdG9yIHN0YXJ0L3N0b3AgYmVoYXZpb3VyIHNvIEkgZG9uJ3Qg
aGF2ZSB0bw0KPiByZXZlcnNlIGVuZ2luZWVyIGl0IGFnYWluIGluIHRoZSBmdXR1cmUuDQo+IA0K
PiBUT0RPOiBEU0kgYmVoYXZpb3IgaXMgdW5rbm93bg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NydC5jICAgIHwgIDIgKysNCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgICAgfCAxOCArKysrKysrKysr
KysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMg
fCAgMiArKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jcnQuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3J0LmMNCj4gaW5kZXggYjgxNGI4NGM2
NTBmLi41MzI2MTdiZjYyNmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfY3J0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9jcnQuYw0KPiBAQCAtMjY1LDYgKzI2NSw3IEBAIHN0YXRpYyB2b2lkIGhzd19wb3N0X2Rp
c2FibGVfY3J0KHN0cnVjdA0KPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCXN0cnVj
dCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShlbmNvZGVyKTsNCj4g
IAlzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YyA9IHRvX2ludGVsX2NydGMob2xkX2NydGNfc3RhdGUt
PnVhcGkuY3J0Yyk7DQo+IA0KPiArCS8qIHRpbWluZyBnZW5lcmF0b3Igc3RvcHMgYWZ0ZXIgZGlz
YWJsaW5nIFRSQU5TQ09ORiAqLw0KPiAgCWludGVsX2NydGNfdmJsYW5rX29mZihzdGF0ZSwgb2xk
X2NydGNfc3RhdGUpOw0KPiANCj4gIAlpbnRlbF9kaXNhYmxlX3RyYW5zY29kZXIob2xkX2NydGNf
c3RhdGUpOw0KPiBAQCAtMzMzLDYgKzMzNCw3IEBAIHN0YXRpYyB2b2lkIGhzd19lbmFibGVfY3J0
KHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUNCj4gKnN0YXRlLA0KPiANCj4gIAlscHRfcGNoX2Vu
YWJsZShzdGF0ZSwgY3J0Yyk7DQo+IA0KPiArCS8qIHRpbWluZyBnZW5lcmF0b3Igc3RhcnRzIGFm
dGVyIGVuYWJsaW5nIFBDSF9UUkFOU0NPTkYgKi8NCj4gIAlpbnRlbF9jcnRjX3ZibGFua19vbihz
dGF0ZSwgY3J0Y19zdGF0ZSk7DQo+IA0KPiAgCWludGVsX2NydF9zZXRfZHBtcyhlbmNvZGVyLCBj
cnRjX3N0YXRlLCBEUk1fTU9ERV9EUE1TX09OKTsgZGlmZiAtLQ0KPiBnaXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kZGkuYw0KPiBpbmRleCBlZDM5ZjFlMjY1YTkuLmU5N2U1ODZiZWQ3MiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+IEBAIC0y
OTYxLDYgKzI5NjEsNyBAQCBzdGF0aWMgdm9pZCBoc3dfZGRpX3ByZV9lbmFibGVfZHAoc3RydWN0
DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAJCQkJCQkgICBjcnRjX3N0YXRlKTsN
Cj4gIAlpbnRlbF9kcF9zaW5rX3NldF9mZWNfcmVhZHkoaW50ZWxfZHAsIGNydGNfc3RhdGUsIHRy
dWUpOw0KPiAgCWludGVsX2RwX3N0YXJ0X2xpbmtfdHJhaW4oc3RhdGUsIGludGVsX2RwLCBjcnRj
X3N0YXRlKTsNCj4gKw0KPiAgCWlmICgocG9ydCAhPSBQT1JUX0EgfHwgRElTUExBWV9WRVIoZGlz
cGxheSkgPj0gOSkgJiYNCj4gIAkgICAgIWlzX3RyYW5zX3BvcnRfc3luY19tb2RlKGNydGNfc3Rh
dGUpKQ0KPiAgCQlpbnRlbF9kcF9zdG9wX2xpbmtfdHJhaW4oaW50ZWxfZHAsIGNydGNfc3RhdGUp
OyBAQCAtMzI4Miw2DQo+ICszMjgzLDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfZGRpX3Bvc3RfZGlz
YWJsZV9oZG1pX29yX3NzdChzdHJ1Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4g
IAlzdHJ1Y3QgaW50ZWxfY3J0YyAqcGlwZV9jcnRjOw0KPiAgCWJvb2wgaXNfaGRtaSA9IGludGVs
X2NydGNfaGFzX3R5cGUob2xkX2NydGNfc3RhdGUsDQo+IElOVEVMX09VVFBVVF9IRE1JKTsNCj4g
DQo+ICsJLyogdGltaW5nIGdlbmVyYXRvciBzdG9wcyBhZnRlciBkaXNhYmxpbmcgVFJBTlNDT05G
ICovDQo+ICAJaW50ZWxfY3J0Y192Ymxhbmtfb2ZmKHN0YXRlLCBvbGRfY3J0Y19zdGF0ZSk7DQo+
IA0KPiAgCWludGVsX2Rpc2FibGVfdHJhbnNjb2RlcihvbGRfY3J0Y19zdGF0ZSk7DQo+IEBAIC0z
NjAwLDYgKzM2MDIsMjIgQEAgc3RhdGljIHZvaWQgaW50ZWxfZGRpX2VuYWJsZShzdHJ1Y3QNCj4g
aW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gIAllbHNlDQo+ICAJCWludGVsX2RkaV9lbmFi
bGVfZHAoc3RhdGUsIGVuY29kZXIsIGNydGNfc3RhdGUsIGNvbm5fc3RhdGUpOw0KPiANCj4gKwkv
Kg0KPiArCSAqIEhETUk6DQo+ICsJICogIHRpbWluZyBnZW5lcmF0b3Igc3RhcnRzIGFmdGVyIGVu
YWJsaW5nIERESV9CVUZfQ1RMDQo+ICsJICogIFRSQU5TQ09ORiBpcyBlbmFibGVkIGJlZm9yZWhh
bmQNCj4gKwkgKiBEUCBTU1Q6DQo+ICsJICogIHRpbWluZyBnZW5lcmF0b3Igc3RhcnRzIGFmdGVy
IHN3aXRjaGluZyBEUF9UUF9DVEwNCj4gKwkgKiAgbGluayB0cmFpbmluZyB0byBub3JtYWwgb3Ig
ZW5hYmxpbmcgVFJBTlNDT05GDQo+ICsJICogICh3aGljaGV2ZXIgaGFwcGVucyBsYXN0KS4NCj4g
KwkgKg0KPiArCSAqIFdpdGggcG9ydCBzeW5jIHRoZSBzZWNvbmRhcmllcyB3aWxsIGJlIHRyYW5z
bWl0dGluZw0KPiArCSAqIHRoZSBpZGxlIHBhdHRlcm4gKGFuZCB0aHVzIHRoZWlyIHRpbWluZyBn
ZW5lcmF0b3JzDQo+ICsJICogd2lsbCBub3QgcnVuKSB1bnRpbCB0aGUgcHJpbWFyeSBoYXMgZmlu
aXNoZWQgaXRzDQo+ICsJICogbGluayB0cmFpbmluZy4gQXQgdGhhdCBwb2ludCBldmVyeW9uZSB3
aWxsIHN3aXRjaA0KPiArCSAqIERQX1RQX0NUTCBsaW5rIHRyYWluaW5nIHRvIG5vcm1hbCBhbGwg
dGhlIHRpbWluZ3MNCj4gKwkgKiBnZW5lcmF0b3JzIHdpbGwgc3RhcnQuDQo+ICsJICovDQo+ICAJ
aWYgKGlzX3RyYW5zX3BvcnRfc3luY19tb2RlKGNydGNfc3RhdGUpKQ0KPiAgCQl0cmFuc19wb3J0
X3N5bmNfdmJsYW5rX29uKHN0YXRlLCBjcnRjX3N0YXRlKTsNCj4gIAllbHNlDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYw0KPiBpbmRleCA4NGU2OWYz
N2RlZmYuLjU2NzM0MDE2Y2QxOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcF9tc3QuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RwX21zdC5jDQo+IEBAIC0xMTE0LDYgKzExMTQsNyBAQCBzdGF0aWMgdm9pZCBt
c3Rfc3RyZWFtX3Bvc3RfZGlzYWJsZShzdHJ1Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0
ZSwNCj4gIAlkcm1fV0FSTl9PTihkaXNwbGF5LT5kcm0sIERJU1BMQVlfVkVSKGRpc3BsYXkpID49
IDEyICYmDQo+IGxhc3RfbXN0X3N0cmVhbSAmJg0KPiAgCQkgICAgIWludGVsX2RwX21zdF9pc19t
YXN0ZXJfdHJhbnMob2xkX2NydGNfc3RhdGUpKTsNCj4gDQo+ICsJLyogdGltaW5nIGdlbmVyYXRv
ciBzdG9wcyBhZnRlciBkaXNhYmxpbmcgVFJBTlNDT05GICovDQo+ICAJaW50ZWxfY3J0Y192Ymxh
bmtfb2ZmKHN0YXRlLCBvbGRfY3J0Y19zdGF0ZSk7DQo+IA0KPiAgCWludGVsX2Rpc2FibGVfdHJh
bnNjb2RlcihvbGRfY3J0Y19zdGF0ZSk7DQo+IEBAIC0xMzkxLDYgKzEzOTIsNyBAQCBzdGF0aWMg
dm9pZCBtc3Rfc3RyZWFtX2VuYWJsZShzdHJ1Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0
ZSwNCj4gDQo+ICAJaW50ZWxfZW5hYmxlX3RyYW5zY29kZXIocGlwZV9jb25maWcpOw0KPiANCj4g
KwkvKiB0aW1pbmcgZ2VuZXJhdG9yIHN0YXJ0cyBhZnRlciBlbmFibGluZyBUUkFOU0NPTkYgKi8N
Cg0KSSB0aGluayBhIGxpbmUgYWJvdXQgaG93IGJzcGVjIHNheXMgZW5hYmxlICJtYXkgYmUgaW50
ZXJuYWxseSBkZWxheWVkDQpmb3Igb25lIGZyYW1lIHdoaWxlIHRoZSBkaXNwbGF5IGRhdGEgYnVm
ZmVycyBhcmUgcmUtY29uZmlndXJlZCIsDQp3aGljaCBpcyB3aHkgaW50ZWxfcGlwZV92Ymxhbmtf
b24oKSBuZWVkcyB0byB3YWl0IGZvciB0aGUNCnNjYW5saW5lIHRvIG1vdmUNCg0KRWl0aGVyIHdh
eSANCg0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGlu
dGVsLmNvbT4NCg0KPiAgCWludGVsX2NydGNfdmJsYW5rX29uKHN0YXRlLCBwaXBlX2NvbmZpZyk7
DQo+IA0KPiAgCWludGVsX2hkY3BfZW5hYmxlKHN0YXRlLCBlbmNvZGVyLCBwaXBlX2NvbmZpZywg
Y29ubl9zdGF0ZSk7DQo+IC0tDQo+IDIuNTUuMA0KDQo=
