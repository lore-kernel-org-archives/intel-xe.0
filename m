Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA37CD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 18:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C67410ED32;
	Mon,  8 Apr 2024 18:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUrDmGlJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC8010ED32
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 18:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712601171; x=1744137171;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XcqJcp67wWgVWuMQ2gxYFS8dX2rUEhjzrg1EOhk5smU=;
 b=SUrDmGlJizt8NFy8WC2el81Qc5fFWVGl2L8mE0l+gwNfhEFuIRmytwUj
 1cYzBAjriREMCy+cLcH9L6ZKAK2qciENDGhIRhgkV87m/Ao6/xSH2b7y3
 TUAHNusYyfXrtjxqJwA3GmoDWmmiTacm+DEdgWdcxejQDCR+aFMP88MIT
 nRdp9Kp+JqJmyVmplCJiGKhu7be9nFioCVgniJRmJTXSVNq+d8cTswTkT
 tgFZtHHItavk3z6aKjhpiVcWqX+93KGSvoJoLRfyAM7IYWVYSnVeHrxVC
 dFfSHIU8MLOavVTmI1WZqjIpXY/vRXxATeR5+Cvmm22n5GW71z20fL36O w==;
X-CSE-ConnectionGUID: fl+6S41WQWy8Qg0005RZvg==
X-CSE-MsgGUID: ssvwe9MdS7W5TH+wTmpeaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7997698"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7997698"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 11:32:51 -0700
X-CSE-ConnectionGUID: C1FcFCmuRmys04yoojedMw==
X-CSE-MsgGUID: U/OLEhAKR4C7uSFpCbFMMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="57429807"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 11:32:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 11:32:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 11:32:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 11:32:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 11:32:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRC8af2PwcnMj0Ll94xJuXTtL03MlErSp8Ug5tHepzuaxU6MnV8i36/75w2SrcteWhVBHYTXIUsVkp+WhdPSDrlXrRdiAaxpdD3RQwQkwNjSMTs38WwjBgvD/FPObxCZrlVlsEdlzKifF3pXbsuwQSH8hZQ7DnrM6ld22qPxwVWu1UoQVsrth+HOywMjU8Uf2/sKQtt+ZLOAP4XFtCUgfdo0pfHo6BJuqrj/0MXGKxk9EzxZ21GI85Gmopsef93c2LE5X6O1pN1JPQFjAqqUW2VYx0bV4ZO5a4AEY69C/Lsjzy4KBB/WE0gDgLtnbbBnWw9WtsssuSopbmDKgGiRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dp0UCGc+OkJMaMEhDh1qElEhOa3v5VOEzFAYOBDujsI=;
 b=bIkncV5LvRg46IYBcroI0tJy/NC2msmZabsYHUOMzkR7s2K/hF6v7VPy3G1KYbc85PrH3N7D0BIRbz+CKnJ06GcrF/qgWYMO5IXoqkqb7XVzNrIeTPwGNfwefRCwPSMDr8FdZEQVguSUrGYPChyfB8/b0ONPpZu3FlTvoZ59TgUCRTOQCfg5xZ2na19tLyvlO+DoclqDmRnaGa6qwVVwnv2JK0q/VVRRiDa2X/JZxLA7ipzZ63WA8ufUOhKR143ZMkEz3j5J5VMjSIUlInujr/Hhi0+SwJpRW5Ilo393p92gsmialALBaqmquuG/3PriQpp3w8vJlF9ouXu0qKIroQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Mon, 8 Apr
 2024 18:32:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 18:32:46 +0000
