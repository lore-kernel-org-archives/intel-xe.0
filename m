Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ADBFCA19D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 23:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3D710E5EA;
	Mon,  9 Mar 2026 23:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEyYeaX5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999DF10E5EA
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 23:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773097629; x=1804633629;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j5yyyOkWEkh0BZUFT/iA84C+5QwKgvmWpkFNpUHzJSQ=;
 b=FEyYeaX5/emFW3XTttmov/BpzelMODQGE7DBppnbE1SuDGNDh7gmxv3Y
 84IYCBy3ypHnvF9pv42Kczs8YhI1CuK8zVqtCi4Cf9/iIdAQuSSpvjAgy
 Cyw+cle7GoRPpMtiG2zaLlGhlb2S/grR81ROkLgJ4bARLcVOp0wUzRW3B
 NE00NrmH53hECs6CbJmPZXRloLRg4OIHPVcaCMmkFkyij2UO3UMwzY7W3
 V+CeDlitkSr4uH1d8uW2DWSbC/hy48ObWY7AyalxAerks1qpugkjDdilq
 wRBec/QlSR/BuHpX/eqWcFNZVGQH6SjkicPebuq0/ASKJyCxw+44rYtbQ A==;
X-CSE-ConnectionGUID: od/aVf9yQre51r8imn2hsw==
X-CSE-MsgGUID: LUVUx4ZQSmquhjURxuUz/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84768412"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="84768412"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 16:07:09 -0700
X-CSE-ConnectionGUID: y/VyqRY+SqOzgdKnV6A5/Q==
X-CSE-MsgGUID: EsBJ6/q1S3uDiRWXC1r02w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219035171"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 16:07:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 16:07:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 16:07:08 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 16:07:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RM+Ki8HLVhE080hmdOt04r0wfrZiJ1c2BFktnbEtcm57ehbL04CfyFnXy53tBjldTKLEk6tTzPVdhPyydBXRR7Ropkwx5X3kpB+A+2nATfiroYgbZqSuMyCCKE5Rn7o2QsX23vgBG8ivmkVDjI0FTKAPmsLlYmBjn3ShJRfH7j7SEsXzm/7GRLuTS7ZrQOmz8e7YSSQQVEndZAcBjT7Tf5QyR/XUn4PxE8UaqKfdpRPy1XDDxOrHFITqfRd7Q0CMLXwil6hQGHoMnMMnioqlGA6CSj7zv4kChYO4+1C5ggAR8aILg1+DJZvSZWxIHo51lv7I8N2Ubkvb7/N0wJPRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoSZXbuMecofdQJld2VZTKc1ZN+gdqbkSh/nvlwo208=;
 b=osmewCy1gfV6OuWZISh7MsN0pyNrJ5IaSXXSbImozxPzvUhzJR1UlJbYmOIT/tPnvRieUZA+yPWpwqXSTQOW0wUQL0/jfGh10S+O/TfTLshP6USTbPqE+lMxishIoeS96Jmm7dHkhRJh6aj/d2Q/V6TfUE+OLeWWwfRIayRTveFUKGKznJJJZW8WUP2qf5dOjO/4laSPe+Unxwj68auC2vFgFVkyhoX+Q0LCSucoRzzZYEC0f3AHLtqeNPINCODlLZw8J3eJUjz53oi1MjiWGxTmz1UtNS8q5pVZmeX66ULZ6HT99WRxy+WdTYkh18ww4lV//aNA8rXvOqDAaytz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 23:07:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 23:07:01 +0000
