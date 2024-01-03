Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C08C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 07:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441D410E232;
	Wed,  3 Jan 2024 07:57:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9529A10E232
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 07:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704268621; x=1735804621;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lIjZybPaJSWytmUwSvtwP1QBW1oz2asgZmVecnWukSk=;
 b=cZ1kYrTZLFAFI2WbZIdfkjYumx+z+EFs2/2D8j8Lt9PDb7XQplIJcbPO
 wItu5P3A7ulWWGlG18GfVuGw/SP8vFY/5TR2IdFMmQ25nfIFjhrA0MTte
 hQb0dizFjQE43FmDIOygUq5tOz4xnBCLyyZJdNfP23yuQwL6IVLWiIQBF
 rkGA1pSDrz7yIJPW+2iy0O6zIvjLUaWY7rMQ+S87A6XaTZYSHnzx496Po
 xsLLy5+t8fCDu4hjoOfNIkG/cN7iHmGaK4qgJVQZNrWbh6uLoMs3KrlDX
 lWGqyolDi/iGvcH/Ibg6cu9KnuDAY5kNNVHkcxKAFf1zg5QtWs71OrLTc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="399747761"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="399747761"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 23:57:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="953152862"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="953152862"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 23:57:00 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 23:57:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 23:57:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 23:56:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlmNF7KkvzGNrsXLBosLlNjDPeuYmkuUAsKCEgfvk1zwG/jWxs0Z4YkDx8E4P8ftW/Ey8xHqjSZs5tbrGUStN0sCk4oE6Xz9+IDqR5qWn3ABEXiK5PSNliCCFafkpVvA1U7lB4hMTRzQ0IEW9NN+bPAapmj2gRK64GviLca4wRBQy3+C0rzC+D4auk67buFhS+7kRXKKrFI5rR7TN1anyfUeFRCUFXNKQJ4ngveX5Tm9wL5Xt3YqF4J3h024jzjacOmqwiIo7V6rAmdvmcofnglKmr6tic4EEa5/W+LlnJIldm2EFjoOzMy1QAW8PX6ac1qNXr9IbKS0Xh9EUuFkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DMLi5MdCpBY18keYboxzlKOIOVlRwgvPzeJ/02v8jE=;
 b=A/bBiySRS3RqcGEU2luvWOY8o449nseXLmSAy3LcG8VkS7Tjk/0wF5F/1WA53JnMPg9CJ662ULIcky3GTZkQue2zjW2TTzLfzUd/kmEoNlDnxRbG1RsZPTDlaRqLOYW3xLqttxFvzAegNaU68CR6/H8WaHItLXQGlo4w1OnYI0wtzDzFD1bNgz0rbQqiH7kh5Jon8cGJYCqph8JcmyebiFS0nLLBdPiSy1NiGm8jnoAFUKd6OEJMZsugn7MLKu2PcW5ftDouegBI2nUtUvZxTqeH81AZf2z/MKiJsIBRk4sXVeuH2mdbCgHeFS9t2sNW1TV83UXagctRh9O6PyR/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.23; Wed, 3 Jan
 2024 07:56:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 07:56:57 +0000
Date: Wed, 3 Jan 2024 07:56:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Refactor __xe_exec_queue_create()
Message-ID: <ZZUTOGcmvbJzfFKE@DUT025-TGLU.fm.intel.com>
References: <20240102211731.6720-1-brian.welty@intel.com>
 <20240102211731.6720-2-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240102211731.6720-2-brian.welty@intel.com>
