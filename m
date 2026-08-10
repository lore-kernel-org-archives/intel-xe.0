Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC62C5AD7B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 22:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC57210E9E1;
	Mon, 10 Aug 2026 22:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTWb+GtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F24B10E9E1
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 22:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786400340; x=1817936340;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5VJkjZgT6FJtVnnH4vc+3cNwFC6tskwiUOWU1X/nfu0=;
 b=CTWb+GtT+4b+JVNxQrIPwYVTCqnv908m9bNppjlZlNEK0nCh094ACI3U
 jLbjf3eARdlevvheAuxDf9YX4naz5V43ZERUgqXBtuK+cfT1mzVt78XDh
 /O9Kz9pyiAKvyyseddxwjgvhcV364KquxZbue/kpaIOTpIpmD10xMqC80
 Et/qafHHML82iHFCiBZP/84j+e2s5ZFh/7GbOZYgEXpJMPl0noieFcBUY
 EdhcW3DM3j60lzrIKnRP3OU7vuLVJUtR0Sh4uCOYGhbj/qzF0Seie1Eoy
 um6l//RV0zLBD16YgdMEC6xCM6C55Me6lmKMe/ZJ2be2y3A11nTKTEHKD g==;
X-CSE-ConnectionGUID: MhnpUnXdTbehqCsUhddw5g==
X-CSE-MsgGUID: NRSVtNkfQqi39tqFHLBoVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90604967"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="90604967"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 15:19:00 -0700
X-CSE-ConnectionGUID: DLpCOSYKQia/IP2N5wcIfA==
X-CSE-MsgGUID: VuZ8RISiQdm9/U8pX8QMZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="287857807"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 15:19:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 15:18:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 15:18:59 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 15:18:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lc/uz9EIqcwX5BgxhGoV/fOoLbAb3SlW3r3nkLXhGlZA6Jybth3DaxB1GINsZVkJn0xNJcDJLpXuLeqePZ+AYv4aye1itAaDxF1I1+QEslYAWOsrEY6Rdj/IXktevZUbJvkluiYkxEik0Br/nOgLBxBtpnzI2N3NXT3O82164WSZfI0614kk2BLoD5QvhNJUeXf8KL4Uikv7mkpqRCrgav17G/oAkYFhmPM0oXOYisMke/Z4g3at2v3QUS+t7MnPkxAEzm3v4WlmX4/+zm/mhaB74ARM9wP7viWrzZk/OmLtfHE5326Xe7FsWbINkx/FCWs6Ffxh3JKwZmQRJOCeGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Zeghvux7+z0VqX/6Zumz8mhPzNaVaJs0Mn8eK0Rs0I=;
 b=cDJl8dtAz3C3jteXOyjU4e4mKi4SzGhreOjNlRncoccD7V7XOrneFeL0i6R0NDlN+QXim3eRHad3xtt8x5xWMTPrc/j8avs8UdYBonL0i+aZcpXY+5up29w9ylFeYZLzUpszcQCVwynEn8cu3dqTSyBfGDMt0m7c170Pj8uPbMlKasp+D/3Jt29lTqwNMjF8rOikyXwrZyhhlVbjxHzx+/23YU/zwQUGRWRMEq8ASMECXO/S9m3+wzvq7xiR+rkk9Hi3EidXC4rIrYcTShVTUqUth9tRgPRXYP0BeQhNa/wa0Luim5WUFoton+BpwaYsmZ+pyX29Pr5kUbexdi3I2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF267298081.namprd11.prod.outlook.com (2603:10b6:f:fc02::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 22:18:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 22:18:57 +0000
Date: Mon, 10 Aug 2026 15:18:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nishit Sharma <nishit.sharma@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Silently discard stale G2H reply during
 overlap
Message-ID: <anpOTndn25rZM+1C@gsse-cloud1.jf.intel.com>
References: <20260807070421.237683-1-nishit.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260807070421.237683-1-nishit.sharma@intel.com>
X-ClientProxiedBy: MW4PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:303:16d::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF267298081:EE_
X-MS-Office365-Filtering-Correlation-Id: ec50e8c5-538f-4f48-473b-08def72d5ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|56012099006|11063799006|10067099003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yFct7wPU8JhLSGRHwYQfA+quTDskAy0gZa+dU0wdcB+uzOLi+hvAhAjqqEocgRauZJmGZdiwC5S18xWB3I3GYXTcfGVCyHNKRP+bBjdrDhSoLW/1hqJV6RsenQpaq9cMXw6PGcz/8f4jTcshr9+HUKD+jU5P90Km+MetrjBzbNFFT+6NuGv1huUGxiNU5AZag8cetfyyK+FPz9undO918r7stYVtwbmsvKk3UYeJcwXheFtDnAogDQe9g9C0h05AKdTb9bLrBhYepouCot64Ln8Mrk1oeZsNwx6nUDm5q3NFrZIFU2y3pYDanKQLvURVtRIKgYuwTDmtLbJGWv0QIf2pZ2JPfzcNjkulObmdlgfDY+MU/+ROHGHWjP7sFJTxjOjft/oQA0CxsFxzXvz3Wh3luveQanA3vcSkZYDnm6h3GHPyocig4lY1nkytyTMXNJV7Djdi2mX68D3SEHi5YmSOR9w6TphL/BqJ7nxrt7E/g3XRs8a6Q8f9Z1z1cCbXf4ghkM4mbO8LpKwDb23xr2i6LA3u8hTDLTjAPSsiJb7SOrIUZaXJ1uzsN/LtY/VQd/HGGRuLiU4vOzT4X+acCWqFoguhgud0tGPqZ2yF9IegK/ugihTxOjeQxwiI37u7qKA0idc1eyCndbPjPlhsNM+CsiBukAALz42ttNQu9jk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9/4AkMBL0akbVzmveTjdRlw5SSjv7o6CvW3JFeuLrwP/oOgq/aIqCzf0KaPx?=
 =?us-ascii?Q?jKw8+A9Qp7wOgro8YgB73cFrhCTomMBaRrafCB+rKwUlzZpQSl61ybGrZJ23?=
 =?us-ascii?Q?5E3a20nNH791XLF3t6tkx/FwDxjakIuqjmzmm2NLY1dW3p82jBZgdkG8dBzc?=
 =?us-ascii?Q?sRTfCByDCpcnXeBuIjwlOj/x1XF9FUxubXGholZgWtIT6VBb4SyDH03cuZ0M?=
 =?us-ascii?Q?5abXNLQzbayTVi5aWAg+sLHSmmCraQeCBpuDz8HH3AMljGl96wsKbrWnc9XD?=
 =?us-ascii?Q?j7x58UJH780BplFi34jFzXktCfqCMYXYq6rMtW4X1UrfVIf8JSwuQwVx45Kl?=
 =?us-ascii?Q?WKUgKgWJtZrm0VyjvG85zkUlbminkoaFe2wxyoZuXgn2rKFoAR9hG4cFSjoY?=
 =?us-ascii?Q?8a92zg1oX0xmiZqsk4EqbQwKtIGTWqpAIwVxR1mWm+yMI4j6luSPPo35YdCW?=
 =?us-ascii?Q?51X3o5dmhhVLgCCOWR+1gbGB4Z8lBygo/JhfoxEOaLzeNU3xNyyMBbBaNTg2?=
 =?us-ascii?Q?FXwNbdvYhhhZ+HB0bXhGs6erCvvf5XFNnkP2cFrm9COBf2dEYXoEm2lHuRbg?=
 =?us-ascii?Q?yHaFBFw3DH22gGsYn7yReBQjyyP+7DQbwIl423HFcaBUJLYAswFOl54ycrC3?=
 =?us-ascii?Q?DxVQ4vaknSQqmdYAN7TPZrhvmCk6d9qEPQXblLtmTpuJKjawn4mN32AgvVNa?=
 =?us-ascii?Q?11+QW0Pd9ulMMQzgO7ZD4JgpyglLbtsN926vI7qnsHG95VxC3rZG9lESIjG0?=
 =?us-ascii?Q?u9DSB8HL5WQXeZHHtlHqxk87OwDGWOe5LkM86NOSOcx9Zu6NQv8VgHmsQOsO?=
 =?us-ascii?Q?k8479lZwUuofL79HMtgjsBANc2uSh0uw3lf8i98tzCUeM3DE9jWJ8I0SerK5?=
 =?us-ascii?Q?gMHkgCcGWG7Kyp53OZ8csg3jPWRXeFMsR0n1vcUWgMvu5kqGkALQtOHP5LGW?=
 =?us-ascii?Q?u9VBeKzHJ/mHZPCOX7eyxTOtHoIozR2lZPm1ecHuJarBHwCeQ4fH6a92Vrk7?=
 =?us-ascii?Q?uRkTK8xUBEIvidNSQdEJnSLZCODnDf4reTuVuIoln6IC7dl7tAtR8YXtQjwh?=
 =?us-ascii?Q?SW3aTWgMKDQ1h4s8v6ICpLx33H4k99DYsZJHxTYzX+oy2cFcLuS1cWbhekoE?=
 =?us-ascii?Q?Cxa0ugwOm+83zo+GTHrXjTR7d9Gh4tyR2OhkbLxSb52IclfJGuutBmG61NIe?=
 =?us-ascii?Q?pQP+/PHMU0XJ4byAADTOCYLAkEcaTQ1gvHpI26U98NBiXU5N6r4noWBVGzUm?=
 =?us-ascii?Q?UHZhQSFaZWw44K3WuXuDiOQQtiuyAZl1Gi63J90uqmVDleqEGbtsniMIhMk4?=
 =?us-ascii?Q?qEpGE5RDggbgSlqSTuyZy/3iEfUuWogZ5HN0qMmokjUEprFfqyJxn+t+MfYY?=
 =?us-ascii?Q?wKHp9mBJR83g7BVp7zQnfrTb+B0ogfH1jsTR/umlDhDwbbxGwCisqIpT2K5s?=
 =?us-ascii?Q?9jkS+D12DZP9ohioAk8xXrsY+dNrUlLGGQme0j6SMrwgpiIeFm17/8oBMpsz?=
 =?us-ascii?Q?8WnAkbZKiKl4aGqAAVK0ue+RC9bxf/NyNbP0oKLsyShWpieK9wkCKYEIeBqu?=
 =?us-ascii?Q?0hd4SWiAf7kTs25M5g4bv9amRAWyn38AK8ErbXp024h1iynwkTg6BbVQyxJP?=
 =?us-ascii?Q?m5N/tx9UHsVBGxQZVCTt7dnc2Z3tczWi3+JBNxKQ8JDQ8VdToIWt+HrmYDfM?=
 =?us-ascii?Q?KoFBkI7rd/gdH8pzCWx4TpCGpEQFaoVuQpkwnoHJvguj82Fx4+9iurgGkGx3?=
 =?us-ascii?Q?IzHx87bbjw=3D=3D?=
X-Exchange-RoutingPolicyChecked: dh7TXgZT29zfR5mhOuGieYlsFJpF3A5yzrFSBn6I/flWjZ+cLr7HeQfAtC98rnLv6QOy1G4z9c8PJzn4WtvGowfPcpIkjCIX5TWB1yAaRzeJ3gBSngT8lpKaGxsgqkXjqe5JnZpDmB7J+GTv1t9JZMGjUMV28bkNyKmw8UpV6pR47P4AO5QHxYat5gy8yZ50nT7PnRBNNR9T4UUYaehpX3qLQs6Iwx+zMX5M+OqFBjj/tIkYbO0lqP93dn2T0s6IpkhXg66yW1zGFSGbmgFmIPLrQnejtByRyB/ipnrZXcqDKv0H3gF0kHLMUpYbh3Mdx+/mU+DLYDAA8WbpVdwqsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec50e8c5-538f-4f48-473b-08def72d5ec4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 22:18:57.0744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XG4Xyri2QS1CsnqeFSqY+Ib5Im1UGIIDqqS8ZHgreKGfmY081ynOsWvRkO73YdX2LaOgXeurDwwgLIuV+Hgi7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF267298081
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

On Fri, Aug 07, 2026 at 07:04:21AM +0000, Nishit Sharma wrote:
> When xe_force_gt_reset_async() fires a second reset before the first
> reset's post-recovery drain has completed, GuC may still be processing
> H2G requests (SCHED_CONTEXT_MODE_SET / DEREGISTER_CONTEXT) that were
> issued by the first reset. The G2H replies SCHED_DONE and DEREGISTER_DONE

We don't issue H2G as part of a GT reset. We stop the CTs, fixup
anything which is missing, and blow away anything in CTs when we
restart.

The relavent functions here are:

xe_guc_ct_stop()
guc_exec_queue_stop()
xe_guc_ct_start() 

> can then arrive after the KMD has already marked those exec queues as
> banned, killed, or wedged in response to the second reset.

> At that point the state flags that the reply handlers assert on
> have already been cleared, and the handlers treat this as a protocol
> violation, emitting an *ERROR* and returning -EPROTO.

We should not be recieving G2H after xe_guc_ct_stop() and then after we
internally mess the with the queue state in guc_exec_queue_stop().

> 
> This is not a real error. The reset path tears down exec queues
> independently of any in-flight G2H traffic, so a stale reply for a dead

No. G2H traffic is stopped in xe_guc_ct_stop() and any remaining
commands are squashed in xe_guc_ct_start().

Can you give an example of the failure you're trying to fix? This seems
to be a misdiagnosis.

> queue is harmless. The proper response is to discard it silently and let
> the reset-driven teardown proceed undisturbed.
> 
> Detect this condition by checking whether the queue is already in a
> terminal state (banned, killed, or wedged) before treating an unexpected
> G2H as a protocol error. If so, log at debug level and return success.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 8aaed4fd13ea..988c236c6a03 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3149,6 +3149,19 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  
>  	if (unlikely(!exec_queue_pending_enable(q) &&
>  		     !exec_queue_pending_disable(q))) {
> +		/*
> +		 * Stale SCHED_DONE from a prior reset cycle: the reset marked
> +		 * the queue banned/killed (clearing the pending flags) before
> +		 * GuC's reply landed. Discard silently
> +		 */
> +		if (exec_queue_banned(q) || exec_queue_killed(q) ||

"Killed" is 100% the wrong term here. We kill queues during a user queue
close or FD close without triggering a GT reset, and the normal firmware
protocol flows are expected to continue working with 100% accuracy or a
bunch of things leak.

wedged, banned also look wrong too - see above.

Matt

> +		    exec_queue_wedged(q)) {
> +			xe_gt_dbg(guc_to_gt(guc),
> +				  "SCHED_DONE: Stale G2H guc_id=%d, state=0x%04x\n",
> +				  q->guc->id, atomic_read(&q->guc->state));
> +			return 0;
> +		}
> +
>  		xe_gt_err(guc_to_gt(guc),
>  			  "SCHED_DONE: Unexpected engine state 0x%04x, guc_id=%d, runnable_state=%u",
>  			  atomic_read(&q->guc->state), q->guc->id,
> @@ -3185,6 +3198,18 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  
>  	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
>  	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
> +		 /*
> +		  * DEREGISTER_DONE from a prior reset cycle
> +		  * Discard silently
> +		  */
> +		if (exec_queue_banned(q) || exec_queue_killed(q) ||
> +		    exec_queue_wedged(q)) {
> +			xe_gt_dbg(guc_to_gt(guc),
> +				  "DEREGISTER_DONE: Stale G2H guc_id=%d, state=0x%04x\n",
> +				  q->guc->id, atomic_read(&q->guc->state));
> +			return 0;
> +		}
> +
>  		xe_gt_err(guc_to_gt(guc),
>  			  "DEREGISTER_DONE: Unexpected engine state 0x%04x, guc_id=%d",
>  			  atomic_read(&q->guc->state), q->guc->id);
> -- 
> 2.43.0
> 