Date: Mon, 8 Apr 2024 14:32:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Always capture exec queues on snapshot
Message-ID: <ZhQ4SSuBH82XDiGN@intel.com>
References: <20240405211632.223568-1-matthew.brost@intel.com>
 <20240405211632.223568-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240405211632.223568-2-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8284:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LEIbi2vk0WY4pLk6JFgJmjOV6JQI9KQ900rOR8o1hmbCF7mwbnNCSd3KcmGYXyH2wzFq6nUWVkzZ+4WnAiFTqtOMGruVxKl4jQU9Xj1H4oUpO4oSIjRQ4y0+279q6VLhEEurin1KuOlAAljS3GtJYnXIlDzGbdzRwcPjr+62Qg4fBimwapo3iunQkJBstGm2SFv1FMD8SpJw1zkNakyozkUKbEVb0R0pUT753+6LcxL1c4D0tkhNVz/LKLfj4oJSx4xGncA3wGrI/UwJIwTPzBl6l/eopYar8XBEXCFRh30gLlTyiURrWJE4BJX02X/03ajS9r7xvV1tWAg/kjZC2bdcgWhh9u81OpN38DCeTlwgCKVBNZRxSBBLvOHd2gRod6d8c0yM1UXPCJweTVXr0eIOs1Cv/nwxExT2J2ru9X/MI5Oc9mu4STtOT6pB7eVgz7A7aFektlIZB3xWcoiga6jUjmNfmxLNbHwPpvljCINz9234YaKsgaOkpwlAY1BqYOG6yhuA5Sp42Rs+jcNVcIAOiMtSVpMvIhGHCPm23QGNMP1bSvUQbb8r44bhAqmtBuJFY6boO/yZ+tQfuGtEvaqTn7anAvtmNugoY+liJ3gpXDXzIo8Z4aSLeU35el6sLpFZO3/sH0H3WPB6DMZzIzQuFUcFeHWEy1n/aJLMUoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aHL93tm5CB0ywqgmikQjamJHFJQjAOCRPDe7QEK+haQvwLwMXT1YOls12Bs4?=
 =?us-ascii?Q?MvmE+UIZUHh5fySZjw32cNXBTsPHlv9I5cba7WBa2iWz093nejfjbfbBgY1R?=
 =?us-ascii?Q?0pDoyjK2f0eVyWP1ZmlcTqgAem2dScUq0Br+pH/Z7c8O+0TInnwAB3K+O5wI?=
 =?us-ascii?Q?kJrqMAbVsL4aFnVCtsoj5XG8ban9xKG+h+6Ox4xMxxYWgvZ/+YU1s48DM1Rv?=
 =?us-ascii?Q?fa92VqKpeCFiF/7YGezNIyH/DNg7U9AX8WWs1pFyo1Jx2mHLGLm91ZrlW1RQ?=
 =?us-ascii?Q?ghD31qQDvCXcMq0gf9zUDrb0bipGv5pluwbRwQqQJPzY6Y75QB5Ac/QpjbRg?=
 =?us-ascii?Q?usS3Trt5qls/ypmR9kY77aA+tWBc66F42IKLLl8qPvqEBzXhAukp/Vy+tgj9?=
 =?us-ascii?Q?O7wDa5iFb7MbndTb3HAP39ZflgkjGtlO+lymMQ89890yuspADMu9wGHPe3GD?=
 =?us-ascii?Q?Yedb6t3RuzvFhFclgYmP8qik8oIrI5bIdioE5M+guzkOp/CjevtYH1C+hTg+?=
 =?us-ascii?Q?EdHww+ud//iNMw/BrH8K8kohQmjIyokrbKLh148fxXhMf6kaXpsD72EmWJ2j?=
 =?us-ascii?Q?ovDJnAPD+y6PGhKhZg+lp/U4GEBNSjQo79Z4UnlywKsTSD+LRGj0/4YCjOB/?=
 =?us-ascii?Q?A3OX6/OyfEi7pqDdaaNZ/6RZUgCE6L11SO9CYsYJavjTEQbhiMIVi5J0Mz5S?=
 =?us-ascii?Q?Ymi78n85rQOd/MKp6SA67kRuTo0nJ+KDts8FPqMLmQ88IZxpkvz7yBAwudfs?=
 =?us-ascii?Q?7EkM5X8qdxjt9ashFnSDSqoHb0J5jvjD7z8/YRxarN7JmHeOF+0ZjyoI45p+?=
 =?us-ascii?Q?21l28uFLqUJMh+JQ8d5mnIEPw9eVgvkGnMdonAAKx96VdKuzsHYB73vJUGry?=
 =?us-ascii?Q?+AuZtoyjCKz8WqsjVjygjndIhH3bv06bxMibZzd4WPnHlv2IPPeXkR0T5oQN?=
 =?us-ascii?Q?h+UFpNXB4Xb69jjfw3+FGu0c2bg7G4NvYLC8kM4xxtavBE7YM/wfHZtkQYSe?=
 =?us-ascii?Q?9qNQwbjpxgDNx1Te/9gPcxc6R8qqyt1XtdMOph82iYkPnKL2jf+rk5LOHzqq?=
 =?us-ascii?Q?nQtq61P3KKMKVrwVy9GVnbIwSjSTMU/o0peQCvCMY+vRDWMfkm2qB2cFEa/b?=
 =?us-ascii?Q?TmzkEoJgol3WYl6lrDIIh8XVGV6lLWcMZNR2UnBFgpAxf5DGLXUXcep1nyJi?=
 =?us-ascii?Q?EWxcjvEzeexcTAx6TcwWDrzI/Dw0G+2b/GL2EdzjFLJuTzZE0vElq/MfsMMa?=
 =?us-ascii?Q?2QamiBBKbBYi7loOMnVf90zN4u0f6iEYbfpTUPLDKudbb7/8PPFryG5A4TaN?=
 =?us-ascii?Q?zuP1nwYm2qpLzeHAmyC+Bq2jqkVkRmFr/2VS03AN5tmsSTpvJZ6qSkVrLGzg?=
 =?us-ascii?Q?JYZ/TitmOH2do6+05geB9tVpbPaClvQWr09w+wn586MiSe+IrLVxFgGcp2TU?=
 =?us-ascii?Q?jSOunkCS8CX/BtDlJ3/v5FeSlW/i2RNdgo8Z2louSq1piHOfO4G1HFR4GXHw?=
 =?us-ascii?Q?0zAOf3OPEfjpbydm+BaNKUUjF7WKuOzh4F59dzsfP2cXFOpgugS8DjIqIk/o?=
 =?us-ascii?Q?rb7vNA/ddVyhTutbKNnSoUbK0Wqk0x5F7qMo/QyGTW0ypQWJK03YSCkG22r6?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed5848a-e303-490a-9878-08dc57fa4952
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 18:32:46.7466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFVfXvXrNYUC3BEp1cJAP3mJ7XjgvJ8p0UlPMtjfUvYWEZHgV94A0Y0RlVau3p11/891Bf8SfnsFlHxPFLSAvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8284
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