X-ClientProxiedBy: BYAPR01CA0011.prod.exchangelabs.com (2603:10b6:a02:80::24)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3aa4b8-25ed-402f-fcd6-08dc0c318eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDO9qmH897lxtaJtasGaflgeB1AtAx4MGtpAy8Bt9Q8h0NlgcjmH7I9L4bjnJAW4VWxHk5yP1TEiFDjx2HHnyJ5hPlhrbK8qMFAqnBvytufe7uZQYAEruU9yJx/ufRDp+gJ9xQ/3FdyZJhCcc9Ihz8JXFnU/vYh8AUnmGNZ2/qE4CgWQQqXtKb3h+/3QZAFfp324e6F+LM1Y/jnGCW8zQTZowfnvNEMQNmIhwAvNbt/+YZLXJwUOKIstYr5YqcI/AbL5ma9GROywfNXydRZjEeJygpYZyt2FtmPRCCec5T1+CDUxmBqGZLGMO04hUHclmJWDH2Mi50QAAvnUk8H+48S0CQnKxsLsjuFAk60S7JCK8sfgZCt3Hzt1b5PVwLpk05LHpkAs1MytbHRcLMf/Wco5+ArjY7Qiyn0QWeR0SDj1gLkdC+384vMdDPRQFSRftCTJf5zWtjcMyCxR6u9e1IlVAn7CfB8p2bvUsIIOECg8DgndyXJ1EGQFWj3XZioq+RX3PPvvwYMSp4JnFZWwo3FNdnzp+g6PIja3Q/iuChqRNrXaqVAb3FhrKD+dKmB+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(86362001)(82960400001)(83380400001)(6512007)(26005)(6486002)(6506007)(6666004)(478600001)(6636002)(66476007)(44832011)(66946007)(66556008)(2906002)(5660300002)(316002)(8936002)(8676002)(41300700001)(4326008)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lP8zj7AaHoPt77MzUR+6J9f0SD9J06XKfDrfPJr1nlghwBIfo3nawRBLemDe?=
 =?us-ascii?Q?zqp+aqPBylBUgbgS251XUKLFPMpBNPZL7DhfBgO3iOwyLlG/3Lc4vfb/X/hn?=
 =?us-ascii?Q?m1YXLoMR0EBpTA4+w47PFThpPXkPcWY5aqonWQGB9l00rKdSJ7kYzqnWgfqQ?=
 =?us-ascii?Q?Jl0dkbxsk/1ar1pw97URWX0sx9L6k0fgU9nhwgmMx89i1iVqHBpmr/wGaGqj?=
 =?us-ascii?Q?OJlZqfPM7FZYbOC3SJZBrpN5evypzqrfBHkuiyd/IXZEemiK95BKtHf2X3Ty?=
 =?us-ascii?Q?+hgtsYHJMdFVZh1BepkNp2qJxCpt5fotQtrN+hCeqZ6uaAZdxzsV8kH8cHwY?=
 =?us-ascii?Q?7cTm5WQAH/TU7ruVMcJOGTENI/QZxAw/WtU/fBsXzfpWthHKEOVfFEfDpA12?=
 =?us-ascii?Q?7RzfzC7hTgI0MtLP4lku8L/NafgdrKDOFAwCfOvlbxXfI/l4EQ/Wz3Q+ZjKP?=
 =?us-ascii?Q?Mm8u0wH3u96+TqL0KnYHCXfs9OztQgjXncg92IgAW+4BfK2F1ZcCcjy3Z+nz?=
 =?us-ascii?Q?cwJnewzvrDh9MU2qIhot0AB5P68jysgRcS3fIQEsp/HJdy2Ll3GkX+m+Ia4i?=
 =?us-ascii?Q?427EEvxXsXvnleipGrDERSJTsfYVaKKZ96SbMBmaDTf4Y72ua/D3LFI4zroo?=
 =?us-ascii?Q?sC3z1ECvJi66IZBMhHjszZC7hHn6RfqeOUjHSb6gx41ftoRFVl3TAYvZ6jY9?=
 =?us-ascii?Q?IMj1QUEzTNE2ybZpO9qqSnQ3GUA/vhcN74IavGu37N0ZAiN8BcD6aJQroibg?=
 =?us-ascii?Q?x2drZpVDKFEJ6YprgnEy8k2XFwYN6a8ALigoQRKYHYfPkU11DnatocPOd9Yk?=
 =?us-ascii?Q?8HHelv9CorEYRxht3Z7rRj7OZPYNCl7Icm6i56pGx1+4UhxbeiGNSusIWJzZ?=
 =?us-ascii?Q?wmJotP1dpEnOmYYaXPYkdHwTqe4Xx9LGhZV+y7wzQNwBg/sba6tJBfZ2FCka?=
 =?us-ascii?Q?+CBx5E9+TN8kgrivXLa4Kn5EZHFom36OOXalY9iD5UTHWYJN5AQETOmawRbm?=
 =?us-ascii?Q?pWaSKj5SrmxzR1EQ7pFxK6/ZBQIayZN2m97Qk/yqEyATrfHntWAmV4r+ga3Q?=
 =?us-ascii?Q?m89ZK1BRjHC7fyjcbnIcmOm36qgmyp9iYLi4bQwhfiQmU9U9C6t6il+gohoO?=
 =?us-ascii?Q?SeavLu3OwiOE0bRxo/kwiyDo9wid+HVH/7VG03kBm+5E/xm1dbHEEDsfZC/c?=
 =?us-ascii?Q?pFRkXVkxYxM1zLWt8bLD6VvappVAOjiKOSiC3fxxaNzNnr6GGkMesYOsqPyB?=
 =?us-ascii?Q?Lq93GAuudteWIOwLoMGlFm4790Q6jNWeLPSHbkeTR25Z8Z/n6Fax7szIQAqf?=
 =?us-ascii?Q?3WYobidNDMUBaGXgI7XIQYIukoX1R2ecbJ1pbaJ8s7ZK6DsfZUEnVvF7jtcp?=
 =?us-ascii?Q?sohrPXK50DuFe4A7vQrnWnVj0QyFZgkMU+WwI38cl9HgiO2Ll+CtjARAo5hC?=
 =?us-ascii?Q?FXGiwUR+n4a+49AeoH/6n126bouCW0vdF0tt+CR4e7kPVnvoTpEYkyOrqZkv?=
 =?us-ascii?Q?CxNwxksLrhygjtNhD47Xux9PZiaijm+kLCq04i9dfTCwTpDB4pqAKKzL9fxh?=
 =?us-ascii?Q?MImPXQINYvLhy8bog3m5OoxyF7NRKdGfHqEDUcxlAj00ng4lKQtZ92uS+L4v?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3aa4b8-25ed-402f-fcd6-08dc0c318eeb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 07:56:57.3805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkhVt098hTuqs+OtgUY/9zI2/EIXW+b2KXP6hAlBRUPXfwHLFBuDeYrS5E4EZQaG6zmrlq0g9LcBNDkhfi76yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 02, 2024 at 01:17:28PM -0800, Brian Welty wrote:
