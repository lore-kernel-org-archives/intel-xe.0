Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D23C282C1
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 14:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7D410ECC2;
	Fri, 28 Feb 2025 14:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIurx68H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C3810ECC2
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 14:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740754628; x=1772290628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dVNxhiKLtWoFEcevRXdL3O4SJgsqzlNnT3cYgWd2n/s=;
 b=nIurx68HIO44iPM/36IiSkm485jbj4f23+QsHElMpz+NraZ1fMJgCViM
 e3CPLv3aVSNqUdspi3eKLuDWrScakCHxLpR6Sm06xhv1hW8pzcROHNh5b
 mLOcpkdr/n0v9MdCDS2ZCSJmknxJLgD07JTE/F16v8xrL9t0kNuMIhxnR
 dseJDEcq4iOcaiX84t2kRRtKEvfNZGlympw2mx8GudoILoLtK3O7QLs6V
 Y1BHDpp8oYVDm7ELfAmyalT8CdIzbhuiVWSvlId2V/xRuPOLPS/ecwekx
 vFiWG47VwJVArf44qdNU1TskYe3lxnhcY0N95ry8Y+tQ9iG3kzRucHjG3 w==;
X-CSE-ConnectionGUID: AL4SkEn1SLqPISI2DR4k0w==
X-CSE-MsgGUID: 63UfsSmFS1K1kWidL+WNqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52670716"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="52670716"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:57:07 -0800
X-CSE-ConnectionGUID: 1AxSQvu0TyGkWZO0Jt9xog==
X-CSE-MsgGUID: J7U/e8snS3yb2586mEPQEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="148276212"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 06:57:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 06:57:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 06:57:06 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 06:57:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVvZrFmsYbm88rw+Gu8v/rnh97Ib9AuyrB0bU/6SYB1v1egyDcHdGMWeWK+l/M6eoKOhcNuZMdoLpB7ZyJG4rpIX7tcNn5pNb0QQxzPjo1ZLPzsaCSPJk5Y+WY0ujk4GHDiRNBG/v4Ngeg2zFlecwPrRIBwVKWhLKKw9Xt7fVbClk9KdP5iE5BcHGZd4RKtWepTYEhVakrnV80GZc+n31XHFWFIuJu+/+3ldiJEwh10XvoLslbYJLHtODylLPIwRofZaLQ255j3yWpk6XASfEGiZBijqjVGbsZcz4cYWGd0pWcBbH1PphgsqMjOYN38IrPMZcbLFsgJJMoBRnI7tnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fxw4n9Cv4Pu+3/OPI3C90q+Ggx1/m12nKZ34dvGMvcA=;
 b=CnjL9kGHf5e5/KKVJfxV49A/iw0blsOMZ8lP5IpinGoAFLzEACIGCUh4LY86uiQ9RAGtdLazgbNP2zL7R7nEqjj92V8L3LaIfuvqXVP85KW69kvfqNY0jArmdfx9bC1aQGfNnyTK3Fy/yho1jJCGsGLj2jqxjGAgpWcyE+SDYfzJZmwRKPK9yW9le0d+mDZNpG3ssKjT2Gp++K1v1qSMLuHzINWMB8x60akZ56HAILEZPXCcEzBvxuwoIajht/kOSFjhhUHyjutQOfq8t1vIE7ql2Hfusrla+BkNLtRX3LJo7DZda9fhKODBPgkNegU4Wh0UWM1hoR2rQolLu8kTqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH7PR11MB6770.namprd11.prod.outlook.com (2603:10b6:510:1b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 14:57:03 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 14:57:03 +0000
Date: Fri, 28 Feb 2025 09:57:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 05/12] drm/xe: Use correct type width for alignment in fb
 pinning code
