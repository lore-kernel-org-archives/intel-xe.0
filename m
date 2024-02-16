Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CA0C48260
	for <intel-xe@archiver.kernel.org>; Fri, 16 Feb 2024 18:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DBD10EC5C;
	Fri, 16 Feb 2024 18:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RxQESpAa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D104F10EC5C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Feb 2024 18:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708109271; x=1739645271;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lmVUP3ULPc+dyhJkzo+TVDR6ENehVjeZg5lUjuWpoGQ=;
 b=RxQESpAaOJ6QgKgC8i+LgovFJDqa4I4D/QrPMFGrD9d0vcFr5qRQWadK
 6qNKimOXKsAVahvlK9Minw4S22dJzQxS+1j8FAn9ZTgfl+42AYiU5HO26
 XzkxBzinfC0Ky4Vc6zP2ad6iHAPo2Ap7xiIPcY8qzqXAsuuujCuX6LlQ6
 XKjV/r0n37+SB99YATRFUqA4IK15FE2npTJz94yPb/Yuz5isTi09Eia3i
 S9Bs8vesWpCrHo14raTr0WRJjqOfWfY1PCM7yqvlVUg5cHC84ZzRgzFtd
 B9l/fF17MVm1w7KCBuJqc2GUqxtl09NvBaI6rnTLanWOCrRDmaBuxheaG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2362963"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2362963"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 10:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="3872908"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Feb 2024 10:47:51 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 10:47:50 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 10:47:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 16 Feb 2024 10:47:49 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 16 Feb 2024 10:47:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k191cBV8Fd79GXozJQeAXZb6ZADSzYH+Fahx5rcnQT8b/WLd7yZWL88SUxdOrEZRvogaPdKI8aS88SJ7Be9B71aclwBTnzY+3kCp3maA6XfEdepabnRPW25ZVIPqgUuUHaA7fwNaIcl+9XzqdyEIWw5BEmkosybqBFPGEGowdHaRpWhPZMLQGMkLiRo5eZx9JfIMBwIkCzanvLtAmTSz5tB6N5l9gVklyzxnSOzf5U+tAUWWVFvhf+Au1kLWG3JpE7QqatfcTszSlmYGNIy8rGGNfdPqGkoKBZLsXxCas/5mE6TS6EAaPRPnhfBUrHNHOu2due+e9s+f5TKeRvxHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKpMcnweHc/vNx3BfrraiLxy/yQSRI6cVEUwXuTMM28=;
 b=msA8v4vzUxsvdzHDg3l0OGmtFSMqTmtfXw86/9QwWQfgmH9feRXCuGSfvBl3VR1W8XZx2miCbwn7l8znYFusvUcjap4F437a4OfdsrwzXXj94yjc7hAwh8SBxboO4a90ydSMokSLzChjFNkxKPI8kIJ/ntgukdhTsgrzdMPvIZa1YAg1f6kd7xRatW/U5qwhf9tQ7vDKLAiFJE9QZrdKG5FDQtsrvrEpHR50rWt/5l/MkmnqgBmJ7OXDSoBUHvF8vjVfygqQHgRoF0HZTHqkUgBP93Q2ryvUUG3XN7Fie/xyT1AnmY3tZU2IM0hvXJw0eKQ4/2Gyhy0tYKWvSlh3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6515.namprd11.prod.outlook.com (2603:10b6:208:3a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 18:47:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092%3]) with mapi id 15.20.7292.026; Fri, 16 Feb 2024
 18:47:47 +0000