> Split __xe_exec_queue_create() into two functions, alloc and init.
> 
> We have an issue in that exec_queue_user_extensions are applied too late.
> In the case of USM properties, these need to be set prior to xe_lrc_init().
> Refactor the logic here, so we can resolve this in follow-on. We only need
> the xe_vm_lock held during the exec_queue_init function.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 58 ++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 44fe8097b7cd..94ae87540854 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -30,16 +30,14 @@ enum xe_exec_queue_sched_prop {
>  	XE_EXEC_QUEUE_SCHED_PROP_MAX = 3,
>  };
>  
> -static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
> -						    struct xe_vm *vm,
> -						    u32 logical_mask,
> -						    u16 width, struct xe_hw_engine *hwe,
> -						    u32 flags)
> +static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> +						   struct xe_vm *vm,
> +						   u32 logical_mask,
> +						   u16 width, struct xe_hw_engine *hwe,
> +						   u32 flags)
>  {
>  	struct xe_exec_queue *q;
>  	struct xe_gt *gt = hwe->gt;
> -	int err;
> -	int i;
>  
>  	/* only kernel queues can be permanent */
>  	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
> @@ -77,8 +75,23 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
>  		q->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
>  	}
>  
> -	for (i = 0; i < width; ++i) {
> -		err = xe_lrc_init(q->lrc + i, hwe, q, vm, SZ_16K);
> +	return q;
> +}
> +
> +static void __xe_exec_queue_free(struct xe_exec_queue *q)
> +{
> +	if (q->vm)
> +		xe_vm_put(q->vm);
> +	kfree(q);
> +}
> +
> +static int __xe_exec_queue_init(struct xe_exec_queue *q)
> +{
> +	struct xe_device *xe = gt_to_xe(q->gt);
> +	int i, err;
> +
> +	for (i = 0; i < q->width; ++i) {
> +		err = xe_lrc_init(q->lrc + i, q->hwe, q, q->vm, SZ_16K);
>  		if (err)
>  			goto err_lrc;
>  	}
> @@ -95,16 +108,15 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
>  	 * can perform GuC CT actions when needed. Caller is expected to have
>  	 * already grabbed the rpm ref outside any sensitive locks.
>  	 */
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !vm))
> +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
>  		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
>  
> -	return q;
> +	return 0;
>  
>  err_lrc:
>  	for (i = i - 1; i >= 0; --i)
>  		xe_lrc_finish(q->lrc + i);
> -	kfree(q);
> -	return ERR_PTR(err);
> +	return err;
>  }
>  
>  struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
> @@ -114,16 +126,27 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>  	struct xe_exec_queue *q;
>  	int err;
>  
> +	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags);
> +	if (IS_ERR(q))
> +		return q;
> +
>  	if (vm) {
>  		err = xe_vm_lock(vm, true);
>  		if (err)
> -			return ERR_PTR(err);
> +			goto err_post_alloc;
>  	}
> -	q = __xe_exec_queue_create(xe, vm, logical_mask, width, hwe, flags);
> +
> +	err = __xe_exec_queue_init(q);
>  	if (vm)
>  		xe_vm_unlock(vm);
> +	if (err)
> +		goto err_post_alloc;
>  
>  	return q;
> +
> +err_post_alloc:
> +	__xe_exec_queue_free(q);
> +	return ERR_PTR(err);
>  }
>  
>  struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
> @@ -174,10 +197,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>  		xe_lrc_finish(q->lrc + i);
>  	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
>  		xe_device_mem_access_put(gt_to_xe(q->gt));
> -	if (q->vm)
> -		xe_vm_put(q->vm);
> -
> -	kfree(q);
> +	__xe_exec_queue_free(q);
>  }
>  
>  void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
> -- 
> 2.43.0
> 