Message-ID: <Z8HOvNmcDFLEmAqT@intel.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221101736.78986-6-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:303:8e::8) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH7PR11MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e710f68-dc49-4752-e13a-08dd58082911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HGq+pOgV0F8C++Qmr4qkJwCjvnO1v4pszQoiHQdi9OYxUIRpTGVAc4s0/iAX?=
 =?us-ascii?Q?2m0R4M+7EPwUIEfZcBXpDRaMuPB2xV1zMRKRJSVIArwCYwW/y7ZJHWFJC0az?=
 =?us-ascii?Q?stWLzPET2wE2yUd0i64xFFz5DLPnhe+Of9vJibGz7QDnLMaoWL1qjN0ukbAr?=
 =?us-ascii?Q?9bOczSzirj816EvA0EAVCwE6oH9Bh3ULLiO/yV/DFm8fLNKWD/6d7JUwZV0g?=
 =?us-ascii?Q?XFfyHLLAJhcPmG4FjjvAex9EgtFFx3iMN8zK00NYtTMmA7Jzv5Re7yqVjm6v?=
 =?us-ascii?Q?Eq47sMpX0d3A2rv1fveCTYPu0pkwSvzQ6UPrfdh7tH00Y/npT4zGiiuejuyI?=
 =?us-ascii?Q?uvwEJiLLc91byhs9NujmHyo0a+zYNb/EkdfbrcYas8T9Bv3c3BhVPXdYdh6H?=
 =?us-ascii?Q?ZJ1WGFqUpsT+SIIQXgUZ1xO2WLpW2+vTCVmtH30czgWN/h4qLOCWsTT3lpkq?=
 =?us-ascii?Q?tyyfbdb1hPQHGyt8nyx7zZAD4hrNyaiaoMcoYZnJ7XFokcBwfZbVq0e9KKK3?=
 =?us-ascii?Q?X/+Adeq/vj56Y+nwItiXg9u2FzOlWe717h4m09TnWMa9mkqzl+3+uxsfLuHH?=
 =?us-ascii?Q?BOwsk8YbscpNgmq8DxIUOdYD/tCbzr1cLXlmR8krSZkXG9t+5ljtOs4mdXTM?=
 =?us-ascii?Q?KwE9ZMWTdBYdE9E7m2H6t3r1mopsPUjlq2ZWm9myj5/H4bByNXujKvLEyDKb?=
 =?us-ascii?Q?DSt9/waw44FmB7VqS7elnjmevlxpPjCi7nC8t8R3nDNAv2Rmycc0gn/Fnf36?=
 =?us-ascii?Q?rZgRlfRRFV+q4lWRnU076whF5lCtqFkH05JTGgt7Mu2xonhgxrVDklcaS5wQ?=
 =?us-ascii?Q?kDHP4GuD4euLUd4mPg9YHKGotkfxg8YzkO3fsyzQnKqYCsRX6DM2uZLFdjbu?=
 =?us-ascii?Q?M7kW14iIWrMItHLeWdXnaxnMx8bTzL7M4JSM/9cGNqceAdsuhG7F87wTFGyi?=
 =?us-ascii?Q?3sBz/OJM6Hyws/eSkScpF4TXb0FBlWLkYCzFrjFS3NBTsvExIUBlsRQiVuxJ?=
 =?us-ascii?Q?+4ovtNsH1jbnZ4cz5PXkk1CXYK9oTbD1MpmHksaJRoeXI3ahI35jJ5Km2L7I?=
 =?us-ascii?Q?rboLDQubHa0KswkrIsHsqx4h6dbIgpQPCJkl+MM5sz0fkHKnXL5wtAxGVysz?=
 =?us-ascii?Q?mry2OZs7YvG5nmfmRlzf4YSE6bINfHnYdaN9y15jIpOJ6zOFsgQxgXk2JCLu?=
 =?us-ascii?Q?+Jfss5rKjgfNy1R2WWpGSwQhtzgd41hVdchUc05x1iBAWk+2lznBUWVf8dYW?=
 =?us-ascii?Q?9JQWqO5n5N5L7MOm50KT3FAc1HJuBqA4FTKm/zS4IFd6zdJy+J4/1x078V+z?=
 =?us-ascii?Q?jJsB5RDiToJGK8L8/OiCDs81LooR23bXYq+nB01AqIUVXEwe5mGEWWEGBkvg?=
 =?us-ascii?Q?1J269AY5hDBUb3p5uhU63R76EQo4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2dOeAe73r4rUNyrlsMt9yygEjrFE5cdJkMI9fYD3OL7d0z7MbDc+TihtP40i?=
 =?us-ascii?Q?cP0jejkAhBqZndOE4IvQHH8HDsDdZXB8534kW8fF4MJTBg+0wKzzPK1Hy54z?=
 =?us-ascii?Q?69cU9L58HknZnkX2hrYpYyiVODN9u4bgfnB9YYylFNqFwgAjUrc8RN/zF+99?=
 =?us-ascii?Q?53Kw1spT3FNTL57XZ82smlkBrWQLBUjDwgu0AYsAI1QhmlUx4q4l5bX0+IGF?=
 =?us-ascii?Q?/TunvOzgO1hLxt+d4M+xljSMRyqoVg20jc2kAppdSOkjyrTqVGqjqomBmOlj?=
 =?us-ascii?Q?NxxKj2J1VyluHiaKUCpUv7YfzTU4NpZw7Jgray0VDYsgZ8lt1IaOL+L62Sj8?=
 =?us-ascii?Q?b59SEYQWvKqLjvqPDigD3PNAwDJh8QyC4hcLFiTCYtRGv+4oV36jkuRI7Cf+?=
 =?us-ascii?Q?LVELu51WHZG4QCnOcjL0+4nZrEeqyb2EjjekW4jiN1sBbRSHmYERNvAVT4Lq?=
 =?us-ascii?Q?lyjqpKrGoXMkLhyG1cffphabtjOYtrb0w9yNDGhMfetk/Wm5a4KZeVzGbcGP?=
 =?us-ascii?Q?xvMFKIf95L+tc66uWluT8qcICPiUec+v2AdYFnyekXhRSBUL+ZsilJJGZO2k?=
 =?us-ascii?Q?7SPHtPqPFR6rH4veuUJL1S0wKeo3ucAqBR4tj9gqcY7xuxk3m0rzvKxx9ERm?=
 =?us-ascii?Q?UZLNKGc0TeY07PU/0njBz8ltq3GToOzjbrYmfz2BOlCg4pYg5tCgxDnLM37p?=
 =?us-ascii?Q?vZ1h7YvUnYk/OJ8ZPec8shsqLuVDgCbJV2ZkGH9muTfz9MBkeWvse8zG9jsi?=
 =?us-ascii?Q?y5fgDTP0YyXAFI5/t1rvx3fuUUXY+VC8UGUmHV9SvosOB6xz0fOhOFgt1w2T?=
 =?us-ascii?Q?guYioV8d2fGt/Ul1CdzhOKO8AEevRpuK03T54nkjtLk9bFBPbVeA2IpIB3+t?=
 =?us-ascii?Q?xRME5YtdE6fHCoIFZTaJiklVjeiZ8opfZFU47A1OBp2gYknKGhL53tPhmi5M?=
 =?us-ascii?Q?vWn91DE7S3nyPZz77XPbL6YEzQ4JG6joXFTC4tI+Oysy0mrZyrNW4rPwrQ38?=
 =?us-ascii?Q?Qk97fk9Z/t+XBEy/p3hKlrU23Cwuu+2jf6AbkM3OQ/I6Pian7tv3leeUuiM4?=
 =?us-ascii?Q?1imR5/fGZh0T1hYKspWvZnyKCgcMb4GN6D6jPsXv133WB8vHSLAuhedyYHRg?=
 =?us-ascii?Q?ZUs1frqhYy24rEPnSoEkrU47BtfbPsklvOQp95Ozo2N0O7r4sFt9frzW6Yy/?=
 =?us-ascii?Q?rMzupF6ztPC5N+/IWoT2qK0pfvoDan5bAuF7WbUBDZfjVnnELRnR1ddgBA+K?=
 =?us-ascii?Q?aZcKcyoyItRtO0lErEdcG81UXzKF69Q276btrd+pFpXME7huRNPtE4a3T8sj?=
 =?us-ascii?Q?s+QoxM7Nss6AojCHFAgiEqQBZasTP1nCcr7iJlEaa0m45JiKPzv/ylzgdBMo?=
 =?us-ascii?Q?OpREIARcJtiwfBwuMEOmRfLdz4sGW7s0uQToTSti9V+PQaEfw8b+MqY14nZV?=
 =?us-ascii?Q?6W+vDKJBYl1x7/AnnWHcGgLdZnKlV//efMEpCqs2FyGCXzkP0T3b0p0zANqf?=
 =?us-ascii?Q?GbiAF0TsoTs+EVyIDDs3KkfxCohap+0I2ahIXS01eE8sx+qJbv/8tKAvM95m?=
 =?us-ascii?Q?HFzwLkicsjiSKmJpV+XXBG+Wbb5koA6dGD76Uj3CCnrsFJGepCJeg3+IvhJD?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e710f68-dc49-4752-e13a-08dd58082911
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 14:57:03.1003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +P2Faj55lbzAi+p8JlItmW5eaKgK2jFQ+ZxESk88936TUyevO3qKTz4uVgq82+RGSdAi+Yk3r9KQMZLU5uwjvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6770
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

