Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623FCE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 19:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F00610E480;
	Tue, 14 Jan 2025 19:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKIaP2Ir";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62A110E47D
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 19:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736884616; x=1768420616;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EdIYy9aiYNJD7iCAXAog5r1+mQ27K1Jcce9fjBas9Ps=;
 b=MKIaP2IroRoEIGESGqA2yMEUqIZ1hENVj7pNP8Y0JF6zPXA0GPLU63nq
 MUGpn6aourGp8aq949jyDGmq4vJop8/RrUqME7KDTe5re/HEw96T4MPlD
 djeJ852GcbNHAa1uaeIWPcxagTxMDEfhAaLgf/iRQlqV1xS3BA/K9/4dq
 JycforGZaGp6A+2UtEnBEiSOVoZk5f0DsrkfS3QseIwM/xXROlkmIjCa9
 bM8Fs1ZcgJrZRxaYy2kmaoKAZE0d4Qc4C9WszfDBBxKAUq/DoJiT6wgua
 jP3QacwpLofSc7EpkiZFqcDnzU+6UTLOEShZSgu6szZ6CM+X3DGEAWN/f g==;
X-CSE-ConnectionGUID: WYZTdT/QR7axfZaIBcw/lw==
X-CSE-MsgGUID: Gm45MKa2Q8+MFaH5nUzInQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48585203"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="48585203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 11:56:56 -0800
X-CSE-ConnectionGUID: XjWckCNMSiWhXBvjU8DeeQ==
X-CSE-MsgGUID: bM3Trm5kQ2W70EmYgplmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="109898480"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 11:56:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 11:56:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 11:56:55 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 11:56:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuBT7X6lC+kcuhSngxAr9QeEosTGzZAicHdIh1wyzlG3fEa07hda/oWNuFCDMjSG/LiJCgKoBUgWQILzxbT+FL7ROM4fLIAASebAg0QcsF/2dTvSh4fhFz8X0bBHXuTdZub3NoZKVWTImwKQwjXYhb1izrOoAeA+UD92zrb0kMj4rhWcTNq/V+jU5elNim9wYbhtxbF8jTwQnrQzxWAAEvhPjJ3G2bTLBwcwXHmfZ3IkVRdufS2dWlwwsJYZR1AlsU3EaHlyI4ynUAVq1ziE+eOwZNK5aUIpBZA927jX/jYmbXkLqiyovouDVsAt/Jl/vxn0YC9m5sNEhq3Mk4VqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gua6sGzqfZGX3H2U22gmQyIwuKHRYXmFUvRhyNI3dZg=;
 b=paMcnVOyFGJ3JzdwYJIpyDHLZ/qzVgeMx9JjJH7fV01Md7u0yfWPdSMSssJRf1wo/xQo8NatH1wEirAHxbHfkKQb6iYPBuoo9PIfIgDdW0IJQfSeUrl64Br13QLbcqhlVYprNu2WnTwxIKhKXg1PrkECfOk2ABq1ptgFOSBoj+UqVkaGL2IUa5WJEO7ewitaHpvJzFpDCk2K4wBbQzPElmYWTjnLUmdHsOFiOwKBgG/e4slEqQe3t1T7xP3i5yI/OK7TEHZm/oRqOkUAwat+Qde2qIRGlkbxKx95xXMfcpw/pSWdANe8H2PfmCeQVXE7x4+dmkWb/2up3fvdkfDiMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 19:56:53 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 19:56:52 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/display: Unify display page table mapping