Date: Fri, 16 Feb 2024 10:47:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <joonas.lahtinen@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] drm/xe: Add has_wmpt GT info
Message-ID: <20240216184744.GK718896@mdroper-desk1.amr.corp.intel.com>
References: <20240203060534.6839-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240203060534.6839-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa584c5-6d9a-4a2f-f35f-08dc2f1fc4b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7zIGsmVkPsaN9dAJLpzmr/W/TvAkb9FYy/V5hniGWVFi/JcyqIP2Uukh3SvQrw5TV/cwzG32HsDuLouCzn+BYYkFqSKj0oxYPVWqW8SVr31KIIt8KgG5vGRrJSBajDDAeXpUK2oRLJ3ctztELDMoRxS9Vtlv0/8aiAQYnwP0W0pyDSKyYbXgmyQHLREQNEY3P8pspqz3fLueiDcOfkRLJAn2dMwJ1rSvHXuBYTF+i5SJlwMkOMPa5V9ZKv5IrDRvRXqJHCNwH3t6+2duZVrc2AuoxXdMz/f6HO+Wbo6iTEkhc5lPOzhbaAqLqRVBYG+lztmLTQCtAa6B/FfcqJ72UhnQmulNRBCBzbbMQVM82U7Lto7cu9YsYAsDiP/8si9rzLgNGK+09lhs8q4LQP/IAVj3fftX2w2HiHdLSE7r0A8YnEtJAj5Wyr5BNfGFipuckGN7Vc6dkjDx89NAfuQRqTgKZGokXtI+Lt+LOrRfhk+B0T6Ed4JkfK1jGafD/FKTBcQ7Wk9CqjYMZHS7yq8RKzUX3xxFfIIvdzIxqps150DCZkqqckmUsPXr8WMJMvWD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(4326008)(478600001)(41300700001)(5660300002)(2906002)(66946007)(66476007)(66556008)(8936002)(8676002)(6862004)(6486002)(6512007)(316002)(6636002)(6666004)(38100700002)(1076003)(26005)(83380400001)(6506007)(33656002)(86362001)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VVvCiC47Pi+xiFgKc9XNMIg2Ap0Hm98ULLG7cV6+VrZgg6eAa14ONv5sy7i2?=
 =?us-ascii?Q?6+Qs5JLC9pWfylf2P+TaOsB182EjB+S7MTJVc/mf6jQsaH5Vs6MjnABhEVlK?=
 =?us-ascii?Q?He/Z0HBxIdhbhOESPIwkMLvzl+6jYcneFlNULBeEQDS3vJJ7Lk2ljAB1Q/Vn?=
 =?us-ascii?Q?lfPwhPfFR4cq1hWG/AXSD8TlIT61mkFtihQt7UBpASFQN6HSn3SCuc8H4obj?=
 =?us-ascii?Q?lPavty7oXJeiKSHvBUNPBcN4igh/BH5clJ+2zCmNx7f3hS01WDLYeqleuKjc?=
 =?us-ascii?Q?C+uJiF3Wf/yDvhFuIhiCZbq1THPAZanf7PxTpm7SU/xMdy3WXlg0aybctVGb?=
 =?us-ascii?Q?vRqgPGEZCL/wzCIdAPTRveFHFfk87Du0eVnGRzhCj2BuS5p+fIWjT9iOJVAs?=
 =?us-ascii?Q?UjgBt/Ay1AD/vM6RPowKJuB+3pB2De2CnFB1AsIMXsSQ3yhVpFHKoc3DHt6b?=
 =?us-ascii?Q?bY/5z2O/Ry8UxhBCBQSouR4AMYppBUAORIEtsD93OOqaF6yLAiPZCoy9Lp1B?=
 =?us-ascii?Q?rFmlmxcjwp807t2TB9Ty63EOGOfAp6yKXPIgZEBhyyLheWxhOU9FdhhHmY1A?=
 =?us-ascii?Q?H8Md9pQo/rur6rW0eI6ZhlM+IGmiTieUtWL6dnMkIvX0Azn/Jpsp+X06fa4l?=
 =?us-ascii?Q?FPLE8RMubmE0oerxstBYnUHLNIn46ieH6nJDXF1W8deuZsiuAHvFzFDEtvCF?=
 =?us-ascii?Q?NvKtvppivYZkCvlHmw2SfHLhiG7557K/q131wDpKAb3a1TSeZymjlaio/+1q?=
 =?us-ascii?Q?Hi1RUNSiSwT/U5PdVMkmGPJkRUbmB7mjHymEMVusn6jt1h/y0rGihsd8ZGag?=
 =?us-ascii?Q?8M38/9/N00y1Dg1uYuYtd9achJuZ7B4jworFurBuhobMQgaPdVB/NB/dBTOg?=
 =?us-ascii?Q?VWeIznf1wp+iSyPhgF6UZ/8QdNVfWAIx1TtOygki+PDwmWcwhVN30SYvF1Hb?=
 =?us-ascii?Q?qQ9ZSQ13meR5sPZQIYqHw/mDNEtnNkMzK/dJLHDCcazFrw08rwUbGGnVyqEm?=
 =?us-ascii?Q?dXjl6W7b4DgwHl6cFDHctlwaqiLdxAv5+XCqQlEu9+hhpfCPFVjte+05fAH7?=
 =?us-ascii?Q?uwMHIUW60HVxAIlLu+j1mFCHHAz7PS1gWK2b3Gx2KF0Xj/7n5KlwlxiNI3VK?=
 =?us-ascii?Q?ms0pzqYRByqSrQ+lyEUWKYZdGY0ITGug6RQW0Q9xpL9BkaBWxSNQMXiL4eF6?=
 =?us-ascii?Q?tEMAECEra7F5+Ia2ktsw5EyxvXiGZ4KD5FxPottAmMR1FyeAH1uPSqiqwiQI?=
 =?us-ascii?Q?qhjAi0KAnyuiQPirCLEU6HDTh4ObvdEjej89wIRJn9MOxYtAul5TRFwbmXzl?=
 =?us-ascii?Q?Qls6TP2YkxUJLT3MTiY7rORFWXlazyeBxDXCtVoNXuzWbOahjZikyFlLaJjE?=
 =?us-ascii?Q?zcrKCJH9hnAAQwCGRzpsz4k2eAxDkGBW0NImA4BlW6JkqOwxGFbQNYj1JvuG?=
 =?us-ascii?Q?e6NBu1Txo5UwILaFUgQuHtDYbY6wXE2D4bWSWaVBlrkemuR2Oo6Jh80rqqoA?=
 =?us-ascii?Q?R+utrn3SqoQrdWJQmXVeQ13C+PqNRLXSo9N1Onl5p0T8JAeKiDbjkH5mewpA?=
 =?us-ascii?Q?AeFur3uej4Qsk2d/YfHlJ+Mz3oRgdgqLLuhY3IHybu59dqq6pFtz8E8Fq7ql?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa584c5-6d9a-4a2f-f35f-08dc2f1fc4b3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 18:47:47.1636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngdX+eL0Z+5zUutyT//XsO6LKS0rjWcgSYc7x/FIANDfA8aRSqKcUgG2OIx2nHX1LsWqnRi9MWfg17y7pxDw+9Aa3zG9dL6q7k48pikcnZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6515
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

