Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FDAC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660F010F3EB;
	Mon, 29 Apr 2024 20:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSO828Tn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0151C10F31D
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 20:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714422586; x=1745958586;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7fTQTachNVbp3i79QOquB/2ZwqR0bsyE3/5AA1JYHO0=;
 b=iSO828TnDJt9OJd1KJlTBccncFxKoTmGCVgO7AEKE6kNZ310j2WcdfVp
 iM9f6SIS5OKbOqGK7VV2bCqN44lXYgvZFviO8aqaWlK4PnPBXjU7Cc8k4
 hV9jWHT474fZJJEYTQCvlnVzcRDQwcoQNluTZ/DPRPxI2e+1f3EzqxwZW
 vTlaSDqPZyNdvwiZTLRr/DxDipuI+vTOXiLWPNb+qQThLNJQ7n0iKk2PZ
 0N1/DU1plwKdRcCDLRkwKzjxjsZ+tOvZXtQCUpeta8HaKGt9YZ1pACBiw
 LnK3bOCtnetMwqGrzhNrMXsIWzZK1K4M02HkHd/d7TkFUD+jeo/9RwYfp w==;
X-CSE-ConnectionGUID: wfmPT96SSLKC0mSY3Woj3A==
X-CSE-MsgGUID: AqwrRGblQDCHV87HhavMyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13033983"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="13033983"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:29:46 -0700
X-CSE-ConnectionGUID: nzmgD1POStmkN42YABh3RQ==
X-CSE-MsgGUID: zTaEqZfKSXqjDsDD2XwWSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="57423564"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 13:29:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:29:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:29:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 13:29:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 13:29:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YB8za6PKML9uZGY3HB/N3ZKM+MoOUgM3GB78tINhCthWby67uDQiH9kfx17EZug9uqmcK3TKOjVSgHGKwHlNBbaDce61kggaSHcsSFadlIW+g7sNOxq0upZ+YKPC6o45qdnmH37z9U5xxvP4IiN0QhUBb6/SsnZafRvIKxQyyX4K0aFPTA/3WpK5vnRpWdEFGcAkGW03fYfbzC+zXAyubVo/6u02cO3xuV79TOupWHyqPi/8RCx66yUvdm1jcb/IsqFHnFog9Ki3HhGkdMiGksCs1ecpKRSV5b6lclhp0mXaEL111jZBECCwmYMjpa+Ft4sXB3cArt+jSAC9WRryGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPfFwnZ/EX8P5Oe6YG+J/GOCPEgPRVG8I2gxb9c/pic=;
 b=kVCenLmjuZg3mUveaHkuLKo+mBwUTF2hLO8OAZPsmmTn5QSokhh8loHMnaO+UEAkE8KEftgO8gbbZ0KgKEQe1t1+mY6x02uv/B9LELaSmoGRDhkzlGRCf7Va9gZIGYJy6gIIuEQsdAJBo/SZuzriCJpY9EspTUheUqFdCrxyJRdZ9tH4xUAwEgljDEaVNgDnac8F6WGHmoqOkQ8yf07ubbw7Bm6Ni3ghGkK3vpTWpi6VKpyX1BFUXWyYInu5iXGO22+461Qoix2aAsO/Yc4w+CpOmIoJZ9vJjncl/XU41BL8+KtCFYQp0Gl1eNVMxu05+sVvRgy3peoGLARcponDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8112.namprd11.prod.outlook.com (2603:10b6:806:2ea::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Mon, 29 Apr
 2024 20:29:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 20:29:39 +0000
Date: Mon, 29 Apr 2024 16:29:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>,
 <michal.winiarski@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Drop __engine_mask
Message-ID: <ZjADLvXstooUQk58@intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240425182410.2705061-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:303:6a::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: dd8b19d7-cf9b-454c-afe3-08dc688b17e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?frNZuKhi+/rDbFBoqCzmXCrRZNPZ6r/Q2jC5CfVQV3mHWRzujRfa7awCxkOu?=
 =?us-ascii?Q?El8Iw5LdyXjcc4VphDK+bNXzdjLxOZg1E/50MLYhyeNsosJ+VQhc21tMB4W2?=
 =?us-ascii?Q?Mxey8r0o6hrQrra+eF/GkMDsXZGZqLtixzJ63kQWIAb+/9irKizpJJvKLOvY?=
 =?us-ascii?Q?ijC8qDZB9kZc2zuVF3+Dwxk3O/1HYomZUFh1CZ3Rt807RWv9xTzIDVRMXPDC?=
 =?us-ascii?Q?FPtHiD1uxiN2QcE6bNY55tpj55zyO6lJntbU76swIFnt+tzLsoKK8tPyE9P3?=
 =?us-ascii?Q?CfFJDC45E7A7B4KnKuT2amQH9pj7c/mCKDJFk4RhroMbHmWRikhC6htEfUer?=
 =?us-ascii?Q?FqljCDz3mVIyhKkaENjNqJQ4YhC9TUqfiP7GCrc0pnVbZpfewfeliiwOEZ8l?=
 =?us-ascii?Q?mZrNqZXrplTyJYhSXbpxKBfeqitv4QD9jGGLegWuYnafilHv9u9Lnxo6PkxH?=
 =?us-ascii?Q?0wICmLHwYIPSmp8SkjEfXr/ef2/SXMjZNkLt/oT3RU9FyAJK7uvBFQrqaqVD?=
 =?us-ascii?Q?AXRdTlHRhHIbPllk6QFE3a9WapOIn//LY9b9puTA1jWodFxou0dakH1JnG9K?=
 =?us-ascii?Q?eGcDO4Mgf4WO6B0DTkz4TwJD5ECHjsCRI6xBCRlJNNM4mAAwB5RDj/bWE1P5?=
 =?us-ascii?Q?x97lrEUumRwds2hsQu/Mkot932xvpWTcWIfbjJjpfRzhstbXWX2i6zi0oE4q?=
 =?us-ascii?Q?u1lNVDxbdxRzMics7diQeibdiMozhQ3oRz4q/zhaMigU1bj2BwVy/efTZOh2?=
 =?us-ascii?Q?1VhCqh939JGjwm/R5ieC8WWK+iZ4Z+3Fbb/T4n3NgGFIEPFGEMoOqMQEj33x?=
 =?us-ascii?Q?tuL0cP+yKuV9nF1YWBbgWB9SHb/4QvEGtpntgxff2RcO0tBm6Mzng0yJlz/v?=
 =?us-ascii?Q?tVORPMDTT7hl58WXMJCussOMKmMZwfG4KJul/rhfLl7ap/Y4IBX4TYEYwK2a?=
 =?us-ascii?Q?80tdkipCI3TmtAD7SN9NRDiP77aQwAmvM55dKchgEjV9P7jstXch8+hqgDDs?=
 =?us-ascii?Q?/B5k7HrrhmyxBCpFamsIKmWsstKfFWGmW+tva+rQwFye+uYWhZje+VB1c8JC?=
 =?us-ascii?Q?0YOLnGaba+o+cOGrQGwQwtFKXpfxwTqH4zpG7p41/ddvAYq2fKpWtCOGBxPc?=
 =?us-ascii?Q?LVMQtWrcGjESyE0T2clwEpHKmvpP7HLolRX1RbK76ROXvVCBjq5ymUApCq1c?=
 =?us-ascii?Q?7xbnzXLMvbN7VaG1O1eC43ggpPg9b9PeN4ghR93vNrzQ1dOpRwlgOrwXBeqr?=
 =?us-ascii?Q?c0fu556TgNRVfM3VgR3cqTBHRgcPAHq0+/XI+eFu8w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S4jvrFdqmHN09cUZZr3sa2uaTjQgpI/L02hnYEZ9Rn+xjuIvX8iDDrVN4zQY?=
 =?us-ascii?Q?k0waAZVHiXROiBup/8frIP5BWsov7+K6FavasamCjar7+5esfVvshvr9Wci/?=
 =?us-ascii?Q?ktDzOrdH98hTwEiSqLYPSaKOwIb2DxCfoma2tpX5NJEx4sCov4GkT7IiHNTA?=
 =?us-ascii?Q?2xiR8x+xkOgixazq53TPPomtEWRnN4QCW6vOvH3hT8Ozkqd1L01RzkoealXA?=
 =?us-ascii?Q?KpRFbu7+xzzOrTaUprQBwHsvcQUEQCf2+EOGYjb66jQ1p+F53oVNzfV2Qkyb?=
 =?us-ascii?Q?dHnUGagtVPY4uTqSrKEEeOcBxwNmJvvAz9fPrnZlielpEeXNflDWw62OI6Os?=
 =?us-ascii?Q?uSYSKKuBKNX5CMosrShNm3T6mfrzO0AlLRMDgR/ggzrwN7/XckNX7WOFvfeC?=
 =?us-ascii?Q?d+IybOWbOWxXB0Xp/ZSP1jZCrpFiugt7CcRWMwU0O1eU1zT6rDQRMuKqiuXb?=
 =?us-ascii?Q?WhpYum6FNWPQscSyolGEShVMeQvAOtC8wHP7EXEAY9Hrqn5Gax79zZdw8n32?=
 =?us-ascii?Q?+obOehiU7+DpChnw/xAmhATM7cixkpPf9DF/OZrKU7PIYQRTPLXogQPXAxhW?=
 =?us-ascii?Q?vzRtdkp5jGCNBDAocUJWbVE9+ncQXHzNQ2rAS7Vi0LxUGmPT5+35wmlprpHL?=
 =?us-ascii?Q?EPJ9xlRdj03RqRy2KOzFtqgb6cf9x0yIKHY18AEs+q3tSQrjPmP2Q6utQY3J?=
 =?us-ascii?Q?ddyz3WEjGzbgPXHB85q+fx3Qk6/rJkIAAqWf8WPZFcQjjw1cz3PUARnXAj9a?=
 =?us-ascii?Q?uUatOiMfIDYSiq/RdeCdNVeuQBOTNGeQfpdlTRrXP1gdaPxc1AUnlViQnrmH?=
 =?us-ascii?Q?46OfrtKtZRhpSt7fqOanfLcTurmOx2vufCCUjR7hgyXyEgAaFKyLtTDNUpl/?=
 =?us-ascii?Q?wx89UCCW9fzWISCo5hr47WU+RyiFGf+WCT6g1KhGki7/RWATNJ/+xdShSFZU?=
 =?us-ascii?Q?fT21xH8nMAN2oDPsvY9zEH97iyXcoYkiTc79WotepyeGbypLNovu2I7IERu7?=
 =?us-ascii?Q?kPOUXk3BlvWYjjL3DAl+05rVCBx69qacaz1Eo/LFhdUCGYBMehdx6VF9vt0u?=
 =?us-ascii?Q?tI0DZH00l5PJ0uUcVERmgM6FdRrGh+uxw261fzc7FdGxZHnyNk6whADX0Nh3?=
 =?us-ascii?Q?Viuu/RJEwKds1C+OgVdeQ2iVeSnrLSFKVc7FLvfDDzuRYZLSw9A/IZA83/qf?=
 =?us-ascii?Q?0CIcYMjGg5EufblAUHbBTHopi68xShEwZOvX1ZsVNycHbgyYdE0RXA9WxeyT?=
 =?us-ascii?Q?keUcWs8wh/A4wg/b9tflMaYXTS1gBkC+Utb+SiSOyqxBQA3yoJngzDMhqu9h?=
 =?us-ascii?Q?fGwbfuWLgUOmn/UFWXtzYXH1n/gpYG6UikfTrwkosrDdSukNaqfWOQL2EruH?=
 =?us-ascii?Q?lVW93zIIir7TMqah+Kho+B/DhB9ERfgyyQMo5sKixIY25FJfYcknfXAZDrUy?=
 =?us-ascii?Q?7C/VfEvep89m/zFNUWyedlA9PFiIhzwAWicxuKbNNXeKmECwIcD1oYExznDD?=
 =?us-ascii?Q?nFee3t5GEN5cB+WrggVczWX3Mx8AGBAYD1etReJtqNHFmV/xwvrOavYbarJj?=
 =?us-ascii?Q?rO8S7hSgcuFBdogvZrb+/BkSTLRIxG2Uox0OMzlEuY248d+r1H5R34ZyzHiT?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8b19d7-cf9b-454c-afe3-08dc688b17e6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 20:29:39.3505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/Mqkx3+SPQAx85C9NsPsi8ZVV988SH7DvAkk/DwUFhU0eIGVZuRCY2v21+S2O0BaFH7IbVsygjMPB0QnISmfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8112
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

On Thu, Apr 25, 2024 at 11:24:06AM -0700, Lucas De Marchi wrote:
> Not really used, it's just a copy of engine_mask, which already reads
> the fuses to mark engines as available/not-available.

I got confused trying to understand why this ever existed.
It indeed doesn't make much sense on today's code.

> 
> While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_gt.c       | 3 ---
>  drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
>  drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
>  drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
>  4 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index e922e77f5010..00a22cf2f5b5 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -515,9 +515,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>  	if (err)
>  		goto out_fw;
>  
> -	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> -	gt->info.engine_mask = gt->info.__engine_mask;
> -
>  out_fw:
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  out:
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index cfdc761ff7f4..72568414fb7d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -116,12 +116,6 @@ struct xe_gt {
>  		u32 reference_clock;
>  		/** @info.engine_mask: mask of engines present on GT */
>  		u64 engine_mask;
> -		/**
> -		 * @info.__engine_mask: mask of engines present on GT read from
> -		 * xe_pci.c, used to fake reading the engine_mask from the
> -		 * hwconfig blob.
> -		 */
> -		u64 __engine_mask;
>  		/** @info.gmdid: raw GMD_ID value from hardware */
>  		u32 gmdid;
>  	} info;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9f6e9b7f11c8..59a3f24d31e6 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -936,8 +936,7 @@ static bool has_service_copy_support(struct xe_gt *gt)
>  	 * all of the actual service copy engines (BCS1-BCS8) have been fused
>  	 * off.
>  	 */
> -	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
> -						XE_HW_ENGINE_BCS1);
> +	return gt->info.engine_mask & XE_HW_ENGINE_BCS_MASK;
>  }
>  
>  static u32 emit_clear_cmd_len(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a0cf5dd803c2..6b2086ea24ab 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -656,9 +656,9 @@ static int xe_info_init(struct xe_device *xe,
>  		gt = tile->primary_gt;
>  		gt->info.id = xe->info.gt_count++;
>  		gt->info.type = XE_GT_TYPE_MAIN;
> -		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
> +		gt->info.engine_mask = graphics_desc->hw_engine_mask;
>  		if (MEDIA_VER(xe) < 13 && media_desc)
> -			gt->info.__engine_mask |= media_desc->hw_engine_mask;
> +			gt->info.engine_mask |= media_desc->hw_engine_mask;
>  
>  		if (MEDIA_VER(xe) < 13 || !media_desc)
>  			continue;
> @@ -673,7 +673,7 @@ static int xe_info_init(struct xe_device *xe,
>  
>  		gt = tile->media_gt;
>  		gt->info.type = XE_GT_TYPE_MEDIA;
> -		gt->info.__engine_mask = media_desc->hw_engine_mask;
> +		gt->info.engine_mask = media_desc->hw_engine_mask;
>  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>  		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>  
> -- 
> 2.43.0
> 
