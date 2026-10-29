Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBA1606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PgqeRbo5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2ED710E1E7;
	Thu, 29 Oct 2026 06:12:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F3D10E1E7;
 Thu, 29 Oct 2026 06:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793254339; x=1824790339;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=URodFKpAR7ZFrKi+3klh4jorrQNVlXlzRGZ8sMIGMwk=;
 b=PgqeRbo5v3xMALhDRBPsw4oT466YnXjIFntX1ykpqMsnK30wBfoPvmVT
 Y8Z60CIJG5844tJaOqvTI3XO52nqAybMJ6SQLgUDZfXsG4SofAhJ3u68u
 nuKrcixgCa1w3sWGI264Kcdy2WPkYee9UdlCe2/7/9/VYd+bP/q1FW9tn
 f91J8HcurYhjvgrjpw3J8CT0JEEc9tPwLm80ZBQFM1z+6+wPNeKUQLcgt
 Dx6udtvgZZBkiHGj25WBM+DfRP02/2lYYMi7YofitGy8XQMXT7pWm6I3z
 VutQBGgs66HFxZ2HLSUJSz6bPOuSU3Gd86VbxIFVnOcbN5eaodLGTvdmo A==;
X-CSE-ConnectionGUID: 4/X6VCoYTjmzw73WxGFKOA==
X-CSE-MsgGUID: UrKivoeyRk2M1JcWvcX9ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1876849"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1876849"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:12:18 -0700
X-CSE-ConnectionGUID: 4wHmfWkgS9+ejhOJ7xpO6w==
X-CSE-MsgGUID: SbniabNUQuuBnPjAFozUFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5041975"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:12:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:12:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 23:12:17 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0Jg0LqU2rWGgnvGQaXfP1R6cnJ61w4h0SylBHtpAVsgSL8Onx5ul1xF0x3bByhKS9S+1QLBkKx9mFM0zL5I0oUsvqaq76uGphCkesof2loHq6LHKRYG/cYGYsLs9S0uc3XHWaRa5DiXekCl5JuydWt40bCjSR2hhNv55uWf+Pl9lM3ZH/yZynHWLc16Km1sOuTRG8XnIjN/nEdFNgrkQLGIz09cDCs05vj3Husf4LcR8UNEP0FmRVNbZGP+kxhMH8rjD8lIaTo+ZzdjtmsUD/nddeBXVrmNa99hIhowZpJtJJj+mFYhsoi8BSZU+l0G6dF+mBSaRTu6iZ8XdHGFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URodFKpAR7ZFrKi+3klh4jorrQNVlXlzRGZ8sMIGMwk=;
 b=w2KldiFhyz110BScemmm+UHg4RFVG/SP3J0HB15E7cQjLYROYM2qPSQbj3rBjvPLiRyQteEMh/cnUw6XQxQEllyEfXAyvvdAI6I7jzvKbw98uDjPAOcArJfnXJo2fNZqb/WlouAMMBoAmLrpSkhhL3/k5fg8X8uMYwDOiodVv9jO2/PcRsvhOo6HiB30MgUGMw2b3+GDcVMoNQJUW0yTus6ESkHQfbDRPMfnzAiYlkgzm8hGzVNX8TdPlArzwo66F/W3ASQW+v0rzmveukEfKhn7hnxhxMtEoPDYVS9rJ1ilR2gnJh/ucQcQHdMIKj00K7qiH4rAwJp1tJ2uMF2GOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by BL3PR11MB6459.namprd11.prod.outlook.com
 (2603:10b6:208:3be::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:12:13 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 06:12:13 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH v2 2/6] drm/i915/display: Add the DP link layer symbol
 timing generator registers
Thread-Topic: [PATCH v2 2/6] drm/i915/display: Add the DP link layer symbol
 timing generator registers
