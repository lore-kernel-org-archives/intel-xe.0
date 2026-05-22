Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641C2CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 16:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2047E10E292;
	Fri, 22 May 2026 16:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0xL4ynj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0DD10E292
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779466214; x=1811002214;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pCQdUoTA1mWHEOr49EQyUjfRuo7R2+lDi94K+y7+wis=;
 b=Z0xL4ynjwPh/VHqYpNFCckAZ4fGUsNwg+hfCnYjAyZZQdAUNOGuAeZbD
 pzdIrWgYY/HRIzcm8H106ZlGbJyKeYuK4RWVdUaTsDXE7c0/n+32yZvVi
 nTDLac2VxHPD0kUC/VdgtsTd2pspZO5NaJHMePlgdH30UGx6Fu/bZiHNY
 qV2/Bjs7ApnwfxEFWsxGPbDIbt665j1RpehOUmZIibgU5lYZ79IHNxC/T
 k+h619DkO9xxwwGcbJUpAWcp6uw8ovstaDrFCDqhq9cW3LJnqPnr8oZvJ
 aJMH3MahDyfmEGgVZk2GOO/9hEIAWQ7NlUATac5BkH/JLklymwTSc6Xuy Q==;
X-CSE-ConnectionGUID: 3JxMgbooQ+qbwiINMQ0QKg==
X-CSE-MsgGUID: u111bNFPQ3CA9g9bHvex0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84017014"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="84017014"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:10:14 -0700
X-CSE-ConnectionGUID: iRAX5GcMSzKUWaNcsfQX6A==
X-CSE-MsgGUID: 8bBuk1zqRWmq9iUxLx+7qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="237920123"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:10:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 09:10:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 22 May 2026 09:10:12 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 09:10:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CohL2JZzHK/If0YEX1QSqJEogSR2cTOpy7VAZgEwnNIDYmy3OzKZ0HqkO8LZQLnJbhbBI/hZKYpBqtCq4BIdoSmT+SUFhzAVWk5dTlLt1l60evntggfa6azdrnAnQiV6LAiGpjsMin6xueyrjI6Qc9tUGOp/mItSdeDQaMZDtFuGPBZfhanrJiJTA6RAWg1vKOqNNaDy6asXIy4Dbn8JJQdrgQg+qNHL6fkwDK29eHm2Oa+xIpXsRwy4ySGRXUqoGqqhCv1P3xttgKBETyy2R1L0hkBmk5gGD++3bovv1EnqHMTkYQ8uIHZhG2kICWoz8SVq07AdHa9d2HPML9/8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUUnuQWpxYajuOHcKtZQmy69HtyX2f7i7zpRncBV16k=;
 b=nOCjhHI/QfUag7QF9SvFrRPONHlJwX+UlZ/sFMdlb+BQ1Ww5cV/vy5iuRTIBjJfX8UeXIuyFB7L3wzWFtlw3D5bgfwC0ec+bFSrHMrprIC+ixQjeD/VpTk6siCT0XgMN61iyhv9ZgBVrvgqkwRV/KwKJUM6zwFe5kSLpjrjALJuIXxFgfWfe/45Xs8nTvaPQnzqv8/ar1aCsVO7If8af+xEfhiqOWSDcGw994ZRoCiao1zxmj9S19UQ8Fpn1sewH9DNJUZmO4Wfz1+rkSp6jFCHav+ekLVc8ksmXYH3kN23M/n28M1iJKfMuKEaEK7sBvFKJG5sPa2M+VpStvSePkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 16:10:09 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 16:10:09 +0000
