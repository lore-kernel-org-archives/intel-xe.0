Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA7EC61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 22:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1E310E058;
	Thu, 12 Jun 2025 22:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCG+R34W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A5A10E058
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 22:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749768896; x=1781304896;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MWFdgvEs0ICT79iboF8UhvdWWHfajfvt/tfUq/0/Vhw=;
 b=fCG+R34WL3gPUndNo52Vvq8twD0scwF5c1zNxC4m+SqaXqU1s6tegQg7
 5hRp2MX72l6rHKb1hcKJTWf1v3qo0og9sTmhKPiTfBIl8kO1sQRe9wiXR
 D6FRwiyLQUmusmoz06be9ezijqDjqpYO3+jxaqv12MJEUJ8V49aYJW/8k
 VSvx28ZGDLm8Qf3o3pEoylGoiAUyARNPQM3uWF2hpf2vsyxM42Bv7hr3o
 Odt9Z4tuBx16S9Kpl4PrMhOqVpEua72l62obPbbu9OKVIBOXBratFW2qf
 BrMKgM9/XFrVmWisNXkXnIgyVNq8GO3d3Wt4qR32BV4okALLnTwVV7gMu w==;
X-CSE-ConnectionGUID: LnU9rokvToC5yxjc7bOn7w==
X-CSE-MsgGUID: u3nzimGiQxa+Ct3tbAQY7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63323128"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="63323128"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:54:56 -0700
X-CSE-ConnectionGUID: JeiQmcAVS6mtUc2CQOuKWA==
X-CSE-MsgGUID: 5iAJWP9+TIeTM88h/XU40Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="152943443"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:54:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 15:54:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 15:54:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 15:54:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBSMzuF7NLKEobtQUJs1n6qeyA6Tpz/JoQaSk4sE2cwSo+dLc5Lqw0nBSx5dgxEzHEuYU7zPMRnz7SwkBBSXZtMmKaoeP4xKq4TVG2ecEsKCZyK7sLUeL8PbNMPP9Mz81uVirS0rgfGQ3W3ut/e/Re4Q2+jPr5L5GH2QcqwTTAhdC6JI/GlIiFJrutjbiRtQjrhJW6fK2LY7gfNRc+qgLcg65enseCBLeRNjR/3lLclBL061/2kfAcMsPiOsJap2kl37TM4I/cuTD6QtI7Sc4Z8Hx9y4IuyQfBPjtTQ6O/tZa8GfKI7mMW2rAM5nl1F3wFRRXEed4udtw5hm5GLSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2DhxgiFqiBZpVkEPeePCFr0ebJj3U7u40ua+JaeZ/A=;
 b=WpmUCuIvlP5vTR2fhKMXNeUWuRZCdip/ucuuUVgEMfSCod3CHQBitFtQzUlUPUizX1/sDt53lgeerKhIAEYbKiEetC66xiKWkLkVECv+qPZPYe7FeXqHgDls1swngl9/OUn8ihRx4ZRS9L4SLL2qgZpVKiW/UQ4s98lVdQdxGxW/jBqCXdsShwjHtnLnYzJPHAYDV5reED8itvU0p4r6N5k7PyKq8c0h0ISmkJ44vLNKgXHm1CDpSiXEd6jgYR7NTVJAqWi5La5DnqYK3hyIdEk0gyZyky7YOOxLImatkwCdp+B5YhhEhY15yeGX/K3SK/q5nMFFKRvGsjaWn4RC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 22:54:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 22:54:53 +0000
