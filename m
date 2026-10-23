Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEC4606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YB40wNYA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C1310E1E9;
	Fri, 23 Oct 2026 14:24:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE457112B8C
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 14:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792765445; x=1824301445;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t3BiijKEcNqzRXEljVKMMCkaFZh4U5RCcwjiDN68uCs=;
 b=YB40wNYAOTzcMCHKHpyfi1CNxbfck7hjHziSmm9Iouqek/g2hTM2ahiq
 JJduTf4fKZ9u7yXZA3+ZlYI9ytJWDiYO+v3o3hWTKZfQSVihpRHHedLbp
 mU3iETgCCgHfeXPe7Z4qqkLHPNkkMsDVct9UcoedvbHXGxt2Gd3DeJjEI
 /7AVXT/m6Go/Bg8p1QFhBOmGuY/EqfNiOMrPwOXtJs7pKA3Phz6LGz1rD
 o9KHRVBvrt9EWe5qTuk1wj5iLDiwiFaBHqqa+OtCzmclC1Eku9F6wfpEP
 YZS8VrxRxncnghGnsEijAh3sTZMkZUumjAM1wVOhRHwN57otmrX+lX5hD Q==;
X-CSE-ConnectionGUID: s/gfna/dR8W8a7B1nLNYnQ==
X-CSE-MsgGUID: r0Ig273NTfCUSH1OrwHmIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1411576"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1411576"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 07:24:04 -0700
X-CSE-ConnectionGUID: MCwp/oacQ+W9YB/SsMOi+g==
X-CSE-MsgGUID: cZHvTEfsRrudoS6LTgOZmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3599602"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 07:24:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 07:24:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 07:24:03 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 07:24:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6+C2y6+eynpGyTjgsDuyXjtCDHycNwkbEzgZjF6qG2ljfVFQOdLcfWqBLBEtbLWSf7d2bWYs4w/xFYlmmElg9qgKgPntW5nh3nUVKhPx3bg0+S7Ir/ZroMel3unupy8qrAzDq5EY9bAdKHuTqYpwGC9OZPtcckkdVONaKyan7wCIMjdMwXD7KP0j/qaJZOeslq2b/gmo7YFF7jaZgpyFSUeH+xkWtMDZ1QFWMzK4upSJaOqfarrWbnZcqa7XH/uUmYFinLbKr14hc2LUNspt/l7FZgv3ppHRonpqFMlF3NIVmXTfscKX0zXnPfaHHpeiksyM9/aB/s8NHjjlo/K2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Edf/LwPQza8/6sLQOJDnHA9s2RgqlOVLJv4B8eMT3UE=;
 b=gpYekcBy1pXt1oL7Yt/VCF9DpQYY5mu42KtVZiOuDwtXMUCUZXLeyfu3rj99pgE0rrlZf948vA5j431sGEah0UEAFKSjQmqPZRhQyVJL04Bm7dxDvdEhJOfZPvzucIHtGRSgmyZNYoDSsKaDvW1v50IKQDXT/pXmJU3IKrCnXHkOeQGH7FQdde/3SnFyyoc571pbJ3CSbTfHYDDpHFcovgTzUbShud3LRyg8fYpf4A9kD9HtKMvCw+oLi9Spy8gxbskJXOrfFVL2EHN0qw9Yo3TrpyMoxzPu4D+iueXWWVje5gefUhm8qOXYDySdMkxhHO5sz6NACfpcE2QEdECWjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by CO1PR11MB4915.namprd11.prod.outlook.com (2603:10b6:303:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Fri, 23 Oct
 2026 14:23:57 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 14:23:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Don't ask for bug reports on force probed
 platforms
Thread-Topic: [PATCH] drm/xe: Don't ask for bug reports on force probed
 platforms
Thread-Index: AQHdYm8NYILs2hyq9kymtFi2IX+XPbcLLucw
Date: Fri, 23 Oct 2026 14:23:56 +0000
Message-ID: <CH0PR11MB5395B4DD55C87A82BB63C377E5642@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261022214742.3723842-2-rodrigo.vivi@intel.com>
In-Reply-To: <20261022214742.3723842-2-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|CO1PR11MB4915:EE_
x-ms-office365-filtering-correlation-id: 90c7de87-08fb-4b44-1511-08df311145ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|23010399003|22082099003|10067099003|18002099003|261021135927099003|261021130227099003|261021121427099003|261022115727099003|261022113327099003|261021123027099003|11063799006|261009223027099003|261021133027099003|38070700021|261022105027099003|261022075727099003|56012099006;
x-microsoft-antispam-message-info: EL7cRiY2rg09IAQgbHdGeCpqkXGwWRgqmbnJIxTxropDqNg8sZI0i4shfx+MtO3kLlXSJN8P24Q0YWo0O9m4LLoEmcvNGr/TvV55xVt6Ay6uXn5sqUhQ0BhHvHut+Sc+ZM4Hc/GnpfOhI75YuP8bQt3i4xVoXIlG8QjDuyU6L9ehCZPpiVCjCANReUd0zDSsg3fnHcnISTUQrM84vNbfF+ZA1cz/cYqsMRCcfu44h8tLmLzDds5htmE3n3yvctU5Lka23Fqi1HUMnCmLuy5zbs8fHnC3mgKEjYijS8qCBCxclflsuo5N8xBsW6oUPKh0omu3SYZjH2xDxjo4vssm2qN8X3B095FMrbGfS5ribA83tQIyIYEZM/Y4O7vDqybl5MMZyr8dyZKwt7dHjSdYC9+IZ1N77V/rAVb38gjHIRPtZ1l1R4dHJZQYk8T3JRcwTvbI764fvxe5uossuC0cHgG8wNbG9DJY9Mhx3m0xneyy5TqkCL0fz8Q+YqyvGDxukFpB/5+iU+k6Lk5kBpsqabmyL5UDyjY0uHSmx/Ov7o9I0s24p4+k1ufgVwA6k5ack7Gzj/0IkNDKUhtT3vyMlHTugOchRWSKajHUdBerAAO3wOerXZ76EaaZDGljZ9SFcY7cIcQvsyLP22Bam6skvOSJakWJG8Lkdoq83jrIVpTy1yQCHUkqH7kG48LsgZW0IKmzIrJ3MNviYIPEGrFE1K4GhWlHJDLV5fDSqOSQjBE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(23010399003)(22082099003)(10067099003)(18002099003)(261021135927099003)(261021130227099003)(261021121427099003)(261022115727099003)(261022113327099003)(261021123027099003)(11063799006)(261009223027099003)(261021133027099003)(38070700021)(261022105027099003)(261022075727099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pUuEHO90dLChCHv/Q46pKc6JVMtCoFLHqrNqEYBMsJSqOqW9YQhFRieHv9SJ?=
 =?us-ascii?Q?FlpzRbgle63rGBVMrbikcry1bbK+pjs94b+UaniOr3dQYLcxPVH0I4kiI3rn?=
 =?us-ascii?Q?mU2X0MsbUNuIM6j5guS/SbieoXOI8uouMeY86qJHXXhtOqla1BVij4JL2Aq8?=
 =?us-ascii?Q?hIA+xnA+7lXSpGKU3PSrpV76cx1f5R9AVunSiW2l3BMpAAzRakCOL6jd7UbX?=
 =?us-ascii?Q?US0G2t+njjxAvfgP57gq8Dszmtlevgj2IioMqpUSvUmvgLip2xiIk81yy3v2?=
 =?us-ascii?Q?Plj/3hZOle8MttJ13A87RAjyQMbuWIIUD/5arHKlkOEdbas9mASqP2K1Yvq9?=
 =?us-ascii?Q?2NMrV3+tyyDyANKGqKt4kzSP6nIIh9DTMjlx90rEKP3wlQWu7+AIUVNtD4wL?=
 =?us-ascii?Q?fYaMssxQS+NRZ5B55Ef67lI6iG0Q3JWaopabnHj57SOYBrHzkeBg6b8aadFT?=
 =?us-ascii?Q?BQHihUDdvMdD/SVT5JZDmZG0PEuwtQuiyi9rRTYaqD1+aCJ+unNUCdwhAqMy?=
 =?us-ascii?Q?A4vh+9AiXQom+Rs6GJleyRsy77xkdC32CwUBK5Z3XNDUNKFLdlHcwLLTdkpA?=
 =?us-ascii?Q?vf/NomBDX4b7UbgFPioRHa4mkOirzidgbX0sGpe7qJg+QQlmF727urHEsl4E?=
 =?us-ascii?Q?25dMxi/NTEWxaL7YplxgtLIx70Sc3YdKO8sscIhAw2SXvsKNyiaegB8yNGvM?=
 =?us-ascii?Q?S7BYOtbH4iJlqfxWyp9YWIK6d8ZaNJ6qBJyxSXZ0l/1AVFD0BZEVDtHi3A5J?=
 =?us-ascii?Q?m/QKxbDQI1aZcnIzAx0XM+DV7IoqDUdshbs18pC85wHNO+/H8N9Lmcio7ZX/?=
 =?us-ascii?Q?l72s0QHy5jIYis/XGEcRpJwl6gNQ1SMc7VeU6bscthoE3353U44BQGJuhJ8j?=
 =?us-ascii?Q?gsk8P/VHk8yF6piAGSVtd41GG+UEqC3xIrQNpnYGwy6hSgNygL9uFPFTB/4u?=
 =?us-ascii?Q?EZ4UIMxXhEtvas/rsnD5lsBW9ESz2F8gR8ymFE8onBXZuGrfBrjwR3l6ZVY6?=
 =?us-ascii?Q?hfYp7ft7K+Kas9BNwIVSiKY1R4Con6sPCA+AtZSfefQbwPBtNXsyDKDkuZC8?=
 =?us-ascii?Q?+f2KIdtp9HppUL2dQsioHGNN/DxcfJBuXuFencJ0ye3luYingwODdVYi69FZ?=
 =?us-ascii?Q?xMCBB1SR+Zg/OPVzp7js/UQkq/3ptCg3POaF4rA18qn2VsRCorV9gJ9ROHIr?=
 =?us-ascii?Q?UdQ347c5G5AaxSl7am3r1lFU8vrec1TPYoYuOdxlnfI6MPmSG2Wu3By3fb6Y?=
 =?us-ascii?Q?eWrhP5tG6ueeZW2ZY9lzwGLorpv7i3TyyJyZDqvWbS0gdz3aqi+6PxKGoGAo?=
 =?us-ascii?Q?KOGPWhHx4KanIKXc4z+k8pP6XEbGaxyFo1pP1NFAkKeRXLS3WA56QFvZzXr7?=
 =?us-ascii?Q?hnGZwobMa45yMJh3263BsWZ7XpsDpLu/5pn1UALvKfosFCB1BP50UXC6j1vR?=
 =?us-ascii?Q?ncusU3sixwLU0oxAPhm7nlk/8n8P82p194bdXLGPu9xJQu1r1dMrgihye0e7?=
 =?us-ascii?Q?84DGdLzvC8rfE983emdX7Ony9eMiMA/F8u+KaVf2dPVpCZkAITSgZqTRkwWr?=
 =?us-ascii?Q?qFji4/ShwTbmm/dgvc8lLKLVTV/vZ/uVc+WC3HWuHV0NrO67R0NDcOFP/g4c?=
 =?us-ascii?Q?KIQV5dt7rQI3ErdjsKhzCGLvvzhOM6DHg7hdAUyn4z4lluvxSEci5uJRYBD2?=
 =?us-ascii?Q?DqXECksbAuzRE7BioldbCcbYrWd47wiMVpTk9pQ11tGs1DhlSImmABZIye/o?=
 =?us-ascii?Q?irCfCFTvgrIg+Iq44a6V0PqKGdB213C8sXEnE/96afMdci/h51uRR4Goirtm?=
x-ms-exchange-antispam-messagedata-1: H/i6i2ZweAenCQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 3uo+bb7x9ZDFLa8l0KxcJILL2wPoK8ai6dfFrmwznUEUR3ZnBW+e39mKMbejh23mqk3AFGWxM5R2klXr8fB9/yv9oSA0e/1gGNiqYQVLvO6qolObWXdTnkgDWkSqnBzRz6mp5aZR/lf5LYT6bXjZAvOqtBHDwf4M7qcE5mU17PO5wNs/ehq387CVl8ltuw9pKfhCxGb902iNylsD+W+g7H8ZPCuN5uS6F2oDm4LuD9abHd7j2oUDxHUyKmWDSZKJgyOFs6WrZPW1KwRnpNoXeli2csPUy2gm8udMZgWkcbIyGPzShgvRpy/zFDuyrWvDNUgLGNzPZHVv6ZWF6cTMrQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c7de87-08fb-4b44-1511-08df311145ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 14:23:56.6881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +3Mmkh7shzSYSA1/QWW9flSqojhKWZjfO8OXPsOtVHsVQBsDBcLL2fMw4RIbZ4LLnQd1cZZQV2U8kvHCeGDD2/GYg0++Jl3UQHWsCZwXjNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
Sent: Thursday, October 22, 2026 2:48 PM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Nikula, Jani <jani.nikula@intel=
.com>
Subject: [PATCH] drm/xe: Don't ask for bug reports on force probed platform=
s
>=20
> Platforms that require force_probe are not yet officially supported,
> and users enabling them do so at their own risk. Only point to the
> issue tracker when a device gets wedged on supported platforms.

Drop "yet" from the commit message, but otherwise this is:

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

... You can probably just do that at merge time, so a resubmit isn't necess=
ary.
-Jonathan Cavitt

>=20
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Assisted-by: LLM
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 1 +
>  drivers/gpu/drm/xe/xe_wedge.c        | 8 +++++---
>  3 files changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 6a6f9a24365c..a318aa5f363c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -236,6 +236,8 @@ struct xe_device {
>  		 * state the firmware or bootloader left it in.
>  		 */
>  		u8 probe_display:1;
> +		/** @info.require_force_probe: platform requires force_probe */
> +		u8 require_force_probe:1;
>  		/** @info.skip_guc_pc: Skip GuC based PM feature init */
>  		u8 skip_guc_pc:1;
>  		/** @info.skip_pcode: skip access to PCODE uC */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 0c13eb901aa7..99f6c379f334 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -824,6 +824,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  		desc->has_sriov;
>  	xe->info.has_sysctrl =3D desc->has_sysctrl;
>  	xe->info.has_temp_sentinel =3D desc->has_temp_sentinel;
> +	xe->info.require_force_probe =3D desc->require_force_probe;
>  	xe->info.skip_guc_pc =3D desc->skip_guc_pc;
>  	xe->info.skip_pcode =3D desc->skip_pcode;
>  	xe->info.needs_scratch =3D desc->needs_scratch;
> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.=
c
> index 2f35937c5e66..0bc0a4ffc594 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -105,9 +105,11 @@ void xe_wedge_declare(struct xe_device *xe, unsigned=
 long method)
> =20
>  	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
>  	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> -			"For recovery procedure, refer to %s\n"
> -			"Please file a _new_ bug report at %s\n",
> -			WEDGED_URL, XE_BUG_URL);
> +			"For recovery procedure, refer to %s\n",
> +			WEDGED_URL);
> +	if (!xe->info.require_force_probe)
> +		xe_err_once(xe, "Please file a _new_ bug report at %s\n",
> +			    XE_BUG_URL);
> =20
>  	for_each_initialized_gt(gt, xe, id)
>  		xe_gt_wedge_declare(gt);
> --=20
> 2.55.0
>=20
>=20