Date: Fri, 22 May 2026 12:10:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Assign queue name in time for drm_sched_init
Message-ID: <ahB_3OV1sSfrfDwY@intel.com>
References: <20260522144003.12836-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260522144003.12836-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS0PR11MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a30f4fe-3346-48d4-d82b-08deb81c988d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: KZJ+6rZmbmuTuw6IKz37U2KgQ4nurrhwBkIrJjKvlhXRpD9BSNYhZ1jmwK6ElchbVQEJFhtJU72VwKBTnyhM7qENZjbWigWSPeOyl8vCG3NBDmkYFNUPjqaF7gfbhgCr93/QbRqnKaQkDvqj73wkkNoqrqQjnie4Z29momYqcSqj/mCRqQn495GrN+ipcJgLN4Wn+YtYYkM+CPJGNX+3+Of0JSW+8inFrPA1hj8yrjZU+jNsvF/2Qb393OtxdQlWxlhOpNyaIpgYVAUD2Jez7CTC3pGzgsD/LA5i2gDBFRYmxwV8kY/BlOCInM5CdJjkPlhuxQSCK8NDJs2h8uyKsdwMUJcAAcKDh9C0VGqyJ4OdTwraxtlaJPaf31O+c+/+7IHAl+pIAFLb0gfU0sap50hgI1KugT+ZhqrfHx3O5uBjBy+vXT5V2vs9TIv+hAGiGtW+9p+c4iCcxh3kCx8MwrSz7fQ1fubQD2NjuVI/GQEyETot4FFqDVXhwAHITsiTMLO8VfLw9gxxyUxUUY4+4iYT3/6ZfZkZfug3fYVXp1m2lf4JMQExgF9njD62LDNmus85DaqFZihOCZc5nyriYBGHXxiDQbu6uU27XOSLN+jgyOPOfoW7iCYJFfWkEC7rRG1ITaIf6F6qwJDdB3xdFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rUcK1moJ4IPO/QmY1GZCbwHlIrG56EpGM7wmFAnTCkdm1xnCQ+qTsB+enryn?=
 =?us-ascii?Q?Cfatz2xmSnA9ry1p94fCfoGXLzb4zh+olX4DBSpRD3OL9T48GeioDaqoFg9t?=
 =?us-ascii?Q?hMa+IgtbZ79ikYRudxjTgkTANVyzO8W4raK6EuJ5ToIAygPD6lWJvyNROnqf?=
 =?us-ascii?Q?nxWuEA1GS2Xs8YKhN4TavcOSQpu2zEs8Uq8jeQH8vqiPzlj3yCyWV0DjpZ3I?=
 =?us-ascii?Q?GgTv3qWJzw4QAk/1mJzaBOPzvt/02haZrIwQIWCxdyFzOhib56/4meT3No4Z?=
 =?us-ascii?Q?hTx2hbABa7mdEA4ZaRDyjbTUUAQmE6NQLaEJ+Q5qslGYKqMWuL7o4qtoxYtU?=
 =?us-ascii?Q?3BWNGPsfza2L/TntnFyPEvvjQaEXSvoT7uL+XbJGa/rHTLILQz2ZEtWfpBOl?=
 =?us-ascii?Q?dO4aYooaB09y4vEK6rEwGTrG/D6shBLjen1k/CCFYEbFlio1zxCmhqRv6p0R?=
 =?us-ascii?Q?Pm2F9yydaR2dLFQPeLd5u6/aKB/nJmuvmtME2mFXbz1dgHdwBLIaONRkC4V8?=
 =?us-ascii?Q?nrRetRNLB2wabjfdn6U03Kb8DneyqfSDJEpKaz55WO5Y1UrvBKmCGZmqj/bL?=
 =?us-ascii?Q?AHD7NK+o89GyQElpteJsxcWvBn4AoJkz/3CNkuawnwS8KbY8sTgkgidmEtYd?=
 =?us-ascii?Q?XeM55Acpn/9Y6JrRwQQe3X7XZBM412wboIgADKpwnXvWtboNEBaTIfojec1s?=
 =?us-ascii?Q?/zNWDrNBYynDm4Ax//5LEY6TDMMNbnlu6JKSqMacvrHJeNP6DFX7qfs4WsPC?=
 =?us-ascii?Q?D9oqt30qmB5YopaAwn9wjzcCFgdjFZrHRZU1Rmi3NmBLxCMUgLhjC8DdPmO7?=
 =?us-ascii?Q?0oeFXwlMcofSS9tO47pEMOy3iZzD6i07GkxMKi8Fo0/xhNTpMXEmMdM6iezE?=
 =?us-ascii?Q?H7mjMcESl4XZ60WRrTzJTLBPWHByM4pScEDo+BeeCNiUMv8PyyRhDFp+kf7c?=
 =?us-ascii?Q?//xhUwucPFmT3+fBrz6pRlpUcJQunZsXWHYDGtAOxnj3hLdVSr5LL64rKaud?=
 =?us-ascii?Q?hENUsFQLQKokG9qzepch+Q4HladAykgsi0jM8wuY4jeveEroPcs/Gno+Y7/N?=
 =?us-ascii?Q?5q5BNXes1C1l4G9qmXQ1nQwcgsubmLWpprCDTLqBp/S3ir9htQQkYvXTw0o4?=
 =?us-ascii?Q?jl8Kmrzgs8N3fjSGk33XbLKA0ZPU9yRK/UpqosaKg+ohPnNyPnMxr6q6uXmo?=
 =?us-ascii?Q?a/LSAGp2SirJ/G/diNE0MiYFKp45FFnRNhbWQOtTO5DQioWrz/w0m1OGehZO?=
 =?us-ascii?Q?UJ5AgNklAfV3fEh4h2nQhf2I9nNhN9TO95xvc8PMUt1b2bbBmrHeVTsJT00k?=
 =?us-ascii?Q?D00y9X1u82H79JwaG/ovBfPzpfPtg39ughDXKIQpjp+i9yhfs58I0uCiIXdP?=
 =?us-ascii?Q?wKmM7SooV043wPpMqZeIBtUSzNyRBGiWSa7Z+ghe/7N6YpQGOFMbEwr5xp++?=
 =?us-ascii?Q?CgolxzAXhYooCgB4AnPc3Y/wrjA2fdc+q/uGRBYJDNt0LyR9U5Hz63+UR2wa?=
 =?us-ascii?Q?6zOKwU2bdy6Atc+WGa8Yd5CakKlqiPlHCeqUVkA7B71jFF5nLukVb+2cDKKK?=
 =?us-ascii?Q?SJY5w7kxfVGd2wd5qtpQNI7aFthKTMzWtNDa+PX+4YYx7dGb58iCWRIvD62n?=
 =?us-ascii?Q?m1a+Qby/ZbfoxJjnmTJDr4cX2jUkPyEZqQb7YZmWrwMraLN58jS20Kpx98/8?=
 =?us-ascii?Q?wu0qktfIPSf34C9c/tmHeTocey4c8zzvZgwFPx1HgM0sFkrT6w3Sulq3rVRf?=
 =?us-ascii?Q?geySz4/fBw=3D=3D?=
