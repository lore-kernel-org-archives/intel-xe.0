Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20540C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 21:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE58710E536;
	Tue, 18 Aug 2026 21:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCgYrdri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70D310E536
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 21:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787087117; x=1818623117;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nTIP+Vy802AH9g+nE0tH09NWSVhq/VCR8q3vNanqPNI=;
 b=lCgYrdri2LIUeV3yYUto1NzPSKwkwbwYG1czUQ28v//sS6zTMbLRZY0A
 5ouUYxbxeT/M/R60Or9lqKjJYR5Jynv8AdedwDWw3hF2KDulOssnnTFo/
 8TWONW909fzcKGqaEgmc2PiVAPC9X5QDXexEIRWKI1AvZgl5W0KITvByn
 HPdz3mstS0SoAhneeUDLXfhsx/JSi4aakBJfMdIJpldaJMN9nTdRgdCtn
 lZGvVZHWqRW7xrFICZAWLIvTiTMxBkHUtSknc4xjwjOmyS8wnoWu8YW/z
 YZCEwQvZhrjG9B+WkB3skC6x/aVCmBqZOWx12Zf+Ow72w7SKie5gyJo+8 w==;
X-CSE-ConnectionGUID: fCVk8210Q82iHBwt1y4zbw==
X-CSE-MsgGUID: FlzC++4uSu6k9sVT48YK9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="75121575"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="75121575"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 14:05:15 -0700
X-CSE-ConnectionGUID: zEevhaZaQjaIaHAm7OwLww==
X-CSE-MsgGUID: M/DL6oP3SHmV9Sn9rtyM2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="303563799"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 14:05:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 14:05:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 14:05:14 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 14:05:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itOGBBFGSyT3yULBV1O9VQgbza3Oi2xCPPWRs650M5VhLgzZJ9BIG68rDR63KlYpO7zNvXPmEFZ/9JC22aGj95rauBpAgSUezl4BZNgo5+GHT/6T92ItHp9NGpTVBRDldRT+l3rfkrD8gpB3YUqB0ry7b9SLPlsp4zQR7PtL6Hl0ce4lnRJlSrvxSbmPRSG2HHKaDXWAM0ryAG8+EAn5GP7dai4Qgq6hFcJ+twFAMFJTvZNkBzf9mDFuAA7d6SE7Y+DQVmOfJrHu3sL1Yiymx8QdIPll632vC0ufqBjFFpEoJLuyfwQZa0/ZG/8xVTVXBGBXy96yP0hiMFZV3yRosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoSB7ZnOXXmTjPMhyQHcFCHw8VpbXy585daQiEpRLYU=;
 b=t/vewD8e1+JNiRhaDaobl3KPHq7NOyvA+iJ2eDrsAVRg4o/zg9GaWiPI30bxPf5NKWHxdMMB1soyyK+7qnojxmi8s20zQ4+wBDktQIRACwTZFzToOg0swmY6oVkPiW38fgg+tBX2r/p0FuRhwsGwud1qkUpErP/X9Bq578FXh4zr8WVRlGud+qad4r7ew62+aDiPMhD9BkOJzJa9BWowhhHg3EFXRe2hXjzaRotn35exxDeyY6H+0XEOLfhsL8ykEm7jtrCQaCg3hcCJeeTWPocU/HmpHQaQ6Yx9+yAJmdUc6VP+Z0a2mQg3nPPn7sh9a8qd6Up32zufuWAHJxt2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB925731.namprd11.prod.outlook.com (2603:10b6:806:530::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 21:05:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 21:05:12 +0000
Date: Tue, 18 Aug 2026 14:05:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
Message-ID: <aoTJBly70vnRnrwK@gsse-cloud1.jf.intel.com>
References: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB925731:EE_
X-MS-Office365-Filtering-Correlation-Id: 522c7ce9-8eb4-4b58-a5a7-08defd6c64be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: AmO3uorSJyK/meHHyksf1VyDsDCjsuWNuV0Yd3KFqWLaoKMZajvLqoPdVjOtJDDa1x/TzCX6z+XAolfz0KLMHXWlXM52OH55ukHl3WbtRw4pE7telYuyF1nrx4CJSTzOuwq568tjxFcqDeECvtOtv7JBdJXV/FpIsxYEZSgB5tVIZx9ZMwPKtwF7/iZvFYUSIc8UtJbtPq54sU7PdpycIAoLSm2ez68BHrPakqreedSEEVIlnsNOdUWQMkurIB8LI2mk//zA0nQldT1spOVK0OlurEiJxlVYoWGnwUwj/4ofzadR/Yqic+fDOSzL5b41gu0TFdHKjG5mbP/zYntk0TDYYCDa/9ryW3Bg+Y6nZxOo3RjsjxUpsXE+b93rn7KPWcRved992c88CDehdPzVt2LzMl9co9whN7nz9kwVrrpAnDiZJJaSBeQu9aQN/sCqw4zgImQ7aV2kdYhnZHYktsLgukIAwgipN5YQi0SRCXcnujCgoiByn4SmcR7E1WQHHEofeLMAOsd7khvG6JSQmIoXj6oqbdbnxVFCZT/vaIlcDZ/BItON49+OAzCwgGkSQjMLVq4Qtgmps7uMuvPvcYwk+ijCwSUNFbl3uFLOEGTAhDxjZ6qQsbjc5tnI/MNTx15/Gh/ssftXM8R3mc8XjQpR0WkmCDsz+hhPWzpKrAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pxl6pPtbQLqeYLBwqIDQ2OvNp4IxUToNnQ8KG2ZFHz3rk82j5uXxXQZxd6Sw?=
 =?us-ascii?Q?+pHMx+7qchJWRT/t82WINV99RFu2a2/VMi++KsFouJjF/rhN2xNdiX4u3VIh?=
 =?us-ascii?Q?IEYAp9ZAAV2+es9yon0uYxIFqWxP0jhOit6F3fo+ZiS1uSXZGGPbP+U2kyEk?=
 =?us-ascii?Q?ssq7zjTQ/wuNNNKl1FZzbyD3LvsEBnTFK8RpMOwxqutIfJ/MzYhDRiYbQ4nf?=
 =?us-ascii?Q?LNOFGnnaQZ90zAoXWhEI0oEueOjwvH2Z10QZiMvbiwZqIr/O47Ta+kuIR1gU?=
 =?us-ascii?Q?/jl/kEs+l70xR34kKD31BZ6xF0HbQjhOkbahMO7rLPlBUfz1PUmSG7n33rK2?=
 =?us-ascii?Q?4LEGLZyzCKPE30x8wogTnkOcuj8Bnv61WdBpZbKUTAkxurbwshoB0xbL8rqw?=
 =?us-ascii?Q?1j2w2jRImxrlF77uSlCFoVEGytXNrYlL9au32CQpxojwmIUT4SegN7j7r3km?=
 =?us-ascii?Q?Mn7skAqLk1z3JbbRzZqxohgrXzByzIiPZRko2kCEkB1pXO0d5S2Sya8rooGq?=
 =?us-ascii?Q?Qyit3wam2E05Ptoy4TRqoywlPEl/89VF8Ps6l+2rjeyrYBWcpbAbiCTDY9DA?=
 =?us-ascii?Q?l9OZDbummCxB3h5nMI2X8H92Fc5eNVt8+N4oN/LUcgkAtaz2rVAVEE8+YVde?=
 =?us-ascii?Q?BnAW1Yb0dxEeuOURopZmY3unEuL3gkUUqq9XfpyaUbrX5MJvJh3xfIYfRsLM?=
 =?us-ascii?Q?GDjLEit7JdjBnQrAb6BnhgnLlDpWgDP4ZRL3M+Kzm5SMY1iBFgU3izhxbeR4?=
 =?us-ascii?Q?dEPAIrpYkfEZ2F2BRCQ5nN+OS/V45SeCeKHbP5TjmT2Lw0tzk4LEhEmFf3wH?=
 =?us-ascii?Q?CtzoNL6t7qVQkFHfmXZQM75OAlvhoznLxvvtc8aCd9T6mlj/hiXQ6I/OUpp6?=
 =?us-ascii?Q?rXJJcRiARfVWh9EhX1IoZGtx53HBWEiTljr/aDjye0ydg4Ni8HQyrG+fDXwZ?=
 =?us-ascii?Q?IyNdUZgtH8A4xdrFbAWAHi72+FmfwCsPeNNZ8eIRYt8VJjGrux2GNrO/KRX2?=
 =?us-ascii?Q?3g9aEL+Ck7aauLSZ1Q9S4A03e0QrRLqtKQKCljSMS9CHkf78DvGmj5ZYywB9?=
 =?us-ascii?Q?lCuuAwuWg1uWM8f12mKUYHviEKs3/7PiQfP1SLEErluZW9jmX2gLGhFGw4yc?=
 =?us-ascii?Q?vF40P1iuiGN5V6jDm4vWVS9Z3UyT68fQnSFI5gL8Bx3yS6hQ1O4OOq69BxbI?=
 =?us-ascii?Q?gxlHpJwwaT6uCmC1b4OoZyBfl6uYyKFQvvrcO75GxzIrMYVx2tK8GFnYVKWu?=
 =?us-ascii?Q?3purVVRVTisR4lqYwcaSotbEF1ajelwCzs+XUnl9qiHa/CmbRvmvj7yBsAVI?=
 =?us-ascii?Q?s37RXEfaHlacigDcmRlVOSh5LI5xQmbSvq5Nvi5ooQd0LoKnwYRok4sLBZ9j?=
 =?us-ascii?Q?XhBufbVesxEZHxpVHMzlnzjyAlzZRJVKOYqNMIrP3TRQyTsDEoC0NcUZLkq3?=
 =?us-ascii?Q?X+/M+yqqqiWr1x3wNdpyHXYjjLEptBPbxHLlR+P7ftGME1fghqoNRFbVuHi8?=
 =?us-ascii?Q?5onZ+43XWcbKvQAoy4UfvNTiZOBHvMp480gpeHK+dxf6Bc/xI0Aj1x0omX4p?=
 =?us-ascii?Q?mEHbQ34eLPdAJLbnB5yptEpzZre9W2oaWquyis6rcLFbHqDFxTSq16SiLLkj?=
 =?us-ascii?Q?19Ue4jmcrwca3/3hnEUmqZRgLkxaWJL/hhK4xyEuYn53w4aZ9Qmz+tbHcAWL?=
 =?us-ascii?Q?OGroRWsIE9FRRwJoOru0ZipyHmIG+6blI5rlJluFSiqFnI/Jup4Dy6vVvVAC?=
 =?us-ascii?Q?Piw3KNEovA=3D=3D?=
X-Exchange-RoutingPolicyChecked: QyamtrbB2nnxF0oRrT1fa+ynsWDZ3E2Q1bygpev3b0dr0mHqVSODlirvKoNQhYoSeytqwnWSI86z6a5w3LGR6EE3qekrIj/UzfSM7WERGE5XDqURZaArYtx3uTdBE4lBIPRq1nKSaorooPOZd/X76l0i3CK1DN7wW4ZHIu/vkWKzK8ok/7LRvcEahr6umzN6JZotI1PrrbLd/9de91WXWdKrlLspJEzD2vaaO3ZVmFDZnfLjkihAIvwJsqUHRngddN2GLhOhlZ0RpGYKTOSBkbSEQZNFvebCOwMepsBQgPjFelkc9U8CZN00cRv55Hi4zaQvozi+6Ljo2ow9nJa2eQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 522c7ce9-8eb4-4b58-a5a7-08defd6c64be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 21:05:12.4966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NKeo1/8Bn7ZMrLbXFWgSzw/YZjAbX5FjGqLduzoTskuE6Iq3odIPaDq2yuWHfS2zhcBW6L/elEyYvSlveFm7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB925731
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

On Wed, Aug 19, 2026 at 02:38:39AM +0800, Jagmeet Randhawa wrote:

This is designed to be lockless.

> q->guc->suspend_pending is accessed without any common lock.
> __suspend_fence_signal(), called from guc_exec_queue_kill() and the

This is actually the problem. __suspend_fence_signal shouldn't be called
from guc_exec_queue_kill(). This can prematurely signal a suspend fence
while the hardware is still executing.

__suspend_fence_signal should be called in two possible places:

- Naturally in G2H handler (handle_sched_done)
- Or in global event that takes down the GuC firmware
  (guc_exec_queue_stop)

With that, a lock isn't need because the state machine / firmware
interaction ensures everything is race free.

So I think the solution is ensure __suspend_fence_signal is called in
the correct places rather than adding protection via a lock.

Matt

> suspend-timeout ban path, clears the flag asynchronously. Meanwhile
> handle_sched_done(), guc_exec_queue_stop() and
> __guc_exec_queue_process_msg_suspend() check the flag and then call
> suspend_fence_signal(), which asserts that it is still set.
> 
> As the check and suspend_fence_signal() are not atomic, the clear can
> land in between and trip the xe_gt_assert(q->guc->suspend_pending).
> 
> The flag is already set and read under the per-queue msg_lock
> (xe_sched_msg_lock()) on the suspend and resume paths. Extend that same
> lock to the clear paths (kill and ban) and to the three check-then-act
> sites so the check and the signal are atomic with respect to the clear.
> In __guc_exec_queue_process_msg_suspend() only the non-sleeping branch is
> wrapped, since the other branch waits. In handle_sched_done() the flag is
> snapshotted under the lock and deregister_exec_queue() is kept outside it.
> 
> v2: Document that sched->msg_lock also protects
>     guc->suspend_pending, which indicates a suspend message is in
>     flight, in addition to the sched->msgs list (Niranjana)
> 
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +++-
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +++-
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 29 ++++++++++++++++----
>  3 files changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> index 63d9bf92583c..78ef2e8ded4f 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> @@ -47,7 +47,10 @@ struct xe_gpu_scheduler {
>  	const struct xe_sched_backend_ops	*ops;
>  	/** @msgs: list of messages to be processed in @work_process_msg */
>  	struct list_head			msgs;
> -	/** @msg_lock: Message lock */
> +	/**
> +	 * @msg_lock: Protects @msgs and guc->suspend_pending (indicates a
> +	 * suspend message is in flight) of exec queues on this scheduler.
> +	 */
>  	spinlock_t				msg_lock;
>  	/** @work_process_msg: processes messages */
>  	struct work_struct		work_process_msg;
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index d27826b36649..74b711abe257 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -52,7 +52,10 @@ struct xe_guc_exec_queue {
>  	u16 id;
>  	/** @suspend_wait: wait queue used to wait on pending suspends */
>  	wait_queue_head_t suspend_wait;
> -	/** @suspend_pending: a suspend of the exec_queue is pending */
> +	/**
> +	 * @suspend_pending: a suspend of the exec_queue is pending.
> +	 * Protected by @sched.msg_lock.
> +	 */
>  	bool suspend_pending;
>  	/**
>  	 * @suspend_count: Reference count of active suspend requests. The
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9036f89dff7d..c565c1d32d3a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1928,9 +1928,13 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>  			set_exec_queue_suspended(q);
>  			disable_scheduling(q, false);
>  		}
> -	} else if (q->guc->suspend_pending) {
> -		set_exec_queue_suspended(q);
> -		suspend_fence_signal(q);
> +	} else {
> +		xe_sched_msg_lock(&q->guc->sched);
> +		if (q->guc->suspend_pending) {
> +			set_exec_queue_suspended(q);
> +			suspend_fence_signal(q);
> +		}
> +		xe_sched_msg_unlock(&q->guc->sched);
>  	}
>  }
>  
> @@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  {
>  	trace_xe_exec_queue_kill(q);
>  	set_exec_queue_killed(q);
> +	xe_sched_msg_lock(&q->guc->sched);
>  	__suspend_fence_signal(q);
> +	xe_sched_msg_unlock(&q->guc->sched);
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
>  
> @@ -2392,11 +2398,15 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
>  	 */
>  	if (xe_exec_queue_is_multi_queue(q)) {
>  		set_exec_queue_group_banned(q);
> +		xe_sched_msg_lock(&q->guc->sched);
>  		__suspend_fence_signal(q);
> +		xe_sched_msg_unlock(&q->guc->sched);
>  		xe_guc_exec_queue_group_trigger_cleanup(q);
>  	} else {
>  		set_exec_queue_banned(q);
> +		xe_sched_msg_lock(&q->guc->sched);
>  		__suspend_fence_signal(q);
> +		xe_sched_msg_unlock(&q->guc->sched);
>  		xe_guc_exec_queue_trigger_cleanup(q);
>  	}
>  }
> @@ -2614,10 +2624,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>  		if (exec_queue_destroyed(q))
>  			do_destroy = true;
>  	}
> +	xe_sched_msg_lock(sched);
>  	if (q->guc->suspend_pending) {
>  		set_exec_queue_suspended(q);
>  		suspend_fence_signal(q);
>  	}
> +	xe_sched_msg_unlock(sched);
>  	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
>  		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
>  		   EXEC_QUEUE_STATE_SUSPENDED,
> @@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  		smp_wmb();
>  		wake_up_all(&guc->ct.wq);
>  	} else {
> +		bool was_pending;
> +
>  		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>  		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>  
> -		if (q->guc->suspend_pending) {
> +		xe_sched_msg_lock(&q->guc->sched);
> +		was_pending = q->guc->suspend_pending;
> +		if (was_pending) {
>  			clear_exec_queue_pending_disable(q);
>  			suspend_fence_signal(q);
> -		} else {
> +		}
> +		xe_sched_msg_unlock(&q->guc->sched);
> +
> +		if (!was_pending) {
>  			if (exec_queue_banned(q)) {
>  				smp_wmb();
>  				wake_up_all(&guc->ct.wq);
> -- 
> 2.53.0
> 
