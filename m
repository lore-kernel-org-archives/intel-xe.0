Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9899CC02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 11:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6E310E4F9;
	Mon, 10 Feb 2025 11:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7KPjyJu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A21A10E4EF
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 11:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739185255; x=1770721255;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uLVKdxmaqV3BrUmFJcY8pkPT55yQv234Jvb/Ou8K+XI=;
 b=f7KPjyJuIYGNa5NNr8fQjHMeXPX6KrCkbodBiQHBpSoeQT3XXWvrfx8E
 ++Fw8KnyXfGdiHo+zshGnrO4pcsaEfljT93cUKggPKvjJFjmEeurAfMhF
 +Z8oR2rMFpCy4PTGyar0Z4eqB5a6/2xkOhs/fuR49uj7NAkK6puU6Lhxj
 5d6rrs80/iTfJT0AreXhRsIXkNBlQVH+yxk6zU5DxhUWPc5hLq2ACaanZ
 /FFGy4lPMwioKQSNUcUIFxrmq4qo5PrOrAYySmc9HvUoaYyt7hdsapsFc
 gTNY3UJTgrAhWCHvnoOUt3ptI6mKJajUd3vISqB0AZZvWd0l7SS7sobcu A==;
X-CSE-ConnectionGUID: zaIuRcr5TJirIVtkT5ikfQ==
X-CSE-MsgGUID: u9wf0bi5Qs2cruoAuvVcjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="62235278"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="62235278"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 03:00:54 -0800
X-CSE-ConnectionGUID: yw8DF0ZhSWWCR1KOE18n8A==
X-CSE-MsgGUID: gyXxMJuzQQO3/lZVs0oL8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135404428"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 03:00:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 03:00:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 03:00:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 03:00:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgRrDDkIP8pLqInvVgFRC0uq6AAXXV8RZixkIK+xHOg4pIY2iMfYRYldfFW5+5GhB37p3g4zngHSBjqNX9vJK5QgsNDDq1fJbcYz6oMiT/n2Vn3AeSuiD/hEuMMumYvLq9g2ni7yqhm8nB7Z+0DJi+4P0eId/WIgE/4gUh2G+iT/1AMOoSekoJ4u/GhoYRiWCkPhbiY9flsQ16m70zdGXu9H+D3JCa4vMzr1lZlzIKDg/bsU+cY4Z1/4lAEDwMbc44amuIlD0JosNfUbAxADZfoCO6kRahDMg+X1lUmNTFUUCubPAJ77xKBecXEwcGx4dkH6abuhdLS+J8RJcwhqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyreYJykfyM+NyV9JUkn7+8HJU8qsBq7gOVugVP7e4k=;
 b=wtrAKtFlrkUIqoXhN54mAKAQPBp0/la14ZFW+1Bvntx+voKaIKPfIcgMWU5pcZqqdNW/uDLwuhm+z+XFYwSvjZ3CYrEUMRjnXjQlBTI5bdMkcwWnUF7+1ysN39l9wrs6uCeb1MJlkd7za8j+DY1OWG/DY+lClHxp6wuz+NdFxIJNFwa2NIZwrx3B9s1/CTW3TRV9hf1bmCI2F917YwsetIB9wTHUh2TMGu4DmORh/qiQDJx6G2/HHob5dScGlgWCkvPnnrZArUEmN9mC+/VTCPkgboOdP6APyl9vLWxnSn6A6MHB0gGpwVE9eXTIElyJkrLNdij8ZuJEgI71j6XmxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by MW4PR11MB6811.namprd11.prod.outlook.com (2603:10b6:303:208::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 11:00:06 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 11:00:06 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v2] drm/xe: Add stats for vma page faults
