Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FAFCA9EBD
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 04:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074B910E500;
	Wed, 14 Oct 2026 04:05:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4606C10E500
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 04:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791950741; x=1823486741;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=802E+tdPSZTIaeLyHRnVwauZ3TYx8J3UVEZlJg+K/VY=;
 b=ngsBOLPsu2Lqh0No6ZswpTUntK5nqT9dECWO57uC3VdppZfewc0l8rwT
 0p0jpS8v3MJWu1ZehqVXGvJIwhIeJeKeYrNL5YIcwZXhqbSVB7z2RMv4n
 ARl3WEHEKFycSGw18/Q6pB98OHnNhSVJH7gF/6in92I+yFamnGIEPeJDB
 73wPKx6RaDTYhB8+JJge1K0gdDaoCJesSWuqDsyL0XVp/dGZh1Kdc06NM
 JuLH1S47J64kHcuy6PilvUMYvLNPsRv4rBrdFYUDLt/G3Rc+Cg5QmAwKf
 2TKx7Dfsh2a2ojKaA+7e0MGA85Av7x5o7Tv6dgYLkoZBYFbSbj3oazAF9 g==;
X-CSE-ConnectionGUID: 8hh/BnV0TH+ET+To5YF/Kw==
X-CSE-MsgGUID: S36OycnURiWcmZ9ZEO9Zhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="695489"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="695489"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 21:05:38 -0700
X-CSE-ConnectionGUID: EfmRCxnsQ2aeNYB8dJUwZg==
X-CSE-MsgGUID: Yb724igkQTK5/Z7z/mF6eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1781253"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 21:05:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 21:05:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 21:05:36 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 21:05:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e25aDgSZmGbdF8Ksg1t8E7RfcrGwvxeS1U/NGrkljntfpUcAhURnmBRIhnCsApcsjASGzUK9WweBF4vJj03Wg+FXoQqR7/+uNmzRoxb+p6eLkPcQnQLgdvprMTZ40nL5Po0gMdn4bwjbJpLsjY5jocIrDx5DUEmHujwpbSDRgdUvdhfUaSe64x54FEYeNm8l0ZLn6pvjVPVDAbmlmZGo3L8vLFdj+0gA1xNlGYH8/eLQch5YgsUP3IsKI2TwPL9Jac3ZN+15MZb4hnkumAgEoc0guQh3bsJigUusWmdBXlPpwF0jDlHY580o0kCQ4NFtilsFqWoUmYJQaI/5f+d5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfUUx7VijNy6bKU1kPBzL/iq+4t48xJuXHnLcDNyuko=;
 b=slCnPhOiRBCWXZCrsny/9oXKpCivS3ZJt6t6JdKF3ZwSWFU0Tzg9xoCwxPoZOdd7ifOyY4WqkUyXm2qIwfeTGoVCq/cBBdcm2BAL8gDwPDcZ6Wj5CGAvuCq9V6Xi3zyZNsZNRIcFXRHCR3pFv/VPEjYDcZ2OzmTVj9wOvFxrk/IA+5GjapQqjLOHJws9rTn8NReXMbaXpmOhiRa1UQA76vvjtk5DCsMPPKDjPCz20u7jVgXmTlmrih+TEvfEIeCG2chGPFlcn9snisf6EstmTg4NT09oULH2eq3T7litWwSzaDbsgN/GBVIfzQNooGe+cg7pdxn1zrJwnOBA1vT7+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by CHXPR11MB9628.namprd11.prod.outlook.com (2603:10b6:610:2f9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 04:05:29 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::2f5a:96ce:f7e4:c315%7]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 04:05:29 +0000
Date: Tue, 13 Oct 2026 21:05:27 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Do not attribute a TDR disable to a pending
 suspend
