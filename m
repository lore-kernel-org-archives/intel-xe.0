Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15833C71135
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 22:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFB110E74B;
	Wed, 11 Jun 2025 22:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvxdERGx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2889010E747
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Jun 2025 22:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749679514; x=1781215514;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bAJ7AHrywib3yfdm5su//Ad+HRQT/FpTwkTgewWiexY=;
 b=RvxdERGx1OAN+OX0D+XeZFuxd02dyk2yuiNQPOWIa8438HiODBFEm/0D
 tpqJOohATlY+Om5Ygb5+phTjLtnpnoRpTjmstU03JOfotHB9+ovANXCfe
 5SKfDDWbji447fysg1+jSktCrZTfgjMUp2FNtSfYo4ZmHCswNIu9Mj7/q
 1kvKL659RQ6E+lXH9w1j1wHUlMdNMHn4xPMcTvWRDd6VNwgj9SELIXKUs
 xit0HQnai1WZHILD5KG7aO0Hh3rs+LObjEkmvChsYAkQQrngcb2IsYJ8q
 gJMXrWIm+pqzdhdXJ61lK0EmRh5pNqOVozaS07I66cTlTbNzECvT8yam7 A==;
X-CSE-ConnectionGUID: UsBXV4BqS0OwB8D5WaflHg==
X-CSE-MsgGUID: i/lavIW0TX2HOOW7P+bQgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62118448"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="62118448"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 15:05:13 -0700
X-CSE-ConnectionGUID: nYJWcOdtS1KoNBhd9CoTQA==
X-CSE-MsgGUID: /TWH45o8TF+Sw3R5IQv1MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147685058"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 15:05:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 15:05:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 15:05:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.86) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 15:05:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9u/qjOFLOpPoJKH8VjuX2lLpAyKDgxZXqXrTDTbmzvl+iwcnwdHYxsHQnx2CKqlsj9AtA45D5DByevyJe4/m3qkM6rd9E7Zl5Ondjur8v/9r2+rLJHGfJxPHsLiiYxgFzdAf/L5xxf8hDs/Onzr4NSp1tzCjO9fsb0nQIPgqqJG0COLcx43wI7G6yd2RSvExUj/mbnftrIku90lMbB2UgjAyqcmteKRd+os6uXqQ8r28flGEbLfG3cFmenIphLpa1Kq+IuOEcQMXKkefcAK+4K7bkSHQCC7LR+8ssuL9cfsgIvQOkoSvpcaIYgWGLSliyIHkLCz0F72fPG2MLej0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIXuNeuB+f5C+gKMEdrEvUjFaNA0NxNe7dLn6VVVzfU=;
 b=t4DVy180dFHH01s8+UhoV+2Mt15J8QSuXc4meOFJNjd4qsdfE0l1cksFigwtSPdZLKCBf8NUXjBA3x4zcGnX8QYAa1QuypB91q2Y6IQvez699IthPwYLvCTZCQDOsYwrRaq14t7JVpgL0rPvV/iomg7OH71ySRYOFubCBaS/4uTdqY7Lj8586ZfOnwcCX2FKQtYGOWDWryq/jDtVPvxwIluRct6/ic3Q9CY4MQ53dSoprTeEygX3U1aOLNMotUA4innvGBFDkm/79sh8TIQx0FOQ3S7g1eO6iuZ1KmD1IzBomdHnpdWshiQNrxncejSF8z5urS1w8oG/t0DJ8Oj7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4771.namprd11.prod.outlook.com (2603:10b6:303:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Wed, 11 Jun
 2025 22:04:55 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 22:04:55 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Topic: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Index: AQHb2xS1G6L4Gnmrj06JQMCG4b4JFrP+fC9w
Date: Wed, 11 Jun 2025 22:04:53 +0000
Message-ID: <CH0PR11MB5444BB01251782688FECD0E6E575A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
In-Reply-To: <20250611210553.3756700-3-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4771:EE_
x-ms-office365-filtering-correlation-id: 844e7725-5ccf-44bf-c0c6-08dda933ff64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yFEQMvtlD0mC5TXLRhxptqeyehwtranSWo8QyETBuckofkUCePHXF1M3OAXf?=
 =?us-ascii?Q?ia4NwnR8sQEQwn4hCJ/VDbNpBfyNwmLg1TYZeANbLFIIoTkYUGt9Fli9x8Ts?=
 =?us-ascii?Q?0vA10a0gQSYoGBP9A3QmXkJK64dgWJc8bZJilzpCZQJ5DlJt2Y6gkMWVBGk3?=
 =?us-ascii?Q?8qhCcXV9kjc1rCfsNne/nfcyn26f0zjQsIoyKs1RSgboA1itAEh9y74YAcx8?=
 =?us-ascii?Q?rvUHnwtmml4tnfNUH8UXuIcCPT22qP0p/2sDanLTTq1TZH21lROgxmaRy15b?=
 =?us-ascii?Q?o75ru3fAhoMqMpIy/PLuhqab4rvpwTFFEPbKk6uhf6+uFeyjqjtnwFnYWP30?=
 =?us-ascii?Q?fgVtbxWaCRZ38czF3wMnZNg6FZcJWUWSrU3vJju9eSQEl5xN/gdHL5wk23QA?=
 =?us-ascii?Q?KX0ObL0SpowGcG9j+HdQgeAHDNTc1WOLT1L0sfZgpfsOEIIapEpFX4uWxdR9?=
 =?us-ascii?Q?v6chBcdArCjc95G6Dxzda1sK6wmtENdSNwQoYMlBcU6GziWlY/41PvKMbkRb?=
 =?us-ascii?Q?86D9dbJbNXr84c32XqiuSgcRa91RomHr56DrqNMKmLMzp5esM3yEUcVwu7cP?=
 =?us-ascii?Q?JIpi8U9wtj/SxfCUTvCHL2ms4O9HB1P/utsbR8kFO72DfxT2OEhO8egAktxJ?=
 =?us-ascii?Q?7CmK/KSsv280vgay0mbrGimpba9u2xK8MZUXIFhRT8zS9XJxdzNL9VKJ+8q8?=
 =?us-ascii?Q?4igqYrvuUYy4txfTEbQUwHbfV5PZOH8xuw95Cj/HLoY+hIS2eY5JGNOVBm4i?=
 =?us-ascii?Q?w5MFPm3JoNXs26bgTK84DzlJIjqoV0VC1EhPatr1VxdlAoHf3wPrvXbKyLgD?=
 =?us-ascii?Q?WIKhXbpYieDDttG3BeT1t3DcJyEn5bP55CPTxr3z10Wv2lIfYngZ6mLLG24k?=
 =?us-ascii?Q?RzWKASXtVYffdb66rLN8QwEw9a8hEelPD0uiOMsD8cj5CdVucqK61ZrONpWW?=
 =?us-ascii?Q?ulWYjDClUahLKKfTJ59GpqolRWKtt9NJlBNcUhnFqseEn6VIAD9OGtpgutIj?=
 =?us-ascii?Q?7zSBzLXM1A7H7WxbWZ+wVdrD05OexvFslpu0YtqbN521cgGGRFbV9Z4P01/L?=
 =?us-ascii?Q?DaENjco0NPYsJJJqrlfTEwpJ0q8YsT2OwCPhllKqkPd4A6ABSUfMFcGNeWbI?=
 =?us-ascii?Q?kH7P16yuLAM1DN2KLmBoDhqo29Dm8BK/07v0O8o8fdZo/aDNN831+Rul211k?=
 =?us-ascii?Q?XYGov0TMsixtEmm4C//amb66PDnBu49BJ8gz8D8MdI5YJah25CvVpgKxGKo7?=
 =?us-ascii?Q?83MjgZL0KkZ83uOL+i+N3ntLKhh+Wk/FgJtjwWWc35uxRepTA1WClPPpEnov?=
 =?us-ascii?Q?q3jYc1UI5ZK+OvPjj/kJ2WTPVEnP6RGRGp+wtAVocLf3HOtnRsRbCTX3twX9?=
 =?us-ascii?Q?MgKQADJCcagRC3VvG6PPgiwcnHvSpznh8nr78QZVHnLs9DBAhhTnY90vngGj?=
 =?us-ascii?Q?VIAUcHiMTRM0+6tMA95KPRCCRWyLDUdKX75+NAXeZdB0mN5mZhzyPEYG9UHY?=
 =?us-ascii?Q?NXunUHDg3iVoxrQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tNYv1U0sPsgrG95eeWuCyq8G0iunN/z/Q4xzRyW/TeERYMFAOAuAV1ULvpvM?=
 =?us-ascii?Q?O+CQBFTOBzBECdepqwrd8Fr/bMnBOUkVpchQ4fRl6w4CeEuaaVpsvqidsJ3B?=
 =?us-ascii?Q?7I5oYb6in2RmgTF73uiVYMJJSnhRGwcgkRuGmd3DJHstosepoGwlPBR4148V?=
 =?us-ascii?Q?IuXMdY1cydFNjo2/YiNJFFGYes1wm/+frydPN5e2tqpnjpny4EDqouTkmpK2?=
 =?us-ascii?Q?KKIuzcq9NljENNRNA5ABG0gjxHjowFwhMzFraFd2jTZwRYBEbvVcQIElSo1D?=
 =?us-ascii?Q?oqsaR4B46O8rTobOAWQv34DcAscWZty6+m3C0MliJKwBTPcbGhZro+4YVL9k?=
 =?us-ascii?Q?QDwolV/HBQW19Lav5EeE2YXw0SNoIvPSkWTQOh7/jNqbTb7EIQDjBhmIBGbH?=
 =?us-ascii?Q?nlKMrMH0Xu8Q0ubS3a7j5gKcPg6rq+RKCRnEmi/UVPheYbCiZNP0fb29B9kG?=
 =?us-ascii?Q?CI5tqO6FHcSai9zQ0lSqxzGfff9yZ150FjpOWF+XN1lFsmJo0AazlNE9voaY?=
 =?us-ascii?Q?8X/zz3owA+JeGPnYy+5p80EmSXWJriN3IvyMr3PEFQpf7ZcMfd/RuHA1828S?=
 =?us-ascii?Q?UQIJVUFW2fc3WUvSNwFOw3YCdknzUtCGU+LMyHAoUG32otOcA5TB8JLnR8EC?=
 =?us-ascii?Q?GmqcKXf/zfjiDKncOsokpa+kNNXZ/9hATIo7SQ7UpBjgDaPyCbHTHkJMZ20C?=
 =?us-ascii?Q?6nvwaWC1htLD4Fua+kVcxVr0WGeqE4L6cVwPXfSIIa41Cn7iq8UTZfHcTc5V?=
 =?us-ascii?Q?wdoo9OVQaqOylcRFfvY8EGM6ME3lnaqGhJpolrFysFaQ1w5O0kj597z0d2Pl?=
 =?us-ascii?Q?tOgraQnfgBluRfx/N0ZENSnPrKJ8NDSfvmZzxk/siwcBxhVF0jPlZ3Fy8v61?=
 =?us-ascii?Q?AM8tUrDr2YhktFhhIVcBYMm1XRFi6pvtx/rMWkXqP7T7co8DCcF3mHn9wRX1?=
 =?us-ascii?Q?msRzZtvsqMHQniUajYHIa0r4UZIXR+nX4yEnQcxYCU39RjmmKC1E78zUtGDd?=
 =?us-ascii?Q?yxth8fVA4hvIH4Pr3K1EaZTPSNv7Qu/+MVAcRcV4kdbz0b+VeUcjkavKPdJc?=
 =?us-ascii?Q?Jx2QjYwc9Oc5Od1qb2M3AQ9FuQFakHTKnn4kW+cpf5a0yFYWIiZnM5yIYmzE?=
 =?us-ascii?Q?dsGnYUfusbr/e0ku+VgZCzbQnsNoKNAF49diSO/LQOmnswZolRg7wbH2HbMO?=
 =?us-ascii?Q?Uf1QdGC3eta3u9vgwBq4FuNPlQIE48E8BNZKW+aa3ErRXOU1KeTsBMmmnSR0?=
 =?us-ascii?Q?AlIiY0F5sS+bONOnTbrzdS8kZpcJkiUHdC7VWatVFmlMsycl2mbg1H75oy5P?=
 =?us-ascii?Q?Rn68xxnd95GHxUBDSzgWf4QoCHJxSHlREO9AN6Njx6uF+jSGeWChxyzUD9uj?=
 =?us-ascii?Q?LSs3rZMbXwBzBLtClBjv9s1nd1MYShsNMWFnW61CFId2Jbw0OelqoHewDqrH?=
 =?us-ascii?Q?apO9WQHts6/gwz/9D0JbG+jPddZwvW4Kev61u7hZ1rXY14pJTALH9tcyp6Qf?=
 =?us-ascii?Q?rG6aFGbu3UY241qkq3HHsyuhneA0QN4j1tc4idgCZud/n0kwm0LsMoMyVVnc?=
 =?us-ascii?Q?LWenVypdYD88dxwT/FLZ8AG+FwxYQFbvGZqmouEs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844e7725-5ccf-44bf-c0c6-08dda933ff64
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 22:04:53.9369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7bQpNjH0qzTIfq+Bj2OyEriIXfK68oi0J8kYbMdyGEiVRHyyYIY6l6nOpeTbhJP6pPgF3BrOrNqetWlJCZD0101iT/AnkUH9BcgtUjPSoMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4771
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of John.C=
.Harrison@Intel.com
Sent: Wednesday, June 11, 2025 2:06 PM
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Harrison, John C <john.c.harrison@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
>=20
> From: John Harrison <John.C.Harrison@Intel.com>
>=20
> The GuC has an option to write log data via NPK. This is basically a
> magic IO address that GuC writes arbitrary data to and which can be
> logged by a suitable hardware logger. This can allow retrieval of the
> GuC log in hardware debug environments even when the system as a whole
> dies horribly.
>=20
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

So, this is basically a new modparam value that redirects GuC logs to
a specific IO address?  I take it guc_log_target =3D 2 is the default value=
, and
guc_log_target =3D 1 would print the logs to stdout, then?  I'd ask why we
use 0 as a default value and not just default to 2 all the time, but I thin=
k I
already know why (we need to guard against guc_log_target =3D 0 anyways
to prevent printing to stdin).

I also take it this is modified on boot by, for example, writing
"xe.guc_log_target=3D1" to CMDLINE_LINUX_DEFAULT as a part of the grub file=
.

Yeah, seems good.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc.c    | 4 ++++
>  drivers/gpu/drm/xe/xe_module.c | 4 ++++
>  drivers/gpu/drm/xe/xe_module.h | 1 +
>  3 files changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e16d19b44bcc..9c0e3113f7d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -35,6 +35,7 @@
>  #include "xe_guc_submit.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
> +#include "xe_module.h"
>  #include "xe_platform_types.h"
>  #include "xe_sriov.h"
>  #include "xe_uc.h"
> @@ -74,6 +75,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>  	else
>  		flags |=3D FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(le=
vel));
> =20
> +	if (xe_modparam.guc_log_target)
> +		flags |=3D FIELD_PREP(GUC_LOG_DESTINATION, xe_modparam.guc_log_target)=
;
> +
>  	return flags;
>  }
> =20
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_modul=
e.c
> index 1c4dfafbcd0b..fc8c681819b9 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -21,6 +21,7 @@
>  struct xe_modparam xe_modparam =3D {
>  	.probe_display =3D true,
>  	.guc_log_level =3D 3,
> +	.guc_log_target =3D 0,
>  	.force_probe =3D CONFIG_DRM_XE_FORCE_PROBE,
>  #ifdef CONFIG_PCI_IOV
>  	.max_vfs =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
> @@ -45,6 +46,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size =
(in MiB) - <0=3Ddisable-res
>  module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=3Ddisable=
, 1..5=3Denable with verbosity min..max)");
> =20
> +module_param_named(guc_log_target, xe_modparam.guc_log_target, int, 0600=
);
> +MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target (0=3Dmemor=
y [default], 1 =3D NPK, 2 =3D memory + NPK)");
> +
>  module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_pa=
th, charp, 0400);
>  MODULE_PARM_DESC(guc_firmware_path,
>  		 "GuC firmware path to use instead of the default one");
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_modul=
e.h
> index 5a3bfea8b7b4..4d978f6f26b6 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -14,6 +14,7 @@ struct xe_modparam {
>  	bool probe_display;
>  	u32 force_vram_bar_size;
>  	int guc_log_level;
> +	int guc_log_target;
>  	char *guc_firmware_path;
>  	char *huc_firmware_path;
>  	char *gsc_firmware_path;
> --=20
> 2.49.0
>=20
>=20
