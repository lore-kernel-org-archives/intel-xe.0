Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FD9D5AE75
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 09:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8F910E0C0;
	Thu,  7 Nov 2024 09:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNEHXHwl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9961C10E0C0
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730971076; x=1762507076;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vIG6IDb4uYCOf/WPh9byfEK16j9zNq4zWhenXpHaSZU=;
 b=QNEHXHwlSRxz9HEHsBsyM3AMQYk4K2rThIMASOX3FQLDOxW96izrnUrC
 pXu2PKTgAc2eBvt+EvJa6zFbyR+iLhFrUBXxuJar1VbNTLH1aHY7ztTlo
 DunEB03KHOgwudmTsLv2oSqUfmvqrtDIfS9xkdwY/hFEeSenCHMZES4du
 Hegz71cN0hVLN6xl49cr4mK2qUjVs3O6swlVmYnlraShU42rtUUMY7E0O
 5EGdHUxk2LNK9WHKIveLFIrvAcE8ibdOE26/8+2RWlVaTarhMMOiUWbcV
 2bd27JWdWEz5pKchCLeliXMa3zpje303qpSJYJZFxfPm1mDgGy7B35IIH A==;
X-CSE-ConnectionGUID: nU5/+doJS6mEbhpVdBmSwg==
X-CSE-MsgGUID: OPopKm3eTqSZmIb22zEYKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42182082"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="42182082"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 01:17:55 -0800
X-CSE-ConnectionGUID: B60vW/wxSIaAI46k148e2g==
X-CSE-MsgGUID: UX0Q6uqLRmq5J/6St+Enfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="85187278"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 01:17:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 01:17:55 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 01:17:55 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 01:17:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKzENzEQLgY5eL/zw19OohbNhD5w4fWE45i993bPMvmAHTqY2O5OxfNd793ESZ6nvzNG2SpEqNRy8UzjVZDmyspioIK/WO7R3rFA8o0Rb7RvFjGOHBxx1hA+EvWLEaGcyUwYPNgYeSojKPxD3MApC7IzwYkyoC69xIwV9EUkXZ8xUySyMoUXImawH1eVoRnI438L2gDk90C520xK3W8ZsWS9uKE+OL4K+5qBq15ghCsK5ltoRl/VY0eR3Gb7YNNAkoU+cIrmsZUT6vGdcdQkMF34LBCfMhq9JFgkTCs444xsyW4eUeWusqBCEpa8ZhGRHjcFtTBRhuIFAVjmEel/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE5Zd6PJhzjeb4E2LqPIFJxNEDtA3zZ9AxPOIS9eXWs=;
 b=lYydNbXTEtantDR8OIEkIcl6CbOAaEVASTN4NDMz1R3gDX4aBHy17UEAFTKavtP2IpkpHQzwZlzXk23cTY7ZSx2eJvEk82iCuoIH6QX0Tjl8gUaGeyK7BNDqEhx7wIVLaHioebaac7mokHLBYV3xVp0qZvST+A1vJDiSj6GO7E/ZlcgMG2BhtGN0X2GNVzenFG/Ecrq02WE/v7/fUKpL9kUaksGqU4uAmF1SZ8Yz/px5Itnu8i6Upb+GrpdrN28+J7TKMtnL2S2k9r+7y8+TCWowmF1vbBBcNX+AczXogfdWHeN/TnZQilshP7zUfc+9BlxLRKEFgpmkWgCfHMFYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ2PR11MB8423.namprd11.prod.outlook.com (2603:10b6:a03:53b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 09:17:48 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8114.028; Thu, 7 Nov 2024
 09:17:47 +0000
Date: Thu, 7 Nov 2024 10:17:23 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Ensure all locks released in exec IOCTL
Message-ID: <ZyyFmdcrID8YFhFO@fdugast-desk>
References: <20241106224944.30130-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241106224944.30130-1-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ2PR11MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c63d8e-417f-49ca-8e9d-08dcff0d0bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pgzuI1uQx35c1lOPmDsVOADeiSWjAOYg7dCqvrCJoKmA3da8jtxonOocHnvA?=
 =?us-ascii?Q?6YxPCYUm75G28kcBT/LvRS0sOuqbZIp1ANELsuF5V0Yg5i0Z2hA+mrA4r9o/?=
 =?us-ascii?Q?VpRh92PmZBs3zippi42tBC7Fwn0H/avvtwInlR9WQPdBX4zhRuM5vy4vmSRv?=
 =?us-ascii?Q?HUGFOUGADy9czidFn8RjGUlcE8u88oS33JJBbBdOz8W+1eMPz0mojwLHZusW?=
 =?us-ascii?Q?pDMVMkPYqchhKuxrOkWgPgCMRnV3q5He2xPCBCw2v0PEPuJBr3Ig6o4WQmH+?=
 =?us-ascii?Q?QO6E7PGUw9f0gc8GlCbrsQ3pOd6cz0FML/HdFPz3yWnuKxtocff4Y+AOUktc?=
 =?us-ascii?Q?q4wg0S1fFr98LnXWJWsjtH8i7cQKj+6BS3qstrAfF4aB2cFufDxmHcdHQQ6D?=
 =?us-ascii?Q?clkoxmwmzFMaV/HqsTq5xednm7mPtS693TGe2a/59zUla/kvic8flJ7MX9s2?=
 =?us-ascii?Q?QtjYaHavtY58OPRs7qfW5ow8UZZrT+Yk8yQaLGLGvppgYLy5OKlX2c41GhYU?=
 =?us-ascii?Q?Tw+QgYHpYYcIY8BDH0pztjoc4sqyvafigE7+69JIs6rtXFVP3MILf4ZJhTrc?=
 =?us-ascii?Q?Ia13IJTjTfhCQ80+w70bpaVuXz4bnuKuFM/C4DTlelOf/glzzHHH7d7zYFml?=
 =?us-ascii?Q?vMLiw+WeOCWyq/pDT1hJqvdkiRpRt27rlBMmlpEhiax31RZCo6Q6HPGkdu/J?=
 =?us-ascii?Q?ZJ77zLdUKJiPNE2ycUm0WreKn+o79xRfD6+jJ6r72zZsjs6b1cSScQub0QIV?=
 =?us-ascii?Q?hS0kIP6bEdoETzXTARLAxj7HWOeoBf+90g6xjYiasldOveCQ5ImWYuPw2AeQ?=
 =?us-ascii?Q?9rVnO+zI7a99CYV3AAcEo5YP8QVNRyLQaCAjXyQFBM66A0MeMCyrCl+fC4BO?=
 =?us-ascii?Q?fIv21gGFhAGIMOYOWzqmlQeUpDHo8lYNB80AkWiLXj9JQfhSoeyQ/SRF71eW?=
 =?us-ascii?Q?zqANjCqb4AycP/98HxNqSbZuj+BRrYLOhzZ/kgWymMkGkj1sBJLmU77yHaeI?=
 =?us-ascii?Q?SG5vYBb51HcTk9vd1/xSGlM5/nN2H7l53pv7LyhTrX2WfWfNhIjF1O3zw/DB?=
 =?us-ascii?Q?iNOezQedqkvKi5agWr/5ujut/AnXY9+EQo4D//SfrwuAQmstY6m0TRbOtJ/T?=
 =?us-ascii?Q?/blNGNJfDYOqowpllybXFr7rN78ycfN2wnTvG+FP9VIIUclRi7B8lSxjhc3H?=
 =?us-ascii?Q?+L4TZuFCv95Q4UZI8ZA/VlTWP1VdSRU1LzBsdDNwFIjIiC8gW2VtkdvLsNNO?=
 =?us-ascii?Q?tRF1jDo9kPdrIlDqwh5T5U8yuYWLcCZlWeHAGzCAOlhf61yoI4x+O+LTpKHW?=
 =?us-ascii?Q?UYHvnm71nVfBN+KVtul1NA6P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mX5gzJYHEOenxgxZ8Ipj1XB0MAty8edDWLBds3+781XqACCqBGvNudDG78ge?=
 =?us-ascii?Q?8tUQxW85NmP/OUQe1RvPRIX5Xueq/R6+T/UUtezJ7iV3Ur9nrjKjllYX1Ykc?=
 =?us-ascii?Q?RgRKF+eZhwUkWvpPX4iR18gYXhOubzT1P18sgQKZoOiWDw759nVLsxgg506K?=
 =?us-ascii?Q?vH4EgnY3s8hA2in1NdJA+90vof2gQo5ZtWxJKD7MSqVsyQuqmCLp7ikzQ+l1?=
 =?us-ascii?Q?GoWIH7qFf2soqiifkEGviRqG8db9mB6XzRrl6gqGZAx8CT69kJhdUj2lcjYI?=
 =?us-ascii?Q?bj/lS4yiFDhCe0aKylnTGhCjCVlRyX1edsSqoxtz39gKe36mR+AhV5JMQQe8?=
 =?us-ascii?Q?fgnO3MSUTKeqxXQHotcBCOCMSZRoNLJh0uL2IlLgK5dzjCZ6gdIdzF34Ct8S?=
 =?us-ascii?Q?Bv/5C5mWh+Ib0WAp2L10SPAr+tUWRjZMg8H2LNqqSlJPgZqkF+xjMs3gDttO?=
 =?us-ascii?Q?KYiAxVFI1zwlu0btxKZL8XLbP42msjTxwLUSZfaI/BXSii6uotoqOaGypY1h?=
 =?us-ascii?Q?6M+sf4DFq5TA5NDNpRBwrBenbiUdXoSljHAnofrClXWn0ktrprzErw6JxCWd?=
 =?us-ascii?Q?Na/ZVPnHEldwgJyy+h606uy/0ArFIdGoSRWCfebFZvR9lVSb+lNCcTAV9idc?=
 =?us-ascii?Q?izn0sCoDs7NceY94JuI7VhMUIL49tNgD01l3Ts4afe/tVCBAlBMSb1AkRXwK?=
 =?us-ascii?Q?ToOnGkT2ld9u+IXnwBVIEJpoNAHhnhrMAF1puyRJWLwZWXxDnOW/ZOXkUxgz?=
 =?us-ascii?Q?rI21ytmiwIIrfFpQET/lM5D2fgA1JoibdeP1v23Wn2FQsIwRhptE+ZKnxWy9?=
 =?us-ascii?Q?ONUcIGY91ubod2Huvk0N22t5T8vO2B/S8j7Gistxky5rHZDeI8pdL9s1kr+u?=
 =?us-ascii?Q?7bRAA87NNNHF5zt/uql4hpBBdSCHSwcj2Qpbmkbt56Et1mAVVTE8j+a2d9f2?=
 =?us-ascii?Q?I9E4H7wJ8iTlejUPysyGWFGWDyQx+IMmKII34oXzPYdFj1BjPF+bokZpR6FA?=
 =?us-ascii?Q?DFBbSvi4itfepb1y2tjGMvewCOxfQOQ6/9qHevsBWLdyDGGmyr6hpqjB7b25?=
 =?us-ascii?Q?ysh1qnhPgzdYFJV9x6KCysmupW1i6cP0sZ7pDsk3i1Ol8Jug/U2EX7iF64sT?=
 =?us-ascii?Q?l1j7xyDkV2YNmc/S2WBzMORRwhqzGT+/n/2xY2uyEdAwCgGjggPu1MY92Ozu?=
 =?us-ascii?Q?ROQPU5ZaM3tahFK+eGkUvO2Zq1K8DdRmgXD8jdhGp0saE82bJ2sibHruNkYz?=
 =?us-ascii?Q?9aly/NYbgHdj/JTbeEH65i0YkKifg6eTIjNTHVnDWoxS+aT3vMANOpPv6LnB?=
 =?us-ascii?Q?XKqhhDZRrJsbqRHQ8GQq21jGYSYSemU5vYiSIcG1crPkVmmXOdLOHGwF9EQJ?=
 =?us-ascii?Q?pMFrLAjBQFRha/BiiGbGhd6Z3lqTQDB7vkE2a4grYX1QFxV+9uHKh7OfxJLh?=
 =?us-ascii?Q?FP+XLB8Yf+Vq53ULwcnB8+RHg6NHS9IwTatW776uXyzIOMoX4qOOC08CweV/?=
 =?us-ascii?Q?mCFwNqlwVLea9MmACdm52uWu4mesBCVDrPP7z5nbPOLly/JPaKUST0JA/N4A?=
 =?us-ascii?Q?SVU5Ccs5XU0FcKx5SIxbcozuF7v0PRioSDgZnZFt1bl2pu4MexEKs8BOtUul?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c63d8e-417f-49ca-8e9d-08dcff0d0bc6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 09:17:47.8584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0vdX+0sJVlxNA/7cnP0Plqye3V4bfa+Ob+6X/uFXFbWBR3R00npONmLRbcNZqUZjdoE4uVkxhACuVKuEQlpZ468pEPFJh7dupz2/7O+95U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8423
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

On Wed, Nov 06, 2024 at 02:49:44PM -0800, Matthew Brost wrote:
> In couple of places the wrong error handling goto was used to release
> locks. Fix these to ensure all locks dropped on exec IOCTL errors.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Fixes: d16ef1a18e39 ("drm/xe/exec: Switch hw engine group execution mode upon job submission")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 756b492f13b0..31cca938956f 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -203,14 +203,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		write_locked = false;
>  	}
>  	if (err)
> -		goto err_syncs;
> +		goto err_hw_exec_mode;
>  
>  	if (write_locked) {
>  		err = xe_vm_userptr_pin(vm);
>  		downgrade_write(&vm->lock);
>  		write_locked = false;
>  		if (err)
> -			goto err_hw_exec_mode;
> +			goto err_unlock_list;
>  	}
>  
>  	if (!args->num_batch_buffer) {
> -- 
> 2.34.1
> 