On Fri, Feb 21, 2025 at 10:17:24AM +0000, Tvrtko Ursulin wrote:
> Plane->min_alignment returns an unsigned int so lets use that in the whole
> relevant call chain.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 11a6b996d739..3df51cd4a86b 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -81,7 +81,7 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>  static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  			       const struct i915_gtt_view *view,
>  			       struct i915_vma *vma,
> -			       u64 physical_alignment)
> +			       unsigned int alignment)
>  {
>  	struct xe_device *xe = to_xe_device(fb->base.dev);
>  	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
> @@ -107,7 +107,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  						      XE_BO_FLAG_VRAM0 |
>  						      XE_BO_FLAG_GGTT |
>  						      XE_BO_FLAG_PAGETABLE,
> -						      physical_alignment);
> +						      alignment);
>  	else
>  		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>  						      dpt_size,  ~0ull,
> @@ -115,7 +115,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  						      XE_BO_FLAG_STOLEN |
>  						      XE_BO_FLAG_GGTT |
>  						      XE_BO_FLAG_PAGETABLE,
> -						      physical_alignment);
> +						      alignment);
>  	if (IS_ERR(dpt))
>  		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>  						      dpt_size,  ~0ull,
> @@ -123,7 +123,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  						      XE_BO_FLAG_SYSTEM |
>  						      XE_BO_FLAG_GGTT |
>  						      XE_BO_FLAG_PAGETABLE,
> -						      physical_alignment);
> +						      alignment);
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
>  
> @@ -193,7 +193,7 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
>  static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  				const struct i915_gtt_view *view,
>  				struct i915_vma *vma,
> -				u64 physical_alignment)
> +				unsigned int alignment)
>  {
>  	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
> @@ -276,7 +276,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  
>  static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  					const struct i915_gtt_view *view,
> -					u64 physical_alignment)
> +					unsigned int alignment)
>  {
>  	struct drm_device *dev = fb->base.dev;
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -326,9 +326,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  
>  	vma->bo = bo;
>  	if (intel_fb_uses_dpt(&fb->base))
> -		ret = __xe_pin_fb_vma_dpt(fb, view, vma, physical_alignment);
> +		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment);
>  	else
> -		ret = __xe_pin_fb_vma_ggtt(fb, view, vma,  physical_alignment);
> +		ret = __xe_pin_fb_vma_ggtt(fb, view, vma,  alignment);
>  	if (ret)
>  		goto err_unpin;
>  
> @@ -421,7 +421,7 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
>  	struct i915_vma *vma;
>  	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
>  	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
> -	u64 phys_alignment = plane->min_alignment(plane, fb, 0);
> +	unsigned int alignment = plane->min_alignment(plane, fb, 0);
>  
>  	if (reuse_vma(new_plane_state, old_plane_state))
>  		return 0;
> @@ -429,7 +429,7 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
>  	/* We reject creating !SCANOUT fb's, so this is weird.. */
>  	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_SCANOUT));
>  
> -	vma = __xe_pin_fb_vma(intel_fb, &new_plane_state->view.gtt, phys_alignment);
> +	vma = __xe_pin_fb_vma(intel_fb, &new_plane_state->view.gtt, alignment);
>  
>  	if (IS_ERR(vma))
>  		return PTR_ERR(vma);
> -- 
> 2.48.0
> 