Message-ID: <as7_h2IX4LNvW5A5@nvishwa1-desk>
References: <20260915192119.51065-1-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260915192119.51065-1-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To MW3PR11MB4684.namprd11.prod.outlook.com
 (2603:10b6:303:5d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4684:EE_|CHXPR11MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: 6829f994-4fef-40a0-d7d2-08df29a86284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|18002099003|261009223027099003|6133799003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: gQWtypn4/f4L3fhq+AG8GfXy8jVgO5ppeEMPpOCrxqSfFhuf8Vm+Yo1mJtH46xNS3ar9HfGVDUWgl3tbgi1RclAz0I2LzI4xL+8uHunWFN4tkNX9GCgjAEHiIrxfk3okvU7aWz4AinGhiomXIvSbvjPArj01AHaCz66wXN41AnMvrppunKhPlCFr0e2OQvqQCxypFuoyXU/G1x6Y2vdBKMSfYA6q7M/VKkfnFRBFjl/TDFyHYR/3NH1eZ+iT9zR+Y+GACF1sjBbZ75XmrOQS0yf8s2GKzGC0ZfkJMqvpwg1AXVSR2RJ0eiYO70YUxNMqNaFcLId+Rijumh53q0F7ReNGkMT2YFAIZzByad/h2MQImJ5hPFF1r9DgmP7Jl80JX2aQtDOy/9sFBNgBlsNrqIraENGe+mFui2wcuE+dhwgKbiKb6rRpuazoVDiQu1OBcqpETtb08JnNXOdWSN2rcHOFpB9XzdbiARNtF/NdYrb4cJpNpDgxGvhxYGLs0zALcpHznoCa47d8digLlt88njfZNtBaEc1fcl9HNvc6PbLcN4AxP1kUBynliBFu+oL05NaqZW1ANCLR6HI6aoAkbhl2hcV7nUe3cMLsEaIAMt+r4xZABBxIJcPfyJn1vNhm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(18002099003)(261009223027099003)(6133799003)(11063799006)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YHGS7UOl81TUGRFGHi/Ah6A9qADbh1YymlVirVqsZbAYSaDsCyKAyk5/vuw5?=
 =?us-ascii?Q?78EEjiE3YVL0FID6sE/NRIY6OduqlHugEk18rzi4D3p+YkfhBdstTDo4GfEm?=
 =?us-ascii?Q?vsL33puBlyM3pYNMw1XfDRdIfWfsMwKWYGRNXwGdqYWgxE/+Pr2AANmLcBlg?=
 =?us-ascii?Q?cZxgQQGhI4MRBGjiO7IMWdjBrwAY0vGo+HsWwTi/yAfkyHyazgr5/a9ZmWdS?=
 =?us-ascii?Q?9++kZNAjjAyf/K/0dkDr4urSha2wEjiS6kAZubSWjuhAwYELyNhEYWvn4qPR?=
 =?us-ascii?Q?5Vgy9sEU88Ugq7iwM7K738+plgCT3JsgNJC5a5khBdL/6u3KKsyRUgReZeYJ?=
 =?us-ascii?Q?U5Nv8fejkGOhDfIBE55V9m1dcwFS13ElpJSHUZyUZgaD+UxWkaMeS6lKdjoc?=
 =?us-ascii?Q?hHSG+bTfs2PpzWmYOVmqbPlbhPnshsfxK6Of+rFVJaPAthkFNrmw5sW/JkWY?=
 =?us-ascii?Q?+gMNP2MibqmWN+MS/BXkcjU+t1KLjsjZ8Caaao9oI4NQhYFImMbcaGsqvj72?=
 =?us-ascii?Q?fr0jp8Z+77mELRyFXVIuBa32xRQxn4UE/U4bTX2/ZF/kixca12CUMt3pjclb?=
 =?us-ascii?Q?RtQ0Gg8PjrNhrQvpN9NVZdadqFGG4Tdz0Sk8pwWlWZ9i2P58/VKR1AMGVanQ?=
 =?us-ascii?Q?1+fuCUwIMMJzqfp5Mr+xDUGI5CtI1SjuOMYGAulEdbbCk49Nhy1s4/PgaWdQ?=
 =?us-ascii?Q?Jm1JkxvyCefMtsEPgCmfLY0wU6R115+LCOjQmoIfPm9qJsFoT4brLvUu9+q7?=
 =?us-ascii?Q?7+EgXeThjl5/SHN1TvtPLrWMY0qiookO0kI6V91JMRSDrX8bFQw8rFwV9DCB?=
 =?us-ascii?Q?Ja3KEdQDAAndCFwEx3nP3cpdWgmYTgYlK+kl807EPJ86+cFJIqr57vhyLAik?=
 =?us-ascii?Q?WjwvIq7Ib6Q3CKG+wDEdYtey7IEQmzsLb/81p322/8ZmO+4RU8RVKWKMW4oS?=
 =?us-ascii?Q?uPAnpAWE0AmVt8mLuZ6Q9TQW8S38YjGo/HjHs/aZrg39EER0EH22vcdLx6wD?=
 =?us-ascii?Q?l+8u2sP3e1qzfyb5EX14qXw6YyECkfM0bJTTlM69fMjj0Jm4oess+QtSVYiA?=
 =?us-ascii?Q?vnVKbkmKo2l84/VtXNe6SnFiZm2Dk7MAS+c5A5KuGQCO0w8I3zZHPvZ9MRr8?=
 =?us-ascii?Q?Z21vmBXJ0Tv27klEYUaD3SuySefsBpIK6YhnF2YS/BCGRm8ECcLMaCeEVDko?=
 =?us-ascii?Q?lV5fCVQL07c4t56/PR6QS4xXYiXdZQt6k8TJqvHh8fgs3tB0YYnV4k0owjOc?=
 =?us-ascii?Q?GQTJK/3oW39nYXtUlYYRpHv82mTMnn24q9YXqresjBMk9IxvVdgqnph9wvOP?=
 =?us-ascii?Q?S9dq1Cxo5oHZbaWIKBxHKi9m/jktQWlbPjx/XcyF+6CGkM9AQ9dbyjaSn3Ek?=
 =?us-ascii?Q?owIJcEHtAZ/ux/EXWfMEDJ7C6Ue/HkvZCdTCNsoKf5NqZuvcOQBQ0NsYhR9B?=
 =?us-ascii?Q?s5CmccCYTGPBqS8wES7h0G1J/WhwyB5P9UMo/q8PO3MMYftzrSF02dmVH3eC?=
 =?us-ascii?Q?I3BzvoeFeLl/oWfClddWuUWMmqHRPSm6kKyS7ZAiPo7ImCJRFCJqLT64XrQR?=
 =?us-ascii?Q?hakhWeQ/PCDfZOXubSva9b5jF8vatWWVEXhBWhGKlNrUzBgc7tUkxetpkhDN?=
 =?us-ascii?Q?sWg2ukqrOtydHs2knZUrwJAbTpPFT8hcQN9WgCwjRMYy7etHCrGygcrPG4Ce?=
 =?us-ascii?Q?lIkoQATrB2sXdGFX+Ux0OKfEquADyGJLAwLJrvDYLd4zki5MI4aajsRqpOdk?=
 =?us-ascii?Q?7yqF2/lFvETSaaj0EvsHy6vlxDhS8VG8hMizme4qQoM/cKyUlVTT?=
X-Exchange-RoutingPolicyChecked: I8r2v/A71nHBYFbWmwMADtXZX3JzSwiVE1TPkPX1wX8IyqAIX4OLasNKdlbm4RNsHmfxc6IL2hsLLZmEahUe9gZjQzxLjTtWAc1AJTtFuCqal6MPy/KMOmHw+a3hkbErT9XcR6AxzOW9/QSdiH7LwHMOE+tiAus0sqywNM0vJr/fkGWCXDOT/8kGX81qqu2Q2LhN4aLii1ag0onpif1O5Qp8xRu3s1ODW7bOuSIL9V0lN7ZMgMBiLQShHd55o2uswI2NoSwrWBMVu8mz+IBehG4j60r7vXmpeW/Q3BSZ6048Oom8MwXQBj0joOlZ+whjehKGjxvOw28h4JdPkSCFeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6829f994-4fef-40a0-d7d2-08df29a86284
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 04:05:29.5398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5/4pSrY309IdApVIBMr6TNm09XWFPS7zIRmLViOdik5eaeoJ+feYff8iOOlimYLQ/pyRkM0xQCn6LZ6fwcxrGi9iHfkoIBOmtd/6TZVSlcq6xquDCsxFlWw4Kjs0pn0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9628
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

On Tue, Sep 15, 2026 at 07:21:19PM +0000, Jagmeet Randhawa wrote:
>handle_sched_done() treats any SCHED_DONE with runnable_state 0 as the
>completion of a suspend whenever q->guc->suspend_pending is set. That is
>not sufficient to tell apart the two producers of a scheduling disable.
>
>When a queue is suspended, __guc_exec_queue_suspend() sets
>suspend_pending and queues a SUSPEND message. If a job times out before
>that message runs, guc_exec_queue_timedout_job() stops submission, which
>traps the message, bans the queue and issues a disable of its own via
>disable_scheduling(). When the GuC acknowledges that disable,
>suspend_pending is still set, so handle_sched_done() misattributes the
>reply to the trapped SUSPEND message.
>
>This signals the suspend fence for a queue that was never suspended,
>tripping the exec_queue_suspended() assert in suspend_fence_signal(), and
>skips the wake_up_all() the TDR is waiting on, so the TDR stalls for its
>full 5s timeout and then triggers an unnecessary GT reset.
>
>The suspend path marks the queue suspended before disabling scheduling,
>and a trapped SUSPEND message never does, so exec_queue_suspended()
>distinguishes the two cases. Use it to qualify the attribution, the same
>way the VF migration replay path already does. The trapped message is not
>lost: it completes the suspend once submission restarts at the end of the
>TDR.
>
>While here, wake guc->ct.wq after clearing pending_disable rather than
>before, so a waiter observes the updated state on its first re-check, and
>wake unconditionally since the suspend and destroy paths have waiters too.
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Link: https://patchwork.freedesktop.org/patch/747153/?series=172176&rev=2
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>

LGTM. Probably need to add some IGT test at some point later.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>


> drivers/gpu/drm/xe/xe_guc_submit.c | 48 ++++++++++++++++++------------
> 1 file changed, 29 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index f3ba8abfc228..dbd370eff416 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -3262,30 +3262,40 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>
>-		if (q->guc->suspend_pending) {
>+		/*
>+		 * A TDR stops the scheduler, which can trap a queued SUSPEND
>+		 * message, and then issues a disable of its own. suspend_pending
>+		 * is still set in that case, so only attribute this SCHED_DONE
>+		 * to a suspend if the SUSPEND message actually ran, i.e. it
>+		 * marked the queue suspended before disabling scheduling. The
>+		 * trapped message completes the suspend once submission
>+		 * restarts.
>+		 */
>+		if (q->guc->suspend_pending && exec_queue_suspended(q)) {
> 			clear_exec_queue_pending_disable(q);
> 			suspend_fence_signal(q);
> 		} else {
>-			if (exec_queue_banned(q)) {
>-				smp_wmb();
>-				wake_up_all(&guc->ct.wq);
>-			}
>-			if (exec_queue_destroyed(q)) {
>-				/*
>-				 * Make sure to clear the pending_disable only
>-				 * after sampling the destroyed state. We want
>-				 * to ensure we don't trigger the unregister too
>-				 * early with something intending to only
>-				 * disable scheduling. The caller doing the
>-				 * destroy must wait for an ongoing
>-				 * pending_disable before marking as destroyed.
>-				 */
>-				clear_exec_queue_pending_disable(q);
>+			/*
>+			 * Make sure to clear the pending_disable only after
>+			 * sampling the destroyed state. We want to ensure we
>+			 * don't trigger the unregister too early with something
>+			 * intending to only disable scheduling. The caller
>+			 * doing the destroy must wait for an ongoing
>+			 * pending_disable before marking as destroyed.
>+			 */
>+			bool destroyed = exec_queue_destroyed(q);
>+
>+			clear_exec_queue_pending_disable(q);
>+			if (destroyed)
> 				deregister_exec_queue(guc, q);
>-			} else {
>-				clear_exec_queue_pending_disable(q);
>-			}
> 		}
>+
>+		/*
>+		 * Wake after pending_disable is cleared, not before, so waiters
>+		 * such as the TDR see the updated state on the first re-check.
>+		 */
>+		smp_wmb();
>+		wake_up_all(&guc->ct.wq);
> 	}
> }
>
>-- 
>2.43.0
>
