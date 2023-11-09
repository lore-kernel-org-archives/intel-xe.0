Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CD1C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 19:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4619C10E22A;
	Thu,  9 Nov 2023 19:08:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEB410E22A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 19:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699556894; x=1731092894;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5JU/GC5lt3PnJ0flFtI/LN10H/z/H9NJHIN+4TesgXw=;
 b=g/Zpf3zRUGdvJLRlPemC5P39qVU+N3YQ/NSM00Y2UQAmmggbZOKXmfeL
 NX/5VNJr83OIeTLrE3Poxajx36xMT2QQIODj/9Mq6lkvH5WKAB3vNfsEQ
 7o/7c3N+T59VN/9UmYDgr9/R5FFY1/7V8E/oC3WBfGydocG0U0f2UPqQx
 PyTYuLyZsamhcknTKoRzwHr6nSZkr8SWSeBgvMjNjG3mY1tH2TmICd/Hm
 /IF4P/8UnpBXUqcuarV5eUjsWNyZ60MYUGMX09QbJmZs3s3i+k3qkT2sE
 UGQujZU3OOHx4QBHJRupqLb5T5E9i0V4HHbU1YmCQXERC734eqrFDc43d Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3091875"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="3091875"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 11:08:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="756981886"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="756981886"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 11:08:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 11:08:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 11:08:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 11:08:11 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 11:08:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Onj4esX4odt9BIY5vImYuojpzs/6IvqY9j8FzwqwOUe2UlAu7erko/wfe6sTHztVwE1IwNSWZzTXNK44f82qSpgdZCtZec/CgWC4OIm30GimKRdIanrAzlb3pwFonidUnamisURoH0xT7eYVmQAZ3j0JOqJNr8+7+XEWsN/xzD5k+5BZ1y4KiNJlYVJPd7BiIgMklQNTaTVcOFTgdNudd3O7RfUqLG6PQDKdHp1s3ZPGqFylDzGu/J4YaoImTi0LJOvePj2E9zAbHf9OzRD6WiFu70YPdGv/joMabTgMF7qcHk+0Scee3SfMeXWc0o8kazx6A/nAtdDvPXTjnx71yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4NjECM388HNhlZB11/xROySQr1X9aC9VfOrDsPV0dk=;
 b=MZsZQifh3+7+aGfEcwmAYY71zIUu43Bco5YgdlShgWzpOqt18N5PzxsE8bGpYiwBU5bHqx8Y7yYlYmZijcyw2HjiB2KakNLbXs8A7rB+GHiQxHVN0MDUb6eBMPitVGChxzJxHqftwKWVfICgwMi2GFZmvpXmJyzf91wbziqqs3b62DmNOSJYPMPUr+ngW2NWnmL98BosMP7uWaM3SonvpJRAfO1CG29JR3inzbXmNwqrFnuYiqYHaLFADmzPx0aDs9tkFMNtK/UfgFjHo8IddizuoOakqRzaSmZWyjnLfCxz18vHC/bP8/aXjKFno1JAzWM937SgV454E076TJW+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7817.namprd11.prod.outlook.com (2603:10b6:610:123::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 19:08:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 19:08:09 +0000
Date: Thu, 9 Nov 2023 12:07:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZUzLdDM9pW0iOXSg@DUT025-TGLU.fm.intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
 <20231109154457.7-36-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231109154457.7-36-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 45db1967-c426-4742-59bd-08dbe15735fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uGSOCVap1D7ntBrt8aa5z5jEK2Xg7XXVYWJm1+qJI0RauYe1UGPL88mz9gR9IsGgZtQY7LHYlOcYptQPbVgRHtdkkb9pESYzLxI2mdgERxsJq389VckDX9qVVhTf15TPdOxQPrDliCK9I787Lqdf6yB7P5HP8WRDJEST0EyTg9VpUuYreTQOQ/3fj5vTZO/2BsGRfczwcFfB2ylTPbph2JBrG6Cigvseq4d+K9gaRKZz6owubFP9526/W7THZunKYPliA+ok9Inzuj+fwjDz7Mvvdey3p6FLK4qnZ0l6oR3LyXDLkdZ7686vqA/k2R9pjWLL3GOajm02D2vPQuRzXS29WRR7JAhlLrYqZMpFsZKSH2kUnG5bpS09EaXdtFxgW3LKBW6uQwwVYgjsItWXWHUyP5GxmJK/evuV3ac3n43SjWSG0OL0F9NrJaTZxhbdZ5nsLK0kHQSZkYhvGHxWIRAQyMqtEGhPeZbEayXVbFv+7Pv3TwO8FILj9S3FYjc7J0jp18psX8kylrt2K9FTPiribAWEvzIl4hAOu8LpuVzHmxNJJY2bBaVvYE+S2pU1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(478600001)(6666004)(6486002)(6512007)(6506007)(86362001)(38100700002)(82960400001)(5660300002)(44832011)(66556008)(41300700001)(83380400001)(316002)(26005)(2906002)(66946007)(107886003)(66476007)(6862004)(8936002)(8676002)(4326008)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pz2l2TqpS053zzrgGsYIfZGf4qUSCL4M1bJXrW7cVWrppxCF+Pfr+2aS1bBp?=
 =?us-ascii?Q?Ja7VSMoYxuE99+WxEISm8IGZwZtmbv0DWQSS0LnQFWiNTr/H9T4jvvE9FxZL?=
 =?us-ascii?Q?luCViBDGNdR9BvgcBbhk+aa43C1vOY6G98uKePoufvPP8Y9SA4ybB1fUGmVx?=
 =?us-ascii?Q?2QA1dNS0yPixqUZMHEmuhCPnbxuHZszi8HKdMkjLyWAQ2lgxhhGVgKpenxcF?=
 =?us-ascii?Q?expONwWVOgyOkuC0vgUZar4lqifIPhHEtePvcdzYaekSw31shCUeT7W8QXrq?=
 =?us-ascii?Q?Vf7mK8R1s5omboeOrqWmHWsRf0qS6NhOh4QmQaUodo4/indlLvzBFMxH+Lq3?=
 =?us-ascii?Q?PfDqu1feSX4V7zMGJP7VtDoiBDBPYaxpopQ0kdaGqMUQUfPhALyU8+x526Sd?=
 =?us-ascii?Q?YyyMB5xcOoQ7hHWINnd/vXIDU2UtqqDjWNKUNwz+Bf9MLC2w8g+B/ziD0QZM?=
 =?us-ascii?Q?QvGmPkB1LVb3fJgaDi4Watdu+Jf57alEadiGP8sFQSJgcXqXUzOVVtpCVUxG?=
 =?us-ascii?Q?0+Z4GbC9/0KCgCiAOIGf+74iDlovuskWiWQfZ8/mszPn0uK8MLSkfjUtcmeA?=
 =?us-ascii?Q?ITH3Ou4gsPVkmFYbKl0U+8oGIDhP3Ro971cgWJD1hl2TiRNcXtp111qKRpPp?=
 =?us-ascii?Q?m55wnRBL8wkyJjWyNGa9w0XjoNBiU0YiiiI6Q3F557SWbT+pSz014sV4uMT2?=
 =?us-ascii?Q?/6MdZeXvCrMu5JMVbg6/uYEzyW3OWMONSN2Jl1ONm15KAhirQDg3/+pJN3nu?=
 =?us-ascii?Q?D38lNyXGpNJmL0g0GUBybiqXW7/a1/nhjlaOVJFMhEguoGh2+3Nl5Klv3mXY?=
 =?us-ascii?Q?ZrsU3MfF7yKSxEDPAC6sWH6B777qRah0UE9HzM30KmYgpuCoxa3T+Dqweu64?=
 =?us-ascii?Q?igo/Udg6cEr2j3evUXpjyfJaFBYcgflyRw7TfiWexcyw1lot5fwjXDFrhFPT?=
 =?us-ascii?Q?1dCnzRmCfyROxVTpsPyDVbqqXmkM4q1CWpIdLEKYlzLMrFeG0+YpQyufAQ1a?=
 =?us-ascii?Q?KTUHTtZTFzwAbQvzN0wlHJJxNfyk85w1IXpp6bkma0d3OgCWXAnHU/rcrZpG?=
 =?us-ascii?Q?OsDVVodiVI9F6i00Y406hFOt2U8GS5vH/afqMJHN+CjAtFtATq1RDtN5o5Bh?=
 =?us-ascii?Q?I1r26dpUm38jC8lIb9eNAeGJcCXsPZm8ypxZXvijJUqu2tVvSda5gTif46wM?=
 =?us-ascii?Q?EvM5gk1mQEHYjACs0azv7eh2r7/gdYg+ro7wuC9XqI2Y+mlUg7/xSj234zmE?=
 =?us-ascii?Q?7eU+k20bY/8HcV3Yx9mjsgjLESISB/f5ypNEpcmmMZ6H3DsnlRZtJwW4T9nd?=
 =?us-ascii?Q?Z/KYBuWrUb5Tgr9rSE0ayBqTY6BYbCi3a2700A5RLp99XA5EIVvLEpnQKnt1?=
 =?us-ascii?Q?WCUo49J3WEncg1eozPEPFkf/rR7ZuH8DE/XUL3fku3YFxbG+/ST50IZlfe/J?=
 =?us-ascii?Q?eFYyTKduzNMKi2BoorRRzoZ736LU39cVjSZz5tzj2dpxspu3mDNHH67TmB+b?=
 =?us-ascii?Q?SRci7vd3NhzbwLpzKMywFjKsr/DUYwlVoRhJHzKf07onu9FnDOVoOqKsuVf2?=
 =?us-ascii?Q?tcnDbhHkQr5ONxsMYrBHBsep6dKDvhJ/1ASqaInDi7Z9QwxywbouCLO07Pj7?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45db1967-c426-4742-59bd-08dbe15735fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 19:08:08.9460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ll0h6MlLKndKmqSMshCtdK4qNXNN7lIbRi/2i8Z36Ies+YGjoDdkRUigKNNyrgMFnrLc57ImbQJrvo5rwgxSBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7817
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 35/43] drm/xe/uapi: Refactor engine
 information
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

