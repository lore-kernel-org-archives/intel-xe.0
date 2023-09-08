Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7802EEB570
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 20:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A200810E94D;
	Fri,  8 Sep 2023 20:43:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C769810E94D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 20:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694205804; x=1725741804;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rPFWUvXSHbwbp9OGMVLnrJx6/GcbnKrsXGSPhmPJhqY=;
 b=Gx+7Q4Vfg5DkAnofABlC/G08pvLgaTD1GQgxWQLknO+0IyftOYIMMQMU
 NmLXtwhGwkApKzBtIRIofSaNGYLMrf4Vc5JKznO04FDfoVKqi25DvPKBl
 y1d35fx8b4bAM6pAIgzDBfuFyXMTW1SHhIQRWlU5fm3cRYsiYOdgBFRxA
 x7c2kIZCiPTbgDMLtzh9egGoNj8FKK1rKTdcxSVNHHJO69pwaO+XMHLZA
 AYQCwBMEq0/5ALZ8gAC8VLJGfC+y9xy4UhzDOJh4kJauMlmgPXVErQddr
 LHuSoGxX+a9PonU4Q1ijZKjjZUiHgWAyyanNepTxFeR/vsU11GFlMgg8m Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="381564186"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="381564186"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 13:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="745734743"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="745734743"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 13:43:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 13:43:24 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 13:43:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 13:43:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 8 Sep 2023 13:43:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kprvQOqa3PSDP45CSV9DRVqIH6nUCxbDzJxE6QXguCR/Xa9J+oXqshXMQ82f8hJVIKETkVnqBoZRY5fwgPYKuWtH05bcP1HZH7qGUG1jhGMsxxi34qgyaCewfYLuFk5OXi8Xez8Zt8AjAwi/cE73PVjotV+9R4YK9bbKhfjCqG6sMQ4Egjj+YDrJKU6QoKPQWw5RiHWSFFUhQ81e+Qlo+I7QFiuFFx0/IOpK00obiiL6b39gpRUau8trKBDYipmy4W5ke3+36oLKAC/64TPjiUEFqW3gL0ZjW7anL+jsLiw8JIjKAxDGSvaq+NiGMAtgG4a8Li6wSv6lNC2KleZU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zn4Jnd9XUOf/mMilJFwJYT5b6iqO48Vz9Ioirpg0jwA=;
 b=OzbZz4BVYv9X2Fg6ijj3Ox3zKgXX0mkAZ03bg89nZQmFIIxv/HSrZaMxz7RbdBiBt970p3v2gWDwSXuDaMP1Fz1JAiDBqiPPOpbkmPHodwk76yBFleAv2JU+ae3Zc/QevtX92tQvPGKcCOq0YQg0NjsGdmMM6yaMO11C5iL77VyNA6cTuQZ9jULo4QZSGZlXa9mZNOLJx/LBEb5v2NCF3wEnRwTBb07n0S9MX6gMoxnX6njyDD1KfebQnnvjjGWUcq+HyFS5tdCwQnYHe2UrQvEfDTOW8MFuOzJVaFxQ9mMzbouUpxATyUjnpNgP57fRJiENH0joFRNpO3zSW5ZzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB7096.namprd11.prod.outlook.com (2603:10b6:510:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 20:43:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.035; Fri, 8 Sep 2023
 20:43:21 +0000
Date: Fri, 8 Sep 2023 13:43:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230908204317.GV2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
 <20230908203302.449041-6-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230908203302.449041-6-rodrigo.vivi@intel.com>
X-ClientProxiedBy: YT4PR01CA0258.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: b1e69d67-f28d-4e4d-bca3-08dbb0ac3d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YOs6chTG4M4LN6JFBLts1g8esGv09bPFXBDHYnSUhN8zKHnwmCrQ4LRZaTNR9cyREGzuFf4i06qLfd+ViR5t3GSyIo2l0VoDjaa9orh7PeXjHOjclOBQOmVWIJ0n6ty7eh52JF1nrgnbo05t61NXAjjEqu5SWaQpVYA8Yhtq4pOh+lUgaXBXYdNV3KXgCZrGECWLTvcUJeRfSrJ1fZANX/lQAFENyNgtmS28QCzRDK7xGbLZOsjPQLgt2BCep79xzQi2wb09K4u67d9/l0Gi0eRPkxUOKWAev2VUSOZ58saK72s+xFmklW5GFZ+0M7JpXyk/6yR0MBtb/Ny6W9JFBVmW8zVse70z9eTFm0+mR5FptT4/k/lmhCdzwo5WJOECnKAV/0aeqaBOopanhT37quiR5Tr+980HwNNuh4Uw/GdecYzKnC5MCQ1ou6PkTR7anScEt8fc/jfXfCYTtBtOwXckjv86tCxOr2gSsOe7FuL0vvaiLL/a7zOCX+HUrF19XCWT6yPUZWpBATMurhnQIY/8OylGg3rtJolaxJZUIEogtgURSaHzXKcqOrxmEEe+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199024)(1800799009)(186009)(66556008)(66946007)(66476007)(316002)(6506007)(6486002)(6636002)(41300700001)(6512007)(478600001)(6666004)(8936002)(4326008)(8676002)(6862004)(1076003)(26005)(5660300002)(38100700002)(82960400001)(33656002)(2906002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?okKtmuICkUc7ka81XEii84ELv8Cj6jt92HgQ2JZUNX7AAVRHSXkYnJhRM3sj?=
 =?us-ascii?Q?w3kf/yqThAIOcGh82i1h5C4nH0fD0+vp97pirVYnqCsRjBDzUzNe/j+1+cTc?=
 =?us-ascii?Q?0gWyq4uEtwo3PBfrCmcMP1fYbFW24dKEsMtIe5mMhqYLgDPagiK46oSm0DO6?=
 =?us-ascii?Q?zx/+3WM44UjAa0nP8kRI0sdTsTB2JHRZenG98b0/hqbGZjzMGz4t4Xzy9/7S?=
 =?us-ascii?Q?r5qAwqhi7MaP1IO/EcMnCHyx5lQJHjAgQbgEZquMUE2wRL0w9ua6XOLB7oFs?=
 =?us-ascii?Q?uM2BmhidDhEKMa6pNsTIUx1L7qeuk8E48dFwSbT1wW1rWGvZTZcfoy7OEbnr?=
 =?us-ascii?Q?MxiEONoco0t3dSg/D6QRpVbHggaHwkj0c6/4xoajtm+J2pFZvFK1ZY8Y64ma?=
 =?us-ascii?Q?d4tlMTrZvbRM68Y2SGP5baOSLl8BzccaivwJgCN75qyoA4YndkbJzlb/5Whz?=
 =?us-ascii?Q?pA9CeXVYR+OHwmIqtMOrFK8L2oFy7OAvPF1VmImYnOWFjxqmwdg+5oUkh7WC?=
 =?us-ascii?Q?FZsSf/jPzkQGSaNKKZf4kCLx0mORPOMk4VoZ4WdSrv4HWH5+3bssFdVG6tX+?=
 =?us-ascii?Q?fXziunGsVTPamjEiwIWTy/2OOhfrXLGMNP73EyxAalghT6MUB+PkDWb2K4Nu?=
 =?us-ascii?Q?UNz103B7y0aSz77pJZVIT6MF5vgMRPt3OK71n9aLu8zTcXgxo5s0jOr0Xvou?=
 =?us-ascii?Q?Xy3wLj+uwidzk6SCeypHsCtip/bJQdAg+T3YXk86cILpovkoM56JKgYcGZUp?=
 =?us-ascii?Q?utbxyUJdBxBAYrR3dGv/cq0/FWrUd8EUwGHDpzFrw9SZidUZ8Hk6B8uncICS?=
 =?us-ascii?Q?lvTQKJwTXCu7dAVQ+TZzRg/d16Zg9zmID2Ahr9Ush1VoMWyUAJklUJC2jz97?=
 =?us-ascii?Q?hf70L+Z0gtiyVA6thQwiREcBF72v3PZfOOrJPTSatJAf+yWQFN/jBN3Ye4ic?=
 =?us-ascii?Q?n0ghhY+M52Sm7weYxh/3EVbeZoF7BtSAuyBvJF6rCW9qFTdShtqGQmZ238X0?=
 =?us-ascii?Q?9twgKPW1kN9HxWXlRdYGKwBsbmaxMjks2YG0P03sfZMV90Yj8Ee58+Rv1OuM?=
 =?us-ascii?Q?DZ+HEohIcqZJxLuX1ejCq68TnLIx2Rm8Dxu2FBxtQqIqqStG9PSuM/e7BA71?=
 =?us-ascii?Q?l2IP+caXGbMo5Ih9DajMGtwbbb5/kafOmdmuS5jZBy5wGdXHQNfZriCl4bCj?=
 =?us-ascii?Q?Du7lCaFKUda5BtlObut+0VR/XVvMMpQyysw9wJdap+HpoKgyDB9TPDUCbdGf?=
 =?us-ascii?Q?nAF8mHt+/tIsB16SlrUQ2mGhLcBj6XQHoh09KnL34bENUfBFkdn1gMA5i4zL?=
 =?us-ascii?Q?pXoQHK6NZSyqlkwIcpzKO7miYE/mJH5QaQuMGHxVmOdlMsmmHfaNHdlpB2oj?=
 =?us-ascii?Q?xMBXLuP3PE0IxYmOSBFfP7KVaGaEw6bJD9yNVdB41JPTCNyyf8JLGHrkgvjG?=
 =?us-ascii?Q?7/aXrJ7tomDXygjWT7h9/Cd2GoZmE8K2oSmlmPTOVVY7CAR5Qb4rLZnnnV5Q?=
 =?us-ascii?Q?V+mpj9NOaXIYv7tFF3nLG7Gelnz0d/JsPd/xharO1BPegU342m9vptz6nUeQ?=
 =?us-ascii?Q?EEHXf828zBYy6TBlEyFz8FzWi+DKwXYDC6k/5gG8GAfPr6QgVINJVjR9YpOn?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e69d67-f28d-4e4d-bca3-08dbb0ac3d94
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 20:43:21.8267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvQP2rvdBXRMurpMntZSoRf2k2uOqF6mrGUXuqYYks1hf+3CFPU5AU4Z2BxHmvGofeWourioS4Ab/1cG2aArEq15Y7RV4ruWMvnWymwE9ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7096
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 5/5] drm/xe/uapi: Rename gts to gt_list.
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 08, 2023 at 04:33:02PM -0400, Rodrigo Vivi wrote:
> During the uapi review it was identified a possible confusion
> with the plural of acronym with a new acronym. So the
> recommendation is to go with gt_list instead.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 40 +++++++++++++++++------------------
>  include/uapi/drm/xe_drm.h     | 18 ++++++++--------
>  2 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 280274b7a507..92d4ec611c49 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -210,14 +210,14 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	return 0;
>  }
>  
> -static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
> +static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query)
>  {
>  	struct xe_gt *gt;
> -	size_t size = sizeof(struct drm_xe_query_gts) +
> +	size_t size = sizeof(struct drm_xe_query_gt_list) +
>  		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
> -	struct drm_xe_query_gts __user *query_ptr =
> +	struct drm_xe_query_gt_list __user *query_ptr =
>  		u64_to_user_ptr(query->data);
> -	struct drm_xe_query_gts *gts;
> +	struct drm_xe_query_gt_list *gt_list;
>  	u8 id;
>  
>  	if (query->size == 0) {
> @@ -227,34 +227,34 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
>  		return -EINVAL;
>  	}
>  
> -	gts = kzalloc(size, GFP_KERNEL);
> -	if (!gts)
> +	gt_list = kzalloc(size, GFP_KERNEL);
> +	if (!gt_list)
>  		return -ENOMEM;
>  
> -	gts->num_gt = xe->info.gt_count;
> +	gt_list->num_gt = xe->info.gt_count;
>  	for_each_gt(gt, xe, id) {
>  		if (xe_gt_is_media_type(gt))
> -			gts->gts[id].type = XE_QUERY_GT_TYPE_MEDIA;
> +			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MEDIA;
>  		else if (gt_to_tile(gt)->id > 0)
> -			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
> +			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_REMOTE;
>  		else
> -			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
> -		gts->gts[id].gt_id = gt->info.id;
> -		gts->gts[id].clock_freq = gt->info.clock_freq;
> +			gt_list->gt_list[id].type = XE_QUERY_GT_TYPE_MAIN;
> +		gt_list->gt_list[id].gt_id = gt->info.id;
> +		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
>  		if (!IS_DGFX(xe))
> -			gts->gts[id].native_mem_regions = 0x1;
> +			gt_list->gt_list[id].native_mem_regions = 0x1;
>  		else
> -			gts->gts[id].native_mem_regions =
> +			gt_list->gt_list[id].native_mem_regions =
>  				BIT(gt_to_tile(gt)->id) << 1;
> -		gts->gts[id].slow_mem_regions = xe->info.mem_region_mask ^
> -			gts->gts[id].native_mem_regions;
> +		gt_list->gt_list[id].slow_mem_regions = xe->info.mem_region_mask ^
> +			gt_list->gt_list[id].native_mem_regions;
>  	}
>  
> -	if (copy_to_user(query_ptr, gts, size)) {
> -		kfree(gts);
> +	if (copy_to_user(query_ptr, gt_list, size)) {
> +		kfree(gt_list);
>  		return -EFAULT;
>  	}
> -	kfree(gts);
> +	kfree(gt_list);
>  
>  	return 0;
>  }
> @@ -366,7 +366,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>  	query_engines,
>  	query_memory_usage,
>  	query_config,
> -	query_gts,
> +	query_gt_list,
>  	query_hwconfig,
>  	query_gt_topology,
>  };
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 81cdd3c95f2f..94b53dc74fa1 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -265,7 +265,7 @@ struct drm_xe_query_config {
>  /**
>   * struct drm_xe_query_gt - describe an individual GT.
>   *
> - * To be used with drm_xe_query_gts, which will return a list with all the
> + * To be used with drm_xe_query_gt_list, which will return a list with all the
>   * existing GT individual descriptions.
>   * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
>   * implementing graphics and/or media operations.
> @@ -302,19 +302,19 @@ struct drm_xe_query_gt {
>  };
>  
>  /**
> - * struct drm_xe_query_gts - describe GTs
> + * struct drm_xe_query_gt_list - A list with GT description items.
>   *
>   * If a query is made with a struct drm_xe_device_query where .query
> - * is equal to DRM_XE_DEVICE_QUERY_GTS, then the reply uses struct
> - * drm_xe_query_gts in .data.
> + * is equal to DRM_XE_DEVICE_QUERY_GT_LIST, then the reply uses struct
> + * drm_xe_query_gt_list in .data.
>   */
> -struct drm_xe_query_gts {
> -	/** @num_gt: number of GTs returned in gts */
> +struct drm_xe_query_gt_list {
> +	/** @num_gt: number of GT items returned in gt_list */
>  	__u32 num_gt;
>  	/** @pad: MBZ */
>  	__u32 pad;
> -	/** @gts: The GT list returned for this device */
> -	struct drm_xe_query_gt gts[];
> +	/** @gt_list: The GT list returned for this device */
> +	struct drm_xe_query_gt gt_list[];
>  };
>  
>  /**
> @@ -407,7 +407,7 @@ struct drm_xe_device_query {
>  #define DRM_XE_DEVICE_QUERY_ENGINES	0
>  #define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
>  #define DRM_XE_DEVICE_QUERY_CONFIG	2
> -#define DRM_XE_DEVICE_QUERY_GTS		3
> +#define DRM_XE_DEVICE_QUERY_GT_LIST	3
>  #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
>  #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
>  	/** @query: The type of data to query */
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