X-Exchange-RoutingPolicyChecked: dxxjAFObEWhuyazKnCpgrxJD3e2gdfm5hZR6rpra43jiyJwZk7I6GQIUJJeJ2/AY5oxZ9krgrh0E3tiAVopgtnCLcx5sYRZjwQ6crGIhAOtBClrp67QN9pE9Biz12hMZ7tbEfPQpRZmsbd/fJoiOtlpGWjgWOyEjLanYafCNGnvwP7r724LixhW+jjqUvy3ot2zOTWP6mwGa4Mg9TGewxVrEoz2ui0lGlEw0uoCnZ74R+iQXwyuVR11FUXcPb12UPqDJEY6itvIVwwSeiXBB5ZQ4H3LsJhKFIgyEw1eqmX4x3SlAKFAErImx25lx8LFo1OHq3kpdk2uW2VVejdu/9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a30f4fe-3346-48d4-d82b-08deb81c988d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 16:10:09.6315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCn4RSWdzF2yjrE65JTgOTEwHc/pRDUQiOtrtJMSfSNT2v75kNYexTO1Tc8ws8d423sRbZp2GurECp+UDpHgjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
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

On Fri, May 22, 2026 at 03:40:03PM +0100, Tvrtko Ursulin wrote:
> Currently the queue name is only assigned after the drm scheduler instance
> has been created. This loses information with all logging or debug
> workqueue facilities so lets re-order things a bit so the name gets
> assigned in time.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index afd8cc7bd231..28f3b23527e6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1961,6 +1961,13 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>  
> +	mutex_lock(&guc->submission_state.lock);
> +	err = alloc_guc_id(guc, q);
> +	mutex_unlock(&guc->submission_state.lock);
> +	if (err)
> +		goto err_free;
> +	xe_exec_queue_assign_name(q, q->guc->id);

I'm afraid this might open some race conditions here.

First I wondering about simply moving the mutex to inside the alloc_guc_id
itself where the submission_state is used so it gets clear, then
I saw the FIXME message in there and wondered why could had made it
harder when it was first developed.

Then I read the Sashiko
https://sashiko.dev/#/patchset/20260522144003.12836-1-tvrtko.ursulin%40igalia.com

Perhaps the safest approach here is to use a unlocked xa_reserve to get
the id and create the name. With this you already get the GFP_NOWAIT FIXME note
fixed.

Then you keep the xa_store down later, not opening for any possible races.
2-in-1 fix...

> +
>  	/*
>  	 * Use primary queue's submit_wq for all secondary queues of a
>  	 * multi queue group. This serialization avoids any locking around
> @@ -1977,28 +1984,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>  			    q->name, gt_to_xe(q->gt)->drm.dev);
>  	if (err)
> -		goto err_free;
> +		goto err_release_id;
>  
>  	sched = &ge->sched;
>  	err = xe_sched_entity_init(&ge->entity, sched);
>  	if (err)
>  		goto err_sched;
>  
> -	mutex_lock(&guc->submission_state.lock);
> -
> -	err = alloc_guc_id(guc, q);
> -	if (err)
> -		goto err_entity;
> -
>  	q->entity = &ge->entity;
>  
> +	mutex_lock(&guc->submission_state.lock);
>  	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
>  		xe_sched_stop(sched);
> -
>  	mutex_unlock(&guc->submission_state.lock);
>  
> -	xe_exec_queue_assign_name(q, q->guc->id);
> -
>  	/*
>  	 * Maintain secondary queues of the multi queue group in a list
>  	 * for handling dependencies across the queues in the group.
> @@ -2021,11 +2020,10 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	return 0;
>  
> -err_entity:
> -	mutex_unlock(&guc->submission_state.lock);
> -	xe_sched_entity_fini(&ge->entity);
>  err_sched:
>  	xe_sched_fini(&ge->sched);
> +err_release_id:
> +	release_guc_id(guc, q);
>  err_free:
>  	kfree(ge);
>  
> -- 
> 2.54.0
> 
