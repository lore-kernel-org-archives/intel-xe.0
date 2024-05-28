Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F14C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 21:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90A11127C5;
	Tue, 28 May 2024 21:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ic86NiOA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AF41127C5
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 21:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716931717; x=1748467717;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CHruNrvY6Zs9eudqe+oT/Vom086V/QxqiNH26iEYUxI=;
 b=Ic86NiOA0Bl453iaRL1hyC73cU5+zWEWht/+oi9PCU1taiGZYqBtbTeX
 z1Ug1zVvenaI2Tld+ED3DtOeQywHYAc7j6AEbWCMMVd+nnZqinaoT7vgr
 MNCl/tSfZzIznNbNZpn/BA+JU9VIu92Gj1l1FT2c1HOIQsfLxL/aVeP9D
 /xFK3J3jPPpwS8npBjvlxULaI9jmWYCUSxgovDUGVpXtshrlqoJENAUov
 XKPb9+ZYc4DkXQ+1clrNktPjOhdHD8v8i9oigod3qMuDp9EBpJgR77JMc
 fDT5wmrEpW/bp3Q8DtIvCy/iZ/HNmAF5htlAcYqQnyV0N7oND7UZHMIWz A==;
X-CSE-ConnectionGUID: s+GtB8qNRyyOWI6kZ06Sfw==
X-CSE-MsgGUID: VyCPKkh/TR2peN4VIBYzqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="35829260"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35829260"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 14:27:37 -0700
X-CSE-ConnectionGUID: xNl9XPVKRg2ICmsyM6+WKg==
X-CSE-MsgGUID: 6TzdyC2WTxWJyqKQD8X+eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="39723344"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 14:27:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 14:27:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 14:27:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 14:27:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Djd434G0lSRjjGvFm+0Xuqsezisuix5HGis8XpHtiNbdVWDRQesTqRB3rujy7PlAunyrcEGBj4I6ahj/FCC9dv0Od4EPMRcJuy/uzGMD8YGHOcvv6hEeVUR/vTbBmH+vwlUqCCGoTnHAklOY1mIQ4BDXaePKrVVaj4rGVEJV85IHA0kmVvWYpmGTzaEYIYyHqzfdJOYSgIy84NEV+2a/WyZ8lyb06HwjETNk2Tof/jLhNyRHgNvHIfMxGOECTdK8LCe4Ntd3zTl35INqioST0oZXaBCpwwodcwb7v0avcXQDfFdVIQiRISOkuh66jaayqAI+eSGv8FgcfYnE0XnHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6xSyg1CIrTes8V/h638NBLYa/CKkga9UJR/g8VOTdE=;
 b=T5bveffxVSvoCon+lbXBSQebbEBLpyVtKbz9hu7witm/A2tVfk2ykVuJOn+4ajt4WVTFKF4BTj/r3R1bk54lFy8U/zjjIr8QbDukh8w8afxrD8v9sh2mi/KqGODMELHYRIEwUizm+tDteYjLKiZhidvi0l2hpIMfKGxuDf5neauEgvo6rX5U3MJz+6Y4YkFPaVyv1xySonbp7ouNUc4kWiMmsrhEc4UsAA/8yTeZjacjA8M5AjcqKcEX7YzKSRKueteqXv69CbyOUdLgHagUASVZFcF+bXM3/yVvPBu+ax4nGb4KgZ1xlWwEzM3B/demD1NqnRoa9f9wnRefnGq9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4887.namprd11.prod.outlook.com (2603:10b6:510:30::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 21:27:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 21:27:32 +0000
Date: Tue, 28 May 2024 14:27:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/xe: Promote VRAM initialization function to own
 file
Message-ID: <20240528212730.GH4990@mdroper-desk1.amr.corp.intel.com>
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527173554.1108-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:a03:331::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4887:EE_
X-MS-Office365-Filtering-Correlation-Id: 857ba626-8506-40d7-f055-08dc7f5cfc0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GlQWaa2OsmSC1r0hGGbyfcTKCiRvKSLvOHA9ovR47V1oD016j5IgwPpKZI?=
 =?iso-8859-1?Q?+duZgGpelkMBFgFquoVi0r2VzWJA3k19ofm1kwMKn3icbxG68cU9D0hI6k?=
 =?iso-8859-1?Q?M5su3mcYBsZlj2w4fq9zZTjMUFIm3laERqwgT+xD9Q06Hb2z3s6F0MoXHy?=
 =?iso-8859-1?Q?3HClOsULuhNDCRUZ31Qh29UWrEc/36HYkG6LpXAl+wluCPeq0ZsSdi+K7e?=
 =?iso-8859-1?Q?uS9i8wx6udHlsBdyWzAUi40XfEdLr7kBjhcV2ZcoodFJFPB6StDyuK6Mzc?=
 =?iso-8859-1?Q?U/Qkjvb5PzyxL3l80nU7ZQWCAtNrKP2VzixFoPPznDkQvAjl/h5TBBO7MI?=
 =?iso-8859-1?Q?YuUZCh2PEBXcouU76hgHXTm8FCqXfghAc8wGuZdJYsbZoPKDyGMNwGNRA/?=
 =?iso-8859-1?Q?8c4izHSjHH1HoMFtKRDZuPwD8ObWrac/aH6Vh9/1S86PUIxd80l5hFu066?=
 =?iso-8859-1?Q?4d7jg17mnU0Adx54whGYioplhcvuqvq7mArDzerv0tm9jJVhRhxoPoW51H?=
 =?iso-8859-1?Q?UJFvy2dxwU7a1i8fOgPTmujehjYUv4sIDyY7P563tdX1tKOTcD2Upd0Zaz?=
 =?iso-8859-1?Q?nVdqmmyg4NkNSfZBWyP/OXk7ighJLwvMp+DMRShug5NG6Aro+2tzLYsyVC?=
 =?iso-8859-1?Q?gfrb5a6fBgJY6N4Tj9yAM5MGGFJb4VMaRQIDCcrC/N/rpdnkMQFMO/oFsJ?=
 =?iso-8859-1?Q?J8sLCr6hk/9ry46JqB3MsVdetKS5qqviGSy398oxSjHOEXu2SQNrsWqjH3?=
 =?iso-8859-1?Q?vTVoEKOzZkDWyqVmuN48g5NAOCiWXY0twXhdp6gUoDoYw6zxnKgD5+D3ww?=
 =?iso-8859-1?Q?Q9nSzTBbswdHaquzjzAPGPobLno9+bMeYWx2OIFUhgRoTMx44FoK/jzRZz?=
 =?iso-8859-1?Q?MXbsoZaRlIkRnGB9egm+wzvEInRz6jCXxUdEvXc1udeoKJLNPNdR+xfowY?=
 =?iso-8859-1?Q?2xuISNhe1hIAHwJCQXdM2GbDX/sR1ByGIrZBvFX1DN8krliNMVngpHLxqi?=
 =?iso-8859-1?Q?cRZCfjuowBySu5bkvB9B+a2VYSPtHZXLGKeI+pe9i8NcS8kRRkGqaUDYCl?=
 =?iso-8859-1?Q?SGhxlOby7I/dN7rwiuhsw5L7erhGFzZ6dFpdkLsDaRnN9U8hNrGQNZLLUL?=
 =?iso-8859-1?Q?m/S8m2argUNZ1syFhEplLqL2aGa3w5DMAT0jcYYpOyIFOdKberkpmc0pEy?=
 =?iso-8859-1?Q?aVo+oHDBbF9uDCKPlrnyjFAhhSqBwlqlKuLRmOzhr09PaUB6lrFeOCrFi3?=
 =?iso-8859-1?Q?nKgtn3MlysbhYA2nUFF/JrbiMkeUDvHyN4qTYhP5T8UzvETZf+0fO686yB?=
 =?iso-8859-1?Q?Ik6sQr4+ZZnGzjRHPh02jg/xEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6ueq0kH4sL1uoRjtIjBih8tlxPm2QV1rORbgVBpKSLt+CrhuALwtPqiYJa?=
 =?iso-8859-1?Q?w49PFwQ0+UvtXVvyhqdBZdbHgdzKW1dY7jBgpLc9i0EP+nn7MuQuFfHpfr?=
 =?iso-8859-1?Q?FfA5ZEj9hiP6+yIIuU9udtHmgVN5DVx5EFgc0AZRZFTdxR1J77uv01XJC8?=
 =?iso-8859-1?Q?vlhjc5hxDQzvEz6usl7xgCUgfh2LY7VTK5mcbUe3pG7EUbeAgmlnRiFYCc?=
 =?iso-8859-1?Q?LOkAVzxeXB1i2eAvzUR/9xeBi3ummtLxqvWfSoT5dhtvUNLitf5gqZqqZ7?=
 =?iso-8859-1?Q?BLGL0TvL2+d2EFwgfct+wZOAPA2a80EJL6UADolNMPMJAyAAVaTUvuMKsL?=
 =?iso-8859-1?Q?YoVnV3/aY3TO4Hqu9Rlwc36SWnjMyaY3a9cSEaXQ5D3GcxCuyU+22I89aR?=
 =?iso-8859-1?Q?lXsXKFLP8SBxVs7IN0qQCEcVc71L5AcBNG15/RjU/pAUIMmeUsBfstjhG+?=
 =?iso-8859-1?Q?Wk4j4bQuaJLTC2nFYUnroRfZdwJaSD1juJDGM1hdG9f8Ny/K3mXFhf936t?=
 =?iso-8859-1?Q?ZTUryziRODsRI9FkuLbJngSn+tJHBKcJHu9czYsoRjzIdRobCQ93KqEkru?=
 =?iso-8859-1?Q?U52pqZzcOq2RHJVH/RavayTdVGEDPfCbTsUV1jXQJctEJ0K6Wb35I5BuoV?=
 =?iso-8859-1?Q?eWkyF+FFBI74I1I4XKQ0Gep8mTbnmuumiSUQEcDcOWD3MGrloFqWK3xF0l?=
 =?iso-8859-1?Q?TOdGivZKj1qCZcalI/3y/p5FbXkDo4rlPqpYcBCRO8puKF6befnkhQMCeJ?=
 =?iso-8859-1?Q?gks3EEY3J8Lt/BtxJKk3UwVb3RKk434YgFUr1FJwdfc1vPq5J2WRcNokxT?=
 =?iso-8859-1?Q?v1TBz9eUdBdqz5qdJTaTmEh98+EX2Ie6XwHDSygN+620tD7ZLbW7Rm+ipH?=
 =?iso-8859-1?Q?xZyq6rY35BBJMqvRkH7KPq8uYlZaaDG3q6cpasOx6KgOedZDStbsGV0cku?=
 =?iso-8859-1?Q?56Wnnvxophd4cS+rTw5VnfiT51vMyovHdE/TB0zAjMWTF19DHEfvuhr4LU?=
 =?iso-8859-1?Q?XrsatOdgOUGp+GahqFcVgAELJdz3HjkmTbM1AKIAvlC9or02uDvd5jl2Jv?=
 =?iso-8859-1?Q?wtpz8sbiHt8n8PzOOYA6Jqwryoc10eX3DjLKevWapWoGtDRBXCNklPrkxR?=
 =?iso-8859-1?Q?RqBwJ24+JAvHfBrTQtX+W2G5SkjUkYUU1N2GQ+dbedTZAEQ2kTKrr+Acb0?=
 =?iso-8859-1?Q?szALMegSQCFenq827e45SRdG7NtLBTob5fcFkA41JW1KB/OngTzKlwqwcn?=
 =?iso-8859-1?Q?CAei+8UJXV2w3v1C6GyI8yI54ojEYE3eIaj5hZVBWUXRWxukARb8+qMebj?=
 =?iso-8859-1?Q?FGiveLdsd9CYwr/UB5rKdbqDh1oDEgy/2rMCfUZylcnbmHAe5JCQdrQD0X?=
 =?iso-8859-1?Q?887lPKXCLsqu6kEjphKfyF4vGRfux/rCXgwNeJ1wUCx83bbhrw+94katd2?=
 =?iso-8859-1?Q?C5PPLJSDC+DK3MQ9TSoCnvDfLlimmnSQ4u55Y4J46QKGxAvKW2IeMP9a9j?=
 =?iso-8859-1?Q?SgkLFRocFxG+8sw5o9SEykGLNP+mzkP4OB+A8P49gtUPOxxvWbbeLW1epH?=
 =?iso-8859-1?Q?eoE4o73RoggU5BtpkpQ1bVdjWpOJBo1XETbIf64zR48eFxZGFGfG3bgSsr?=
 =?iso-8859-1?Q?7UjoUBArIUuONcFFtcZu3s/EMR6r5WKpFytU8MjYhIlK6iCCSvywlOmA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 857ba626-8506-40d7-f055-08dc7f5cfc0a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 21:27:32.3546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 576to8DvxNMQQQqQcdwSfNbxoXQXgI3xg+/vfAspweR+ZmnpDjmYzfJFYQ5p6DtMbcjQf85art2oFmAyLiQfSjtU/qhQF5clPVKmsV0DMpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4887
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

On Mon, May 27, 2024 at 07:35:52PM +0200, Michal Wajdeczko wrote:
> There is no point in mixing MMIO and VRAM code in the same file.

I'd say s/MMIO/register access/ since the VRAM BAR is technically
memory-mapped IO.  It's just that when we usually talk about "mmio" in
the driver we're more focused on register IO.

Separating this out still makes sense regardless.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

As a side note, I notice that there are a bunch of static VRAM functions
that have an "xe_" prefix.  You rename one of them in the next series of
the patch, but we should probably rename the others somewhere in this
series as well to align with our typical coding style.


Matt

> Move and rename the VRAM probe function to a new file (there are
> no other changes other then simple kernel-doc).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile    |   1 +
>  drivers/gpu/drm/xe/xe_device.c |   3 +-
>  drivers/gpu/drm/xe/xe_mmio.c   | 333 +------------------------------
>  drivers/gpu/drm/xe/xe_vram.c   | 350 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vram.h   |  13 ++
>  5 files changed, 368 insertions(+), 332 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_vram.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vram.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index d5b137e762ed..74bd64d9e8ab 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -143,6 +143,7 @@ xe-y += xe_bb.o \
>  	xe_uc_debugfs.o \
>  	xe_uc_fw.o \
>  	xe_vm.o \
> +	xe_vram.o \
>  	xe_vram_freq.o \
>  	xe_wait_user_fence.o \
>  	xe_wa.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f04b11e45c2d..61ec15f2034b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -51,6 +51,7 @@
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
> +#include "xe_vram.h"
>  #include "xe_wait_user_fence.h"
>  
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> @@ -615,7 +616,7 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_irq_shutdown;
>  
> -	err = xe_mmio_probe_vram(xe);
> +	err = xe_vram_probe(xe);
>  	if (err)
>  		goto err_irq_shutdown;
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 1272246dd8a3..7962eeb9adb7 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -8,348 +8,19 @@
>  #include <linux/delay.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/minmax.h>
> +#include <linux/pci.h>
>  
>  #include <drm/drm_managed.h>
> -#include <drm/xe_drm.h>
> +#include <drm/drm_print.h>
>  
>  #include "regs/xe_bars.h"
> -#include "regs/xe_engine_regs.h"
> -#include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
> -#include "xe_bo.h"
>  #include "xe_device.h"
> -#include "xe_force_wake.h"
> -#include "xe_ggtt.h"
>  #include "xe_gt.h"
> -#include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_macros.h"
> -#include "xe_module.h"
>  #include "xe_sriov.h"
> -#include "xe_tile.h"
> -
> -#define BAR_SIZE_SHIFT 20
> -
> -static void
> -_resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> -{
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	int bar_size = pci_rebar_bytes_to_size(size);
> -	int ret;
> -
> -	if (pci_resource_len(pdev, resno))
> -		pci_release_resource(pdev, resno);
> -
> -	ret = pci_resize_resource(pdev, resno, bar_size);
> -	if (ret) {
> -		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
> -			 resno, 1 << bar_size, ERR_PTR(ret));
> -		return;
> -	}
> -
> -	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
> -}
> -
> -/*
> - * if force_vram_bar_size is set, attempt to set to the requested size
> - * else set to maximum possible size
> - */
> -static void xe_resize_vram_bar(struct xe_device *xe)
> -{
> -	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	struct pci_bus *root = pdev->bus;
> -	resource_size_t current_size;
> -	resource_size_t rebar_size;
> -	struct resource *root_res;
> -	u32 bar_size_mask;
> -	u32 pci_cmd;
> -	int i;
> -
> -	/* gather some relevant info */
> -	current_size = pci_resource_len(pdev, LMEM_BAR);
> -	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
> -
> -	if (!bar_size_mask)
> -		return;
> -
> -	/* set to a specific size? */
> -	if (force_vram_bar_size) {
> -		u32 bar_size_bit;
> -
> -		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
> -
> -		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
> -
> -		if (!bar_size_bit) {
> -			drm_info(&xe->drm,
> -				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
> -				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
> -			return;
> -		}
> -
> -		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
> -
> -		if (rebar_size == current_size)
> -			return;
> -	} else {
> -		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
> -
> -		/* only resize if larger than current */
> -		if (rebar_size <= current_size)
> -			return;
> -	}
> -
> -	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
> -		 (u64)current_size >> 20, (u64)rebar_size >> 20);
> -
> -	while (root->parent)
> -		root = root->parent;
> -
> -	pci_bus_for_each_resource(root, root_res, i) {
> -		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
> -		    (u64)root_res->start > 0x100000000ul)
> -			break;
> -	}
> -
> -	if (!root_res) {
> -		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> -		return;
> -	}
> -
> -	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
> -	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
> -
> -	_resize_bar(xe, LMEM_BAR, rebar_size);
> -
> -	pci_assign_unassigned_bus_resources(pdev->bus);
> -	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
> -}
> -
> -static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
> -{
> -	if (!pci_resource_flags(pdev, bar))
> -		return false;
> -
> -	if (pci_resource_flags(pdev, bar) & IORESOURCE_UNSET)
> -		return false;
> -
> -	if (!pci_resource_len(pdev, bar))
> -		return false;
> -
> -	return true;
> -}
> -
> -static int xe_determine_lmem_bar_size(struct xe_device *xe)
> -{
> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -
> -	if (!xe_pci_resource_valid(pdev, LMEM_BAR)) {
> -		drm_err(&xe->drm, "pci resource is not valid\n");
> -		return -ENXIO;
> -	}
> -
> -	xe_resize_vram_bar(xe);
> -
> -	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
> -	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
> -	if (!xe->mem.vram.io_size)
> -		return -EIO;
> -
> -	/* XXX: Need to change when xe link code is ready */
> -	xe->mem.vram.dpa_base = 0;
> -
> -	/* set up a map to the total memory area. */
> -	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
> -
> -	return 0;
> -}
> -
> -static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
> -{
> -	struct xe_device *xe = gt_to_xe(gt);
> -	u64 offset;
> -	u32 reg;
> -
> -	if (GRAPHICS_VER(xe) >= 20) {
> -		u64 ccs_size = tile_size / 512;
> -		u64 offset_hi, offset_lo;
> -		u32 nodes, num_enabled;
> -
> -		reg = xe_mmio_read32(gt, MIRROR_FUSE3);
> -		nodes = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, reg);
> -		num_enabled = hweight32(nodes); /* Number of enabled l3 nodes */
> -
> -		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
> -		offset_lo = REG_FIELD_GET(XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK, reg);
> -
> -		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_UPPER);
> -		offset_hi = REG_FIELD_GET(XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK, reg);
> -
> -		offset = offset_hi << 32; /* HW view bits 39:32 */
> -		offset |= offset_lo << 6; /* HW view bits 31:6 */
> -		offset *= num_enabled; /* convert to SW view */
> -
> -		/* We don't expect any holes */
> -		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(gt, GSMBASE) - ccs_size),
> -			      "Hole between CCS and GSM.\n");
> -	} else {
> -		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> -		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
> -	}
> -
> -	return offset;
> -}
> -
> -/**
> - * xe_mmio_tile_vram_size() - Collect vram size and offset information
> - * @tile: tile to get info for
> - * @vram_size: available vram (size - device reserved portions)
> - * @tile_size: actual vram size
> - * @tile_offset: physical start point in the vram address space
> - *
> - * There are 4 places for size information:
> - * - io size (from pci_resource_len of LMEM bar) (only used for small bar and DG1)
> - * - TILEx size (actual vram size)
> - * - GSMBASE offset (TILEx - "stolen")
> - * - CSSBASE offset (TILEx - CSS space necessary)
> - *
> - * CSSBASE is always a lower/smaller offset then GSMBASE.
> - *
> - * The actual available size of memory is to the CCS or GSM base.
> - * NOTE: multi-tile bases will include the tile offset.
> - *
> - */
> -static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> -				  u64 *tile_size, u64 *tile_offset)
> -{
> -	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_gt *gt = tile->primary_gt;
> -	u64 offset;
> -	int err;
> -	u32 reg;
> -
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return err;
> -
> -	/* actual size */
> -	if (unlikely(xe->info.platform == XE_DG1)) {
> -		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
> -		*tile_offset = 0;
> -	} else {
> -		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
> -		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
> -		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
> -	}
> -
> -	/* minus device usage */
> -	if (xe->info.has_flat_ccs) {
> -		offset = get_flat_ccs_offset(gt, *tile_size);
> -	} else {
> -		offset = xe_mmio_read64_2x32(gt, GSMBASE);
> -	}
> -
> -	/* remove the tile offset so we have just the available size */
> -	*vram_size = offset - *tile_offset;
> -
> -	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -}
> -
> -static void vram_fini(void *arg)
> -{
> -	struct xe_device *xe = arg;
> -	struct xe_tile *tile;
> -	int id;
> -
> -	if (xe->mem.vram.mapping)
> -		iounmap(xe->mem.vram.mapping);
> -
> -	xe->mem.vram.mapping = NULL;
> -
> -	for_each_tile(tile, xe, id)
> -		tile->mem.vram.mapping = NULL;
> -}
> -
> -int xe_mmio_probe_vram(struct xe_device *xe)
> -{
> -	struct xe_tile *tile;
> -	resource_size_t io_size;
> -	u64 available_size = 0;
> -	u64 total_size = 0;
> -	u64 tile_offset;
> -	u64 tile_size;
> -	u64 vram_size;
> -	int err;
> -	u8 id;
> -
> -	if (!IS_DGFX(xe))
> -		return 0;
> -
> -	/* Get the size of the root tile's vram for later accessibility comparison */
> -	tile = xe_device_get_root_tile(xe);
> -	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> -	if (err)
> -		return err;
> -
> -	err = xe_determine_lmem_bar_size(xe);
> -	if (err)
> -		return err;
> -
> -	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> -		 &xe->mem.vram.io_size);
> -
> -	io_size = xe->mem.vram.io_size;
> -
> -	/* tile specific ranges */
> -	for_each_tile(tile, xe, id) {
> -		err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> -		if (err)
> -			return err;
> -
> -		tile->mem.vram.actual_physical_size = tile_size;
> -		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
> -		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
> -
> -		if (!tile->mem.vram.io_size) {
> -			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> -			return -ENODEV;
> -		}
> -
> -		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
> -		tile->mem.vram.usable_size = vram_size;
> -		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
> -
> -		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
> -			drm_info(&xe->drm, "Small BAR device\n");
> -		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
> -			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
> -		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
> -			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
> -			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
> -
> -		/* calculate total size using tile size to get the correct HW sizing */
> -		total_size += tile_size;
> -		available_size += vram_size;
> -
> -		if (total_size > xe->mem.vram.io_size) {
> -			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> -				 &total_size, &xe->mem.vram.io_size);
> -		}
> -
> -		io_size -= min_t(u64, tile_size, io_size);
> -	}
> -
> -	xe->mem.vram.actual_physical_size = total_size;
> -
> -	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> -		 &xe->mem.vram.actual_physical_size);
> -	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> -		 &available_size);
> -
> -	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
> -}
>  
>  static void tiles_fini(void *arg)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> new file mode 100644
> index 000000000000..d8b81e4e050c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -0,0 +1,350 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021-2024 Intel Corporation
> + */
> +
> +#include <linux/pci.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "regs/xe_bars.h"
> +#include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt_mcr.h"
> +#include "xe_mmio.h"
> +#include "xe_module.h"
> +#include "xe_vram.h"
> +
> +#define BAR_SIZE_SHIFT 20
> +
> +static void
> +_resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	int bar_size = pci_rebar_bytes_to_size(size);
> +	int ret;
> +
> +	if (pci_resource_len(pdev, resno))
> +		pci_release_resource(pdev, resno);
> +
> +	ret = pci_resize_resource(pdev, resno, bar_size);
> +	if (ret) {
> +		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
> +			 resno, 1 << bar_size, ERR_PTR(ret));
> +		return;
> +	}
> +
> +	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
> +}
> +
> +/*
> + * if force_vram_bar_size is set, attempt to set to the requested size
> + * else set to maximum possible size
> + */
> +static void xe_resize_vram_bar(struct xe_device *xe)
> +{
> +	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_bus *root = pdev->bus;
> +	resource_size_t current_size;
> +	resource_size_t rebar_size;
> +	struct resource *root_res;
> +	u32 bar_size_mask;
> +	u32 pci_cmd;
> +	int i;
> +
> +	/* gather some relevant info */
> +	current_size = pci_resource_len(pdev, LMEM_BAR);
> +	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
> +
> +	if (!bar_size_mask)
> +		return;
> +
> +	/* set to a specific size? */
> +	if (force_vram_bar_size) {
> +		u32 bar_size_bit;
> +
> +		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
> +
> +		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
> +
> +		if (!bar_size_bit) {
> +			drm_info(&xe->drm,
> +				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
> +				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
> +			return;
> +		}
> +
> +		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
> +
> +		if (rebar_size == current_size)
> +			return;
> +	} else {
> +		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
> +
> +		/* only resize if larger than current */
> +		if (rebar_size <= current_size)
> +			return;
> +	}
> +
> +	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
> +		 (u64)current_size >> 20, (u64)rebar_size >> 20);
> +
> +	while (root->parent)
> +		root = root->parent;
> +
> +	pci_bus_for_each_resource(root, root_res, i) {
> +		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
> +		    (u64)root_res->start > 0x100000000ul)
> +			break;
> +	}
> +
> +	if (!root_res) {
> +		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> +		return;
> +	}
> +
> +	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
> +	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
> +
> +	_resize_bar(xe, LMEM_BAR, rebar_size);
> +
> +	pci_assign_unassigned_bus_resources(pdev->bus);
> +	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
> +}
> +
> +static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
> +{
> +	if (!pci_resource_flags(pdev, bar))
> +		return false;
> +
> +	if (pci_resource_flags(pdev, bar) & IORESOURCE_UNSET)
> +		return false;
> +
> +	if (!pci_resource_len(pdev, bar))
> +		return false;
> +
> +	return true;
> +}
> +
> +static int xe_determine_lmem_bar_size(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	if (!xe_pci_resource_valid(pdev, LMEM_BAR)) {
> +		drm_err(&xe->drm, "pci resource is not valid\n");
> +		return -ENXIO;
> +	}
> +
> +	xe_resize_vram_bar(xe);
> +
> +	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
> +	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
> +	if (!xe->mem.vram.io_size)
> +		return -EIO;
> +
> +	/* XXX: Need to change when xe link code is ready */
> +	xe->mem.vram.dpa_base = 0;
> +
> +	/* set up a map to the total memory area. */
> +	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
> +
> +	return 0;
> +}
> +
> +static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 offset;
> +	u32 reg;
> +
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		u64 ccs_size = tile_size / 512;
> +		u64 offset_hi, offset_lo;
> +		u32 nodes, num_enabled;
> +
> +		reg = xe_mmio_read32(gt, MIRROR_FUSE3);
> +		nodes = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, reg);
> +		num_enabled = hweight32(nodes); /* Number of enabled l3 nodes */
> +
> +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
> +		offset_lo = REG_FIELD_GET(XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK, reg);
> +
> +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_UPPER);
> +		offset_hi = REG_FIELD_GET(XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK, reg);
> +
> +		offset = offset_hi << 32; /* HW view bits 39:32 */
> +		offset |= offset_lo << 6; /* HW view bits 31:6 */
> +		offset *= num_enabled; /* convert to SW view */
> +
> +		/* We don't expect any holes */
> +		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(gt, GSMBASE) - ccs_size),
> +			      "Hole between CCS and GSM.\n");
> +	} else {
> +		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> +		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
> +	}
> +
> +	return offset;
> +}
> +
> +/**
> + * xe_mmio_tile_vram_size() - Collect vram size and offset information
> + * @tile: tile to get info for
> + * @vram_size: available vram (size - device reserved portions)
> + * @tile_size: actual vram size
> + * @tile_offset: physical start point in the vram address space
> + *
> + * There are 4 places for size information:
> + * - io size (from pci_resource_len of LMEM bar) (only used for small bar and DG1)
> + * - TILEx size (actual vram size)
> + * - GSMBASE offset (TILEx - "stolen")
> + * - CSSBASE offset (TILEx - CSS space necessary)
> + *
> + * CSSBASE is always a lower/smaller offset then GSMBASE.
> + *
> + * The actual available size of memory is to the CCS or GSM base.
> + * NOTE: multi-tile bases will include the tile offset.
> + *
> + */
> +static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> +				  u64 *tile_size, u64 *tile_offset)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u64 offset;
> +	int err;
> +	u32 reg;
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return err;
> +
> +	/* actual size */
> +	if (unlikely(xe->info.platform == XE_DG1)) {
> +		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
> +		*tile_offset = 0;
> +	} else {
> +		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
> +		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
> +		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
> +	}
> +
> +	/* minus device usage */
> +	if (xe->info.has_flat_ccs) {
> +		offset = get_flat_ccs_offset(gt, *tile_size);
> +	} else {
> +		offset = xe_mmio_read64_2x32(gt, GSMBASE);
> +	}
> +
> +	/* remove the tile offset so we have just the available size */
> +	*vram_size = offset - *tile_offset;
> +
> +	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +}
> +
> +static void vram_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	if (xe->mem.vram.mapping)
> +		iounmap(xe->mem.vram.mapping);
> +
> +	xe->mem.vram.mapping = NULL;
> +
> +	for_each_tile(tile, xe, id)
> +		tile->mem.vram.mapping = NULL;
> +}
> +
> +/**
> + * xe_vram_probe() - Probe VRAM configuration
> + * @xe: the &xe_device
> + *
> + * Collect VRAM size and offset information for all tiles.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int xe_vram_probe(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	resource_size_t io_size;
> +	u64 available_size = 0;
> +	u64 total_size = 0;
> +	u64 tile_offset;
> +	u64 tile_size;
> +	u64 vram_size;
> +	int err;
> +	u8 id;
> +
> +	if (!IS_DGFX(xe))
> +		return 0;
> +
> +	/* Get the size of the root tile's vram for later accessibility comparison */
> +	tile = xe_device_get_root_tile(xe);
> +	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> +	if (err)
> +		return err;
> +
> +	err = xe_determine_lmem_bar_size(xe);
> +	if (err)
> +		return err;
> +
> +	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> +		 &xe->mem.vram.io_size);
> +
> +	io_size = xe->mem.vram.io_size;
> +
> +	/* tile specific ranges */
> +	for_each_tile(tile, xe, id) {
> +		err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> +		if (err)
> +			return err;
> +
> +		tile->mem.vram.actual_physical_size = tile_size;
> +		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
> +		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
> +
> +		if (!tile->mem.vram.io_size) {
> +			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> +			return -ENODEV;
> +		}
> +
> +		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
> +		tile->mem.vram.usable_size = vram_size;
> +		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
> +
> +		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
> +			drm_info(&xe->drm, "Small BAR device\n");
> +		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
> +			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
> +		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
> +			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
> +			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
> +
> +		/* calculate total size using tile size to get the correct HW sizing */
> +		total_size += tile_size;
> +		available_size += vram_size;
> +
> +		if (total_size > xe->mem.vram.io_size) {
> +			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> +				 &total_size, &xe->mem.vram.io_size);
> +		}
> +
> +		io_size -= min_t(u64, tile_size, io_size);
> +	}
> +
> +	xe->mem.vram.actual_physical_size = total_size;
> +
> +	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> +		 &xe->mem.vram.actual_physical_size);
> +	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
> +		 &available_size);
> +
> +	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
> new file mode 100644
> index 000000000000..e31cc04ec0db
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vram.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_VRAM_H_
> +#define _XE_VRAM_H_
> +
> +struct xe_device;
> +
> +int xe_vram_probe(struct xe_device *xe);
> +
> +#endif
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
