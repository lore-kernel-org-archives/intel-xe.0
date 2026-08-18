Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A33FC5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 23:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BDE10E089;
	Tue, 18 Aug 2026 23:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTg93Ret";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37BA10E089
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 23:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787095649; x=1818631649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tv+dNQW0L6/YGZZq4nctQjCejlKc8XyrNdVpsGmoKC0=;
 b=WTg93RetRdd+gqcZXw+oSAwl1F2XlW5R/bEbL9AeEYpfZCvTlB/fQA3K
 Nhg+hWLGJGiwtVBYTR9ewnawyFur0WkBjs7OHH18MI2s+l1RYdqTRMbA2
 T4uPSKJ3mzc54BK8TtTTh0ORNlSbUF4aMDeDjMoxLN/cDovKbT1qDWt1u
 L6NtmK7Q7RI2HQOdBocwODfC3zqSGYYZbOEvGUdPD+IT2Ki9xgCxmc8sn
 SAx9djT1JhEUVeBZVZxYehCDaUCWsYmFs4jkFGa+/GZfKCiAeEXwaxDy0
 fOTvRjjBkqMrJSbMeWqbKsEI4CEepN/ihzLAPomvCBHJgax5js2PzVLD3 Q==;
X-CSE-ConnectionGUID: Bx8lpy74T9G0GgD6hXY7Ew==
X-CSE-MsgGUID: 3T3uKWt9TMWQDakDgHRJ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="99123861"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="99123861"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 16:27:29 -0700
X-CSE-ConnectionGUID: Rahj+jCoRZqY4oB0hk8Erg==
X-CSE-MsgGUID: J+mJmyfqRrirpt/LLnMfvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="288879078"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 16:27:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 16:27:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 16:27:27 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.64)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 16:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2qXV4Lr8lXQRzLNrMKJMxSVr/AwdJMYk8fBxS40FVw1IIowkmHr0T8/mVJ6UpqXO+IbHufjaiNcIV3C85hGBk5iErsF72a0m9ng+rFHG1i/hxBdxVRnRIrFUGVJHuBdndQzCQa3zA6mUHqI0VJBP2sMeSlC7cl/1h7qD7TVMA5aWWAv/hGXln0Tev/MNRrmiyCel+cTCs5q3NfziU/jYtomDxabAMoMakeU9RG/Zyfr6MaaF/wS/atWqhJqyV62mFvuv/Sm+QMjOy/JAAryZvB61NHXyprGRRJd0ggUBuU3eMdoQG7YnQVr1aUNnaRMcbhiAe+bsowCfzaCaXUnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hUC0e7oPy5U9FzhvaXwujRomdNXOTR66+lo4GVP03Q=;
 b=xjSfah6aLkbkDkixEjaUuybj9UNGV0cVzLziI07x9kww4uSamwstARNGpqEEB8Cl+1/G1k9haxmhOPSnjRsJ/f7yUsXIg28O83WIvdTyyZ+chX0S4P2ouEo0uY5sz+XUsqEic8H38FCXMkfr/N+MxqabEnLyzhT/3yx09ALKfQoTU3L3S4EJTJ/ZzufYbHNpGhQWmJxpS9gDR2EVhpD5WQ2UCcFxoZT4ZN9SU0RjPi1JNOLWx1Hch0MPXDorWlbooKh7lYMqnB58763uGRvAiav01DfqQm3KwRubpJuX9rq69mwGsVJgs08hivEJ+8QRjZUxeeaLiwhPspr8JbZm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA1PR11MB6265.namprd11.prod.outlook.com (2603:10b6:208:3e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 23:27:18 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0315.014; Tue, 18 Aug 2026
 23:27:18 +0000
Date: Tue, 18 Aug 2026 16:27:14 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
Message-ID: <aoTqUiIq8DMoT1dK@nvishwa1-desk>
References: <20260818183838.273486-2-jagmeet.randhawa@intel.com>
 <aoTJBly70vnRnrwK@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aoTJBly70vnRnrwK@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA1PR11MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: c5cd2b3e-e0ee-42b7-7b18-08defd803e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|10067099003|6133799003|22082099003|18002099003|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info: DZm39penarp1SFrLoWq4/U2lRPzK4kI4k1CT5iLPd1mEieaNcAi67As3eq8GlsCYrwtgL+XtW+UxKf1T4YdmL7ErEriyAFBixs6vVh3WkG5ZlPajiV0DeWFPKBpnd+hIaLzB4EZwV42XWXu9tbjYqTeP0ZI4ZNMzaXXB18YyMxaMQ0Nngfd6kO+LK07uW60f+92+WZVk4d+NlTNrNiiKdTWN7b+k5H+fObe5oFIfLraVL1hTcASii6a7Y4fYA6Q60nqDrdnMp1yLjIhoGh3iH+pssJ3a3BbQeZmDefQBumgbH+/gqis3uzoVGX2/3iXgVLGmx9rqajMmByHl4E7YYlXPl3nfCHyF6ZUNpgG+39eJehMczEbzIuje4/Nf2L4N6ljanhovqp91vJHp7dcSnog79dewdgmm0MpOcl/IsymfvNNDYPfumtNuLro0XXYCCxzFQjYqCOWtWzd2zAnEYJwJip09urozRLueXvy2iZQKNblzdk7E+leVlsTFFTfPSLD1PVNjqNRW2HYUWadvwKt0dAA/Jp7fYFpK3ytO0yMBv+oegO9vlCFEirDg2MWPx4Uyd9q0qAr8qK6ZHjwPrhP0GIaKjDn5RTlDT8WGAkb4d/TgDAbpKvCHr/ThIOC2xt0YaSReKUORTHJ/BM1Xu2Vtgw5IHMVPCytEI4Y3FZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KNC4SOmH+oFcvoM2OR2f4ZmBdACxS8oHQphBLzwWX1n5iiCbkoFAGaMYNhXH?=
 =?us-ascii?Q?K+PCP9r6ZN8pl5i8n0LSUYzQjHcepKAK3/bgcC4TT5YYuGv0Pe8Ippbktm+L?=
 =?us-ascii?Q?wzimIjLv/Xt+3PhTdM/MSuCsRC1C383jX4VEOmj+NvAh1YKSdk7qmUZf1VL+?=
 =?us-ascii?Q?vaoJkez+c9brj36N+1EBdqcqoWKzG1WnT+9B4s1kIBZPabs1eaVtJ+LOcE1k?=
 =?us-ascii?Q?NlyYJEYhm7i8jBt/aRu5LbpmVePQyqAFiyVxMUI/epQj+khB4qLYJxuv/rrM?=
 =?us-ascii?Q?8Euodg3cR3tU5Jf7LOTf7K2vSGjA1f+42cZjMhsCquaUH7kkeKFGKgtdBnEn?=
 =?us-ascii?Q?ObA2STL3nCsimY7yk9++9YmTbH2cmoQV63NcpaJXShWioLTn0FX5ADvviJcD?=
 =?us-ascii?Q?PuwN0dx5SCE1CETdaDPNlRsRLW8UHWtfbGT79yMO4u5euP+zFFXx85JQvdXD?=
 =?us-ascii?Q?C1jhmaYoJx0di+b5D3m+IQGoWe1fXkv5GunOtQ05kVP09aD85XUp24Xvz6UE?=
 =?us-ascii?Q?wMb5kdWtcy2I1kNc1NUy0kJtfVNFRvvvWPkCk7FHP8PseEDojtaAvH1usmiW?=
 =?us-ascii?Q?Uihm4wHCUlXn56dliYT11j9S2KPj2jSxEs2cklU+7+95+jZX/EzyXrmmd9De?=
 =?us-ascii?Q?eIIJ1mNR3r6uBtuUUmGwc5m3sl/Xh8W6vMCAHRwZTvutJwgQltlbAFk0vM8B?=
 =?us-ascii?Q?gvBq7pOnOUgKtJo4bnygxPnSpsved3OpAmGvZjGgSIe1csX40zgcpehJFYow?=
 =?us-ascii?Q?3sDHsJQLOW5c0ds8tnYalj7/m+vDRNCtsS6CegMeb3LZmZbcBBHUGk816Go7?=
 =?us-ascii?Q?dkjo4Z0SDzJZ1CS6DU9UTvjeiSz93LCgTGSQSS6ZcBbu2v7TBaZkvJa7h6dN?=
 =?us-ascii?Q?lp6D3u9b1NH64ru3fIeBo0kqnkOBdkStwDDDLGtk4ypnpSGuv1EFmTKUeNlc?=
 =?us-ascii?Q?4V7UKoTmMWA3daYPkCqqBFW6/zfrjtixr0j2PfMWEcbxwlyDhVpwXuKVvcs+?=
 =?us-ascii?Q?0/hyfTDHeTrMvcoM9dh/VvbE6yfstL9r1hWtuMuVBG5TzFLXzI5MqWzzudv9?=
 =?us-ascii?Q?C7YJyQpSKjCboUxbDwVvEnYlc7LGM4ZzcZTv6PU2sKJsqBGks4IstmIKdi7t?=
 =?us-ascii?Q?JyJexiPiM6KeSUF66O1yU8WQach3qmIhAfnNt9T/enlyE19rFP5PvU+bVK/B?=
 =?us-ascii?Q?cxkm5xw+6EIhFhXQhiRqIo6YJuE2IR81NgY1r55JfV+KcfhyHyWNk4TDVMxQ?=
 =?us-ascii?Q?pJR6V/LRrGfuy4sdVc5xnYTvKHqX6vdaB01NI5Kuwdijkbr57rBzN5kIUR1G?=
 =?us-ascii?Q?KhLXSmQWRlHJfPXs9rDK58CmUKB1b/7jAiy7/kH+/yT24DhWcuGQyBmkhbfy?=
 =?us-ascii?Q?euvTxCA6E5jJbNYTburhZ1JyGKquVcQYCUyTCy0Ou7Kee4CbhSl8lIZa8hMI?=
 =?us-ascii?Q?wOLd17E+EQlaJoH+hncKB/umlaV7nIlKM9NG9/lWnVFAEiMHI54yGQ+8w00h?=
 =?us-ascii?Q?cmZv5LJThTUnqNuDSBu9RSjcgUPZSvBHqiOfhQI342Ri/YFwJaoUn/UaUrEs?=
 =?us-ascii?Q?yV9loCarqNrnIbuT1vWa6NZ/HQr/FHrVpzTPmEsVNZb9o792EcVnQDYOYLJu?=
 =?us-ascii?Q?mSmWsQCjZzufaiZv1Abf4VYDMe+8hM4VXYray+3c3Tg7fsk7o650h+HRdU2Z?=
 =?us-ascii?Q?zGQ51IcHVho+sAoOQw4Yr8+SHF4MwEYDzdy7xx2aJZPrX21kfWc2wt0tXF+d?=
 =?us-ascii?Q?FQ0TOGYoS7DuEA/3n11/CCEly9AZ1raP5lPzybrAxxSqkCuBNbuf?=
X-Exchange-RoutingPolicyChecked: JaQ2Kx5HMnkRrdTiiFoJvotDQ/KCnM1rkLkIYk3Pa1x7BT3weey/KUUlH/i3dfUXfTqxh6PTG/TYkfz+dqOyp8HKX1nudx6u3JsA33iXTcjwNA+85Oy7E5YTYVApEmXyxiRmL9KowyppBgicm28X6oSlWX+eAdfg5Wy9Vb9oiY59bsaXhLXb0B//Jca75RlKHc9FzPm9fI/BCeeg0DqRee9FwWn4psMEnZ3w/MRZsJkLhhG+ulRjxnHi93WGTgZdiNHwRlds4M1lsulsLKpv782esBIEolCre9a6algyNFDcOktvHBc6EJ+cnAXwvXlaqYYwG1zf4lZtVO4Tk6bOiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5cd2b3e-e0ee-42b7-7b18-08defd803e5b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 23:27:18.0247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/N+2w8pOZ+CXc1s7KX9PvAo8BKpP8CIYRmBzY1daT/sYjDj0MdkBJV30n5HWKq3dTe1/h+U40IkW1kVUYS5Be34YuICJMnYJzMsEOHTZNgnxBqPqSgCgcKJNF4uvJds
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6265
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

On Tue, Aug 18, 2026 at 02:05:10PM -0700, Matthew Brost wrote:
>On Wed, Aug 19, 2026 at 02:38:39AM +0800, Jagmeet Randhawa wrote:
>
>This is designed to be lockless.
>
>> q->guc->suspend_pending is accessed without any common lock.
>> __suspend_fence_signal(), called from guc_exec_queue_kill() and the
>
>This is actually the problem. __suspend_fence_signal shouldn't be called
>from guc_exec_queue_kill(). This can prematurely signal a suspend fence
>while the hardware is still executing.
>
>__suspend_fence_signal should be called in two possible places:
>
>- Naturally in G2H handler (handle_sched_done)
>- Or in global event that takes down the GuC firmware
>  (guc_exec_queue_stop)
>
>With that, a lock isn't need because the state machine / firmware
>interaction ensures everything is race free.
>
>So I think the solution is ensure __suspend_fence_signal is called in
>the correct places rather than adding protection via a lock.
>

Matt,

I think it is probably not as trivial as dropping __suspend_fence_signal()
from guc_exec_queue_kill() for following reasons.

1. __suspend_fence_signal() is also called from
    guc_exec_queue_suspend_timeout_ban() if suspend_wait times out.

2. Calling __suspend_fence_signal() wakes up any suspend_wait(),
    which otherwise will have to wait 5 seconds before timing out.
    If in guc_exec_queue_kill(), if we just try to wake up suspend_wait,
    without clearing suspend_pending, then a resume() might run before
    TDR kicks in and hits the !suspend_pending assert.

3. Even if we drop __suspend_pending_signal() from guc_exec_queue_kill()
    and guc_exec_queue_suspend_timeout_ban(), we still have
    handle_sched_done() and guc_exec_queue_stop() which can race against
    each other in accessing suspend_pending and clearing it.

So, probably this locking extention patch here might be simpler and
effective.

Niranjana

>Matt
>
>> suspend-timeout ban path, clears the flag asynchronously. Meanwhile
>> handle_sched_done(), guc_exec_queue_stop() and
>> __guc_exec_queue_process_msg_suspend() check the flag and then call
>> suspend_fence_signal(), which asserts that it is still set.
>>
>> As the check and suspend_fence_signal() are not atomic, the clear can
>> land in between and trip the xe_gt_assert(q->guc->suspend_pending).
>>
>> The flag is already set and read under the per-queue msg_lock
>> (xe_sched_msg_lock()) on the suspend and resume paths. Extend that same
>> lock to the clear paths (kill and ban) and to the three check-then-act
>> sites so the check and the signal are atomic with respect to the clear.
>> In __guc_exec_queue_process_msg_suspend() only the non-sleeping branch is
>> wrapped, since the other branch waits. In handle_sched_done() the flag is
>> snapshotted under the lock and deregister_exec_queue() is kept outside it.
>>
>> v2: Document that sched->msg_lock also protects
>>     guc->suspend_pending, which indicates a suspend message is in
>>     flight, in addition to the sched->msgs list (Niranjana)
>>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +++-
>>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +++-
>>  drivers/gpu/drm/xe/xe_guc_submit.c           | 29 ++++++++++++++++----
>>  3 files changed, 32 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>> index 63d9bf92583c..78ef2e8ded4f 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>> @@ -47,7 +47,10 @@ struct xe_gpu_scheduler {
>>  	const struct xe_sched_backend_ops	*ops;
>>  	/** @msgs: list of messages to be processed in @work_process_msg */
>>  	struct list_head			msgs;
>> -	/** @msg_lock: Message lock */
>> +	/**
>> +	 * @msg_lock: Protects @msgs and guc->suspend_pending (indicates a
>> +	 * suspend message is in flight) of exec queues on this scheduler.
>> +	 */
>>  	spinlock_t				msg_lock;
>>  	/** @work_process_msg: processes messages */
>>  	struct work_struct		work_process_msg;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> index d27826b36649..74b711abe257 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>> @@ -52,7 +52,10 @@ struct xe_guc_exec_queue {
>>  	u16 id;
>>  	/** @suspend_wait: wait queue used to wait on pending suspends */
>>  	wait_queue_head_t suspend_wait;
>> -	/** @suspend_pending: a suspend of the exec_queue is pending */
>> +	/**
>> +	 * @suspend_pending: a suspend of the exec_queue is pending.
>> +	 * Protected by @sched.msg_lock.
>> +	 */
>>  	bool suspend_pending;
>>  	/**
>>  	 * @suspend_count: Reference count of active suspend requests. The
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 9036f89dff7d..c565c1d32d3a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1928,9 +1928,13 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>>  			set_exec_queue_suspended(q);
>>  			disable_scheduling(q, false);
>>  		}
>> -	} else if (q->guc->suspend_pending) {
>> -		set_exec_queue_suspended(q);
>> -		suspend_fence_signal(q);
>> +	} else {
>> +		xe_sched_msg_lock(&q->guc->sched);
>> +		if (q->guc->suspend_pending) {
>> +			set_exec_queue_suspended(q);
>> +			suspend_fence_signal(q);
>> +		}
>> +		xe_sched_msg_unlock(&q->guc->sched);
>>  	}
>>  }
>>
>> @@ -2130,7 +2134,9 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>>  {
>>  	trace_xe_exec_queue_kill(q);
>>  	set_exec_queue_killed(q);
>> +	xe_sched_msg_lock(&q->guc->sched);
>>  	__suspend_fence_signal(q);
>> +	xe_sched_msg_unlock(&q->guc->sched);
>>  	xe_guc_exec_queue_trigger_cleanup(q);
>>  }
>>
>> @@ -2392,11 +2398,15 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
>>  	 */
>>  	if (xe_exec_queue_is_multi_queue(q)) {
>>  		set_exec_queue_group_banned(q);
>> +		xe_sched_msg_lock(&q->guc->sched);
>>  		__suspend_fence_signal(q);
>> +		xe_sched_msg_unlock(&q->guc->sched);
>>  		xe_guc_exec_queue_group_trigger_cleanup(q);
>>  	} else {
>>  		set_exec_queue_banned(q);
>> +		xe_sched_msg_lock(&q->guc->sched);
>>  		__suspend_fence_signal(q);
>> +		xe_sched_msg_unlock(&q->guc->sched);
>>  		xe_guc_exec_queue_trigger_cleanup(q);
>>  	}
>>  }
>> @@ -2614,10 +2624,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>>  		if (exec_queue_destroyed(q))
>>  			do_destroy = true;
>>  	}
>> +	xe_sched_msg_lock(sched);
>>  	if (q->guc->suspend_pending) {
>>  		set_exec_queue_suspended(q);
>>  		suspend_fence_signal(q);
>>  	}
>> +	xe_sched_msg_unlock(sched);
>>  	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
>>  		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
>>  		   EXEC_QUEUE_STATE_SUSPENDED,
>> @@ -3222,13 +3234,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>>  		smp_wmb();
>>  		wake_up_all(&guc->ct.wq);
>>  	} else {
>> +		bool was_pending;
>> +
>>  		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>>  		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>>
>> -		if (q->guc->suspend_pending) {
>> +		xe_sched_msg_lock(&q->guc->sched);
>> +		was_pending = q->guc->suspend_pending;
>> +		if (was_pending) {
>>  			clear_exec_queue_pending_disable(q);
>>  			suspend_fence_signal(q);
>> -		} else {
>> +		}
>> +		xe_sched_msg_unlock(&q->guc->sched);
>> +
>> +		if (!was_pending) {
>>  			if (exec_queue_banned(q)) {
>>  				smp_wmb();
>>  				wake_up_all(&guc->ct.wq);
>> --
>> 2.53.0
>>
