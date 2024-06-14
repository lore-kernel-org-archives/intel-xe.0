Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE70C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 06:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF14A10EC3C;
	Fri, 14 Jun 2024 06:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bChKs0wb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4055B10EC3A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718345502; x=1749881502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gDj0gWI/h5uvsNGpuGP0wWkMnFzoPCnBSBggCueFuOA=;
 b=bChKs0wbhj4QnmU15ISmdIO2i6dTMN3sd71fGKg/5yGKVS/L187MLfmd
 m40rH3JL+CskTgm+Ku2vzFb9E30NCl25ApGv3ntx87AVkvysemyJZIH4Z
 wsFFEG2RBKZ0bzjGKXqYVzs8H/ofsh27QXEN9PXEttz9hhpNm9mQOsfOf
 mH+rbsYMXOBa9qD3fY2JXwZfe6F6M73PLB/FeCmqxD/qhnl1isKH2Myj9
 TQm+I8MhgZyp3Dl/SIjqoRotpbZAZQWKr4lSpLW9fzZD2ZwPcTw6Fq69x
 BK7amxUxGSz/IY62bRRXCAOjgxApcA9YNVazJh0nEW6krz68+hhc+mDWy g==;
X-CSE-ConnectionGUID: A++JjejcSpCyLVmDCmXCgg==
X-CSE-MsgGUID: v24oQxGrRPCXNpJoiQlwkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25791797"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="25791797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 23:11:41 -0700
X-CSE-ConnectionGUID: n/NeLC7HT0KoUEA+rRBVIg==
X-CSE-MsgGUID: EB2FMxxHQuego8soE0WqIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="41071454"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 23:11:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 23:11:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 23:11:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 23:11:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQj2X//npHbLgQziQAY43ux7QQAUqQCvznLZtjAFcf4ne39uOyKYv0VoQNleBVBTQijIVL7w/VqvfpVjLTOYckOiN8Rm3nefnKjcm9j+daDw7tHavSHBq8jhoW/vWA4VzyU6x5vVGH9DszOnxVnkpnp6UOvhqfZOXdGH+1f4WfTCgAQAq7Qz/RapBsJisg4dHCy+U78DKgUsd6h8CwRuS+gDaeRAyR1cd/j/6UCSoTvfM2S+zHMOed7xkZbr/nHwxEibBKMXYAW76U0SVKZB7oixrXAbboCnIXdhtJTPfUxYXD8DcArTiTCFpFe/1gZMUZulg8lhlUHnJJtZQnpfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4YnMWVpaNWHkMwHy0fOEcvND52Sc6c50pwnxivV9lc=;
 b=aa300POtvsjYNzXzsDYhbwUNri03FOo77gJgNMb+m+nmYehQMSXxnIyMLm1jonElOcyT2bft5qJIAmw7WCUoj/zzeEj9qiUGxTF7pEsieF9HEP0DN8Re5/Dz00xVCwS5URRw/HZsynW3Iqv7ZT9/PNgbxmY7DWNE3xHGJK2aKIVfUdac1Jsbc4Az7jnFq1sCkFuWF7MzhXsSjIGg4SP8oNYF38y/6LsNg6q26EYNeG2S7uVgMIb5e+836aSbuvhfRjtl67ygn8EV4IUa9YVyPQjLB3EOMUa6kcNqwZdU3bHGDXngL+UESg5w2EcHtp7KWb6Pl3OTJBwHLGjPPr42Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB7931.namprd11.prod.outlook.com (2603:10b6:8:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.38; Fri, 14 Jun
 2024 06:11:33 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7633.036; Fri, 14 Jun 2024
 06:11:33 +0000
Date: Fri, 14 Jun 2024 06:10:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/exec_queue: Rename xe_exec_queue::compute to
 xe_exec_queue::lr
Message-ID: <Zmve8rpgrl89h6+a@DUT025-TGLU.fm.intel.com>
References: <20240613170348.723245-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240613170348.723245-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: b0534675-7557-4497-bfda-08dc8c38d6c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|376009|1800799019|366011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zuQzm+gqOkH9DyA6rooElH3Pyp7/4kKm7JbWjFJ5L98HWtOtdP8o09Z4RlhZ?=
 =?us-ascii?Q?djmifKaTdzTHZ34JRLx/VtZNJbn5YCYmQSzsU1ROimKFJdKYMgo/M/2ByAKr?=
 =?us-ascii?Q?sG4pMzwbuP8fvIkYEJ/FhK9flrH3Yb5NM22O3/TpLPvSMOQV1DEHBNanyz0B?=
 =?us-ascii?Q?nWNGgSg1KeSHVJ+nxNxGmmzj9CvzAT4lwqOxsaMU9LxVuMiOgXKr5/kusEJ4?=
 =?us-ascii?Q?jy4VKHNVrDDgVx1iKB9K0ynw6mol6Srlo+TRCxzr6b12iCEwIjnJjIpcRgCc?=
 =?us-ascii?Q?iivjwQxd023q+fUeu8XM0eB+36U5BmK7jyNfWCqshiyDbFmaE4Ydr0jNKnNq?=
 =?us-ascii?Q?uKCcKw4z9+pha5A056DlJC1KHqCeFOVwUO0fn3zUZVL04f4RbgpqaWJI1zVn?=
 =?us-ascii?Q?8NCD9q2chmXfubSoFM2yB6F84Bsl/bPoZXN+s7XvKhAwj5PQ05zbYIN1Ssr8?=
 =?us-ascii?Q?IsswsvKp4Uhhiv8BmI/3kRe0tSpmUWywxzpYrb0VvxDZmu5rWGpqHmVZe3Ms?=
 =?us-ascii?Q?LJYrTKQjRohtkt4S6d9MQQNLR9HwvLuE2WnLOo0Ae/AW6aNN5TyVrgeOqjT/?=
 =?us-ascii?Q?o5M+ujDQV6+Um4tjgN38SSmFpNUW13kL6p/CFz0ihui8lftlUmM8UKFJwAMW?=
 =?us-ascii?Q?YIuxMhwSAukBcxzlheepXjxXcjUazmH5sKObocfYPRZ7SI6NpkGTvLMESVMP?=
 =?us-ascii?Q?Fe0prfji4xbRbKA8kmEPySMKs5hgv2Sx+wJk4DJecgfZl5t56AJO3O5rdXSU?=
 =?us-ascii?Q?LAsb+VaLoBlKI8XuV+RkkVbsLZbeESxLo3yOvX/ouRhz/+8knHVA7bUmWhl4?=
 =?us-ascii?Q?nNsoq4jhwj3cZSSAuo9Nv6ANnEYGnIRMwPJ9pzj3963aTcTKUXBl1ap1IvIn?=
 =?us-ascii?Q?FjE63I4NLeysscodzu3Wx/iv53wt5p1hzWRfEpsXv++g36YxN4XmEnVhe7Fi?=
 =?us-ascii?Q?ZSSYrWv2mWyiP4rP/SyYCBVvwwk64d4ntY7s7hmLAeZftXr2XcLJj/4AdV0A?=
 =?us-ascii?Q?vvse/KzpNcJGSg2JkZGnwLVQgwE4lXEpLG2xWYVeVvim5lG2Mc4zmkDGdU/M?=
 =?us-ascii?Q?Mv+1NzVVGHSPQsHIWon3chatVz7dGWK6hr4TovhLaM3YOWjZsBxSliBiz3S6?=
 =?us-ascii?Q?p5GYl+oy1boiHFBrf/qJ6v1pPDDgihJFKE8Dw7YIlX5+W5OWJSFN5NxsxN8a?=
 =?us-ascii?Q?J8EWXZcZjpKNLi+3cFFk6FhIFv84U+t2GZeRYc7x22JuTefz8JvHJbQmlftY?=
 =?us-ascii?Q?4IA3GaT/MPME71Rt6bMpKY9NZLD886fAj/mKyhf59QX3SII9o9/p+cNkGWZb?=
 =?us-ascii?Q?uELRg+fFe/9Xiy949bn5e5kp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3cYAQ7rifZpLxw+qkQ4fpGV3KM8ExNpP8yFWxHrYDzdoYwb2z+Qo1SvHLYmD?=
 =?us-ascii?Q?bVB9koVk4C8igrX2diaCz/qBSP+fQ461Th1Pk9mBKFMWDgvUePsPamn373q3?=
 =?us-ascii?Q?YdHqSzLCOWOGSSSpqGgBOKhHnuRADzlgVLdBiszcYAiw2YgvstFewNdiLMLm?=
 =?us-ascii?Q?GhuqHXFFeCPJSJy72LFZelnHnIVCut2oqZw8DBGhkCs4CJ7SZSWfyHahPpOJ?=
 =?us-ascii?Q?4EyC+BPpFVP/J/lb53Hs3mvGssMDPU0ktfnrtkVMhqWsjzsOF7Kk5nNZqu1d?=
 =?us-ascii?Q?+FnDzXhjiaU+VfhHh751YKp8bVY1v6JMlb40youk6p/XtwMlA0FBtFKHvFZ5?=
 =?us-ascii?Q?gZP8zsgY3dIMh0cPfYUBYK2gWKoE1SSYVH+La61gE4TSCnUq5dRO4em2j96x?=
 =?us-ascii?Q?x/l0eAK1pCF7CuPgtdQjgdVHgZTa3wj8w4rAmd7STdVwF/oTBjqPbAl/auRb?=
 =?us-ascii?Q?slLLI7bhu5xC/Ro/KR02wTqdeGYEBHb0PRmaBmI9Gj/8TymfZJFl/sB6R2nv?=
 =?us-ascii?Q?8tQq7VnlVAZeYeohszwRMq5Bb5KWkiU4zBXl7xsfbQKELiN81dCOnayBvWQU?=
 =?us-ascii?Q?PN/vNZWnTKdnNfI65dWlXkSKkcoYjZlizWHGf3OIpb3OEat50mYQQnhLM0V+?=
 =?us-ascii?Q?Pk2RspN+Zfwn2DV8r0THY5Rmz++Q52K73WWP3cJxSw8I/oTcOKfd5+1JMR4P?=
 =?us-ascii?Q?KdRAapMgyFMhw5Cbidpqe4Eb1V68qDiBo3nRv7Xj+H+XTHIRjhYj9S+QRUWe?=
 =?us-ascii?Q?/u2lmzuOMmskmkiled9YDt0/mmfXF/hV2HzjGmygLnQbsFp27pOTKLkE6ApN?=
 =?us-ascii?Q?azVswYM7wJQzToQPA/Lv5vSwvIL52QqSOffYHRaj9EAdCvpiWMDE89TGHymS?=
 =?us-ascii?Q?ze6QQhcCKV5xT06oZLn+XpJH4e3/u7Z4Miecc+U6E7suUQxxWpJ5tDDTesG+?=
 =?us-ascii?Q?7x8IJVBNVggAm5xuXJoJttSOM6GDaMLy4Er/DibYCALRSBcTEuNOOYDW8Wod?=
 =?us-ascii?Q?aTQ3SQE6s1cw1+AioCE/0Xwx2ssdZr3bpFXeqJsVktN+jNOx+vNqYO/C4JIV?=
 =?us-ascii?Q?zRUPN56/LeTWRV9+KAIDNzpcFL+W7/+LLAYJsUpDUUqn4hDDXPPiC85dcDyS?=
 =?us-ascii?Q?1f7HtuflAlgsSKyLmbM5SheUjsyU/1EocIRuy/C6p1I3eS9741HwKgiY9yBH?=
 =?us-ascii?Q?y7Oq1k/R5bIdEwN48GDopmP62IrA2St/PyJnidIZd95X/aMWHJd9wvcupYBv?=
 =?us-ascii?Q?eYmREOBp2sL2+RE/QssLUMIQoMDm3N30gp1mtT1+5oLr6/yvFSE0AlZPeiAi?=
 =?us-ascii?Q?0kWe0IVnJTw912JCvjo1xQ95FGu++4RURj1kCj5wv5HJSJNrQIZFKbV1FXni?=
 =?us-ascii?Q?2PUr4TsKh/OaG6SPorxSUW350vp13AuEPyw5beD1CPoukew3529seUqt76lt?=
 =?us-ascii?Q?wDeI0L9vmhWjGi2W+aXdEaBWI2UNNnXxZqTj4QEPvJHHKQ1st9zNGW1Gjlbb?=
 =?us-ascii?Q?ywmw+WoMir3ud3Id/J89Xuv1mapD+wyeQyp8h8ff44zZ+B4gdFWH9gFm/RUy?=
 =?us-ascii?Q?cE3WLE9XLiVui1fc+spf5je5oN9vGXmkxwhX9sRgf7uzPW7Q/c+e6ihYsnWi?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0534675-7557-4497-bfda-08dc8c38d6c1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 06:11:32.9916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db2v+61fKxbf9pvuLzXpt7Cwdlde+MR2GklOMQQjXGH31+z8O2d1FoJkSd0nNtQ9J6ubiim1VcjHPHYtW334SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7931
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

On Thu, Jun 13, 2024 at 07:03:48PM +0200, Francois Dugast wrote:
> The properties of this struct are used in long running context so
> make that clear by renaming it to lr, in alignment with the rest
> of the code.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  6 +--
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 14 +++---
>  drivers/gpu/drm/xe/xe_preempt_fence.c    |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c               | 58 ++++++++++++------------
>  4 files changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index cf45df0328da..0ba37835849b 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -67,7 +67,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->fence_irq = &gt->fence_irq[hwe->class];
>  	q->ring_ops = gt->ring_ops[hwe->class];
>  	q->ops = gt->exec_queue_ops;
> -	INIT_LIST_HEAD(&q->compute.link);
> +	INIT_LIST_HEAD(&q->lr.link);
>  	INIT_LIST_HEAD(&q->multi_gt_link);
>  
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
> @@ -633,8 +633,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			return PTR_ERR(q);
>  
>  		if (xe_vm_in_preempt_fence_mode(vm)) {
> -			q->compute.context = dma_fence_context_alloc(1);
> -			spin_lock_init(&q->compute.lock);
> +			q->lr.context = dma_fence_context_alloc(1);
> +			spin_lock_init(&q->lr.lock);
>  
>  			err = xe_vm_add_compute_exec_queue(vm, q);
>  			if (XE_IOCTL_DBG(xe, err))
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index f0c5f82ce7e3..201588ec33c3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -113,19 +113,19 @@ struct xe_exec_queue {
>  		enum xe_exec_queue_priority priority;
>  	} sched_props;
>  
> -	/** @compute: compute exec queue state */
> +	/** @lr: long-running exec queue state */
>  	struct {
> -		/** @compute.pfence: preemption fence */
> +		/** @lr.pfence: preemption fence */
>  		struct dma_fence *pfence;
> -		/** @compute.context: preemption fence context */
> +		/** @lr.context: preemption fence context */
>  		u64 context;
> -		/** @compute.seqno: preemption fence seqno */
> +		/** @lr.seqno: preemption fence seqno */
>  		u32 seqno;
> -		/** @compute.link: link into VM's list of exec queues */
> +		/** @lr.link: link into VM's list of exec queues */
>  		struct list_head link;
> -		/** @compute.lock: preemption fences lock */
> +		/** @lr.lock: preemption fences lock */
>  		spinlock_t lock;
> -	} compute;
> +	} lr;
>  
>  	/** @ops: submission backend exec queue operations */
>  	const struct xe_exec_queue_ops *ops;
> diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> index 5b243b7feb59..e8b8ae5c6485 100644
> --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> @@ -129,7 +129,7 @@ xe_preempt_fence_arm(struct xe_preempt_fence *pfence, struct xe_exec_queue *q,
>  	list_del_init(&pfence->link);
>  	pfence->q = xe_exec_queue_get(q);
>  	dma_fence_init(&pfence->base, &preempt_fence_ops,
> -		      &q->compute.lock, context, seqno);
> +		      &q->lr.lock, context, seqno);
>  
>  	return &pfence->base;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 99bf7412475c..f5480a4c56f3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -83,10 +83,10 @@ static bool preempt_fences_waiting(struct xe_vm *vm)
>  	lockdep_assert_held(&vm->lock);
>  	xe_vm_assert_held(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
> -		if (!q->compute.pfence ||
> +	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
> +		if (!q->lr.pfence ||
>  		    test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> -			     &q->compute.pfence->flags)) {
> +			     &q->lr.pfence->flags)) {
>  			return true;
>  		}
>  	}
> @@ -129,14 +129,14 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
>  
>  	xe_vm_assert_held(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
> -		if (q->compute.pfence) {
> -			long timeout = dma_fence_wait(q->compute.pfence, false);
> +	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
> +		if (q->lr.pfence) {
> +			long timeout = dma_fence_wait(q->lr.pfence, false);
>  
>  			if (timeout < 0)
>  				return -ETIME;
> -			dma_fence_put(q->compute.pfence);
> -			q->compute.pfence = NULL;
> +			dma_fence_put(q->lr.pfence);
> +			q->lr.pfence = NULL;
>  		}
>  	}
>  
> @@ -148,7 +148,7 @@ static bool xe_vm_is_idle(struct xe_vm *vm)
>  	struct xe_exec_queue *q;
>  
>  	xe_vm_assert_held(vm);
> -	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
>  		if (!xe_exec_queue_is_idle(q))
>  			return false;
>  	}
> @@ -161,17 +161,17 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
>  	struct list_head *link;
>  	struct xe_exec_queue *q;
>  
> -	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
>  		struct dma_fence *fence;
>  
>  		link = list->next;
>  		xe_assert(vm->xe, link != list);
>  
>  		fence = xe_preempt_fence_arm(to_preempt_fence_from_link(link),
> -					     q, q->compute.context,
> -					     ++q->compute.seqno);
> -		dma_fence_put(q->compute.pfence);
> -		q->compute.pfence = fence;
> +					     q, q->lr.context,
> +					     ++q->lr.seqno);
> +		dma_fence_put(q->lr.pfence);
> +		q->lr.pfence = fence;
>  	}
>  }
>  
> @@ -191,10 +191,10 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>  	if (err)
>  		goto out_unlock;
>  
> -	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
> -		if (q->compute.pfence) {
> +	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link)
> +		if (q->lr.pfence) {
>  			dma_resv_add_fence(bo->ttm.base.resv,
> -					   q->compute.pfence,
> +					   q->lr.pfence,
>  					   DMA_RESV_USAGE_BOOKKEEP);
>  		}
>  
> @@ -211,10 +211,10 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
>  	lockdep_assert_held(&vm->lock);
>  	xe_vm_assert_held(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
> +	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
>  		q->ops->resume(q);
>  
> -		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, q->compute.pfence,
> +		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, q->lr.pfence,
>  					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
>  	}
>  }
> @@ -238,16 +238,16 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	if (err)
>  		goto out_up_write;
>  
> -	pfence = xe_preempt_fence_create(q, q->compute.context,
> -					 ++q->compute.seqno);
> +	pfence = xe_preempt_fence_create(q, q->lr.context,
> +					 ++q->lr.seqno);
>  	if (!pfence) {
>  		err = -ENOMEM;
>  		goto out_fini;
>  	}
>  
> -	list_add(&q->compute.link, &vm->preempt.exec_queues);
> +	list_add(&q->lr.link, &vm->preempt.exec_queues);
>  	++vm->preempt.num_exec_queues;
> -	q->compute.pfence = pfence;
> +	q->lr.pfence = pfence;
>  
>  	down_read(&vm->userptr.notifier_lock);
>  
> @@ -284,12 +284,12 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  		return;
>  
>  	down_write(&vm->lock);
> -	list_del(&q->compute.link);
> +	list_del(&q->lr.link);
>  	--vm->preempt.num_exec_queues;
> -	if (q->compute.pfence) {
> -		dma_fence_enable_sw_signaling(q->compute.pfence);
> -		dma_fence_put(q->compute.pfence);
> -		q->compute.pfence = NULL;
> +	if (q->lr.pfence) {
> +		dma_fence_enable_sw_signaling(q->lr.pfence);
> +		dma_fence_put(q->lr.pfence);
> +		q->lr.pfence = NULL;
>  	}
>  	up_write(&vm->lock);
>  }
> @@ -327,7 +327,7 @@ static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
>  	vm->flags |= XE_VM_FLAG_BANNED;
>  	trace_xe_vm_kill(vm);
>  
> -	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
> +	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link)
>  		q->ops->kill(q);
>  
>  	if (unlocked)
> -- 
> 2.43.0
> 