Thread-Topic: [PATCH v2] drm/xe: Add stats for vma page faults
Thread-Index: AQHbeJ2WvsGPmaATd0yhecdrpVTblrNAZIIw
Date: Mon, 10 Feb 2025 11:00:06 +0000
Message-ID: <LV3PR11MB8695EEAD555C33226658CD1BF9F22@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250206134551.1321265-1-francois.dugast@intel.com>
In-Reply-To: <20250206134551.1321265-1-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|MW4PR11MB6811:EE_
x-ms-office365-filtering-correlation-id: c398e8a5-9037-4df0-8a15-08dd49c213cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DPlpxGFTWFz4UC9V+nXS8p+NPKyfvxH2W6rafLlvzqFksdcdTrDQu3kNUN/l?=
 =?us-ascii?Q?icF9d2ok8goBXIS6Ap6fR5uS2FmQIKoGcb+nedii68W6+29QEYa1E8IERCVz?=
 =?us-ascii?Q?H8UlwxXNnvaSq23pzCGl2uOBUtyXKzDBgsFH+maU2NgmzhXN5VyBfl5LiRxb?=
 =?us-ascii?Q?x8XLlS1HmJwZ5p3vboM6o9+WcEFpAgMeAnfdnu+Er/NMX1/j3bV794RKi1bD?=
 =?us-ascii?Q?GwdO3FSEKCC1qHnLzr+EjH75tN5OCSdd4hF/eoUPqAiGqKmPJLTGRxo30EzQ?=
 =?us-ascii?Q?NAKy/ZENEiD/syN8HCWRib9J9LP7CBHgfR3/jux89bLWUtbnaUSuonH4Kx6l?=
 =?us-ascii?Q?PtKg6YtoPyO7r+Qf8j1pjW7stqLbkaQDu/r/cKIQTL7KVzaoJweV53RCZrXy?=
 =?us-ascii?Q?3DpNiRKkdoiaHSLZ2fX9gQ9zjUAAkP83FyhbZscQMMv3dp1ah4wj9IQZ4aoB?=
 =?us-ascii?Q?LDkRY427ALeNeXruC14lwvu4BJeXpyJo1AFny/JcBZxnc5WpWpGHSLZulBBR?=
 =?us-ascii?Q?9LrMCPZ/SzPZn6qFv8R9IKTSLiOWZlk2dahnuz30wPnjxNxFr3Fwm7y1Q7Sy?=
 =?us-ascii?Q?mX/Xow0r8D8ID5caB4U+8xlYcsD3xHpebYqlcQON/yx4T25RV86ByImm3Jva?=
 =?us-ascii?Q?6z5cz3ixg7aenzy0PLLGIZ5HiDOQU+PQzrSFud2aH0gYsJpZoBHpdmKatZly?=
 =?us-ascii?Q?RbtKaQFi+n0qztSf89Us9uUvSU3RTbnq3RXtQjmNvpINoDfgFsYm53g5M4WG?=
 =?us-ascii?Q?zHg2XzBrdMjBs9FHeeEUnXE+aTSQRFrOHd/w5xErnW5YIP11XQggoMY6vqdj?=
 =?us-ascii?Q?ZjJgbWmAxg7Y+PQYdRDgwiU+kIpCkwp1ugtCL4Isy+vKNb8J7kFq/zfLAdVV?=
 =?us-ascii?Q?ynfBb8ytzVu5ED/ryMGNY//8ScuEUvpAVEdkZRoSJFgW9GfrCzGUFI4mWgQ3?=
 =?us-ascii?Q?eyMM4aH9Z0nUknU7IjSIhxNbdXRQ7aSbJzA7t5+EFMb22kjFBXaX0iMkBUvr?=
 =?us-ascii?Q?Xefd+/jsXVf+WoHZPwjuhIAwWw5k3j6IVZRVlJe/AmK4lP9aA29GBiP/ZP1t?=
 =?us-ascii?Q?bO1U2InfH0Kv2Hz+CxICdoTu7saAFvl6V7Wk/CSSW9hsNVbYKnxX7BAxT9R2?=
 =?us-ascii?Q?4vi3r8nxabcqn2S16RW1GNyFQJoeBP1iOqaaUyyDt+DW8jJuIgAGTwfkKfVk?=
 =?us-ascii?Q?DedZO6RvJgqc/eQ2thX3So9xtGoZ83vJ7XtcQz63wgj/X2PMl/zG3QH53fmt?=
 =?us-ascii?Q?KvyHuPYHxZtj/UnCuh26GxPKSODnLhqidd3tRwNley40Kuq5hb1uMS+JQT3c?=
 =?us-ascii?Q?1jZp+jy0CgHlbcL1pg0Wk1zzetYtMOHFxKmVO+iT+cbQyi7XQIKrkjcpbQ4l?=
 =?us-ascii?Q?bDH84iqLnDGS/tJ6Y4S4lZfS9VLdKQXKhN7oe+2y9D4qIktbfnssCoCU4ORv?=
 =?us-ascii?Q?xgwFdBeFma5o2Cajur4WHut6tIGAe9Pr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v2vdX0YhI39wud7m7dtp0bAxNIuBlW8vjfMhwp36WZFc0pbk1CURy+9dIciv?=
 =?us-ascii?Q?FKybrMcQ3UQ5ev68Iaxo9xJQ0EjgMWCgLYJT18REM8aam9u9ydCtHBd0sHIF?=
 =?us-ascii?Q?F25ptGXo0wiLTxpAbTG1UGQZszqZQBZkygZnoQc6GmX5bPs7GzjfdIPVKIlH?=
 =?us-ascii?Q?SEL7hraGbMtXu0NnTvKCdJ5a9LQHBK/d/6NiGC7iS0tUWQDOTeh5L2ae7Dcp?=
 =?us-ascii?Q?R5jaA9yEIQhWRD7AfTpDA7rq+D84N7Ur7nxjUIMSVjF5+qYjuFOhDzYs5aoP?=
 =?us-ascii?Q?A/a/Uasf/RNoy/iDMzE+28gOkBz6HqpSuiXp6TdRfeHae119gL4QTgLuMP1Q?=
 =?us-ascii?Q?j4DlsAoIiJ9npL7KZGxrpBCBZHTkvL+gnrOK7rVu4Jy0dQ+FzzWWyQ4i/Up3?=
 =?us-ascii?Q?tykMVHnyuSaXnunXYKzKZJ7/zU/dgCQULmJA8LxysQn1FEZHiYq+V0SGF1YT?=
 =?us-ascii?Q?rlRXiCyiUW7u8hIUJaLsPZsCw4mP3HIOStsAcVC3RHM1/4D7YFjqTDYened/?=
 =?us-ascii?Q?b8UnnccHwYGsS1LSpRmYwosr8ajdDiypnEhuGN10zNCLd/iqEIiRK6RvBnxn?=
 =?us-ascii?Q?Rkrjr/9lpyyHfop6k8mwjrkl0kT2Rqiww7DV6SV0j1Fqq7yqkYAQE3Hcsd6+?=
 =?us-ascii?Q?MqJuRXEFr3QWb7DuPfJTvmgiILVxv4/kgAphPwvvQ+fXcuRJPrw7ttuymKAS?=
 =?us-ascii?Q?gJEc3Rm/MMdnZIm8WmfxL9njtjFj7motFSX8rEcICT3k1Nk1eVaI1UGT234Y?=
 =?us-ascii?Q?q9c0cgZu8QT1mCyPNPwZRHRhzLWx9mM1E8Da9GhrLNZqCIu/bAjWreR7GvRu?=
 =?us-ascii?Q?6yXIaljencfSMM4OegEsh3Ageh1JBFrEXo30sSNPmgFrUJcabxUxaYmH3wW5?=
 =?us-ascii?Q?QKiN9FGMXnyRW/ebZx4I/5PIsSfQVs2cOfXTTa0fbiKvnEwet0TFDWXeBQkQ?=
 =?us-ascii?Q?jBm9oiXkWqoIW2zyLWLXe+WcGBYsHfOHyztArSJDYbEkVpS0NRW0l2WlSXcy?=
 =?us-ascii?Q?lsNRa06KsuQ4CUpQ9NRjbFT8sy+oDcveZR3/WrX3FHwo9KtaNGDGHaFYEazK?=
 =?us-ascii?Q?OshueH4YtlWOdxEwLtbaudRIyD0alPzDOoNEvBpRqsPo7100MLLDJkRfig7a?=
 =?us-ascii?Q?MqBCmnsrshv+i4igx1CKDaDvRVl3jDOIF0ZRUjfUh9isIJUk/wn+NArw8OqT?=
 =?us-ascii?Q?JDbHxuIyErrnj4skNkrhfcIwG0AEH13H2flOlVkdnV2Oyuzn+NkuceqHX0Dd?=
 =?us-ascii?Q?UYUmTq2URRGkTUaj0NWrGZXFDsxdRNxTMharqfpg0bZjn8CYbS4K5KLryr8i?=
 =?us-ascii?Q?SI2j//vrREThQKfEkj8fpXD3jOJxjPguqJ16S0bXkbHKFdWyiVYSQodJWCob?=
 =?us-ascii?Q?ajDlv+P6BefiolwHmp7SDzfnmI3SezFjKzFAcHjmmCo2l0IQ2yIuVYD8A8t5?=
 =?us-ascii?Q?i/Nvpbo0zcI+4VdrqkPgkTGEEFdvrg8zmcuonl8BhORDFEdumSqTlfIaijSJ?=
 =?us-ascii?Q?1VL/OSaxwRj8DW6TT8OCCF0UlM47EwDMiNwXZ+FDbmhAZrKYxdc2Fh2yOtWC?=
 =?us-ascii?Q?9JhvhoNGtMl+MlBJHX9kZrOVIgBmycXKdBlKluY8jpaGCG8PptRQ33Jj6Y6P?=
 =?us-ascii?Q?pw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c398e8a5-9037-4df0-8a15-08dd49c213cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 11:00:06.0963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vaIpWe+DgFcy6/oz6k1BRQf1tlGTTKxhIi1IEsxO2NP9M3cWqWjTb1sWMNHL9/wBu0d0lVxm213nJ1IwefLaaYZADDKjh05nAFIUwlzd//E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6811
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

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Fran=
cois
> Dugast
> Sent: Thursday, February 6, 2025 7:16 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Dugast, Francois <francois.dugast@intel.com>
> Subject: [PATCH v2] drm/xe: Add stats for vma page faults
>=20
> Add new entries in stats for vma page faults. If CONFIG_DEBUG_FS is
> enabled, the count and number of bytes can be viewed per GT in the
> stat debugfs file. This helps when testing, to confirm page faults
> have been triggered as expected. It also helps when looking at the
> performance impact of page faults. Data is simply collected when
> entering the page fault handler so there is no indication whether
> it completed successfully, with or without retries, etc.
>=20
> Example output:
>=20
>     cat /sys/kernel/debug/dri/0/gt0/stats
>     tlb_inval_count: 129
>     vma_pagefault_count: 12
>     vma_pagefault_bytes: 98304
>=20
> v2: Rebase
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c   | 10 +++++++---
>  drivers/gpu/drm/xe/xe_gt_stats.c       |  2 ++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h |  2 ++
>  3 files changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index cb92fb5cbc75..46701ca11ce0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -14,6 +14,7 @@
>  #include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> +#include "xe_gt_stats.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> @@ -124,16 +125,20 @@ static int xe_pf_begin(struct drm_exec *exec, struc=
t
> xe_vma *vma,
>  	return 0;
>  }
>=20
> -static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *=
pf,
> +static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
>  				struct xe_vma *vma)
>  {
>  	struct xe_vm *vm =3D xe_vma_vm(vma);
> +	struct xe_tile *tile =3D gt_to_tile(gt);
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	ktime_t end =3D 0;
>  	int err;
>  	bool atomic;
>=20
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES,
> xe_vma_size(vma));
> +
>  	trace_xe_vma_pagefault(vma);
>  	atomic =3D access_is_atomic(pf->access_type);
>=20
> @@ -202,7 +207,6 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe,
> u32 asid)
>  static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  {
>  	struct xe_device *xe =3D gt_to_xe(gt);
> -	struct xe_tile *tile =3D gt_to_tile(gt);
>  	struct xe_vm *vm;
>  	struct xe_vma *vma =3D NULL;
>  	int err;
> @@ -231,7 +235,7 @@ static int handle_pagefault(struct xe_gt *gt, struct
> pagefault *pf)
>  		goto unlock_vm;
>  	}
>=20
> -	err =3D handle_vma_pagefault(tile, pf, vma);
> +	err =3D handle_vma_pagefault(gt, pf, vma);
>=20
>  unlock_vm:
>  	if (!err)
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c
> b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 7a6c1d808e41..2e9879ea4674 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -28,6 +28,8 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum
> xe_gt_stats_id id, int incr)
>=20
>  static const char *const stat_description[__XE_GT_STATS_NUM_IDS] =3D {
>  	"tlb_inval_count",
> +	"vma_pagefault_count",
> +	"vma_pagefault_bytes",
>  };
>=20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index 2fc055e39f27..b072bd80c4b9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -8,6 +8,8 @@
>=20
>  enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_TLB_INVAL,
> +	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
> +	XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES,
>  	/* must be the last entry */
>  	__XE_GT_STATS_NUM_IDS,
>  };
> --
> 2.43.0

