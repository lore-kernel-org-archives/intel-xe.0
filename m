Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F32C54798
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 14:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9CB10E289;
	Fri, 23 Feb 2024 14:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRURlfnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAFB10E289
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Feb 2024 14:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708697541; x=1740233541;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p1ootaxymWrr4OxAz7CPg+EVuBrSX6BfLnbrmanbfOg=;
 b=cRURlfnJWPKX43ewe6vJa0w61/mP49GY2Xp6IiPsOEm0j4dMe5fkkwGd
 +oX5cRGc1Y/k9VSTODcsyXcd7u9S95zQQv8yLU7Rh+BhU7upVDkwvvE3W
 fSW/jUmz/5TbvSjHy4lAxdZ4zwaE9hV4twO5L9lyUflmpxgW9vfX++raH
 0cYG546F5txzbpabK0AagSzr+OF4vFlTgsRzuGglJZ3HIosprh0wyzbkl
 0cpg3KpHAWaHAOEbRV+j1kCAhWSDgpMeaIpM4NSykXqxpAA8cCb+lu4Lu
 AbTEWU3tw3bQqtFPGoNBc4stmQWMGoTcLibaFdxri8q45BmYAbKkAPvjc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20451164"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="20451164"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 06:12:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6290660"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 06:12:20 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 06:12:19 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 06:12:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 06:12:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 06:12:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yut94uoauTqe7JsWp8kWSbe01aDjaE37Y9Xm2sh6EJJBRvGcXCkUcQ42UWajnHARANquMhC8EMOCsyFr7EtW2/jFC4pwm7hELfKDJgCWtpkPPrhJO5y0m80WXDt3DEAidHtjWHUNf7hWvChAftn3ihOY2r7quhYK2PHw0qINXHKEU2uz2t+GsKVhuvCO22j/Jnyc+DK9rFGy94hS6zP4/neSF3ieNmW7mYg5MVINYH0LkBX8vmQqrZycmYeQtpAMMXM5Ffug+1170thhIwFt2TW1xsL1KQoKBo9HZ5LKrm6skKflx147rCUgrobFL/EDc19666SJi8q9ASZytcyT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODSyyLwjOGjLVur03E3d/9ANnxC01fPWOLIKvnUkYAU=;
 b=IchQCLBiiaEB6tny3UuEpsGwXR0+D3NZXH3611bt/opnRRUigITIm5SajqIeCjXhnWJgvJDizzptho3xzM/YktJ1Nzp3vVJGBz1SIY2cunTzO5anOc3Dn51C5DD2Wo0dE2FdKa6nGL7uhqEZ0z4P6ykMWXaXWb64In+ngpu0/4KggOFWG7xWWFf5GplLOGcpsdWiw1/tu/Rh9mmnoOf5wry09Gk6h36ra7KREBFmk+PBPc05bpieiYLvh+0Nfrl/nppn7soXxYMCx0pe/K0g1AajHY+LWjKQ8tJvVryNe2qQZPW3vZh8hMiEeZVBr8ipqZB42u+osp/GmHwGOMl+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5508.namprd11.prod.outlook.com (2603:10b6:610:d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 14:12:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 14:12:11 +0000
Date: Fri, 23 Feb 2024 09:12:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove unused 'create' parameter from queue
 property logic
Message-ID: <ZdinuD7bd_KTkz_m@intel.com>
References: <20240223122311.7238-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240223122311.7238-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5508:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e1adf95-521a-48d0-bd5a-08dc34796d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7cNHL4JN88By34vIrzjOxPSyb9VtiAO8AVFCbBMGdcyYnLDHZFNDZrNzlzWVFbJGkmYwMC9fe9jVjDrodWiTfXsOaTeDJN07wKqFWUAIwBX/3AekprUj4AiUjPo0MUYKHlq+V95dQzIz5efqeNHkkLa8hN78cA3K8FzcigikYlXCIE9xYq/aRcFG6bT79zCjNdUFjpzUdqL1U0G/WhGnjgY5X33unvHBwEaAge1wYx5Cd0v0bO6fRiEW8oLtrLymcfu4RogZY3SsTpXQ5jcK3MZxfj6R0EmW2DYE8ydJ2jMWiW64ijHnDyzd8BYMcDUCvzSYCi5zozceJhk8+IqdPzRvtxo+cGVCVyxpvq4SiMn3iCQc136+YW46MdNGXwNAL43/Le9kZMud8WWiaOLZcXMm3Lm9aLtwoMAhakW1htVDoznzfMn8arxw60dO7katfN7jugcjk0x+XsXEskHa+1grjn3w/iinV4ACMihbOkoQiW3bknaCNPpi2chkvtdY+KcssSK1QT9nFVu9ioz7CwocMEiOTaqNiPjS8DBqLuQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MqU6QwWaJUiDQk3+OaKTTSkBSHKGtC/HzxQNkr8NW0ljWVIt9eDexm0zg+G4?=
 =?us-ascii?Q?622hoQjImPAhzCCmJeQjCZo9waCeVUxnpBePbr3cU6W0p0Nca2JeGEat4FkT?=
 =?us-ascii?Q?HlDfCmFkNEdVVRsHizF6Nyxj+P70rFxehhp2WWPOOVr6F3ohAL2g/MF2aKDJ?=
 =?us-ascii?Q?hlgR4RmLI2IMTHlznw+NQmRNdplzQaYwmylHGDx6l29lfcItibJr8VgF/his?=
 =?us-ascii?Q?x92MVx4SI/7h7UidVfOHSbfyG/IxnpLP21NDqv2s7pAwzLYcvJ24ZGrAcndH?=
 =?us-ascii?Q?wX5IW8yxiawesCMmMvgBhpzvwTUX70g7RQB4/TwTQDU1HP8s60dsESn+QqW2?=
 =?us-ascii?Q?RJAAjV3mu7D6FC36rY0ZFnJOFCo93493BTcz1Icaqr5LR6CD/ZZUp3kmyQoa?=
 =?us-ascii?Q?VWfZHA7xoipZMfz+qISMet/lBouqpusfnTcaEdBGqHer7MXA7YdvRW142GqY?=
 =?us-ascii?Q?+U5kH98i+FOzBlDMv7ocbZVz/9lTWfKFP14aUCne00XsS/uK2sJT84dBw3QT?=
 =?us-ascii?Q?nV/0SezP5OHM+I9s8r1iKSWuLHZjJ/mQ8HEfnHGqEw8gPjLY3N0T/Mv1o+nw?=
 =?us-ascii?Q?yY8TEFNWoGoNztELAPevMrWUFts6zQqez+G3yhE9hcvbG2pqTkV8XJHHXUAg?=
 =?us-ascii?Q?sX2FFh/f7iWP6Y1YRvwQlgYhGaDL/iZBoZFMLq+YkCSaK3ml7u7Gws7pyR7g?=
 =?us-ascii?Q?e8ai71C5MwDSmWQccWWQoieTeXqO77Pn5KiBcd9X3UwSgHkoWY8/6A2ajMvi?=
 =?us-ascii?Q?PUlR/K6K3qyhYEsibV4s2pKb1i6wNFU4Z3NGnaAO7l4vAkx2fWc0ajj8WUmc?=
 =?us-ascii?Q?hehFqyw3y4fe3h9bb9JqlKNALL5RC2A2qm6JQ8EaxDqzfbXS/gNmL3SiO8hu?=
 =?us-ascii?Q?f8Q9sFnIDI3Z7cIQsuJjXA4KOPtgEnPdHaLPzO+rfoHM1IOsKCnF4g0vqnlO?=
 =?us-ascii?Q?lOxnJaElcOYLmBSAlFOiwKxJFCdns5cg1h84akJE5ya4RFoB7ys5geJJtGRj?=
 =?us-ascii?Q?/kPt5pYpGaz4pJDzPo56CRscr3Auq4AWx/AhU02fFlq6DvBqpMBu6vOd6IYO?=
 =?us-ascii?Q?CUe98dpnGDKw8jSj6FBzzR9FtKBdPmaSL1F0lnfMmK0Ngy1xqh6Nn1IW1If2?=
 =?us-ascii?Q?KyLYArCrfta6oPzYnNxVxUNBUtFeC+A/O1NOBpeLaadFcQffmIrslJQfxO3k?=
 =?us-ascii?Q?dyi3CO8GgStsIGshvFf0SyrzND9ePbTITe6QzzKpjKcK8/c0Kd+IVhLWPRyT?=
 =?us-ascii?Q?g3WzhBIOsB+oT+ALQrOEs+UMlfRhnB/NXXa7+nzTch1EnkpMBDcpSpMY3kw9?=
 =?us-ascii?Q?x/1ZmbN+0OpsOSLD+4CYmNS3oUbuuE4BuaNTOJTeQ4t7JiSSNs/vI8wtyAj9?=
 =?us-ascii?Q?d7SVubHQL1rJDIiGhTQMDv13ksmWMPenCl0oLOUAXni4hpvLrHe9vHbt5iub?=
 =?us-ascii?Q?HZE11JtFlyaTW6TebHdqlCNqk9DTs/kMbFT52AL4/6kt0Qni17Xk6/rlhrQ1?=
 =?us-ascii?Q?R9WZhM8tBaOqyakrI0bh2/i4FVGpCiFNrunhNT25EoQy5Uh3wvL8e7ozb7eO?=
 =?us-ascii?Q?2DidnsCK+4L7Yfxp0kmNEfgtNlCWwmPUQyESQ58/OTG5WiI2NjwgeTy8Rbow?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1adf95-521a-48d0-bd5a-08dc34796d86
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 14:12:11.5502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koUuAz+pSmo9jNSj8x/iHpCvDZUBBE6ebWio93hEstSnSSBO5GKJg6IEv5ZUnqT4F6625esruAOb31W3Is/xPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5508
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

On Fri, Feb 23, 2024 at 01:23:11PM +0100, Nirmoy Das wrote:
> The 'create' parameter in exec_queue_user_extensions was always true.
> This commit removes the dead parameter and all the relevant dead code.

I'm afraid that you need to rebase now that I just push the removal
of some of these functions.

But with that rebased you can already resend it using

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 56 +++++++++---------------------
>  1 file changed, 16 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 4bb8f897bf15..969c82d20e79 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -31,7 +31,7 @@ enum xe_exec_queue_sched_prop {
>  };
>  
>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
> -				      u64 extensions, int ext_number, bool create);
> +				      u64 extensions, int ext_number);
>  
>  static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  						   struct xe_vm *vm,
> @@ -79,7 +79,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  		 * may set q->usm, must come before xe_lrc_init(),
>  		 * may overwrite q->sched_props, must come before q->ops->init()
>  		 */
> -		err = exec_queue_user_extensions(xe, q, extensions, 0, true);
> +		err = exec_queue_user_extensions(xe, q, extensions, 0);
>  		if (err) {
>  			kfree(q);
>  			return ERR_PTR(err);
> @@ -268,7 +268,7 @@ xe_exec_queue_device_get_max_priority(struct xe_device *xe)
>  }
>  
>  static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q,
> -				   u64 value, bool create)
> +				   u64 value)
>  {
>  	if (XE_IOCTL_DBG(xe, value > XE_EXEC_QUEUE_PRIORITY_HIGH))
>  		return -EINVAL;
> @@ -276,9 +276,6 @@ static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q
>  	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
>  		return -EPERM;
>  
> -	if (!create)
> -		return q->ops->set_priority(q, value);
> -
>  	q->sched_props.priority = value;
>  	return 0;
>  }
> @@ -336,7 +333,7 @@ xe_exec_queue_get_prop_minmax(struct xe_hw_engine_class_intf *eclass,
>  }
>  
>  static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *q,
> -				    u64 value, bool create)
> +				    u64 value)
>  {
>  	u32 min = 0, max = 0;
>  
> @@ -347,16 +344,12 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>  	    !xe_hw_engine_timeout_in_range(value, min, max))
>  		return -EINVAL;
>  
> -	if (!create)
> -		return q->ops->set_timeslice(q, value);
> -
>  	q->sched_props.timeslice_us = value;
>  	return 0;
>  }
>  
>  static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> -					     struct xe_exec_queue *q, u64 value,
> -					     bool create)
> +					     struct xe_exec_queue *q, u64 value)
>  {
>  	u32 min = 0, max = 0;
>  
> @@ -367,21 +360,15 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
>  	    !xe_hw_engine_timeout_in_range(value, min, max))
>  		return -EINVAL;
>  
> -	if (!create)
> -		return q->ops->set_preempt_timeout(q, value);
> -
>  	q->sched_props.preempt_timeout_us = value;
>  	return 0;
>  }
>  
>  static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue *q,
> -				      u64 value, bool create)
> +				      u64 value)
>  {
>  	u32 min = 0, max = 0;
>  
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
>  	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
>  				      XE_EXEC_QUEUE_JOB_TIMEOUT, &min, &max);
>  
> @@ -395,11 +382,8 @@ static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue
>  }
>  
>  static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
> -				      u64 value, bool create)
> +				      u64 value)
>  {
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
>  		return -EINVAL;
>  
> @@ -409,11 +393,8 @@ static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue
>  }
>  
>  static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue *q,
> -				     u64 value, bool create)
> +				     u64 value)
>  {
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
>  		return -EINVAL;
>  
> @@ -423,11 +404,8 @@ static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue
>  }
>  
>  static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_queue *q,
> -					  u64 value, bool create)
> +					  u64 value)
>  {
> -	if (XE_IOCTL_DBG(xe, !create))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
>  		return -EINVAL;
>  
> @@ -441,7 +419,7 @@ static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_q
>  
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
> -					     u64 value, bool create);
> +					     u64 value);
>  
>  static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
> @@ -455,8 +433,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  					    struct xe_exec_queue *q,
> -					    u64 extension,
> -					    bool create)
> +					    u64 extension)
>  {
>  	u64 __user *address = u64_to_user_ptr(extension);
>  	struct drm_xe_ext_set_property ext;
> @@ -476,13 +453,12 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  	if (!exec_queue_set_property_funcs[idx])
>  		return -EINVAL;
>  
> -	return exec_queue_set_property_funcs[idx](xe, q, ext.value,  create);
> +	return exec_queue_set_property_funcs[idx](xe, q, ext.value);
>  }
>  
>  typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
>  					       struct xe_exec_queue *q,
> -					       u64 extension,
> -					       bool create);
> +					       u64 extension);
>  
>  static const xe_exec_queue_set_property_fn exec_queue_user_extension_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
> @@ -490,7 +466,7 @@ static const xe_exec_queue_set_property_fn exec_queue_user_extension_funcs[] = {
>  
>  #define MAX_USER_EXTENSIONS	16
>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
> -				      u64 extensions, int ext_number, bool create)
> +				      u64 extensions, int ext_number)
>  {
>  	u64 __user *address = u64_to_user_ptr(extensions);
>  	struct drm_xe_user_extension ext;
> @@ -511,13 +487,13 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  
>  	idx = array_index_nospec(ext.name,
>  				 ARRAY_SIZE(exec_queue_user_extension_funcs));
> -	err = exec_queue_user_extension_funcs[idx](xe, q, extensions, create);
> +	err = exec_queue_user_extension_funcs[idx](xe, q, extensions);
>  	if (XE_IOCTL_DBG(xe, err))
>  		return err;
>  
>  	if (ext.next_extension)
>  		return exec_queue_user_extensions(xe, q, ext.next_extension,
> -					      ++ext_number, create);
> +						  ++ext_number);
>  
>  	return 0;
>  }
> -- 
> 2.42.0
> 
