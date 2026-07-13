Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158F8C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 16:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54E810E476;
	Mon, 13 Jul 2026 16:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOZqShek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E923410E4D9
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783959327; x=1815495327;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7UDg3Oyv0wO3mKywrIXca+4BnNRPVbGNVYOZ4PoIMlY=;
 b=MOZqShekUrOG60cVlKvyKtQUrJW+95rsEh/F1k3sV6D9Zbh+q8d6kytF
 fTOzmJ7Lq+g9f4YLKoeWFez00EJhmpG5G4Z4sAxCJO7790J3DHdf5ZPsG
 S+r1oZvm8DFdpHqtC1n0FYVuIzHeC9le6gqJYAMBTL6uq0FLp9sNK2NnC
 6Tv5dIzE9Gc8yxOuwIJi1IC922Vk5hRzMWD2lebcFgL+lmnZb/0nPxXhq
 N84rF1Th2KjhueeZascUV4ja4LajQzb9hcDkgvqxOjfY7cs5tddlZ2RVZ
 epp/s7iyhELoW+ZMagac2CynmIvz41HkEGxMQXJ4U9SsodvUAyjhe46N6 Q==;
X-CSE-ConnectionGUID: Ump08dRmQa6mg3OOa1/H3Q==
X-CSE-MsgGUID: ETrPRLaoTGmlGFltr2WnuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84689251"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84689251"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 09:15:26 -0700
X-CSE-ConnectionGUID: yJ4FaLXjTkuHSwtQtOLJDw==
X-CSE-MsgGUID: 8RhHRwlqQkyb75gY/ewZiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259446326"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 09:15:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 09:15:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 09:15:26 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 09:15:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eb+5Vgc3phc1ipNhu0OUPmpilc3FTX2GSzoalfq9uMB2hacGm0MM0ha4PZc6lQMXFj41qRquq5ibwKQDDP+hhqNICn8FCHlS9JXcKbIuR7/R0kFonimssDw7kWccRP5bLF8S9YBpeOddGVeB3SNYaAltnpFuh+JVuTRoWl6zvgEycl8EYY9eRFDdNZ9bSdym27vNkFIMSZVlFOuSjn3CIfb9EQBiZd+HRlXp5gvBt73xjBf4MGdrTMn3+Yb6E/fD03U5DM9bbXre945UuRHgHuNpMDQrYwnPqMrjF6oik8UHagrCvPPAVyAckxjrzZsC/zImiKNHYknMWS8FWE9fqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fK3SGmD8HfxnCcHamxn0OlhkGog+8gOY0aqZ2UyQtsA=;
 b=qevWhXAL/uSxhxJzCYysWkZB0Wq/JUtWLMGwspk6jSQrFvtlJ1D6/243BSYkU/3vlBW8wjWot4iOkxQyaHt9aLm5FzNyrL8cH5g7k3D5GOeQBW0nvmJARumKH3kc4tTzWGyXR8PXG78t6GoKAmRkJbQfIkyqJF7jocHR0gEC6HoOLt+QdbiEhwOu+xYvQv2Gk1VCUJKkTjOf8k8jZBSviO62c+JyzIeKIUEYRjJlVSLFcwYOFcEXalMAk0WiTf9Ns7FTUjkdJo7bsbl76Zkb/VVacxJWpHUTWrao4kwHoxFxqTYu38jg3xPiHquIsfmn/M4HS/+erYSLJjY2tt6S8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB9510.namprd11.prod.outlook.com (2603:10b6:806:47e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 16:15:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 16:15:19 +0000
Date: Mon, 13 Jul 2026 09:15:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 2/6] drm/xe/guc: ban exec queue on suspend timeout
Message-ID: <alUPFZaePMxtC1FN@gsse-cloud1.jf.intel.com>
References: <20260713030005.2123322-8-niranjana.vishwanathapura@intel.com>
 <20260713030005.2123322-10-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260713030005.2123322-10-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW3PR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:303:2a::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b22bea-a68f-412d-e545-08dee0f9ef0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: pH7fIe0YWuyo4h+dzM9XQH3IZZ6InVr+iSlhRzHMLp0FMCUVNDMkFmDth31zLuZ8/xCJ7r0EGjHnmGN6mAPWcU1r9bZvFzJzk9KlBzRnFlR/xWKGsIgJjhFSQmVMAF60gOu8cdulHNYHvXaKGzKwc+Ov5smneUWQB4IxOXhyL0PDM1asbxhhSzBzanPYYh5ywmu+B73CBcyTxXlf1hDric6jJGKKI8n+14X3jKapKf0pCjXn9BQ3AjXU5TDcmD1Uh3mNkLa16R8ApjlbxGV8EjK/u34K4U+eCOTjejUl8vsoNsZBjO+70yGvV3JaUnD3KkVrUprhEnXd0QwG9oFEstcLGbzlLnIArpO5llLORp7+UFBcGBNEVz/2jr0czroierO1tKC3kmy/ipQEdTRiZVs8SorMO1hdwsyEkwPR6e5TGlcV1mjGJ6zdPRxDwFzCjU/wh6Gi/hPGLf2EAqDJbiuQBT7slc6RHWFfherinmVsVm3/JbvXhwVNe1F2RG9fy+LQH7uPRoOBj+7+PLS4/pXJjSbOyCHp9rkY1RFDgVcZy69PjA+em5flpgBV2HhEqjjS3hiD79NPxmHPTicnE+XFEMcax4CT6JrSutBUzpUqJEx0VeQQeY/kX4oUEkgwCX6r0InJ9GvfUEL4DLl47QxNDgmsygzWjeycP6d4XaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PPfn7PFU8h4OWbBVHIg2lf5oTDMF1NLiAFGWo+Yrpki+RUYATCPMvl1rPgJV?=
 =?us-ascii?Q?n+Jz8kMO89pyvrTZEhzBVTmJMrsyS/xOLwzhjJk4TOuhcyixoo9P4o5CLcqF?=
 =?us-ascii?Q?rj20SDzx2ldoKpRAp4QirJLkSAEHTWlm3YeIcTyAs8OJ9u4EHZ7Cb8LM9Sh+?=
 =?us-ascii?Q?HFj8z9WfDRpbAT/R0ZRIg6fkvXw0fnGPOLc8tjYq3g2UcPaifHHCYspyIUvE?=
 =?us-ascii?Q?NcosmWnPlu17//SWTnAxYYehPvcHkPuCI3gvDdr8mYNOE8NJDtZgThEX94D7?=
 =?us-ascii?Q?5Ohi03AR0LR33GPeyVaAGsB9zi8x4qNWE4FreHfA/+OdLCXP1O7srBtISGTJ?=
 =?us-ascii?Q?lalwtxnii5iNKCpKNHsgKaDY1Qzpz6/7TXDuNy9xivRlRj9CKxJkSjsn2ql/?=
 =?us-ascii?Q?5eX9INR2ab7ttKWEBEijFqxzozuMPhC2h+CPCw7zt9rhM3gan0TnTgd4IOeS?=
 =?us-ascii?Q?o7dAmMbM8SXUZmwecqQZWyQ54sHutB2lvAbHwB8RY41Fdh7XialriTxF0BEh?=
 =?us-ascii?Q?PsTkKXEUMLu+x4wSERTzQ6USFq6WT4paUCw35SNlqoHGrAH6xKQOycvArrzw?=
 =?us-ascii?Q?+k/0qdkpnZdbkM8jaAbeIVr/nha2H+zMgTSWV14wvt/hAH0T4NIX/nsMmYJ9?=
 =?us-ascii?Q?oTqSi1DGmTuHWCikU9pka6wvaeTQ2qN8UPiuAJcVryVOfLvyS43qt73vh/oL?=
 =?us-ascii?Q?9/R6Jla3zIX/ehTE8M6CnhJkgauFSxZ+7vO6bBc0/CJXgcFBVUS4q/oSZsXY?=
 =?us-ascii?Q?gEJ9+05IflIAtobpAMrjYlV7M/49E98fIOvYg42wGOSFDUpluNmyuz3X82qO?=
 =?us-ascii?Q?1ZVMipXafEAbOgCFzf5Lz3/KjjpwaQzA8qMehabJAbqTcVQJGYKAy8To3ceR?=
 =?us-ascii?Q?twTa13UQumd45jrkVKUftxsMWyx1p4K5ogC0Qhqi9PCJvgj1uGMtLL1Ox6x+?=
 =?us-ascii?Q?tc9sLM2AH2ohFwI7UzOvm4TpYcKCOBHpw0rKtG5ST1FVH+0fgF93lo/5GpXr?=
 =?us-ascii?Q?l7rzRavrBBJG3dUQlItatgabWBebRmfRC3jnuAkFArUTnEY0H32DSvMwMm4y?=
 =?us-ascii?Q?7wlvXgBLpXiyIMbDEoASzvyHNBKKDGxPwmC7d+Q3OJRqhR7Q9RVaYk/5w+eQ?=
 =?us-ascii?Q?xc8P2b9/FOM4Wd/HlgReJaRp34qW548+fj0bCiQorIYL4oqq2rHIiHmohCHF?=
 =?us-ascii?Q?+SIpWwIDODh0Apb2lKwvb9jUIB73vB9UWqozFL05FvNHM8+/1VAPB+1RcNjp?=
 =?us-ascii?Q?BhnqquADUxYTmx7QRnIrdMMiL1JMTnwvZ7H4YTndkklCK9nagrvyncv+nzi9?=
 =?us-ascii?Q?PFyUWo3iXyM5IQfOxdzBBrlucK5oVMnhQrgfLd6OCikAzSZdV72fxQywxMBs?=
 =?us-ascii?Q?THmJLFMvg839vI5P7yJ7GFaIIp2IRP2rUo8aJPt17KwR4Jij5FXnYsGdZCeb?=
 =?us-ascii?Q?taH5vC10EF+3igkQhC2S88WIpmWvCQ2S1QJmvq5vLn7lPGmPtuRpRp+8v42G?=
 =?us-ascii?Q?G4ISP6cIla6Iadi0pNizPnp38h37XeP88SyEqvjceuRJJ++UU96YYRO/7oPh?=
 =?us-ascii?Q?AB6J60zAQM4gXN32BFQ4OgQDfXjVvylLqQAmKhsDEp+u/LFF1+gT4Bwg4dQS?=
 =?us-ascii?Q?/7MNrYfjPjml836afRUGmraa043XpfTjStLl0x/mOoeGYyK4vtHexdSE0iwq?=
 =?us-ascii?Q?3qia0fdWIau6//n6x+etr6GgGTG9iZzjoMIj0hxN70QwrRxiHf73mZanVV9c?=
 =?us-ascii?Q?klvimnlaLA=3D=3D?=