On Fri, Apr 05, 2024 at 02:16:31PM -0700, Matthew Brost wrote:
> Always capture exec queues on snapshot regardless if exec queue has
> pending jobs or not. Having jobs or not does indicate whether the exec
> queue capture is useful.
> 
> Example bugs that would not be easily detected by skipping capture when
> pending job list is empty:
> - Jobs pending on exec queue have dependencies
> - Leaking exec queue refs
> - GuC protocol issues (i.e. losing G2H)
> 
> In addition to above bugs, in general it just useful to see every exec
> queue registered with the GuC and its state.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c  | 25 +++----------------------
>  drivers/gpu/drm/xe/xe_guc_submit.h  |  4 ++--
>  3 files changed, 6 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index a951043b2943..283ca7518aff 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -188,7 +188,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>  
>  	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
> -	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(job);
> +	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
>  	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
>  	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9c30bd9ac8c0..cc1890e322cb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1777,7 +1777,7 @@ guc_exec_queue_wq_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>  
>  /**
>   * xe_guc_exec_queue_snapshot_capture - Take a quick snapshot of the GuC Engine.
> - * @job: faulty Xe scheduled job.
> + * @q: faulty exec queue
>   *
>   * This can be printed out in a later stage like during dev_coredump
>   * analysis.
> @@ -1786,9 +1786,8 @@ guc_exec_queue_wq_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>   * caller, using `xe_guc_exec_queue_snapshot_free`.
>   */
>  struct xe_guc_submit_exec_queue_snapshot *
> -xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job)
> +xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
>  {
> -	struct xe_exec_queue *q = job->q;
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
>  	struct xe_guc_submit_exec_queue_snapshot *snapshot;
>  	int i;
> @@ -1944,28 +1943,10 @@ void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *s
>  static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
>  {
>  	struct xe_guc_submit_exec_queue_snapshot *snapshot;
> -	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct xe_sched_job *job;
> -	bool found = false;
>  
> -	spin_lock(&sched->base.job_list_lock);
> -	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> -		if (job->q == q) {
> -			xe_sched_job_get(job);
> -			found = true;
> -			break;
> -		}
> -	}
> -	spin_unlock(&sched->base.job_list_lock);
> -
> -	if (!found)
> -		return;
> -
> -	snapshot = xe_guc_exec_queue_snapshot_capture(job);
> +	snapshot = xe_guc_exec_queue_snapshot_capture(q);
>  	xe_guc_exec_queue_snapshot_print(snapshot, p);
>  	xe_guc_exec_queue_snapshot_free(snapshot);
> -
> -	xe_sched_job_put(job);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 2f14dfd04722..fad0421ead36 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -9,8 +9,8 @@
>  #include <linux/types.h>
>  
>  struct drm_printer;
> +struct xe_exec_queue;
>  struct xe_guc;
> -struct xe_sched_job;
>  
>  int xe_guc_submit_init(struct xe_guc *guc);
>  
> @@ -27,7 +27,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
>  struct xe_guc_submit_exec_queue_snapshot *
> -xe_guc_exec_queue_snapshot_capture(struct xe_sched_job *job);
> +xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>  void
>  xe_guc_exec_queue_snapshot_capture_delayed(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>  void
> -- 
> 2.34.1
> 