Thread-Index: AQHdZphYy7TZ8RUTwkSihWH+S28Z5LcUCCdg
Date: Thu, 29 Oct 2026 06:12:12 +0000
Message-ID: <DS4PPFE901A304F7471CD18ABD882B4156FE36E2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261028-vlk-64036-dp-symbol-tg-v2-0-43849c325d32@intel.com>
 <20261028-vlk-64036-dp-symbol-tg-v2-2-43849c325d32@intel.com>
In-Reply-To: <20261028-vlk-64036-dp-symbol-tg-v2-2-43849c325d32@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|BL3PR11MB6459:EE_
x-ms-office365-filtering-correlation-id: 67cd0868-2615-4601-b5a0-08df358392d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006|261028144727099003|10067099003|261021123027099003|261022105027099003|261021121427099003|261009223027099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info: V3poOyocwcUX3fmqGes7NI00011RK1bnTbwUQbUVGyuU2wn/vnl+YPa4tiQrHxrKV9U/k4vrLCb+y40NXkZJHv9SloaOLe8gQr6mCB3/Hzhb2ucY8iRggph9JfUCpxJwt7KV5CU+ZNGSbmXp3ZNcafnmm9/gr0oqeKM2tAjADdOSRYVN7XRdYpHe+bmslrYW9gtNWH7+cwe8AwlE2KcN6F389XdpJVx8Aw5Ga0X9hPIvp3a8ZyfetY18z4uRl4rYgEgibFhoBCh8UetYPloC38JJZdRWnUvjcNyy2MokmrKtGrw/niA4ipMa9WbY2Lc+xnIPWy1gxnb1uq8eIn1c9PRptg38tvbsMwA0CZnYIcwgaNVaW55ud2IGBBgXEG5c2QkfyL/PXaTTHacrhB+rFw9niAKwkxEoozl38kMS/E9+XbfymDnBDJCxtr1d6mi5uDqJ1EIWkaVF1t5fS47dPxnb/iTwLjtpwgrwFKsSO0+1jZWNtgNfG6VyQehYK86nUXZH04AtzlpMZyWLxeUuUT7yyi1hHBrAIDk2tEXiEt/D9pPMeEJRhTIdQJv4sh83GZMqQ7d/vp6igzZlhaN4aQeoSZEeqjhf/Ril+frfHL8wzcfjpcw5V5znUBLJPYYkO4UwiXg7RJ87nJSLljeCt1Ou/B7+bnJbGY+8EYgP6ZDew6JuexrMX3h9HhaVOtriwwcz08bigYHlDzYmzelvP90xNYyYSjyugyiopAIhYZg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(10067099003)(261021123027099003)(261022105027099003)(261021121427099003)(261009223027099003)(261026140227099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVVZeTB2MVprVWp6TDc0SWhkdFI4K2NVb2t5S1h3Snl1SXJjS2wxckd4VU1i?=
 =?utf-8?B?bmJkOHAyeCt1V2djeHdMRUZ4T0Y3WDZZdVp5QjFtN0lrSjNtZlBGK29QSE43?=
 =?utf-8?B?Rm5lMi9OTGN0Z2laTjc5YjNlSEw0ZmxKd3IybTRCWVVWdCtodnVKTnRGMy9M?=
 =?utf-8?B?RlhXbHVqOGg3Q1FYV3BwWkdCZ0VIcHRxSUpDYi93WmR2MUtaSmVZWWNZZHJV?=
 =?utf-8?B?VU5qb0REakIweWNLUzY4ZWQwZ1RkeHJTOUs3Y0h6bTRSOXZBN29jWDlYZ2NV?=
 =?utf-8?B?ZUFSTzJPU1AwTVlpVmErTk1BL3hyUHY3VlpYWnZvSm50djNPWjFnSGhPWjdT?=
 =?utf-8?B?cjh3WE8xdUhVM3V6OGNyVkl6Yk56ZVBMYXpObEZNNzRCbisvWWF1SWdzbXMv?=
 =?utf-8?B?SVlmUXp6NldkS1k2SVdtZVVJbXdhZTBNVmVTVTE4NHFiVEl3Q0d2Si9jcUpW?=
 =?utf-8?B?dW5aVjlvaFJta0tZYmNLOFkyZzlrOVl3bnZvQkhIRFNVa3UxS0VvdnN5Zlp0?=
 =?utf-8?B?Sk52dEpxTHEzMFNYNmFIbllpMTkrd2VHcllKOXR6Y1pWRk5BMm9lOEdVN3V2?=
 =?utf-8?B?ZXNmd2tmcmY2UXFqby9nZktnWTJ0cVBidzNUcG01Y2NYUDQzTmtaaThHTXg4?=
 =?utf-8?B?byt5aWdta3o2REZqVHovWUxFUVlZRUJueW84Ly9IUWNpenBVeU5DdUgyU0V2?=
 =?utf-8?B?cmV0cm11eDF6SC96ck5ONFZKZ3NXS1Yvd2NxclhWRTB0VitwK1hqUW9iY2x0?=
 =?utf-8?B?dlR1M2dnWjZLM1g3cFAyOTJOWVVUME1kTUkrSmZLazRXbDJ5OXNyWTlXMmZz?=
 =?utf-8?B?NlM5SktHdEgvMk1BUzVPcDIyT3B5SGRyaW5hVFg5dkNlZWZIOU1sWWlQaUdW?=
 =?utf-8?B?SFdvT3pQRVdvdkZGOVZlVE9hNU9iYmR1K1E2TkVLZ01DY3Z4K3hpS3N5dC9w?=
 =?utf-8?B?NnF0V3BPMGVGMXBaRDVsTU0xZ0xIZEh0UHpZa09HcldtMWNNZ0FUUkhJeUdE?=
 =?utf-8?B?SWhQUzNHQU1aTnBndjI3RjE5NEpaWUs5b2JtTzNwZFVoRzZsVDFjNUc2aEhW?=
 =?utf-8?B?dWRCVTQ1NHZUcVdnQy9LbmVXanBWNGovTTFtNzdBZDlpSm96YzdVcHZtTUZV?=
 =?utf-8?B?YzVQMkhKZmdveTVYdmRYUXowVEVwNGp5T09ieHNKQmR4WHhwQWl3ZU91clBB?=
 =?utf-8?B?V1BMcnFCWEVUQlVaWWlZTGNIczZpc29SR0YwWWNadlNVcytXRFZHYzNvQStK?=
 =?utf-8?B?QlJPRnNPWWFCQys5cUhGZWpQSW9DTjJ6eFdpOVgyOVE0UWhnejVqSi82c2Nl?=
 =?utf-8?B?aU04Ni9qWE9Bc1VObEtEdDBid1RFY1Z3YlJ5NXVKRkxPZlFveVhxWTNFS3U4?=
 =?utf-8?B?MDlZNGJzRGMxM3BBOXdOOGNLTFVsYWtRS2FhYmh2dnRKbFcxZUM4MlllVjNh?=
 =?utf-8?B?UzB0NmFvRkZVNXRUaUh0K2NpVkRrdHdLTlNONURkK1Zmb1hWT3VhK1JoQWts?=
 =?utf-8?B?OXhxNmovWmtXVVFSN2srUXNIaGFRdC96TkRudjRSL2Rqd2d4dXh3czJKRzNJ?=
 =?utf-8?B?b3kveVJnTjUreDdJaEtMK3U4QnlTRGZvTGw4aWdwcDEvUGdxQ0xrNHVNRzRl?=
 =?utf-8?B?VE1lVXpNRXkvcytQVkNPWTA2Vi9jUUJBZkVjWVpxRFFNTHpKKzNkdXVTd2ho?=
 =?utf-8?B?WW5kU2UvRlJvdmozb0kxK0VHTUp3V0x1YzgwaEljTHRpb3FFMXNHR3ZJUkhR?=
 =?utf-8?B?b2pTb0tQclUyS1MxNWlYa1RsQUl0L3RxdmFLZzQ3bFAyY2hidkU0UHpsQVZO?=
 =?utf-8?B?WWZxT2tpV2lxT2g0QXJnY3V1c096TERyWEErNmVYOStKSHI1NDVkV2c1SkxQ?=
 =?utf-8?B?ZFRXclVsV0lQYjBFeC9la0hGa3FiNFplTDc2c2pPbkF3TFBsWkJFRng4clNj?=
 =?utf-8?B?TFAyeFBYcW5BL2dLRG1Ja2FEMmlZNGh6MG12T3libFhUS08zaUo2enlKNStH?=
 =?utf-8?B?bngzUFE2WWx0d0pVNzNwdlJ0aTdmZlpGdXczc244d1h5empRZkRVL09hSmNC?=
 =?utf-8?B?TmlmNWR2aWJIemZKK043ZTQwdnVqUlBXUFpFTStCclRObm1ucXhjeEFtRWEr?=
 =?utf-8?B?bUkrRkhIRjlqdEZtZ1lvcTFLU0pvOVZ6dTcwVWMza1FVWFYramNpVldEMjJC?=
 =?utf-8?B?N3lSODljQmFvLzZ2WWVsWXlia0R4RXRuWDljMDFvaGxDeHl3Z3dvZ2YvMFZW?=
 =?utf-8?B?RFRpSVl6ZHUxMGtvN2RrbE5FVCtNbWVCOTJ1RWVJOFpxQ3ExUnRyMXVyTWhm?=
 =?utf-8?B?TTJjdU5hM0dubkt1N1JmRDJPaldTY0JsbVpDWWFRc1JsVVAva090Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mZ6vv1jrKbXiRW5h0GQG3nuR+QJeA8v3bGmPMp70MjOM3iCLa/7O5r6Wyo9WA4K9A9neDYsIOCwQZKk48HxRCyn6zX3wdvkbcDDKNQn2IVFd2jEb8RaniyeDaoXUxuH5u7T7DgolwpBlKQg1MUMd4nLslfmQEz5BAdWS3j77oA0/fItFI0/7jkVgbmvo+t+F1FStPshZX643xXk/qYlaT4hXllHR76Vpd6hz099dWC8hpWfTQcI/dzH+s/qjQ50OJ1xosrDUDI0UUwe7msGFMGx85P3kb/mkHbeCdzRFacTM21Sz3xaw83oamEPUt9sMsSprxwF7EW4/u6cPPriArw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cd0868-2615-4601-b5a0-08df358392d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 06:12:12.9659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RY1piSwajxaLwG1DulqyLosc9RyVYhrueUX65FJiKADyRrxloyH6VXBgGZBEhUKDqr5S/eEhzcPBWXGfb2zrAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UPPERCASE_50_75 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMi82XSBkcm0vaTkxNS9kaXNwbGF5OiBBZGQgdGhlIERQIGxp
bmsgbGF5ZXIgc3ltYm9sIHRpbWluZw0KPiBnZW5lcmF0b3IgcmVnaXN0ZXJzDQo+IA0KPiBBZGQg
dGhlIGRlZmluaXRpb25zIG9mIHRoZSByZWdpc3RlcnMgb2YgdGhlIERQIGxpbmsgbGF5ZXIgKExM
KSBzeW1ib2wgYmFzZWQNCj4gdGltaW5nIGdlbmVyYXRvci4NCj4gDQo+IEJzcGVjOiA2ODg0OSwg
Njg5MjIsIDY5OTYxDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheV9yZWdzLmggfCA0NQ0KPiArKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcmVncy5oDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3JlZ3MuaA0KPiBpbmRleA0KPiBiYmRi
YzI3NjI5ZDcxMDRjMWY4MGJhYWQ0NGU3MTA4NzIyMTRkNDJiLi42NzhiMjFlMzhhMTkzYWQyYWZk
YjMzNw0KPiBkNGIxYmFjNzdlNzkxOTY5ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3JlZ3MuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcmVncy5oDQo+IEBAIC04NzksNiArODc5LDcg
QEANCj4gICNkZWZpbmUgICBUUkFOU0NPTkZfRFNJX1BMTF9MT0NLRUQJCVJFR19CSVQoMjkpIC8q
IHZsdiAmDQo+IHBpcGUgQSBvbmx5ICovDQo+ICAjZGVmaW5lICAgVFJBTlNDT05GX0ZSQU1FX1NU
QVJUX0RFTEFZX01BU0sJUkVHX0dFTk1BU0soMjgsDQo+IDI3KSAvKiBwcmUtaHN3ICovDQo+ICAj
ZGVmaW5lICAgVFJBTlNDT05GX0ZSQU1FX1NUQVJUX0RFTEFZKHgpDQo+IAlSRUdfRklFTERfUFJF
UChUUkFOU0NPTkZfRlJBTUVfU1RBUlRfREVMQVlfTUFTSywgKHgpKSAvKg0KPiBwcmUtaHN3OiAw
LTMgKi8NCj4gKyNkZWZpbmUgICBUUkFOU0NPTkZfRFBfU1lNQk9MX1RHX0VOQUJMRQkJUkVHX0JJ
VCgyOCkNCj4gLyogeGUzcCsgKi8NCj4gICNkZWZpbmUgICBUUkFOU0NPTkZfUElQRV9MT0NLRUQJ
CQlSRUdfQklUKDI1KQ0KPiAgI2RlZmluZSAgIFRSQU5TQ09ORl9GT1JDRV9CT1JERVIJCQlSRUdf
QklUKDI1KQ0KPiAgI2RlZmluZSAgIFRSQU5TQ09ORl9HQU1NQV9NT0RFX01BU0tfSTlYWAkJUkVH
X0JJVCgyNCkNCj4gLyogZ21jaCAqLw0KPiBAQCAtOTMwLDYgKzkzMSw3IEBADQo+ICAjZGVmaW5l
ICAgVFJBTlNDT05GX0RJVEhFUl9UWVBFX1RFTVANCj4gCVJFR19GSUVMRF9QUkVQKFRSQU5TQ09O
Rl9ESVRIRVJfVFlQRV9NQVNLLCAzKQ0KPiAgI2RlZmluZSAgIFRSQU5TQ09ORl9QSVhFTF9DT1VO
VF9TQ0FMSU5HX01BU0sJUkVHX0dFTk1BU0soMSwgMCkNCj4gICNkZWZpbmUgICBUUkFOU0NPTkZf
UElYRUxfQ09VTlRfU0NBTElOR19YNAkxDQo+ICsjZGVmaW5lICAgVFJBTlNDT05GX1BJWEVMX0NP
VU5UX1NDQUxJTkdfWDEJMyAvKiB4ZTNwKyAqLw0KPiANCj4gICNkZWZpbmUgX1BJUEVBU1RBVAkJ
MHg3MDAyNA0KPiAgI2RlZmluZSBQSVBFU1RBVChkZXZfcHJpdiwgcGlwZSkJCV9NTUlPX1BJUEUy
KGRldl9wcml2LCBwaXBlLA0KPiBfUElQRUFTVEFUKQ0KPiBAQCAtMjMzMiw2ICsyMzM0LDQ5IEBA
DQo+ICAjZGVmaW5lIF9EUF9NSU5fSEJMQU5LX0NUTF9CCQkJMHg2MTBhYw0KPiAgI2RlZmluZSBE
UF9NSU5fSEJMQU5LX0NUTCh0cmFucykJCV9NTUlPX1RSQU5TKHRyYW5zLA0KPiBfRFBfTUlOX0hC
TEFOS19DVExfQSwgX0RQX01JTl9IQkxBTktfQ1RMX0IpDQo+IA0KPiArLyogRFAgbGluayBsYXll
ciAoTEwpIHN5bWJvbCBiYXNlZCB0aW1pbmcgZ2VuZXJhdG9yLCBkaXNwbGF5IHZlcnNpb24gMzUr
ICovDQo+ICsjZGVmaW5lIF9UUkFOU19MTFNZTV9IQUNUX0EJCQkweDYwMGRjDQo+ICsjZGVmaW5l
IF9UUkFOU19MTFNZTV9IQUNUX0IJCQkweDYxMGRjDQo+ICsjZGVmaW5lIFRSQU5TX0xMU1lNX0hB
Q1QodHJhbnMpIFwNCj4gKwlfTU1JT19UUkFOUyh0cmFucywgX1RSQU5TX0xMU1lNX0hBQ1RfQSwN
Cj4gX1RSQU5TX0xMU1lNX0hBQ1RfQikNCj4gKyNkZWZpbmUgICBUUkFOU19MTFNZTV9IQUNUX01B
U0sJCQlSRUdfR0VOTUFTSygxNCwgMCkNCj4gKyNkZWZpbmUgICBUUkFOU19MTFNZTV9IQUNUX1ZB
TCh4KQ0KPiAJUkVHX0ZJRUxEX1BSRVAoVFJBTlNfTExTWU1fSEFDVF9NQVNLLCAoeCkpDQo+ICsN
Cj4gKyNkZWZpbmUgX1RSQU5TX0xMU1lNX0hUT1RBTF9BCQkJMHg2MDBlMA0KPiArI2RlZmluZSBf
VFJBTlNfTExTWU1fSFRPVEFMX0IJCQkweDYxMGUwDQo+ICsjZGVmaW5lIFRSQU5TX0xMU1lNX0hU
T1RBTCh0cmFucykgXA0KPiArCV9NTUlPX1RSQU5TKHRyYW5zLCBfVFJBTlNfTExTWU1fSFRPVEFM
X0EsDQo+IF9UUkFOU19MTFNZTV9IVE9UQUxfQikNCj4gKyNkZWZpbmUgICBUUkFOU19MTFNZTV9I
VE9UQUxfTUFTSwkJUkVHX0dFTk1BU0soMTQsIDApDQo+ICsjZGVmaW5lICAgVFJBTlNfTExTWU1f
SFRPVEFMX1ZBTCh4KQ0KPiAJUkVHX0ZJRUxEX1BSRVAoVFJBTlNfTExTWU1fSFRPVEFMX01BU0ss
ICh4KSkNCj4gKw0KPiArI2RlZmluZSBfVFJBTlNfTExTWU1fQ0hVTktfU0laRV9BCQkweDYwMGU0
DQo+ICsjZGVmaW5lIF9UUkFOU19MTFNZTV9DSFVOS19TSVpFX0IJCTB4NjEwZTQNCj4gKyNkZWZp
bmUgVFJBTlNfTExTWU1fQ0hVTktfU0laRSh0cmFucykgXA0KPiArCV9NTUlPX1RSQU5TKHRyYW5z
LCBfVFJBTlNfTExTWU1fQ0hVTktfU0laRV9BLA0KPiBfVFJBTlNfTExTWU1fQ0hVTktfU0laRV9C
KQ0KPiArI2RlZmluZSAgIFRSQU5TX0xMU1lNX0NIVU5LX1NJWkVfTUFTSwkJUkVHX0dFTk1BU0so
MTEsIDApDQo+ICsjZGVmaW5lICAgVFJBTlNfTExTWU1fQ0hVTktfU0laRV9WQUwoeCkNCj4gCVJF
R19GSUVMRF9QUkVQKFRSQU5TX0xMU1lNX0NIVU5LX1NJWkVfTUFTSywgKHgpKQ0KPiArDQo+ICsv
KiBEYXRhIE0vTiB2YWx1ZSBEVzAvRFcxIGF0IHRoZSBiYXNlIG9mZnNldCwgRFcyL0RXMyBpbiB0
aGUgX0VYVA0KPiByZWdpc3RlciAqLw0KPiArI2RlZmluZSBfRFBfTExTWU1fREFUQU1fQQkJCTB4
NjAwMjQNCj4gKyNkZWZpbmUgX0RQX0xMU1lNX0RBVEFNX0IJCQkweDYxMDI0DQo+ICsjZGVmaW5l
IERQX0xMU1lNX0RBVEFNKHRyYW5zLCBkdykgXA0KPiArCV9NTUlPKF9UUkFOUyh0cmFucywgX0RQ
X0xMU1lNX0RBVEFNX0EsDQo+IF9EUF9MTFNZTV9EQVRBTV9CKSArIDQgKiAoZHcpKQ0KDQpXaHkg
bm90IHVzZSB0aGlzIGZ1bmN0aW9uIGFuZCBmb3JtYXQgaW5zdGVhZCAoZm9yIGFsbCA0IHJlZ2lz
dGVyIGRlZmluaXRpb25zKQ0KDQpfTU1JT19UUkFOUzIoZGlzcGxheSwgdHJhbnMsIF9EUF9MTFNZ
TV9EQVRBTV9FWFRfQSArIChkdykgKiA0KQ0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQoN
Cj4gKw0KPiArI2RlZmluZSBfRFBfTExTWU1fREFUQU5fQQkJCTB4NjAwMzgNCj4gKyNkZWZpbmUg
X0RQX0xMU1lNX0RBVEFOX0IJCQkweDYxMDM4DQo+ICsjZGVmaW5lIERQX0xMU1lNX0RBVEFOKHRy
YW5zLCBkdykgXA0KPiArCV9NTUlPKF9UUkFOUyh0cmFucywgX0RQX0xMU1lNX0RBVEFOX0EsIF9E
UF9MTFNZTV9EQVRBTl9CKQ0KPiArIDQgKiAoZHcpKQ0KPiArDQo+ICsjZGVmaW5lIF9EUF9MTFNZ
TV9EQVRBTV9FWFRfQQkJCTB4NjA0NzANCj4gKyNkZWZpbmUgX0RQX0xMU1lNX0RBVEFNX0VYVF9C
CQkJMHg2MTQ3MA0KPiArI2RlZmluZSBEUF9MTFNZTV9EQVRBTV9FWFQodHJhbnMsIGR3KSBcDQo+
ICsJX01NSU8oX1RSQU5TKHRyYW5zLCBfRFBfTExTWU1fREFUQU1fRVhUX0EsDQo+IF9EUF9MTFNZ
TV9EQVRBTV9FWFRfQikgKyA0DQo+ICsqIChkdykpDQo+ICsNCj4gKyNkZWZpbmUgX0RQX0xMU1lN
X0RBVEFOX0VYVF9BCQkJMHg2MDQ3OA0KPiArI2RlZmluZSBfRFBfTExTWU1fREFUQU5fRVhUX0IJ
CQkweDYxNDc4DQo+ICsjZGVmaW5lIERQX0xMU1lNX0RBVEFOX0VYVCh0cmFucywgZHcpIFwNCj4g
KwlfTU1JTyhfVFJBTlModHJhbnMsIF9EUF9MTFNZTV9EQVRBTl9FWFRfQSwNCj4gX0RQX0xMU1lN
X0RBVEFOX0VYVF9CKSArIDQNCj4gKyogKGR3KSkNCj4gKw0KPiAgLyogU05CIGVEUCB0cmFpbmlu
ZyBwYXJhbXMgKi8NCj4gIC8qIFNOQiBBLXN0ZXBwaW5nICovDQo+ICAjZGVmaW5lICBFRFBfTElO
S19UUkFJTl80MDBNVl8wREJfU05CX0EJCSgweDM4IDw8IDIyKQ0KPiANCj4gLS0NCj4gMi4yNS4x
DQoNCg==