Thread-Topic: [PATCH 2/2] drm/xe/display: Unify display page table mapping
Thread-Index: AQHbZq5JJW6//i/TtUC9PWVZ7wym3bMWrmIw
Date: Tue, 14 Jan 2025 19:56:52 +0000
Message-ID: <CH0PR11MB544424D8F89D6E806E7FE09EE5182@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <20250114180403.896587-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250114180403.896587-2-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7431:EE_
x-ms-office365-filtering-correlation-id: 20945cf6-c182-4590-b2be-08dd34d59757
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?YnTp0nrQYqh6wAcb1QAbzkLVdqf83rzqnDpqoYgCzzYyQc7wgww9enJwX0pC?=
 =?us-ascii?Q?DnudF+qCc5vaSOo607jM0iYec7BWBDMlVYTQF3vHe5U5Msh8WHNjkETAmZ5q?=
 =?us-ascii?Q?3CCYAXPqmfoPiKyNzJznkjdrUDuQb4BDq61+4G79pJ3j+G7QXMzFl1Gn6W+Z?=
 =?us-ascii?Q?0Z6mvrvOh65tizMzUResgljXjmdn0ItVYDbBST9r9Hpq21RtJxPzIu1o1cMp?=
 =?us-ascii?Q?BoblGls+ZQautkuAkpU9O/TiKro2pgc4F3QFUmKrLmtPgpF274SE3/HFAOeI?=
 =?us-ascii?Q?VnMltQeobBlNavDLJ+87i/6RGHyOG2BALSdjKJjllmYBc86oYarMe3AbtbvG?=
 =?us-ascii?Q?5AlbioVV+15ZnUw7ymy+1ZFMWLqgLcAPNxcD20N/SqEJ9B3a/1T2UP8EIi8l?=
 =?us-ascii?Q?QZ0BF5L0NKQLsqqB1H2WVGGKP441KRLJ5l9xuH0o1DAmQtvKzTUZfGycWtsk?=
 =?us-ascii?Q?I7/ka1WQ3HVIr+w9yGmOiIJPdKlD/FbEJ1Fu2Whdh5n+CGGQmWBw1UYxsqdr?=
 =?us-ascii?Q?pWPrj4aKmA8a9w6HnikFkbyOws7nJBxYsiB0ntRjWip7BgMfE850S60VQhaX?=
 =?us-ascii?Q?Z9Vh0QX8ybbSp+4T3CdyUtqb+9COwt/VK3p6gRUYggSEgSVBqBzo9SzE/zlH?=
 =?us-ascii?Q?VD6bzu/5wZCGhwNQ5ZGXrDJxehi3MQYpJtNIk4ROw4P9hskY7KMe5EVngdgJ?=
 =?us-ascii?Q?tfnbdbRI9sLKnVHtZLbUDVFEPmEn6Xl+laVU0lzSHIC059grLLijBRKOD7VM?=
 =?us-ascii?Q?UC91tIl4NAaNPpEYqR0M62xQCH9P/8vt+qgMV9dO9Po6I+0uQfnoq2ASs8qD?=
 =?us-ascii?Q?LLQEFums2tw1L5VXmsTsHC7cvU47fWZ7uaF2qzHDwoEOP8QqwWVZvksKmsrb?=
 =?us-ascii?Q?4U79iQaCTrVs+chA9DL83y6VgJfsBDQhXXcExvn0u/w9PLJAoPMXMrK69TI+?=
 =?us-ascii?Q?CBGSCtQ3UdLirj/83M9JRqfVyuF56BGRz1AGJCJggaBRILlqy3Kng9P5nVGd?=
 =?us-ascii?Q?aVyB2ULWS2uZYRijB0IU90Mlv8Db2VrbI8e/wVC2NpIIhllc/bMBojo4LUL8?=
 =?us-ascii?Q?UD1y3zzxlsqDmXjtC1vKjpqwlwbCFH/D1f0v7Krz+Zhw7MzCD8X22sBOa66v?=
 =?us-ascii?Q?lfgZTNebzmRrPIa8NPvRyJ8PA5Kq2MgpTrbgQtrMYw7RSrOjAl3P+AjkBV9W?=
 =?us-ascii?Q?w0wMLrAGY29mB3JiD+OiYEvpBYB6qw1T4EouOBF4wv88QgXK6Hl/+yIqa67U?=
 =?us-ascii?Q?NhSWcTnhiN4anPUTcbSaVKV1R+siaiuezOdQjH0JpOJW4z0IovGummXhh3Fz?=
 =?us-ascii?Q?hLrzLRcAma6UUgUgeGbfn50/9zHo20mxGul1tyOqFhJwvgT8IZ4WX5uhwgyI?=
 =?us-ascii?Q?XjC93V+a0foxJO3j99iBgwFxMFOt206Ba3E+4/0l37hF5jOpo/dHi6ttSfiG?=
 =?us-ascii?Q?lDWTge57wdxsH2ZSnJaIofps+YlW33lw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z7zSOwghfTOMLKcPfn3YaiTH9lwuzno+qvRDqunAkGnbz+jfSvnxd3qBq8eq?=
 =?us-ascii?Q?ejXNUnhZ2R3TmxevuT+lHFdqe/ZG4aAxLEjgSojlofdAZzBlmAAaat3Vmppw?=
 =?us-ascii?Q?WiDKY6NNxEWTrDqR6w18MzfnumQ5Eln7iZwreOXdHpHQi+shrrjTUyR43AAW?=
 =?us-ascii?Q?SNlpo0NKSY/KEPChWRov05/an7QjjzO2ofqpFNvsjyVeuECAnznFEW+ISVVn?=
 =?us-ascii?Q?CYwkmKJgGw47MJ2nEGnAoL7XRTB6JMvhE32tXEHRSPWJV2mYdEmi0ha6A95W?=
 =?us-ascii?Q?Ua4mdtu9hvcPSMDD1haqqVyjmtCxH+HcxMtrJvZDiLlN4lj827ELC4kP1dBK?=
 =?us-ascii?Q?LTbovPc00SvwH3L9nTIe17Xjxk7xvI4ow8fMnonVPqwRKvicHipfJBzszLRm?=
 =?us-ascii?Q?xX360pqnJWKC3GYw879jP2pMHtjD2KUxaM3ZcxV9Vh1bnqjGprp16Jla20WI?=
 =?us-ascii?Q?NUfW6QpfN2uV1jpObV1F9ZSU7+sv+MqGwvk/wa1koj68a7T9XjcGnt4ZGvZl?=
 =?us-ascii?Q?AgpYILFDqTLa7OAjyoRA4/SYfAPVYVNwZW/sB79qyLCUrI5nZ27SvIK367Rw?=
 =?us-ascii?Q?eFNTKk/7ogNeV5d0kfPovBQ5KQzJjqJW+yLS4jQ6zDzYGxIlpsvzeHFO7p6U?=
 =?us-ascii?Q?JhIQNB7iD1IjAdYUi793kK0toWKYeDOWGY16QE0uJqLlBZrKRPxPgEYVSgsi?=
 =?us-ascii?Q?X4LV03TzMVVfYLhH4sjqGzgnuYg0HqSFywSla5yM9QdqqoBxhx7+z2sRrJKQ?=
 =?us-ascii?Q?d3Q6HTEoV7ULmoTsZW7u2MlMBmhPOpRr8j76lJ/d0kSN2GylW+aSXHv4vSMs?=
 =?us-ascii?Q?3fbCt/gTwUvQiqCqFwEshwcwxZZtzh5Z+5P7NwRmcgMQatRxE1fL0uNWy0J4?=
 =?us-ascii?Q?TCE4elnvTX2Efh6UoMovL58YixbSRlv9iQumvFUi+sG8eEOeOy3pnVHRj/t4?=
 =?us-ascii?Q?QI8x6MmWI9hQqvF41jRNlmyA0RBR6wpNGM5UvYNP+XgYIhU/0y/usHeioN6r?=
 =?us-ascii?Q?uf5sxf8CTjA39sADFlFRFfqozhd98lPcsVQsExYod2DKBYcva5BXX56upr69?=
 =?us-ascii?Q?g4BifmKlhE6RucWt/+DqvoMSYiCjP4qTRv5gooSPaxlmOlRo8Lic2hdZ+NBl?=
 =?us-ascii?Q?LB04dC+euZOUnYm1n01VbYIFFEeIvSp9jeWQBoDlR1fAnAsdUH40+SD1zMOb?=
 =?us-ascii?Q?AShxaJcdoxHfhEaLBWSU+ilgH1hTQzekw8qvHfum55BDqrCF2Y1TovV3ewon?=
 =?us-ascii?Q?x/KSC7b/JsEfI3Gq1cHgHVGRZTgSUGr0djxUCx9k/EGoJzLM6+NDxp09ohsv?=
 =?us-ascii?Q?12W8vK83D847viMWHJI2yEygY21cgSn1h+hILFOWJk6GsVExQlwdSwSwXxQC?=
 =?us-ascii?Q?/v2BmXGrdDpKidISJ8ZEKTRvjKzgCUCMLXo5cqFOIn5vNnXdGzPLfcrVMMPH?=
 =?us-ascii?Q?T9aMCKIDtPtMQOfJJ6req+zPKNU4q6E1hhtaul4N/gb/fQMFlFSaRXrTw7UC?=
 =?us-ascii?Q?ELwYQbS0i4wMzMHMb725+ZKhyuvEI042xVj5zDTgQ1tw/B5lW0iHBqyVDnXo?=
 =?us-ascii?Q?zIGfdYDTteBycJScs9X1St4xHIIbS0WSbaIiuGv+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20945cf6-c182-4590-b2be-08dd34d59757
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 19:56:52.8213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JT2i5HkYXc/EF6Moad7w7c92wk/LeqvQPHEJZgsdivhSo/k7DjsbNtZ0XtpNJx7QDfb4erc9hpyVGdqVbMOycLGRpX1uJpLtirO0O8ez6o4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Juha-P=
ekka Heikkila
Sent: Tuesday, January 14, 2025 10:04 AM
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 2/2] drm/xe/display: Unify display page table mapping
>=20
> Unify writing of remapped and straight DPTs. Take out writing of
> rotated DPT since Xe doesn't support any platform that does
> 90 degree rotated framebuffers.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