Date: Thu, 12 Jun 2025 15:56:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Fix memset on iomem
Message-ID: <aEtbHSkl1/1JU5Jg@lstrano-desk.jf.intel.com>
References: <20250612-vmap-vaddr-v1-1-26238ed443eb@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250612-vmap-vaddr-v1-1-26238ed443eb@intel.com>
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4753:EE_
X-MS-Office365-Filtering-Correlation-Id: c3cd7a7b-d479-492f-eb9a-08ddaa04250d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DosCi5sdFwmQy7h0zZu4RvR4f7IuAB1O64jH7QSMZoRlk3wq4JUS1oSPtzV+?=
 =?us-ascii?Q?eLzf2/3TqVEnvqxbtv0UmM6pp9xT9eq6ic5Li3gNHKRfWM2zUmJs+lbZCdnX?=
 =?us-ascii?Q?g+40ukIHMdWp1owOsqmJq3VSCmZVDzm1Ikp1DgPaSAh1Tol6F0ajsjeyBib4?=
 =?us-ascii?Q?w5FqqN7W4xRZF0VLXzbOHWpMw4XlmjdD8zVH8sSvni4WU9+/Dg3HAWiR9fov?=
 =?us-ascii?Q?frpJs8Wo2/a7QWZhnvlvE1j0tZHiQcxKwTtoCohwlltXZ6/MF63pt2GL+Bkt?=
 =?us-ascii?Q?DczGrOGPUxvFzsjEJ0KbrMs5ksQIBiIIsPVwtOI4eBZ/8XYUyMuhN1qcxk9i?=
 =?us-ascii?Q?ph7NNyUHv2x0TOdvYziNX+dFtYwt8BjUbEFy1LpM9mCfchZcCrrbZ5mnBEvV?=
 =?us-ascii?Q?rR4w6pKS/RFSykIzr/stT/38pgggv2kusjuHXWbnPvFSBcSpVD8DIJWkTT32?=
 =?us-ascii?Q?nsFc3hqWRpw7DrWfxhY/5ZhdknOZ9enobpI8jLMv7f8UY8oL3vqibNeObauZ?=
 =?us-ascii?Q?oqdYoPaWyZrmk8RNw3HwTq+mrKo5fmjT2DMO5fAxlbL/PkYIIC35YDNUQU+O?=
 =?us-ascii?Q?ZtZJ3Zv9hBgHHRKUmbjW/j8svjE3TD3ynpH7/EnpZTheqBtMrZsKAMGZk4al?=
 =?us-ascii?Q?hJfVfqa6sl6lUQzFKCFH7EyPNfT4puDJrmk1Q8zi9lRuUSvDreoSCnylee+G?=
 =?us-ascii?Q?KYfBR7GjUKFKGhOoDjc+lpYYoADTV8acnKX8MPqMJIuR6ddKtlYHAdDY+cuD?=
 =?us-ascii?Q?7mNLbyMTdlAj4FeNeLw9bsd1dgP080DcyvsfHdr+4nndZxEhOOllO2fXuUd+?=
 =?us-ascii?Q?XEV4I2nHQH5W9i0qma9FM1JM/AZqQORxuAkNvYJEK1JGnA8rV3o116msB0Bx?=
 =?us-ascii?Q?PR+0p5YIQWuznAvhzqh07aRIBq3xkvYv7zpeIRcFtFX6fUfgu+Sq+G9p+Dey?=
 =?us-ascii?Q?tJL5up8IXz8Ony1z+eBCHlx51buDzlbbQh8yKZUVLVZxy5q+/vtOfSL9yRKT?=
 =?us-ascii?Q?9MAzjE2ob0ap2ORHynMpPdkpAGNcZw8geifgv4M4wcXSB1EjEe7YGGTNXDrf?=
 =?us-ascii?Q?ILYnwdGwt+ZNZQaxjkzKHVK4Ds5XrP8pNb8dB2E+UCXI3ZL41JufRDPjv4Um?=
 =?us-ascii?Q?RQ3Rv+2acZaNbBzeRwpk6GmTTLLHE2xx4fWqAQpaFCkKK1w6t2D+v5gd4inl?=
 =?us-ascii?Q?WUB2uvUENJ9DaS5MbyOotY/sNoFBHyX045+tAIubDvZbWtoNxXcVEDDVL8jZ?=
 =?us-ascii?Q?sKpG7Ra4AJcWpIIlbUdioXq9fix1I68hMF+1UXj+cvR/S7RoUWbj8fN0f0SO?=
 =?us-ascii?Q?Baqj/KViA1Vv2/rEsFJawTwdzt68Hf3SAcrAudypQ9v0EbVxcZpdXlOVTYui?=
 =?us-ascii?Q?/ECpLrvn82QPbdv2EPn0VcfueX6KeQEJ52rso89uzDXxryjBDLU5LmTNGob3?=
 =?us-ascii?Q?/Tm9OhBalMM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xgWVvvPLn1fXmLAbj77ArMoO0e8NrQMzZj/1tbxRuY0+h+ZzcfT3wlZNkBk0?=
 =?us-ascii?Q?ftgNC4C+I87N6f1RGEN/fL9sCv0cmYsJG1HoeOmnDFkP3bIDFsrv8sAQBPCh?=
 =?us-ascii?Q?7hdbU8NOyDuRwL17FOVlQYNt7p2b2CyHz22qY7tL+k3cMXCGmeqpnMqnta98?=
 =?us-ascii?Q?i0dCJK6gADb6vnovaQBF85gZCjpUp7mUMOBNgLtWjsgdqbU5tFsGmSsgrVvj?=
 =?us-ascii?Q?6sFqgsyUsJCKxuDRSMY33CB+tNrDdpdn3EnrtARE3/Y8Z4J1TgyNqcUTn5GB?=
 =?us-ascii?Q?uXfPazp1nRYtgMAoO26+PauIC3Ri9HSewkVWJbfem1aJOU85jj1+FYheOr3q?=
 =?us-ascii?Q?RKw9U8hK0qP7eGnV1qAmxMR3GpuHgBcnRs5qhq5oAkWkNRTAu5Z/jVakfdWD?=
 =?us-ascii?Q?bCfMU8an9egeInGIBm3S3pp5R5uN3kI8eMWuEar2K4bAnVC3YvglmK+eCY06?=
 =?us-ascii?Q?8UAvKJqYaQLn+TSUL9QEdfYcVHgfAXkMJItaYhnzuxUQsjR18htMHTvDcwty?=
 =?us-ascii?Q?r4TNddGMQ428tZo/7vYd0bWe69tNfo0Ow8RM8jfiOX+OyWpqRWhAh0ckEW41?=
 =?us-ascii?Q?v7w7wYJMcKHlMT0+njumhsb02XnmF8fuD6f5hTUUpi6kenbIXDzeUxEPFzyY?=
 =?us-ascii?Q?wsoDq7TMv7rm/M2u3Ki0D3IEkA4f2wshXfrppvbgEMyHBIugkwn1YusaEM5t?=
 =?us-ascii?Q?h+dPrY149HbM79Y79HwqzipCCt6pCmr8nR6GN7KCEDNE4f/XsBas5uwOYb2M?=
 =?us-ascii?Q?BqH+Ar3Kf4ZgGIDKOGRqOZ3fhgzcfUTZblxA05EMT16duzPYdFyG6pOA41OS?=
 =?us-ascii?Q?g33+TWMwf4PF334tjscXPDbz5mAOsCMu5mOapnjUEj9UNC316yF3+pPX9TQJ?=
 =?us-ascii?Q?FreQPFGEOIWQ18d2Eef3nquA61j8pg8ckONFN6zVCxHBf+o49sS141VWS1EH?=
 =?us-ascii?Q?bJqwMLt2RUHQlM8evKd3/dj/Pz/wwp2AJmwnVmcZqi46E9SiaSXDhzy+xecA?=
 =?us-ascii?Q?UQgH/aKncuIyKdpFZ1LEBJ/Ezr3qoJ6qbT7iblJdVJReIel2b3ra08dF/dax?=
 =?us-ascii?Q?9unPj+2NHDigHqu+GCi5/TzDwyJ4eMTY45dhXvbFpVd4dGujTUBvjKrSGC7n?=
 =?us-ascii?Q?i5z4Jgl0N4gvaN7AQPMpJUQ5QSu+RFw2W+a7HbQfClWIfhwbUnD09emIi1uZ?=
 =?us-ascii?Q?MD0WdfZLLUHEpx6gAACAMd1UVCRwid3cCaJO8t6Jj74yTHVLFUX3bF6ZSCQm?=
 =?us-ascii?Q?1wn75KKsq3kbhO5R4FE1+baFRsYT80SCNsXlEzUN8HiSGOmUvyocA1DmKrb7?=
 =?us-ascii?Q?f4lktGUnukF2TwLvWkK15QBtopD6KT42uTfDjlhqR11NfsOUAeFOEIAZjIkv?=
 =?us-ascii?Q?qHthwU18K8IhhSYWA6EIhyVvoTlr8TFMyBJLcaIksBsPBUC81DsQL+0BopOO?=
 =?us-ascii?Q?2wdjPvOx/UYNRPKQ/+W/2gQxe/8Z96dmohSZem+fgvIv549iK+ufQipJooqd?=
 =?us-ascii?Q?q16tXFv2ZX7CCQrZDN5p7SFSbK9z35SSIs+g6B3AM1uoOz+8mfaX5KN2cn3q?=
 =?us-ascii?Q?njIZLORZ3g769+oQo/d8nRcHHdJTCA1+9UF7W9rd3i28MRiaE4tg0fa3BFIr?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cd7a7b-d479-492f-eb9a-08ddaa04250d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 22:54:53.6148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bW+KUoHheAZVJmaQCayNJZByZI35xdU/AhiRCq2DGdcBZ6ie3IwJYfAzzpaqP6Pvu0BFUwxM0ws9qkDVQHDgfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4753
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

On Thu, Jun 12, 2025 at 03:14:12PM -0700, Lucas De Marchi wrote:
> It should rather use xe_map_memset() as the BO is created with
> XE_BO_FLAG_VRAM_IF_DGFX in xe_guc_pc_init().
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 18c6239920355..3beaaa7b25c1b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1068,7 +1068,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  		goto out;
>  	}
>  
> -	memset(pc->bo->vmap.vaddr, 0, size);
> +	xe_map_memset(xe, &pc->bo->vmap, 0, 0, size);
>  	slpc_shared_data_write(pc, header.size, size);
>  
>  	earlier = ktime_get();
> 
> 
> 
