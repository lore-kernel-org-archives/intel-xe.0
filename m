Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC12C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 18:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B1210E131;
	Wed, 15 Nov 2023 18:53:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEFE10E131
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700074386; x=1731610386;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wM+CAXcuDq7UOgpLh8kdKuOQgDFJ5yawVqofa1m6D9Q=;
 b=GEdr7ib9LtmEdgWmMXL61ZXCykKUu70el30+MD03l4gajr1ncHTnikxC
 JeAQyNl30m/AJdK19+esF5WYjJyKVLyHpIS+nWhr3QO8xYJwDtHKDIGxd
 QurT2V0PiIOZ/4Lyz0tcXmw9oj5EcZualjTsFBOceXzVTKDXqdHSmk2My
 2335KBji+60javLPcsI3C3FF98i3IT9BlnQRSWTAqSeCST4ZBHzyrUMt/
 +hDWK/HBX4U6duFon/EtpeX7GEkDug+zaonCZuynGfdYynhFPkau1jJCK
 2UjJKy8NRNpXGmcmruo96I8lgbaDDwKyPKe2+yS713q5ZIoUQ2k2Tlhpz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370283459"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="370283459"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 10:53:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="938573379"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="938573379"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 10:53:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 10:53:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 10:53:05 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 10:53:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpLuAnHTkfJhL5qmjarqZzDuhc1TXdsGtHB7Aqa0TIn7+V1JLLPYVm2SoPtz3+UDdLHnRdiYomwTzI5bJhkKnK5P0BR7yX1s4X+ASQqedKWZr+ELVDNqOSV2VCkP91HeVx48dG3B3gQZ/pjQQ7QV/3ILamrxc6y9b3YpLjgMMz1t62Tjrh5UFGLad7Ob9qECfZNCagL3KVlC4AbQ7DceVEuMzVGkayTDB9pOWZp2y+C6FP+lJMnruBbAn6SRdZwlrAJnY719XRX/dzG1Pd2pVUGB1VnTxc+h7DXt/Bvw5d/O7+XbRs8JDYxdswg+KIAnK6W6vJg+vcBzW66Ak/2Apw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85ZqBRCIOpbLt2I/Y/sq2xiLHjopJZh3xXT8jGEFuUM=;
 b=l5X48QKX8Q0v9S2UlQEkE57YNIyG7rXR7hz8c3YjVlrmY6qVhJ2iNzPB5pBlRmjuP5W3UyJFvN36PZGfhdj84ALzJ3PixluLMVSx0dVCGYZhwP110yIr60fmLU5b4YrWdSUSMPmaG8gaMTwyTrfAEpruAIM+ugJYRv0jTYzR3fvSlkyssqsi5SG7u3gY3QuX8+8aqm5Nign1D1iLFl3EAFiQfIxTPKVWkC23/3HT41hrqFSF4JTreDwM85o1qgAD32YnRN2DT7Q34MtKu0C/L1xLlxW9d/7eSg/PPSbo0+Glp/1A/T9PyqGE1YXeBMy9y3V+GXFu+RsHnhdZbs8NQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6088.namprd11.prod.outlook.com (2603:10b6:208:3cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 18:53:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 18:53:03 +0000
Date: Wed, 15 Nov 2023 10:53:00 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <20231115185300.GG1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
 <20231114133434.7-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231114133434.7-5-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6088:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e71780-0b93-416d-7d89-08dbe60c1891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cx1XImDzQ75h+lwP6JMYRyIN+yb7f+9R8ZVEjBZiBsswjRXQ/A+dnFyiaXpfxUmIpkpud33R0tAL8l1WkYIIFP6SPbTIYZA/Jlk7gbh8CfwXnR8qrUnx7TgEKt4SNHIh/1YN/FFs7vZVwU43/aDL2iIERYZB2Rp/oOZiomZXxjsSInKMGSDRkmQTI+vHZW+Efnw0Wn1edDBVMk4KSNM0sTOcBxbjz0M+LPiqw1d3Pyi0aFiCv40NxUpgXTnZWdElsgBjSPkVtuCRQv1+QOAY7N1SwCbLBxwm4eV1MDWlQwqwTV8w2257N4+z/TLj89puIo7tNixIyDZtF4djlb0nwvMg4w2tEyGgnundpGT6UfWX8Ew1GhGCTw8FvosswuodVMLfEsQ/OQxruFA4/jKA/toS1Athe/wYk/NjAi8TXfA6sWIGVXlAAyROJrRO8ATNFQvPOoOq9GAFRzTyQLNNBi9zNEtNoRqvN5akLunm978pgAjRD/+1Sn48r50hBcldFyjmZ+rZbVe+egK21AA+S3u49DLc8kzEoYeQZoFTmDfVUOlQpggY65ogkNnUDi/G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(39860400002)(346002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(38100700002)(107886003)(1076003)(8936002)(6862004)(8676002)(4326008)(6512007)(6506007)(26005)(82960400001)(83380400001)(478600001)(66476007)(66556008)(6636002)(316002)(66946007)(33656002)(41300700001)(6486002)(2906002)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bmRZVEzMd4XH3RVvx+fnLYWl1L8Ejfixb8+uxVDIqQ8Y8a9CYwybFmLMBT29?=
 =?us-ascii?Q?fSWk3QUn+63di/tgZPlC7WSeAzLVszaRQTL5mRoHAtqU3J6bgMvm9n2LplkS?=
 =?us-ascii?Q?526u9YGSh1EDhWjVTiuRtm781YLvceZzsWKO22IcvIWG+T/LPplNGh43dh9s?=
 =?us-ascii?Q?v11nq8jLRuFN0j/xLjE5IOg4q5yVaZVZAykJ9MwvrEH+ZL80g47JkPpz8P4V?=
 =?us-ascii?Q?a1a777OF1cFg3bf4QecNZC7VeaAC9Ikw7+2gwA6rDo/H5LIFBjXrQMXGrv61?=
 =?us-ascii?Q?90Ur3Hzs4EqcFOepGxOzvsd6Jp9xCHhLu/LM0q7cgIB+SybqiWlVI4rjveJV?=
 =?us-ascii?Q?k/dmcjIgmQQE9sxa+FM7qXHEnzy1IrU5f9THe3ZMp//gQ5iIwnA5Ci3qMygh?=
 =?us-ascii?Q?o2WA5as2FUJf4/hw0N7tfCUYKFY8VY540bx4uk1lvd66OV5U6iFSfsK9wZV+?=
 =?us-ascii?Q?QQYhipR7mqDn03DTDW/zSwdbyic6Td1gVcSblg2eaZvwopdby8DXf6oKM0YJ?=
 =?us-ascii?Q?sRaKpnEbpFhVbRJK4TxY4t2kLNqz/oE+Nm6ErUQMdHjAIyurNZoFk+xUYPMg?=
 =?us-ascii?Q?h1breZNy3Ra/i3BtRA9Ax8LtXm67cGBN5NM8dS9IolDcjZ86thTYloQ+Ewjq?=
 =?us-ascii?Q?l/Uzb8d+bLvADFGGYC7YWo3BLQ3p8KTXmrl/mj7bTo1UMK0D5a7wwjMfuaiE?=
 =?us-ascii?Q?lCXxwzULbQ0O5v/X5yAykNKKL3gQU2KP53EeoHjJRhy6jv9iYztARCRbiEQM?=
 =?us-ascii?Q?RYmrN+YdAZVvlUCaG2SssyYgieI0InVOfujzAgWMHOMfnB4e8jLo8oyanCWP?=
 =?us-ascii?Q?31QRM6EblBfrn6MpIUSeY0VzDzrN/zmnUvZw5veDdhXEQwF/FPUKgY2vcpeE?=
 =?us-ascii?Q?GhU+7rXrc4TJjbE1FVeFPT75y/2pkbqHlzamt6tSdZ7f8shTJuHOCqTez2E+?=
 =?us-ascii?Q?M0NoULiEdxvdilXF1M/iSh3p0XBecAYCmTf+0Bm90Huy/wHa5O/KevDm8yOe?=
 =?us-ascii?Q?ulmmtrq6uYpdJ0jFx7vUD5qVZ2ARxaDlY9NcRMvDaMXTdKtnlmGn5hGs6jvI?=
 =?us-ascii?Q?ZYZQTKR1WLb10WWV1cqiMpdvamHqja+NosuwxHSHpXZN0tCLMaUCq8LdGCyL?=
 =?us-ascii?Q?McHTJbxX4vlWWUJbdSscqdi29wn26eanJpuDXgYPtjyJAPATigUqBsNJ3afU?=
 =?us-ascii?Q?Pv3zv0BqlhkEvbDFuOuURsrFMjw601XjhWt/pgUcCYX9Wg6DPvCMz3FO4zTL?=
 =?us-ascii?Q?3NYCKkXMoQByciu2E8HvOg/P19H0sZ76ozpJJmhatrIryFFf10qFaGixX7U/?=
 =?us-ascii?Q?9hFw2S5pymPNt089YMa1t1O/rFKeZNy2sg1Ij1wGFN69NXVJra8bKGgSLM43?=
 =?us-ascii?Q?8Whbu3eQDpWyV/QO+iYvxKaePw4c7Uw2KdCL13lS6gBF/x9K54g+UKO+G3BH?=
 =?us-ascii?Q?nmKKftpYjSngZ0ev69v9peB1tVNJMwdFnk/lNfH4Nu2eQBi8bmY4Vx4Hdcuq?=
 =?us-ascii?Q?M2jDi3ys4f2vr36GFgHEElil0ZMhggiZQcaZquV1XVvdhsCoaELMudi5SfXb?=
 =?us-ascii?Q?3X9NCwZNBFsJ/YKkbArFpAwz3COs7esZIUKPR3kwaAuxudxoUJuoy3S/zFNV?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e71780-0b93-416d-7d89-08dbe60c1891
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 18:53:03.0934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecwC1+RVpImgB0jYwwJuwZQ+5rIMom5FfQq5aHMptIvNjtyPg/f5C2jC4ys7eE0ecdC9dU2ePUSor9YaRmKkhZOZjhDYP/C2Djzlt6J6RGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6088
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 4/8] drm/xe/uapi: Rename *_mem_regions
 masks
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 01:34:30PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> - 'native' doesn't make much sense on integrated devices.
> - 'slow' is not necessarily true and doesn't go well with opposition
>   to 'native'.
> 
> Instead, let's use 'near' vs 'far'. It makes sense with all the current
> Intel GPUs and it is future proof. Right now, there's absolutely no need
> to define among the 'far' memory, which ones are slower, either in terms
> of latency, nunmber of hops or bandwidth.
> 
> In case of this might become a requirement in the future, a new query
> could be added to indicate the certain 'distance' between a given engine
> and a memory_region. But for now, this fulfill all of the current
> requirements in the most straightforward way for the userspace drivers.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c |  8 ++++----
>  include/uapi/drm/xe_drm.h     | 17 +++++++++--------
>  2 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 48befd9f0812..8b5136460ea6 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -377,12 +377,12 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>  		gt_list->gt_list[id].gt_id = gt->info.id;
>  		gt_list->gt_list[id].clock_freq = gt->info.clock_freq;
>  		if (!IS_DGFX(xe))
> -			gt_list->gt_list[id].native_mem_regions = 0x1;
> +			gt_list->gt_list[id].near_mem_regions = 0x1;
>  		else
> -			gt_list->gt_list[id].native_mem_regions =
> +			gt_list->gt_list[id].near_mem_regions =
>  				BIT(gt_to_tile(gt)->id) << 1;
> -		gt_list->gt_list[id].slow_mem_regions = xe->info.mem_region_mask ^
> -			gt_list->gt_list[id].native_mem_regions;
> +		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
> +			gt_list->gt_list[id].near_mem_regions;
>  	}
>  
>  	if (copy_to_user(query_ptr, gt_list, size)) {
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index a8d351c9fa7c..fd51d4444119 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -349,17 +349,18 @@ struct drm_xe_query_gt {
>  	/** @clock_freq: A clock frequency for timestamp */
>  	__u32 clock_freq;
>  	/**
> -	 * @native_mem_regions: Bit mask of instances from
> -	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
> -	 * direct access.
> +	 * @near_mem_regions: Bit mask of instances from
> +	 * drm_xe_query_mem_usage that is near the current engines of this GT.

s/is/are/.  And although "near" is good in the field name, I wonder if
the kerneldoc's explanation text should say "nearest" rather than "near"
to help clarify that this is a relative rather than based on some
absolute metric.

>  	 */
> -	__u64 native_mem_regions;
> +	__u64 near_mem_regions;
>  	/**
> -	 * @slow_mem_regions: Bit mask of instances from
> -	 * drm_xe_query_mem_usage that this GT can indirectly access, although
> -	 * they live on a different GPU/Tile.
> +	 * @far_mem_regions: Bit mask of instances from
> +	 * drm_xe_query_mem_usage that is far from the engines of this GT.

s/is/are/ again.

> +	 * In general, it has extra indirections when compared to the

And since instances was plural, also s/it has/they have/.

> +	 * @near_mem_regions. For a discrete device this could mean system
> +	 * memory and memory living in a different Tile.

No need to capitalize "tile."


Aside from those minor nitpicks,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  	 */
> -	__u64 slow_mem_regions;
> +	__u64 far_mem_regions;
>  	/** @reserved: Reserved */
>  	__u64 reserved[8];
>  };
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