LGTM
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 141 +++++++++----------------
>  1 file changed, 48 insertions(+), 93 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index c28885316986..70322f28eee5 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -14,66 +14,44 @@
>  #include "xe_ggtt.h"
>  #include "xe_pm.h"
> =20
> -static void
> -write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,=
 u32 bo_ofs,
> -		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
> +static void encode_and_write_pte(struct xe_bo *bo, struct iosys_map *map=
,
> +				 u32 *ofs, u32 src_idx, struct xe_device *xe)
>  {
> -	struct xe_device *xe =3D xe_bo_device(bo);
>  	struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
> -	u32 column, row;
> -
> -	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially=
,
> -	 * by writing dpt/ggtt in a different order?
> -	 */
> -
> -	for (column =3D 0; column < width; column++) {
> -		u32 src_idx =3D src_stride * (height - 1) + column + bo_ofs;
> -
> -		for (row =3D 0; row < height; row++) {
> -			u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> -							      xe->pat.idx[XE_CACHE_NONE]);
> -
> -			iosys_map_wr(map, *dpt_ofs, u64, pte);
> -			*dpt_ofs +=3D 8;
> -			src_idx -=3D src_stride;
> -		}
> -
> -		/* The DE ignores the PTEs for the padding tiles */
> -		*dpt_ofs +=3D (dst_stride - height) * 8;
> -	}
> -
> -	/* Align to next page */
> -	*dpt_ofs =3D ALIGN(*dpt_ofs, 4096);
> +	u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> +					      xe->pat.idx[XE_CACHE_NONE]);
> +	iosys_map_wr(map, *ofs, u64, pte);
> +	*ofs +=3D 8;
>  }
> =20
> -static void
> -write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs=
,
> -		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
> -		   u32 dst_stride)
> +static void write_dpt(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_=
ofs,
> +		      const struct intel_remapped_plane_info *plane,
> +		      enum i915_gtt_view_type type)
>  {
>  	struct xe_device *xe =3D xe_bo_device(bo);
> -	struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
> -	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
> -		=3D ggtt->pt_ops->pte_encode_bo;
> -	u32 column, row;
> -
> -	for (row =3D 0; row < height; row++) {
> -		u32 src_idx =3D src_stride * row + bo_ofs;
> -
> -		for (column =3D 0; column < width; column++) {
> -			iosys_map_wr(map, *dpt_ofs, u64,
> -				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
> -				     xe->pat.idx[XE_CACHE_NONE]));
> -
> -			*dpt_ofs +=3D 8;
> -			src_idx++;
> +	const u32 dpt_even =3D (plane->dst_stride - plane->width) * 8;
> +	const u32 dest_width =3D plane->width;
> +	const u32 dest_height =3D plane->height;
> +	u32 src_idx;
> +
> +	for (u32 row =3D 0; row < dest_height; ++row) {
> +		for (u32 column =3D 0; column < dest_width; ++column) {
> +			switch (type) {
> +			case I915_GTT_VIEW_NORMAL:
> +				src_idx =3D plane->offset + column;
> +				break;
> +			case I915_GTT_VIEW_REMAPPED:
> +				src_idx =3D plane->offset +
> +					row * plane->src_stride + column;
> +				break;
> +			default:
> +				WARN(1, "Unsupported GTT view type: %d", type);
> +				return;
> +			}
> +			encode_and_write_pte(bo, map, dpt_ofs, src_idx, xe);
>  		}
> -
> -		/* The DE ignores the PTEs for the padding tiles */
> -		*dpt_ofs +=3D (dst_stride - width) * 8;
> +		*dpt_ofs +=3D dpt_even;
>  	}
> -
> -	/* Align to next page */
>  	*dpt_ofs =3D ALIGN(*dpt_ofs, 4096);
>  }
> =20
> @@ -125,59 +103,36 @@ static int __xe_pin_fb_vma_dpt(const struct intel_f=
ramebuffer *fb,
>  {
>  	struct xe_device *xe =3D to_xe_device(fb->base.dev);
>  	struct xe_tile *tile0 =3D xe_device_get_root_tile(xe);
> -	struct xe_ggtt *ggtt =3D tile0->mem.ggtt;
>  	struct drm_gem_object *obj =3D intel_fb_bo(&fb->base);
>  	struct xe_bo *bo =3D gem_to_xe_bo(obj), *dpt;
>  	u32 dpt_size, size =3D bo->ttm.base.size;
> +	const struct intel_remapped_plane_info *plane;
> +	u32 i, plane_count, dpt_ofs =3D 0;
> +	struct intel_remapped_plane_info normal_plane;
> =20
> -	if (view->type =3D=3D I915_GTT_VIEW_NORMAL)
> +	if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
>  		dpt_size =3D ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
> -	else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED)
> -		dpt_size =3D ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.rem=
apped) * 8,
> -				 XE_PAGE_SIZE);
> -	else
> -		/* display uses 4K tiles instead of bytes here, convert to entries.. *=
/
> -		dpt_size =3D ALIGN(intel_rotation_info_size(&view->rotated) * 8,
> +		normal_plane.offset =3D 0;
> +		normal_plane.width =3D size / XE_PAGE_SIZE;
> +		normal_plane.height =3D 1;
> +		normal_plane.src_stride =3D size / XE_PAGE_SIZE;
> +		normal_plane.dst_stride =3D size / XE_PAGE_SIZE;
> +		plane =3D &normal_plane;
> +		plane_count =3D 1;
> +	} else {
> +		dpt_size =3D ALIGN(intel_remapped_info_size(&view->remapped) * 8,
>  				 XE_PAGE_SIZE);
> +		plane =3D view->remapped.plane;
> +		plane_count =3D ARRAY_SIZE(view->remapped.plane);
> +	}
> =20
>  	dpt =3D xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
> =20
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
> =20
> -	if (view->type =3D=3D I915_GTT_VIEW_NORMAL) {
> -		u32 x;
> -
> -		for (x =3D 0; x < size / XE_PAGE_SIZE; x++) {
> -			u64 pte =3D ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
> -							      xe->pat.idx[XE_CACHE_NONE]);
> -
> -			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
> -		}
> -	} else if (view->type =3D=3D I915_GTT_VIEW_REMAPPED) {
> -		const struct intel_remapped_info *remap_info =3D &view->remapped;
> -		u32 i, dpt_ofs =3D 0;
> -
> -		for (i =3D 0; i < ARRAY_SIZE(remap_info->plane); i++)
> -			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
> -					   remap_info->plane[i].offset,
> -					   remap_info->plane[i].width,
> -					   remap_info->plane[i].height,
> -					   remap_info->plane[i].src_stride,
> -					   remap_info->plane[i].dst_stride);
> -
> -	} else {
> -		const struct intel_rotation_info *rot_info =3D &view->rotated;
> -		u32 i, dpt_ofs =3D 0;
> -
> -		for (i =3D 0; i < ARRAY_SIZE(rot_info->plane); i++)
> -			write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
> -					  rot_info->plane[i].offset,
> -					  rot_info->plane[i].width,
> -					  rot_info->plane[i].height,
> -					  rot_info->plane[i].src_stride,
> -					  rot_info->plane[i].dst_stride);
> -	}
> +	for (i =3D 0; i < plane_count; i++)
> +		write_dpt(bo, &dpt->vmap, &dpt_ofs, &plane[i], view->type);
> =20
>  	vma->dpt =3D dpt;
>  	vma->node =3D dpt->ggtt_node[tile0->id];
> --=20
> 2.45.2
>=20
>=20