Date: Mon, 9 Mar 2026 16:06:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v4] drm/xe: Add Wa_14026578760
Message-ID: <20260309230658.GE52346@mdroper-desk1.amr.corp.intel.com>
References: <20260309063923.4031933-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260309063923.4031933-1-varun.gupta@intel.com>
X-ClientProxiedBy: BYAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::37) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: d1649c08-65bd-463f-611a-08de7e30922e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: BL4nJN3y63tzA9bwfs7BOP4rYD0wfxbJ+OS1P2weQjoce8Ctm7AkuP0cXqiQBKCbXrYYBQ3vMu4MFzq/WM31A3KO1OYuUil0T1Z/ZFR3F035spouG832buDpPD012/xTyiOt5gInfr8PNKtF8bV/le9nhcJFfq4SOK0wAhkblGEEWomaP0hsC2BXd2TjWkKr9mMhwhNNwoR+ym3/DLK+q9i8UP22wYEPQazL7NVI5U2TC2FInIeTzTcp//oDT4B+Ola1HKCd0e6cpj8iuqmQz3dKT/RMEsfNKa7xNv+5PJadhAa840kbpCQM0G8MoejaDDiWtyukQkVxXvODAl+nzgV4hVJ4kiQlqGHfqScIhBSewmYVcXTUdgKLfTT4IxgZM6EvGQN1Y753bFZMhFYBcPCXwXDeuZAnrQvw6gRSAcm1TlOhhMTQWbuuWyWIXjr5Ul7JvJGlYKN8KM0HdXYS3Q6zguVHIe2H5pu5S7TAu9kK5Whfp8jri4a92TGSf/qUyKKvCAFN1Qt6iYdpIhaKNnOYyyI7ofAtpZgRjKw5ryCxHYnMs9ClT3V5M2oa5VJZvn6MDZfYu4QcT5Po8HO8DwnW8v9KoDmDXPZqW0ymNZFYdAudM6RAX5vDGQJAmN6qQLdn4vIHrKoGI9G2yEJnopZQpr5dR8qqPc2GkV9Bmp2AreCMdNdLli6aXNRvYUHwpjdPRvcHXeV9TOhel6CjzW+EtlLaOBxkYZCJ6sujkrg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Twd3N2i4/77LGrhATL56artSYdMfBtpMLAALjKzIrBedIJn0RWmYjc/JB3bj?=
 =?us-ascii?Q?XSFTICXqUt2XlHrEuWXEFnfCWgWWmQoydjeOiHhh7SF4h9H+N+oVy2+b8zcp?=
 =?us-ascii?Q?NN630oBBGabD7Lg/Ke0lFLefpnaee2XTLuGRpRUoKEFCpEcc7UCiO7wxWJWM?=
 =?us-ascii?Q?n37NsdNFxfE9pAgri6sLDW6nCsBbH5r6rEf4qwHAvcviEamIJtpkxH88wlrD?=
 =?us-ascii?Q?bmpAyDgn6eiMdsoHl+XypHmgZcaj6/aECKe4YKVRdp2hSmJwjR15VxSyEQTS?=
 =?us-ascii?Q?VKPVobnlIO0nzEEvCX48alRp775rGGLLTwa+o6nqxfPWh5IoIsNWE8EfQfi8?=
 =?us-ascii?Q?hNoBEy/n0jxcrOJAPhHEY8e3mgmOpC07GJOn1nUq2Co7gHQmt9zrzBSjyZzg?=
 =?us-ascii?Q?SUkQMB7cULH4xXSehSdGK1zZM9yVfRGrw3VKIZEDEV9tiGTFOK6ejHMju4dJ?=
 =?us-ascii?Q?2SPqvoObA39otsWcswMfC1ec0z4TFFjjOpO6qgx/h6tZOZxGe2la58m3OaJy?=
 =?us-ascii?Q?eswM8dCBn2h15Gf2IWGwKc/pe4DNlYGm3BDRlA52qXlp0EC3ReEcV35oFZfB?=
 =?us-ascii?Q?jweFGqTlPFmQRwML6cWgbXdxvq/kUGAlloxyO0m2lUMjEB0W05GuAe00Cz8H?=
 =?us-ascii?Q?4m70JmuA/KfC1faNISQ1AOsF43Q4y70ntP2TMV6qCbaMnmNFbKDsSr61Rej0?=
 =?us-ascii?Q?HOPZsTOByeKpUg0oEsRC/lR5GFWe412Ia0WGqK1RYlnfdyNg1oTL+IIffSUS?=
 =?us-ascii?Q?1BhSqYr/d57OXVxfh4qq6RhmM8vRVT55Quu2UkwS8dj5VjgaMoT2rPbAxpZm?=
 =?us-ascii?Q?HrlJLsvohGC1tX8MlgsZ6BlF9HDrc0LGKzAGikkpBxTofs9m0SPKnDIutK9p?=
 =?us-ascii?Q?T2z2To8L8rKkhf7U5Y65c5rJfrBI+/MaUzGqWi5eHfLGAC9vYnK0/TAWhUca?=
 =?us-ascii?Q?6w0jQPDIlz83SIIKXh8D9jVboy8rbR+7GbVQuK77ZehEqnY+/bp7GsXkQLtE?=
 =?us-ascii?Q?+xqk29POGtBl7QqzIuJNCPXWaHKZ+gbRoUPZqOL37vbe2Z13Zoy4oGwGuN0L?=
 =?us-ascii?Q?LGJ6xCDoW9/QE6CDXIuXe9E1yXF5QjJCD24Ui9/uxUMQ81BIavSIuTxmOBtt?=
 =?us-ascii?Q?Uh5tGooIRChpnjW/Lpwa9CIKQuqzj88Asb1n6vrbKeSxC6tZqPmho19LZLa1?=
 =?us-ascii?Q?JxalVw6Sw0Jd6L6pLBEmkDW8j3q3VQ9EyOSvT6sxKTvhvI+MHREZ07soMGX3?=
 =?us-ascii?Q?J9+4NvzYTZHTw2oZjUqQVs7GZsr/FF+ohID3+aluXE9WIfwEAjwD2uKWb6jF?=
 =?us-ascii?Q?edJ5DnvFSjVmO2XoFtQUG1zngjdPHnBTGxXlpeuVP8mXwAK358ZO6Umzptbj?=
 =?us-ascii?Q?VauL0tUDDVfg73eU2Ym9g4ogtZsJXKT5dZZGB+H2DgDZg+CdEaBSQElan4Zn?=
 =?us-ascii?Q?BBMnmnW+zXFgIveBOpWXB5ZbMwPvvn0YkcgAhCYdd29jup0FVsg1CkQQUQRM?=
 =?us-ascii?Q?HVYwtVRyh/ij5RRbWb4Se7P9FMQ/s2eZ9IAh+YVo4GNo6kMvD/u4EWtBP2/t?=
 =?us-ascii?Q?ko2ChVvpF4cePER4EEif7xtfGrADxwJIz1D6zP8PbrjFSrlagLXeNKSV4Sp4?=
 =?us-ascii?Q?9mUcazwQLH7UebgRr8IfyxcbonURd3gjL9EiPnqHnmBIdJVOu5pIwa9f8JHp?=
 =?us-ascii?Q?SrKoyvbJjAijk9xznATxKPRvrsv0p5E517ug01FVVuuXISVa3oqk/jKYOLMo?=
 =?us-ascii?Q?ryArHNU3nfXWRLcA7pUhzAyr5W+DsgY=3D?=
