Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990F0C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 21:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0DC10ED00;
	Tue, 18 Aug 2026 21:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7Ts/z5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA1F10ECD9
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787087169; x=1818623169;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DbCzuFBKfwyK3tWsJUkZ4VhwxNPnDVAWJepJ0NeVfAU=;
 b=k7Ts/z5OBi+HiEGxbMK6aH9R7R9rB8itsgIUFkz22fQV5cBW13MsNJuH
 YUdEmB2bizV5Q70+OU0byjqqjikPpi3D7Dfwm28VlCni4bM/3lmt4FUgC
 cRLIXZ4Aqa5J2EB8rf7jcwEhkj/Kr64lfrMOh1AkhaHQy3gTWmP0SVmsA
 j2mgl26Pli36gS/xLInf2MR5rkUR+EHOYvf7rYJtxyn2Q16bt9w1i+hUi
 5L4M8TnDm1dVbU4BdGBTHRIPFhp+O9Qy01+U0cq6DnEwnc4G4WVSCEN5l
 in5hBy++/SF8/NzzA9XOCQZMAxuuCORdZTuBZkeEUNgZW1GQ50bpQ9iFe g==;
X-CSE-ConnectionGUID: 4cQPun6ERfiN/jTkz49QKQ==
X-CSE-MsgGUID: Cn8dMvhmRQ+073HTWp/A/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90107615"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="90107615"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 14:06:08 -0700
X-CSE-ConnectionGUID: ogEOWRLXTNGdEeB5Ns1g/Q==
X-CSE-MsgGUID: k/yeJX+KS++48w/51ueRUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="261592519"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 14:06:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 14:06:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 14:06:07 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 14:06:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgRW+M1+/INMsmgL84YBX4ngTnH0ofAyaCZ1MkTh8Fs+6eQv3zz0PVfDrGg6jJZSJjwTFODwF2pDIeSbtFfzRukJtDg4BZtYlN5vX364FmAJJGqD3ktQbyIk4+MOcB5n5NgKt7Oix9v7PbxOME2ApyiVqGLcbwpPfRSRYOAWawxFp0udmDDadEuSFtesOsq4m0osNHnAMSkSISswVsGwL9WfpmPc6RdXZ/iPtGhmOS6FskpDhgTQUfg4j3lC2igkIUYEQpib9w2BLuQTEIhIiauGK4KC9P3eZaQwp6nju5JwGkDUIB8a0he7nMc+xoPYujvrXK/9+su3DkoZo1ezjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjBEiNJOT5M56EK0LQrn7kXfOiJt2a4YFDyErtHTSPE=;
 b=E/m55S3mHPqaY6drb/RmF0ysvnizMKAPFhF/LiJJfEV8mBaFYpSC4Zl/oSxds55oS52UKuwYPUIHbAuTJo0kdzpN/OS4QKnEpxoswhD7jcM0+nuqE/hKvQNuYZn/+HgJKrQ93WfLoEUQMXaDCXJS/QLNX7fPafovXDZ0WJ1+yeLRYnIrJRRRms51BnTUw8B5Hr225lvfcMIBE68EnVmuWzXyNDEcLtmlKy+YbPDZTYh68wSH5OV7HZnEXaYFBaHPJXrRd3g6hET8eKLtMqhZMly02v3yxzcxtVytWg5T7FOmobsKXlCpevikQTa93axmWZDK6WXy4zNSCOzRJOlO/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB925731.namprd11.prod.outlook.com (2603:10b6:806:530::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 21:06:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 21:06:03 +0000
Date: Tue, 18 Aug 2026 14:06:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
Message-ID: <aoTJOSrzjx1tiF9d@gsse-cloud1.jf.intel.com>
References: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
 <aoTGO2iyIgHK-QMd@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aoTGO2iyIgHK-QMd@nvishwa1-desk>
X-ClientProxiedBy: SJ0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB925731:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b982442-c7e8-4776-2f2b-08defd6c8373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|4143699003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: cXz7GxRGu+e4U7FIkSciegyvCHC4IEmftpi3BLTDzN8d+ROitvrUWz8w4WxEO+pBk/FizJ/A+lhW6ZUF4GG1eu0tifOdxYdtCypFOBYhpEzVnu2hmRrpZ/az0Bf7NkmPx7gGWxM1hxyFogKreNoNPQmpB0CWmqgJsxe4rM21I191LheT1+U2rSfPuXTHkEG8OEJwBWnxisYHU03hSfZjzi2tU/0XYIBRLRdoak4dM2L6cLRvww1HA6lY195NB+OLxHlhPrRY8lUYJ0EQk9fAPlXUbJe2i1DOzOP1TS4m5lfA8VhZXQr6QhRbo0yBnUDu2pn2ka62dSsd9KJ5ifyZ2XZEZgXQhX4gk2+zgg1v+X0XhvEbSly9raL5RomDVy3QUaKFG+TiBP2G9doqpRZh3J/XSzQBV1+3lJVCWI72DI4g7NMBozA4m37+/Uo8cMUq+KJTNahfZfCqK+W5wyAgfVcMiipatB29L1Y82Az/plHPiCGkwI/ZBFYY43hk1zrGrCPRT2TLGwZJIGjriM2PeR0Of83/JzOwpVXTel+28lbtZQ7d9rmuA6oL8GIW3NxKakjVxg/tU08QPZgU5h9Unwk0f+HoCNZrsWAOh+/j+YzG9a1OmLO5B/U5Bq2zF4q4L1s92F8wngPsR5vDMH2S0IFMIGlgFhCBUKhRFGFSEUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SALKg7uMjvoJHB0gzO91Iuibo0CR7XGcpyj23Dl+pimrTuZKI9J3VMggRity?=
 =?us-ascii?Q?Eve5k5HElNIGim+PKrGLYJx7A+dg2LlHFPyvdheOnZasWzb9ANfyNmAPmyY/?=
 =?us-ascii?Q?PUiBpWfBdqjQueqYTva3ypHPlUCU+QbsF0zKap7iN84eFMLRDnVgQIKXhhNf?=
 =?us-ascii?Q?QH1/X3xwP7NEA0pUDg7dDvjahbg3NehT6ej4DcGh4MIzn2/07BnNE3cO0tYv?=
 =?us-ascii?Q?IuGtJgp+HR3HmBaJcgMIRR0KOCCjskRH+oTcStcuKcHwqJ7be+Au0TqxjXOq?=
 =?us-ascii?Q?+PfaiWOIazJ0e3cX948dLVVxD/W9kQeYeHUoKQ8nIGoVOIqaeYfbZDHcXAWw?=
 =?us-ascii?Q?2hTeG7CEA7qaJmlbV9Ig20UjnaGZB+vW7lhu2yFbKKlhuBrbfkRa9Zd9GY8Y?=
 =?us-ascii?Q?/BT71/gTtAZFYJFkR1R+zdFO4ThU8W9ukcCGzW1sLtRqnwo7of7Lif7UEAok?=
 =?us-ascii?Q?h8K6h1OhFpI6XI119IosYc+0UKQ7Y1Yg9rox8ZyJ7QQKnBbnzx3LWIwISt5O?=
 =?us-ascii?Q?bsc1uRFUxv7xfkZkOXy4wq1UdOUU5+sHuCipVtSJbWBGICkPiNbsjyQgGMSu?=
 =?us-ascii?Q?s16R6nlELNDcEvLO+2BTEgQHjs9CCAqOPLn/n4kV1vlBWy1v1kCKztTQkSGc?=
 =?us-ascii?Q?nhkdbAPQUO4mvJXIsmx40yugSBvoe/GCkuQnxUdlXNBzIwj6k/yHSOKz3tjX?=
 =?us-ascii?Q?Tl2RimH4VoAbW0QRM5z9cXxvqBlAZwCXz9RvrecagmE3xy2jbYSM6YQLBkYw?=
 =?us-ascii?Q?/DWyexBuFLvyAqEphHpg4zn4xaowsH/mEPzshXoRl0r9EKv0ZF36onbg8Q/G?=
 =?us-ascii?Q?r1Dmzc2Jdg468MtFgJN9DmCz1uE4E/R2TMzEHJTXPietYtyDQgE3ziXFJIhh?=
 =?us-ascii?Q?kv4IzOq6mk7B5lsXpDlPJJnrIjAJXRx2p8R7uq+t3lLwR/Qy94jVPiLDju/G?=
 =?us-ascii?Q?TOX3dIcxCi3YqdwZKilHSZIzdwHYhoqDzh/E+yXXrZot2Vk03JIH+wO5cYOB?=
 =?us-ascii?Q?XlFOA7aoHbBWsQmT3/1PhCZiLwD2BiEf4E5DHQVSgk70wNpUt+qxIR9VjKgK?=
 =?us-ascii?Q?M0isgdtmKk7nHaVgCp1HzsEKASCGfArZhEiay7CDgZ2ArwZX79mUgzxEVR17?=
 =?us-ascii?Q?OB2pCEkEzr5Y+MWvRy+OzDf8RGYZNbkggH0ViD9HiXIr9KX/9ySQEBL+5j/V?=
 =?us-ascii?Q?uCH7q5xuP7ATibj6DGrOgZEdmE0TH7bOAa6pKsfUv29tGouwLk4XwjwCr2qR?=
 =?us-ascii?Q?wshWjrAZ2vQjcygF/q6pLyawvpx6S7QFN+JpB/2i8gCfEqWWar2Mp32OgcGD?=
 =?us-ascii?Q?WFUJ/r7AWf5Q3q4RJMoZwfJcxctxoisj0bQYmISY9Xil9tTeeXoAEEHQcMMR?=
 =?us-ascii?Q?z6lYAK/EwBkmv1wsyJ8L82qOT5LCNm7h4ba8qJ4B+XVt1shtiapItro3C+IM?=
 =?us-ascii?Q?CmExtr2psW7oGkDwlt5CKtRpuk4t2wqT/SWHPGdka8hxJL7b77QVxtLFUGZX?=
 =?us-ascii?Q?aJzEq0fZhf5oO9+BGjoWJXCKtfSZuy5MxwSpIiyxpwQRCaJqFgMbs5OhJM8l?=
 =?us-ascii?Q?oWq/nECgtz4VHXiQy4fWiADw/NrJI0Os+bIP1IgLp1ktA2jia5LpuMCuZerR?=
 =?us-ascii?Q?i5K6JAEUA1EYsSjqw2/wwxFefUy1tCMPRedoLePrhgjvdROrFTQSRTONrVll?=
 =?us-ascii?Q?WJFtuZXbiHx/DW0bJPojT57eLoAKGHcYMEWJ1F+FnvgE9z1NsgusZg+aJxQ5?=
 =?us-ascii?Q?WwRoMhoyWi//fn3mqcamWwpV3LRUSmg=3D?=
X-Exchange-RoutingPolicyChecked: C3EfbxcYwLSk5myf4yJhFW+6qXiLhBTPWTLzThJuMRRHMolboJDUljWT3COLPhNbD6WTyD2mUR8UGsAx8tTkBcVuztNhGd43mEw03kc7X4Qq/VBW02pvCPzzANDXG+DZUJFR1JUY1Om46pJznDw9VJUYLqW+STaJz1O0i7Tc+tl7oQwKM1atNkVa31B7mLmYAQV64j52Cvo5jhhmeIsM75xaWhUYdGMJh2wb8aIKgGLVqn4phl8gXkFYPOCtncjU1I/AvO9znF8VstoqG6CQj2bAxTxJV6fUImdM+ADn4BhjmAw0WCC/SgkVp2HVp5YFIVwkUJl3mNJB6qGJ0G9fZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b982442-c7e8-4776-2f2b-08defd6c8373
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 21:06:03.8168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vf3gkTnlIBa2akK267x5CBuXoi9CoQTXXKawR9mSv3P5jty6LmAL5AHYi8dKuv804fOzBuS3WelhaHqYp/7oJQ==
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

On Tue, Aug 18, 2026 at 01:53:15PM -0700, Niranjana Vishwanathapura wrote:
> On Wed, Aug 19, 2026 at 02:38:39AM +0800, Jagmeet Randhawa wrote:
> > q->guc->suspend_pending is accessed without any common lock.
> > __suspend_fence_signal(), called from guc_exec_queue_kill() and the
> > suspend-timeout ban path, clears the flag asynchronously. Meanwhile
> > handle_sched_done(), guc_exec_queue_stop() and
> > __guc_exec_queue_process_msg_suspend() check the flag and then call
> > suspend_fence_signal(), which asserts that it is still set.
> > 
> > As the check and suspend_fence_signal() are not atomic, the clear can
> > land in between and trip the xe_gt_assert(q->guc->suspend_pending).
> > 
> > The flag is already set and read under the per-queue msg_lock
> > (xe_sched_msg_lock()) on the suspend and resume paths. Extend that same
> > lock to the clear paths (kill and ban) and to the three check-then-act
> > sites so the check and the signal are atomic with respect to the clear.
> > In __guc_exec_queue_process_msg_suspend() only the non-sleeping branch is
> > wrapped, since the other branch waits. In handle_sched_done() the flag is
> > snapshotted under the lock and deregister_exec_queue() is kept outside it.
> > 
> > v2: Document that sched->msg_lock also protects
> >    guc->suspend_pending, which indicates a suspend message is in
> >    flight, in addition to the sched->msgs list (Niranjana)
> > 
> > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> 
> LGTM
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 

So my latest reply, I don't think patch is needed in its current form.

Matt

> > ---
> > drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +++-
> > drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +++-
> > drivers/gpu/drm/xe/xe_guc_submit.c           | 29 ++++++++++++++++----
> > 3 files changed, 32 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > index 63d9bf92583c..78ef2e8ded4f 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> > @@ -47,7 +47,10 @@ struct xe_gpu_scheduler {
> > 	const struct xe_sched_backend_ops	*ops;
> > 	/** @msgs: list of messages to be processed in @work_process_msg */
> > 	struct list_head			msgs;
> > -	/** @msg_lock: Message lock */
> > +	/**
> > +	 * @msg_lock: Protects @msgs and guc->suspend_pending (indicates a
> > +	 * suspend message is in flight) of exec queues on this scheduler.
> > +	 */
> > 	spinlock_t				msg_lock;
> > 	/** @work_process_msg: processes messages */
> > 	struct work_struct		work_process_msg;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > index d27826b36649..74b711abe257 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > @@ -52,7 +52,10 @@ struct xe_guc_exec_queue {
> > 	u16 id;
> > 	/** @suspend_wait: wait queue used to wait on pending suspends */
> > 	wait_queue_head_t suspend_wait;
> > -	/** @suspend_pending: a suspend of the exec_queue is pending */
> > +	/**
> > +	 * @suspend_pending: a suspend of the exec_queue is pending.
> > +	 * Protected by @sched.msg_lock.
> > +	 */
> > 	bool suspend_pending;
> > 	/**
> > 	 * @suspend_count: Reference count of active suspend requests. The
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 9036f89dff7d..c565c1d32d3a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1928,9 +1928,13 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> > 			set_exec_queue_suspended(q);
> > 			disable_scheduling(q, false);
> > 		}
> > -	} else if (q->guc->suspend_pending) {
> > -		set_exec_queue_suspended(q);
> > -		suspend_fence_signal(q);
> > +	} else {
> > +		xe_sched_msg_lock(&q->guc->sched);
> > +		if (q->guc->suspend_pending) {
> > +			set_exec_queue_suspended(q);
> > +			suspend_fence_signal(q);
> > +		}
> > +		xe_sched_msg_unlock(&q->guc->sched);
> > 	}
> > }
> > 
> > @@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> > {
> > 	trace_xe_exec_queue_kill(q);
> > 	set_exec_queue_killed(q);
> > +	xe_sched_msg_lock(&q->guc->sched);
> > 	__suspend_fence_signal(q);
> > +	xe_sched_msg_unlock(&q->guc->sched);
> > 	xe_guc_exec_queue_trigger_cleanup(q);
> > }
> > 
> > @@ -2392,11 +2398,15 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
> > 	 */
> > 	if (xe_exec_queue_is_multi_queue(q)) {
> > 		set_exec_queue_group_banned(q);
> > +		xe_sched_msg_lock(&q->guc->sched);
> > 		__suspend_fence_signal(q);
> > +		xe_sched_msg_unlock(&q->guc->sched);
> > 		xe_guc_exec_queue_group_trigger_cleanup(q);
> > 	} else {
> > 		set_exec_queue_banned(q);
> > +		xe_sched_msg_lock(&q->guc->sched);
> > 		__suspend_fence_signal(q);
> > +		xe_sched_msg_unlock(&q->guc->sched);
> > 		xe_guc_exec_queue_trigger_cleanup(q);
> > 	}
> > }
> > @@ -2614,10 +2624,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > 		if (exec_queue_destroyed(q))
> > 			do_destroy = true;
> > 	}
> > +	xe_sched_msg_lock(sched);
> > 	if (q->guc->suspend_pending) {
> > 		set_exec_queue_suspended(q);
> > 		suspend_fence_signal(q);
> > 	}
> > +	xe_sched_msg_unlock(sched);
> > 	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
> > 		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
> > 		   EXEC_QUEUE_STATE_SUSPENDED,
> > @@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > 		smp_wmb();
> > 		wake_up_all(&guc->ct.wq);
> > 	} else {
> > +		bool was_pending;
> > +
> > 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> > 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
> > 
> > -		if (q->guc->suspend_pending) {
> > +		xe_sched_msg_lock(&q->guc->sched);
> > +		was_pending = q->guc->suspend_pending;
> > +		if (was_pending) {
> > 			clear_exec_queue_pending_disable(q);
> > 			suspend_fence_signal(q);
> > -		} else {
> > +		}
> > +		xe_sched_msg_unlock(&q->guc->sched);
> > +
> > +		if (!was_pending) {
> > 			if (exec_queue_banned(q)) {
> > 				smp_wmb();
> > 				wake_up_all(&guc->ct.wq);
> > -- 
> > 2.53.0
> > 