X-Exchange-RoutingPolicyChecked: YAzx4dx/545QuCa0Ul4HvbYfntLSVGQ80qH+1kfLTuOU4McbEHg6pmlWZmvOkfIpX++jytsJ2MT2SraVwqyO761j3NRV/GL7ATHbk0qCeFKyYaW1n4LY5g+jW29ngLr35ss4HSKZbcSZU3Nxwy79VAnMT8TOMOs8Q8pZhEdySs8R+uWdUzSWbG1QZ7BPcQAZVsPguFj86c0jtwO4UVR3aoflDjzqzAYn4YtG/1Y119ZnhnjFQfaDpOdLAqsYCpJehZPLNHJYwCvo6TyyVb3yCUrNk93xbkPNtR2Xo0yuQDimZ4MFENq/AOqlNXfsE3MOKaIoVxgIr8/L6q8fCAWmDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b22bea-a68f-412d-e545-08dee0f9ef0a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:15:19.6674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKe8lmE5iTdjXVmWXpk7gel1RJKxm/ZxXIPwuEg2m2kQBk3ilXLHJTGwH2GS1sWFpLjFQpznieGeZus6N/9i3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9510
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

On Sun, Jul 12, 2026 at 08:00:06PM -0700, Niranjana Vishwanathapura wrote:
> Harden guc_exec_queue_suspend_wait():
> 
>  - In multi-queue mode the primary owns the group's GuC scheduling
>    context, so wait on the primary's suspend to complete.
> 
>  - On timeout, ban the queue and trigger cleanup rather than leaving it
>    suspended forever. Clearing suspend_pending via __suspend_fence_signal()
>    lets a subsequent resume() proceed without tripping the
>    !suspend_pending assert. A timeout on the primary wedges the whole
>    group, so ban and tear down the entire group in the multi-queue case.
>    The ban/cleanup is factored into guc_exec_queue_suspend_timeout_ban().
> 
> Add a note that on a signal (-ERESTARTSYS) the queue is not banned and
> the suspend is not confirmed complete, so callers must not resume()
> without re-confirming.
> 
> Assisted-by: Github-Copilot:Claude-opus-4.8
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 53 +++++++++++++++++++++++++++---
>  1 file changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index cec3bbf3a10e..3ece51451f86 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2202,12 +2202,53 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  	return 0;
>  }
>  
> +static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +
> +	xe_gt_warn(guc_to_gt(guc),
> +		   "Suspend fence, guc_id=%d, failed to respond, banning queue",
> +		   q->guc->id);
> +	/*
> +	 * The GuC failed to respond to the suspend within the timeout. This is
> +	 * not recoverable for this context, so ban it and tear it down via
> +	 * cleanup rather than leave it suspended forever. __suspend_fence_signal
> +	 * clears suspend_pending and wakes any waiter.
> +	 *
> +	 * @q is the primary here; it owns the group's GuC context, so a failure
> +	 * to suspend it wedges the whole group. Ban and tear down the entire
> +	 * group in the multi-queue case.
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		set_exec_queue_group_banned(q);
> +		__suspend_fence_signal(q);
> +		xe_guc_exec_queue_group_trigger_cleanup(q);
> +	} else {
> +		set_exec_queue_banned(q);
> +		__suspend_fence_signal(q);
> +		xe_guc_exec_queue_trigger_cleanup(q);
> +	}
> +}
> +
>  static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	int ret;
>  
> +	/*
> +	 * In multi-queue mode the primary owns the GuC scheduling context for
> +	 * the whole group, so wait on the primary's suspend to complete. All
> +	 * group members share the same GuC/device, so guc, xe and timeout above
> +	 * are computed from @q directly.
> +	 *
> +	 * A secondary's suspend is short-circuited (no GuC round-trip) and, as
> +	 * its SUSPEND message precedes the primary's on the shared FIFO
> +	 * submit_wq, completes before the primary's. So waiting on the primary
> +	 * is sufficient.
> +	 */
> +	q = xe_exec_queue_multi_queue_primary(q);
> +
>  	/*
>  	 * Likely don't need to check exec_queue_killed() as we clear
>  	 * suspend_pending upon kill but to be paranoid but races in which
> @@ -2230,10 +2271,7 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  		return -EAGAIN;
>  
>  	if (!ret) {
> -		xe_gt_warn(guc_to_gt(guc),
> -			   "Suspend fence, guc_id=%d, failed to respond",
> -			   q->guc->id);
> -		/* XXX: Trigger GT reset? */
> +		guc_exec_queue_suspend_timeout_ban(q);
>  		return -ETIME;
>  	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
>  		/* Corner case on RESFIX DONE where vf_recovery() changes */
> @@ -2242,6 +2280,13 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  
>  #undef WAIT_COND
>  
> +	/*
> +	 * ret < 0 (-ERESTARTSYS): the interruptible wait was aborted by a
> +	 * signal. The queue is not banned - the failure is in the waiter, not
> +	 * the queue. The suspend is not confirmed complete, so suspend_pending
> +	 * may still be set; callers must not resume() on this error without
> +	 * re-confirming the suspend.
> +	 */
>  	return ret < 0 ? ret : 0;
>  }
>  
> -- 
> 2.43.0
> 