X-Exchange-RoutingPolicyChecked: OxbBZeobgl+ctJXwfioOJVTvwdeuNbvfaZHSr755T0cZFHy5GXNF3UYxK5aF9zI1Z7GYROL+i+4I21Td9Vd+aaBlHyGBXZPOfz1aBQkb1vZwGjhnWjFlKT0mvlaflsANtOHIgIIvLS+x6iImEk/8AIT9lxsGRhHVaYosegbdvT9qMzVbJucXkM58j3YG3u/4e/vB2+8zMs0gSNEXeNE05ad4KcgLNJOaeYh9Aj1tIGw19UetlNTrQUddXXGeRtqcAKvG1CVyGc4Iv9EB8tEKCB777BeyRQ23gnRBsmxj3b2NMikiJxbGO3PE8/EajNgXyx/enDjRryVeyGN6B2fZjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d1649c08-65bd-463f-611a-08de7e30922e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 23:07:01.0072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYy7ZG7Jggj0o4V1LDmUtzErqzsC8v9w9brjmaGb2gkWcMCLqXLrkxA4ZcL28YPlptkkOd1diqwk97oiJ3YPpyNIM7E9cnbBW+6NAnZRAKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
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

On Mon, Mar 09, 2026 at 12:09:23PM +0530, Varun Gupta wrote:
> Add GT workaround Wa_14026578760 for graphics versions 35.10, 35.11
> and media version 35.03.
> 
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v4:
>  - Drop separate media register define; MEDIA_GT_GSI_OFFSET is applied
>    automatically by the media GT's mmio, so a single XE_REG_MCR
>    suffices for both graphics and media (Matt Roper)
> v3:
>  - Use separate register defines for graphics and media (Tejas)
> v2:
>  - Fix register define ordering (Matt Roper)
>  - Broaden workaround scope to cover graphics 35.10, 35.11 and media
>    35.03 per workaround database (Matt Roper)
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 90b9017770ea..c70dbf7e4e7c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -100,6 +100,9 @@
>  #define VE1_AUX_INV				XE_REG(0x42b8)
>  #define   AUX_INV				REG_BIT(0)
>  
> +#define GAMSTLB_CTRL				XE_REG_MCR(0x477c)
> +#define   DIS_PEND_GPA_LINK			REG_BIT(13)
> +
>  #define GAMSTLB_CTRL2				XE_REG_MCR(0x4788)
>  #define   STLB_SINGLE_BANK_MODE			REG_BIT(11)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 26950b8a7543..dc780368c452 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -164,6 +164,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  		       MEDIA_VERSION_RANGE(1301, 3500)),
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
>  	},
> +	{ XE_RTP_NAME("14026578760"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, 3511), OR,
> +		       MEDIA_VERSION(3503)),
> +	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL, DIS_PEND_GPA_LINK))
> +	},
>  
>  	/* DG1 */
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