On Thu, Nov 09, 2023 at 03:44:49PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> First of all, let's add the tile and gt IDs to the engine_info.
> We originally tried to abstract tile from the uAPI, but it is
> not future proof since the tile might be important info to the
> user space in regarding cache line information.
> 
> Now that we have gt_id as part of the info, let's convert
> the instance.gt_id into a generic scheduling group id number.
> For all the current platforms, the scheduling group is the
> GT ID underneath, but at least the API becomes flexible enough
> to allow different kind of engine grouping without necessarily
> get so tied to the GT ID.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c      | 17 +++++++++--------
>  drivers/gpu/drm/xe/xe_query.c           | 13 ++++++++++---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c |  4 ++--
>  include/uapi/drm/xe_drm.h               | 10 ++++++++--
>  4 files changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 064f25e5e3a5..e30363bb5152 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -500,13 +500,13 @@ find_hw_engine(struct xe_device *xe,
>  	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
>  		return NULL;
>  
> -	if (eci.gt_id >= xe->info.gt_count)
> +	if (eci.sched_group_id >= xe->info.gt_count)
>  		return NULL;
>  
>  	idx = array_index_nospec(eci.engine_class,
>  				 ARRAY_SIZE(user_to_xe_engine_class));
>  
> -	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
> +	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.sched_group_id),
>  			       user_to_xe_engine_class[idx],
>  			       eci.engine_instance, true);
>  }
> @@ -547,7 +547,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>  	int len = num_bb_per_exec * num_eng_per_bb;
>  	int i, j, n;
>  	u16 class;
> -	u16 gt_id;
> +	u16 sched_group_id;
>  	u32 return_mask = 0, prev_mask;
>  
>  	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe) &&
> @@ -569,12 +569,13 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>  			if (XE_IOCTL_DBG(xe, xe_hw_engine_is_reserved(hwe)))
>  				return 0;
>  
> -			if (XE_IOCTL_DBG(xe, n && eci[n].gt_id != gt_id) ||
> +			if (XE_IOCTL_DBG(xe, n &&
> +					 eci[n].sched_group_id != sched_group_id) ||
>  			    XE_IOCTL_DBG(xe, n && eci[n].engine_class != class))
>  				return 0;
>  
>  			class = eci[n].engine_class;
> -			gt_id = eci[n].gt_id;
> +			sched_group_id = eci[n].sched_group_id;
>  
>  			if (num_bb_per_exec == 1 || !i)
>  				return_mask |= BIT(eci[n].engine_instance);
> @@ -623,7 +624,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, err))
>  		return -EFAULT;
>  
> -	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
> +	if (XE_IOCTL_DBG(xe, eci[0].sched_group_id >= xe->info.gt_count))
>  		return -EINVAL;
>  
>  	if (eci[0].engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC) {
> @@ -636,7 +637,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			if (xe_gt_is_media_type(gt))
>  				continue;
>  
> -			eci[0].gt_id = gt->info.id;
> +			eci[0].sched_group_id = gt->info.id;
>  			logical_mask = bind_exec_queue_logical_mask(xe, gt, eci,
>  								    args->num_bb_per_exec,
>  								    args->num_eng_per_bb);
> @@ -677,7 +678,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  					      &q->multi_gt_link);
>  		}
>  	} else {
> -		gt = xe_device_get_gt(xe, eci[0].gt_id);
> +		gt = xe_device_get_gt(xe, eci[0].sched_group_id);
>  		logical_mask = calc_validate_logical_mask(xe, gt, eci,
>  							  args->num_bb_per_exec,
>  							  args->num_eng_per_bb);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index e5db18c91f01..99e1bfa9b446 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -131,10 +131,10 @@ query_engine_cycles(struct xe_device *xe,
>  		return -EINVAL;
>  
>  	eci = &resp.eci;
> -	if (eci->gt_id > XE_MAX_GT_PER_TILE)
> +	if (eci->sched_group_id > XE_MAX_GT_PER_TILE)
>  		return -EINVAL;
>  
> -	gt = xe_device_get_gt(xe, eci->gt_id);
> +	gt = xe_device_get_gt(xe, eci->sched_group_id);
>  	if (!gt)
>  		return -EINVAL;
>  
> @@ -215,8 +215,15 @@ static int query_engines(struct xe_device *xe,
>  				xe_to_user_engine_class[hwe->class];
>  			hw_engine_info[i].instance.engine_instance =
>  				hwe->logical_instance;
> -			hw_engine_info[i].instance.gt_id = gt->info.id;
> +			/*
> +			 * Scheduling Group ID is the global GT ID for the
> +			 * current hardware, although the API is flexible
> +			 */
> +			hw_engine_info[i].instance.sched_group_id = gt->info.id;
>  			hw_engine_info[i].instance.pad = 0;
> +			hw_engine_info[i].tile_id = gt_to_tile(gt)->id;
> +			hw_engine_info[i].gt_id = gt->info.id;
> +
>  			/*
>  			 * The mem_regions indexes in the mask below need to
>  			 * directly identify the struct
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 4d5c2555ce41..dcbb1c578b22 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -68,10 +68,10 @@ static int check_hw_engines(struct xe_device *xe,
>  		enum xe_engine_class user_class =
>  			user_to_xe_engine_class[eci[i].engine_class];
>  
> -		if (eci[i].gt_id >= xe->info.tile_count)
> +		if (eci[i].sched_group_id >= xe->info.tile_count)
>  			return -EINVAL;
>  
> -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
> +		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].sched_group_id),
>  				     user_class, eci[i].engine_instance, true))
>  			return -EINVAL;
>  	}
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index df8c5663f899..342f22c2d9f0 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -211,8 +211,8 @@ struct drm_xe_engine_class_instance {
>  	__u16 engine_class;
>  	/** @engine_instance: Engine instance */
>  	__u16 engine_instance;
> -	/** @gt_id: GT ID the instance is associated with */
> -	__u16 gt_id;
> +	/** @sched_group_id: Scheduling Group ID for this engine instance */
> +	__u16 sched_group_id;
>  	/** @pad: MBZ */
>  	__u16 pad;
>  };
> @@ -228,6 +228,12 @@ struct drm_xe_query_engine_info {
>  	/** @instance: The @drm_xe_engine_class_instance */
>  	struct drm_xe_engine_class_instance instance;
>  
> +	/** @tile_id: Tile ID where this Engine lives */
> +	__u16 tile_id;
> +
> +	/** @gt_id: GT ID where this Engine lives */
> +	__u16 gt_id;
> +
>  	/**
>  	 * @near_mem_regions: Bit mask of instances from
>  	 * drm_xe_query_mem_regions that is near this engine.
> -- 
> 2.34.1
> 
