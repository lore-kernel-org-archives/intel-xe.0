Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69E4CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 03:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF51112378;
	Wed,  3 Apr 2024 03:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hsrm1Uiw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9B8112378
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 03:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712114810; x=1743650810;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K/5nZf6yDmwfWpzhWJtHZJCD+dbQmfrNalgqcgnO9ik=;
 b=hsrm1UiwVMTFNyGgupyUEjeRfwQHK+HGWAN1ZfwPWIKm1Zx7sLWFvrdh
 76gaca07QUGW0o8rg98FJNW9BEINAd5pcXYUd6gyLhtXCjyUkdOoqO7oq
 kRLmGmvgCcYa/rUxL21z5TppXFuX3rC/K0StroodGU+y3IyLFsJNLjhs1
 J1hSLVbl+ITKwd7tNV80b1Pqgc1gLWNAUu32Y1eAd4bB23Fpw7NoWxgLC
 pAMI6K4Rmm1AskHKklrDMpl1OlymYWa+AJF9GhsWlz+ePXrPEiwWYdP5z
 oqPfnKMmaMKvcQE9SzMhjsKbSmkxJ+ZClx5FthoU9yqW//6NR72B6RZ0s A==;
X-CSE-ConnectionGUID: Wj8DNJ8CSiaasfRVxkByRw==
X-CSE-MsgGUID: vXhqLOs2RWSx2KbCg+N9sQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7448297"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7448297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 20:26:49 -0700
X-CSE-ConnectionGUID: SCE5h0UzRXKy3ywOIFeq5w==
X-CSE-MsgGUID: 2qVJWcFbQ4CHhioRHkNNUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="55730829"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 20:26:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 20:26:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 20:26:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 20:26:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdQJpF5XzUx8WbyXWTIMugjnCLITiJRnoIJweSe8Tb0cPL6qmJPAlK1SF0QQpfjT67axHqzwjUuekEPbUezGwHXAAQD5Y82Ibx3G9lYbjYQWlamwg0Gx7Rsd4gZ62iKordyvLJ1BuWj8IPSJqcfjhXhWH1GpFRc+Hl+1ZP+GnPGoJRGXz0ROoRYp/unTBAoaNRthBgGWZM5gAK2tyOLq8tJqKuGql9nceDTT/qWOEmGlj7LrnenWa7KiCdELhoJp9Rra+/QBnTasUvJzx4haKwuJjC5ha/WZleLHeL7uqH9eBCX3saYqXBiWj3eH1ceycDo376HHOhTsOVSkpO6O7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7TGGArtXoePhSnE7qin55r7TqwtSvdoDXij/PggekE=;
 b=MR3gAsK/gEOL/UW6pa+Xc8BWyAGYkl2NdvgsZiiEVzxi7NQ3PBmo+eEfp4+LFztIY+Jj9oZctid0Nxr2TbchSXodQIVDZErNBmLbAQfnGTCShde1Upz5Dlf3kGD+PlbQKfdPj28TD8toJnY2+8BZR5dsj5JPiJgvH/7L3QIImFvexBzzaQIDZNyNRAjtl8ydz+A8CX4QiDA5OZQb9zBpLX0DyTj+u8Xa0g9DNXgN+9ZOXF3qQTJ9tggTeqfkIV6YLgoQ9OakLV2jQMT4iMoeDNCudMa/wc5DuWIEWMPO68krlbKl76dJztl6g7QeN8Cx70EzCamEQixdqaMqMmRHag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4682.namprd11.prod.outlook.com (2603:10b6:303:2e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 03:26:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 03:26:46 +0000
Date: Wed, 3 Apr 2024 03:27:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/xe_guc_status: Allow lr exec queues to be
 banned
Message-ID: <ZgzMpxCvldMq7cYM@DUT025-TGLU.fm.intel.com>
References: <20240329184929.3675256-1-jonathan.cavitt@intel.com>
 <20240329184929.3675256-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240329184929.3675256-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4682:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /MaPbFLpEbsWT3ONZNbyw9vhXrEBhLJzVXbD25dQ0xADWaKVsuVAyjdfO/mTacFkdzS/0aJBG71rwkA1pT9ANhLapndk7B/OrXs6DZskT9FZ4JXe0dMte08eyG9XwdXYE1P2zQ9QJTD7qfSSmSuyIHvospbHky+AZMijjNOhXD1eLGIOvEORdN+jgAg4zGR4BZFpR6A/LI+bTKreT+lrPnD1JYB1WD39fO9dI40kSUGaltKoSPTOQlut0aHwftroEM/Te8guc+hFx9uhjIPmb1scAti9NJLiscSl2VNm+JC8CTI3i8rTHL90Fw3EruJZNlxusVzJGyAzn7WUVOyBMZARD0lPk48ZLaf9uYIZHX0L5h6FxFlJNSry8vzS+ABvK2wWu3v0yoEoWRIg5dpwYaW0mF9nnMGf8TVAI+mYNLyMcn/u783bNIiB+lK9NYefrDWBKlBp/fu9uUS1OcGAhMJp1f63MRQAywvT9adLh12VfYhxl3UyPnshSRa9Xh9tlo63uh2uo9WFey2nRt9nY091m/X05Rx430CEgGvh3japX5b0Qj/P2OJ6aLRvVhtE4TZTiWDbJ9D76V0Sz7ytbTxoR1ay4naTC6ivZYcpGz8Ty699gkM2SxVqqOSXEFglLocgl75MyYPnX1QKcTDL7dRGLzOmUR0qnCgJuZNlCtk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l9lq1tCiJNB8PSkbLSeYGgzRZggt9o+LaVA7LKFJ2yHD6RCvvt1IGRz3l+uG?=
 =?us-ascii?Q?3Icy2B+SHAnQngwv2alH7Ypc+RY973xuQftMMWdilBfoIEpn4o7Nq5CnWay2?=
 =?us-ascii?Q?RtwhVo4GrpqWEZQ4LSEeUTKQR5yo7hcLfgXG4aOYCd/X5fJj4p1pmApJCRzl?=
 =?us-ascii?Q?5dm2FWclsnjgokQ4OwoMHTDiwg+Is5WQGqdcEGPc28xToW5JRdn22hhd5Rxi?=
 =?us-ascii?Q?nddlf9ucTjXv3lvW0qQj6d2aoDY8/7bGk7LX0kTcRMtSRFKCqvc21HnX88Y+?=
 =?us-ascii?Q?tSfuEtg+0NearAXh1THOvKjZ3igFZbpTgumab17oS5x6eT1KlSaAwFpz8R5G?=
 =?us-ascii?Q?GvoWoh2I37FR/0KF1e2xuKb8pR3SXTAqvSBB8PnjP4K8qJBJ6n39R9vSrdXq?=
 =?us-ascii?Q?r7ysXLcDaLls5Tw9WjA6vIBHR90bVGoXCurNQi/pFhQFmReSzH9bXa236zdU?=
 =?us-ascii?Q?fR/rj8XDaZpLiX2nSdcXtJ/xMgBvovPTds8qhl1G124krtjHqYMgd+zl7b2Y?=
 =?us-ascii?Q?+9AKVPKQrRD9tgy16+tgTDeU6lW61f/7s4Rrh0GWuZt+4f0e8FRmD+EJ5vuE?=
 =?us-ascii?Q?i2Ne3xaaY+LH5wugEybYFYWFu1dkf/TxkZfyVlaPWVAf1k5MItkcDKBqRK2o?=
 =?us-ascii?Q?Y9q12ZBjKqZsXwDcumBCntFZMiQUqny5m4jpxp9qBKXYkGgna9MO/ZRbRwls?=
 =?us-ascii?Q?ERvqBbF/QiZ0CMWVAh9QBkIdXdPnjEFrlAejWrg+rMT6Ra0IwvIKYrFPQrY+?=
 =?us-ascii?Q?y0i6WHpeEoWAsQIc4ItY4eJwgYa3Jx1jHIf57HAU7AdqsnLjQmfNkXUBc652?=
 =?us-ascii?Q?kxkBBLQz7ccNfxOvRtV9m/Of09tVHe7ry4TVOeQiXToPfR0AnAz1IR0qSvBV?=
 =?us-ascii?Q?P69IeCzT28G7oJyiFlSP1BWQakzw8iPZfIuES5QYuIgErDPJdsyevBR8QxjZ?=
 =?us-ascii?Q?Ydk5XAmmL+h/ZxjdHAZcVdHXQYSTyPvfrhdolrQ3tUvxH144IyDRQAWh4hND?=
 =?us-ascii?Q?UIRluQ6xCoOvIYKdwz6UiobG0LIFyzoFOOqcgc2ER0EPR6YSIu4ALrAqftny?=
 =?us-ascii?Q?GBzv4Xb6s0zTwq56IHJvMSomBucVDfDRESsTFsCTEciDn7NUS3tvOhW/7IpT?=
 =?us-ascii?Q?7qk5fwl0S1tpCh2p7/9ccgFJQReFCyVWaXoswyIG3F/7Jcp7JSbvylhr2F1n?=
 =?us-ascii?Q?L5mq+J7xVDHW/d+kAtkH2iY7yMBTM1QKIZ7t2SfHexbizaMnlsQa7Sesso3f?=
 =?us-ascii?Q?vFg9p10PtPbbQ06r2E+cwzlewhdoPyi3T3y1SVue+WCvTLIJvyecQr6UhK+p?=
 =?us-ascii?Q?PVNor7Fr1oeNPFQL8e18TlPNtA9E+HTrj0NEXQ7dA/GumqogJg091MS6E9bJ?=
 =?us-ascii?Q?MoxXVtLUz8WdKORFgv+Q1a5KNIpni0OWqBM330L8WUhf40EmGpjYIA53sZ8u?=
 =?us-ascii?Q?zZhnkfA8+e3dzhHAmf9IgYFOYk6KFR/gHPw9cwXlkN2tAsMdl+KJo4QCtzNc?=
 =?us-ascii?Q?ORt2uw6uo1zUnqWTLIirV2XbK66pNgLVeuzY0doo/vUiUuYuxLjgsg4tZErW?=
 =?us-ascii?Q?eLrVCmheiy+QQDfAhkdVKIj2LCNiC4c8+4FN0twOEPUUEWLYx0Nsilek1d+8?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 906e4fd6-000a-440a-009d-08dc538de40c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 03:26:46.2613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSeosm5hmRdwD5VlHni2MELNiBPHQsoD73MhOnTqXDv1laiqjXlHjTwSCpKGjWslwSLZcj6wdxHerDYEgg82dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4682
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

On Fri, Mar 29, 2024 at 11:49:28AM -0700, Jonathan Cavitt wrote:
> LR queues currently don't get banned during a GT/GuC reset because they
> lack a job.  Though they don't have a job to detect the reset status of,
> it's still possible to tell when they should be banned by looking at the
> LRC: if the LRC head and tail don't match, then the exec queue should be
> banned and cleaned up.
> 
> This also requires swapping the usage of xe_sched_tdr_queue_imm with
> xe_guc_exec_queue_trigger_cleanup, as the former is specific to non-lr
> exec queues.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 294f40ab6aaf1..bc0b5ec0b2ebd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1424,15 +1424,23 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>  	 */
>  	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
>  		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
> +		bool ban = false;
>  
>  		if (job) {
>  			if ((xe_sched_job_started(job) &&
>  			    !xe_sched_job_completed(job)) ||
>  			    xe_sched_invalidate_job(job, 2)) {
>  				trace_xe_sched_job_ban(job);
> -				set_exec_queue_banned(q);
> -				xe_sched_tdr_queue_imm(&q->guc->sched);
> +				ban = true;
>  			}
> +		} else if (xe_exec_queue_is_lr(q) &&
> +			   (xe_lrc_ring_head(q->lrc) != q->lrc->ring.tail)) {
> +			ban = true;
> +		}
> +
> +		if (ban) {
> +			set_exec_queue_banned(q);
> +			xe_guc_exec_queue_trigger_cleanup(q);

This coding pattern kinda bugs me but can't really think of anything better.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  		}
>  	}
>  }
> -- 
> 2.25.1
> 