On Sat, Feb 03, 2024 at 07:05:33AM +0100, Nirmoy Das wrote:
> Add a GT info member to reflect wmtp feature status.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

There's a typo in the subject line (s/wmpt/wmtp/).  Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_types.h  |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c | 15 +++++++++++----
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 70c615dd1498..2f2fa00c1a04 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -119,6 +119,8 @@ struct xe_gt {
>  		u64 __engine_mask;
>  		/** @info.gmdid: raw GMD_ID value from hardware */
>  		u32 gmdid;
> +		/** @has_wmtp: gt supports mid-thread preemption */
> +		bool has_wmtp;
>  	} info;
>  
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 0d17e32d70c8..82424e5d6033 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -319,14 +319,11 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
>  static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
>  				      const struct xe_hw_engine *hwe)
>  {
> -	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
> -		return false;
> -
>  	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
>  	    hwe->class != XE_ENGINE_CLASS_RENDER)
>  		return false;
>  
> -	return xe_mmio_read32(hwe->gt, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
> +	return !gt->info.has_wmtp;
>  }
>  
>  void
> @@ -671,6 +668,15 @@ static void read_compute_fuses(struct xe_gt *gt)
>  		read_compute_fuses_from_dss(gt);
>  }
>  
> +static void read_wmpt_fuses(struct xe_gt *gt)
> +{
> +	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
> +		return;
> +
> +	gt->info.has_wmtp = !(xe_mmio_read32(gt, XEHP_FUSE4) &
> +			    CFEG_WMTP_DISABLE);
> +}
> +
>  static void check_gsc_availability(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -696,6 +702,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>  	read_media_fuses(gt);
>  	read_copy_fuses(gt);
>  	read_compute_fuses(gt);
> +	read_wmpt_fuses(gt);
>  	check_gsc_availability(gt);
>  
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
