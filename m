Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59DCC624DB
	for <intel-xe@archiver.kernel.org>; Sat,  5 Sep 2026 19:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8346610E326;
	Sat,  5 Sep 2026 19:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6fyQoPy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7340610E326
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Sep 2026 19:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788637606; x=1820173606;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4IzMHJiC2VjUxaiNjvV/7og1CbpcRbSkDXfHbIkpjcY=;
 b=P6fyQoPyLvo+OxMxmmQLBA2LPyLGEygHlTOMYmsbtfr9IJAVow0355fk
 PJ01f8PW7ufanzAD/oCmvc48jUWa/fd+g/ab0SBTDHnRp2MLaDsz92BZZ
 xYmI6mHKpAEF+HY3PcelgB2wvW/Fdrb65Yin0E4JnEgdHkwdy60dITPuc
 wkflSNbSL5FJaK6irLfy2/mU2Wml9Po1S8+98IqgNGV2o+Mjt5g40fgOb
 Ab0+6aLub/3khPVZbXtB3mw2/XFsEfD3jUwII7fNbj7zKS6TPhpDrV+VS
 tnU9PAB9bcA+k9H8ZMJFqAg5yJitswewhNS2ZCQzP09Ac8Sl2Xhb2CuZY g==;
X-CSE-ConnectionGUID: G8iwIOx6RhSGFUmIR6+dtw==
X-CSE-MsgGUID: mbyiY4a1RKGsXxcnYtN5CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="89123719"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; d="scan'208";a="89123719"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 12:46:45 -0700
X-CSE-ConnectionGUID: Hprvk1D7QMaivmschxaERQ==
X-CSE-MsgGUID: 8PYw0zqnRw2yInvs96p8uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; d="scan'208";a="265984888"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 12:46:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 12:46:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sat, 5 Sep 2026 12:46:45 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 5 Sep 2026 12:46:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnqBbfVnRPBLGYLseVce/XZq9I3Addlpi2HIRUQoj3YLUXjpotEreV3arTi39JtdzMY0NXEWzgmYhkDRvQ3yzuGtC8RoM51YF/RGELUJTkXXnmyXLr8akMm+yFcavAaQZPdrgHQDQ1TasF2nEs1U4A3qBhf4U/wvJOuXLx+ClTyWmWmh7TczqJpiyshMSpVKTa8hYsWmU2oKLemZHBH8eODOVTNQHQnci5poDmWIz+gNzTHKgGW23hgbBO+AH1MgR5KLYTog9RwT1X9KndsGmVHo8wYY15YIehGo25tnMAoN8H4gqW4jLjXPcCsuBa588vCDsBWNTDSggoK01bySTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0NXawE7il91LCfPxxHOwWMuRbCF4ihOobE1PGS3fVA=;
 b=pe6MbTZ8xNDrNrLGANXYBq3VDbVaw3GQAvgMvzE4E639+GK/JXyBrJOzgflEHNND0YRRWmaRiUSDrgqzdnDGF2X8tE6O6te+Ou+w8OfFTX3+svuPJldzvVc0iWcZZlHUQp8O1OA4duuBc+EG1u2wFcdQ/PtDGo6blZA1r/BjXv95/Lqcqz54JlJqBOy+OyST8uY+3Oo2mrDjZpzUM1Xh+4IED/iuCXSz+ewVX6QGwXGLDULYgFibRprhjufAkVmXvM0ycZkHkgjGkU+f0mjoefMQ5bXMAA7mH0dJNNm0umfvsc9gZOLqwYBZp6zf/2ykKslJWOhV6gLM9RGmCsR3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SN7PR11MB6601.namprd11.prod.outlook.com (2603:10b6:806:273::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Sat, 5 Sep
 2026 19:46:37 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%2]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 19:46:37 +0000
Date: Sat, 5 Sep 2026 12:46:34 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH, v3] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
Message-ID: <apxxmsn-0XFojodZ@nvishwa1-desk>
References: <20260902201222.30022-1-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260902201222.30022-1-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SN7PR11MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ff5f6a-0ec2-482d-5127-08df0b8665db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|22082099003|18002099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: uAhYAu9A6KpQRR/6ueg3QKupL6J3SxFY3S8htgAe9i3/AJJc0V1AQGKamX/eKn4EtPI6tn4zAvQtSSMCYbvBVhHm3iDJpJttfJeDtvy1UHvTiN6IUsfKdPlKhVw8A/FBxCvlB6EQQ1/RZBZvVoKGFQob25ehFcS8WY7o3uV2FgFFbSVqd5/S7ub9I7kG5w/ViRl6zMFFKvHOZthAQvpcyzlf7xW9vAvg8SPrcHn8j0Qt1fobIfg2Wc6Ey6phcpP1vaMeeF1djM5rgVPWyQnQhOMAWDWDveTq8dERNF0zEiR+LHX3/gBARVESemBllT+0c+lHpb8/Jg8iL0+X2dlPSkCoj5t5NaqWsIrEAlDRbcS4UOGCDjMgmCGrMZ8d85c0pNrm+A6Ruk3LLfdWHXiY+LTXPNorbgkeyqHpBiH/mPK7AbGptdtIgDrnujj+EO5h4yTnE86csTB9T6kb9QQ+LUNZMZCa18Tyjus2oWaV0935+4P6HBflD7Xj6VOjTiCx2p30MD4ktbyQjDJ5bgdC9LIr4OrmjES9kbLZLWAzBnUXaass8RPiUD+fvs2npk+Se5jVXrATqr4HobVlu92tukI6GsUH2tUVlk+NT3kBRoeyJwPXuVLXhd7WvxbeZ9jkVFIipi8DkSXnb0eKQi6vlv7QGzMg08B9koQ8bJWjv6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xhXsic9mIwW/Xynpfib88DRxi2NiBP0xtNplio4sCuyBv2OYAgSlIAwLXdWQ?=
 =?us-ascii?Q?Ci5dEIaVA1mOaB3mGXIPX9jTPJN/95SaYxHiSgLzQau7e6NUiNZkeMm4itFM?=
 =?us-ascii?Q?Sjq+5LjRmKQLSUIX7cINkBRYo+Gfkc3ERsxO8B939ZuqmHWRXOM82nxYzDXq?=
 =?us-ascii?Q?5bX/57HPViIuc9MdohNGl+81yPuEPGEzQR+PbR8193ej6xwKuIyC2NJGZaGz?=
 =?us-ascii?Q?FU2W8IiuJx4JlvBIVtRvo9fqqPA9L+7ie2UTwfvt81+r0DrkudEIOGyGUe2J?=
 =?us-ascii?Q?KE5ZSn2iF9olTwr6LpExvn6DGHyTN7p4Qi8WoNWvtTnBkGTqxpDiKOcFIIdd?=
 =?us-ascii?Q?zn9MQRbsKd8yUSTIHJNu4MAe+2n1Ij9WMzYeldPefx+K2hRJM3Rb/mqvIQQi?=
 =?us-ascii?Q?jDxsUXfDChHiJ5hDjPiSfS2hxXg3COp3j5eBMD9QOSMUOU2LFJpeSFPTE5UP?=
 =?us-ascii?Q?qcX5wO4fIfMzF8VVKgvwbkR6DKjCOwyREB8HIHyHQcHXCseIR7y8Grd/xWPP?=
 =?us-ascii?Q?WOiV1dmQicK5s+QHRPNE1uYxeOwAr4DdqaBgJfdPwRn8pwKXUy1258iDvNi5?=
 =?us-ascii?Q?5a1KHMwESGO5ElQGxpLJnPqQzde4Vzs7RDiizh1Ci5cQ/27ueaSoz43IqX7D?=
 =?us-ascii?Q?zihArq0ze+Wjl+fYtsFfTkNhYWDkMJx1HmTr/nXaNFUaiZNYvuX7B/8qlT4m?=
 =?us-ascii?Q?ntU7IVnZ3bDcnqx2jqGYfLs4InaJeP9NbALetWJ2dTsuql6QSwaKHZBEpcJE?=
 =?us-ascii?Q?2fBYNxw2DK/dAHefefL27KvGi3BcTQU3vUJKVQaC3F7L9Y+0aZJMqbcMjzB4?=
 =?us-ascii?Q?ZNlvLncJxqDoyvHc8EVZ9/qjatjTLWvPIQ/KDhxmnI2pYSEtYcftCUyZjmGb?=
 =?us-ascii?Q?lJtd5afbCi9y3hwhdChEaq/fgJRHxARQGG27QImR/kvsmQGayBBe2Iv51689?=
 =?us-ascii?Q?BrQAZbWCcTTDj+rlJfpSmKDLa2e5INruRpc6wqcc+JdDKx8L/Fd9Cj0BpkyB?=
 =?us-ascii?Q?qYL1ePMQmUXEOijEOA+jfNbR3Q9Jf0wWlXT0rdKrnf0HXd7tWpHUXlR27cNk?=
 =?us-ascii?Q?rNrjiVewyA+0MvkQQmEoZCrpxML53K97yskJWNHx+gzmoMaWtHfXYlg5teAv?=
 =?us-ascii?Q?nKphKdC474eg6HZKmSmoN7L9uBV8ZPmj+EQooCKWtPdu4J6dH4A3D7dslHoc?=
 =?us-ascii?Q?09vby8C52VPazePCXlB4UbAFL9G259wd/wZTWQY/1ix6ofqvJC2Byxoq3oOH?=
 =?us-ascii?Q?HSDIzB3NSC77b2ngnJNfDoFHTM+dyQtEpBLHEwcEa3u4cqtsET7yUlSsGDbl?=
 =?us-ascii?Q?+2IesfhToSHuRy7Y+6C84cfm8nroyObpsH0ozJi+U9bR5K8IwJJH9F2Lx5t0?=
 =?us-ascii?Q?6VsxNttag3XPA/2hUWNUWewrCg+Kr0XPKJIyPCNPpzKV6+VxlotHATs5GIZa?=
 =?us-ascii?Q?+jD5dZYQ1PUzUEVMKXKDmBLUliE3+ihd5ogCkkmRzrRMv84USbce/2XnwDXg?=
 =?us-ascii?Q?Pgy70X2hFv9ePRpBMD8S6c1LBXNYe9UdtMKhoazMK1W2Isn0X44GcTboxbTV?=
 =?us-ascii?Q?tuXP7fcwsJ5TJYNQ/sAujW36r3hhJ/ef7LaVkUEVRkGx3GtecvN2RyJ7i/pK?=
 =?us-ascii?Q?MJlVMzpOxxzYV2EVYT+I55bLoiqWw7iGVEdx7rCHXEPEmCEXKb/UccgT/3Cj?=
 =?us-ascii?Q?TZQCxlNnZEHT4EmeHF9dvXIpnhfrQ7azv19lpBe3W7eGkP7tCii/q4nOLeZu?=
 =?us-ascii?Q?u7MvZNtTXwvgPqnqv70+6WZHDFtlzTO6UaJjuveyC+ziXms1nqFv?=
X-Exchange-RoutingPolicyChecked: JSP09tgMe2WX6Lst2FSfWCXa9ZgEPrOH/oZbJ6pztPJ65dGso0IGE/fAnJ2TflNc93sRnA+ksOsjL3NFOOCz7Loc/vaEimwJ3xNKOhxufPAai9NlpgsQnjoDYEn0ctCi9JjrwNNLBUYCmaPhiFMYUSmXgJhqHImKcRbyfco0WNhsW0rcOFKHl4VCoecrrpnCpt2NTFj3OzjKAJPBJkv2UsJ0AmcQTJEoEJ7rt+kvG52WsASmegQHEfiLsyjbjsHPIBTjrfFGRpQc7Qs8oIx2LwLeDEQkwZPoX1NqNificTWLigMc131qFooi0HgQHGqvvxmZyDz8W5rYuiujLdG2vQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ff5f6a-0ec2-482d-5127-08df0b8665db
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 19:46:37.3800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsvJ4Ks2c53MkaRkw3mgvAtpB7dzghxJfVWTvg549j8YSyuuSIrsa1uDkL1SUvDqfCQNZ+B1b0Sots9Nft7vin1if9wYhUfwq665o33E5w2UzvowV/jZMT0Sd8Kj20eh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6601
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

On Wed, Sep 02, 2026 at 08:12:22PM +0000, Jagmeet Randhawa wrote:
>q->guc->suspend_pending is accessed without any common lock.
>__suspend_fence_signal(), called from guc_exec_queue_kill() and the
>suspend-timeout ban path, clears the flag asynchronously. Meanwhile
>handle_sched_done(), guc_exec_queue_stop() and
>__guc_exec_queue_process_msg_suspend() check the flag and then call
>suspend_fence_signal(), which asserts that it is still set.
>
>As the check and suspend_fence_signal() are not atomic, the clear can
>land in between and trip the xe_gt_assert(q->guc->suspend_pending).
>
>Rather than serializing those clears, drop them. Signalling the suspend
>fence from kill or from the suspend-timeout ban completes a suspend while
>the queue may still be executing on the hardware, so neither is a valid
>place to do it. Split the wake up out of __suspend_fence_signal() into
>suspend_wait_wake() and use that in guc_exec_queue_kill(), so a waiter
>still observes the killed state immediately rather than waiting out the
>full timeout - guc_exec_queue_wait_suspend_done() already breaks on
>exec_queue_killed(). The suspend-timeout ban needs no wake at all, as the
>waiter that timed out is its caller.
>
>suspend_pending now stays set on a killed or banned queue until it is
>torn down, so relax the !suspend_pending assert in
>__guc_exec_queue_resume() to permit that state.
>
>handle_sched_done() and guc_exec_queue_stop() can still race with each
>other, so take the per-queue msg_lock, which already covers the set on
>the suspend path, across their check-then-act. In handle_sched_done() the
>flag is snapshotted under the lock and deregister_exec_queue() is kept
>outside it. __guc_exec_queue_process_msg_suspend() is left unlocked: it
>runs on the scheduler message worker, which guc_exec_queue_stop() parks
>via xe_sched_submission_stop() before touching the flag.
>
>v2: Document that sched->msg_lock also protects
>    guc->suspend_pending, which indicates a suspend message is in
>    flight, in addition to the sched->msgs list (Niranjana)
>
>v3: Drop __suspend_fence_signal() from guc_exec_queue_kill() and
>    guc_exec_queue_suspend_timeout_ban() rather than serializing them
>    with msg_lock, keeping only the wake up in kill and guarding the
>    !suspend_pending assert in resume (Matthew, Niranjana)
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>---
> drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  5 +-
> drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  5 +-
> drivers/gpu/drm/xe/xe_guc_submit.c           | 58 ++++++++++++++------
> 3 files changed, 49 insertions(+), 19 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>index 63d9bf92583c..78ef2e8ded4f 100644
>--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
>@@ -47,7 +47,10 @@ struct xe_gpu_scheduler {
> 	const struct xe_sched_backend_ops	*ops;
> 	/** @msgs: list of messages to be processed in @work_process_msg */
> 	struct list_head			msgs;
>-	/** @msg_lock: Message lock */
>+	/**
>+	 * @msg_lock: Protects @msgs and guc->suspend_pending (indicates a
>+	 * suspend message is in flight) of exec queues on this scheduler.
>+	 */
> 	spinlock_t				msg_lock;
> 	/** @work_process_msg: processes messages */
> 	struct work_struct		work_process_msg;
>diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>index d27826b36649..74b711abe257 100644
>--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>@@ -52,7 +52,10 @@ struct xe_guc_exec_queue {
> 	u16 id;
> 	/** @suspend_wait: wait queue used to wait on pending suspends */
> 	wait_queue_head_t suspend_wait;
>-	/** @suspend_pending: a suspend of the exec_queue is pending */
>+	/**
>+	 * @suspend_pending: a suspend of the exec_queue is pending.
>+	 * Protected by @sched.msg_lock.
>+	 */
> 	bool suspend_pending;
> 	/**
> 	 * @suspend_count: Reference count of active suspend requests. The
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 99d8c807ff05..1420f5ebd72f 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1863,16 +1863,11 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
> 	kfree(msg);
> }
>
>-static void __suspend_fence_signal(struct xe_exec_queue *q)
>+static void suspend_wait_wake(struct xe_exec_queue *q)
> {
> 	struct xe_guc *guc = exec_queue_to_guc(q);
> 	struct xe_device *xe = guc_to_xe(guc);
>
>-	if (!q->guc->suspend_pending)
>-		return;
>-
>-	WRITE_ONCE(q->guc->suspend_pending, false);
>-
> 	/*
> 	 * We use a GuC shared wait queue for VFs because the VF resfix start
> 	 * interrupt must be able to wake all instances of suspend_wait. This
>@@ -1885,6 +1880,15 @@ static void __suspend_fence_signal(struct xe_exec_queue *q)
> 		wake_up(&q->guc->suspend_wait);
> }
>
>+static void __suspend_fence_signal(struct xe_exec_queue *q)
>+{
>+	if (!q->guc->suspend_pending)
>+		return;
>+
>+	WRITE_ONCE(q->guc->suspend_pending, false);
>+	suspend_wait_wake(q);
>+}
>+
> static void suspend_fence_signal(struct xe_exec_queue *q)
> {
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>@@ -2134,7 +2138,13 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> {
> 	trace_xe_exec_queue_kill(q);
> 	set_exec_queue_killed(q);
>-	__suspend_fence_signal(q);
>+	/*
>+	 * Do not signal the suspend fence here, the queue may still be running
>+	 * on the hardware. Only wake any suspend waiter so it observes the
>+	 * killed state instead of waiting out the full timeout, suspend_pending
>+	 * stays set until the queue is torn down.
>+	 */
>+	suspend_wait_wake(q);
> 	xe_guc_exec_queue_trigger_cleanup(q);
> }
>
>@@ -2323,7 +2333,12 @@ static bool __guc_exec_queue_resume(struct xe_exec_queue *q)
> 	bool last;
>
> 	xe_sched_msg_lock(sched);
>-	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending);
>+	/*
>+	 * A killed, banned or wedged queue keeps suspend_pending set until it
>+	 * is torn down, so only assert the flag is clear otherwise.
>+	 */
>+	xe_gt_assert(guc_to_gt(guc), !ge->suspend_pending ||
>+		     exec_queue_killed_or_banned_or_wedged(q));

This raises question as to if we really should add RESUME message if queue is
killed or just directly call clear_exec_queue_suspended(). I think it is
probably better to schedule the RESUME message so that any messaging order is
kept intact. So, it think it is fine.

Overall the patch looks good to me and you have my r-b.
Matt, hope this update addresses your concerns.

Niranjana

> 	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
> 	last = (--ge->suspend_count == 0);
> 	if (last) {
>@@ -2393,8 +2408,10 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
> 	/*
> 	 * The GuC failed to respond to the suspend within the timeout. This is
> 	 * not recoverable for this context, so ban it and tear it down via
>-	 * cleanup rather than leave it suspended forever. __suspend_fence_signal
>-	 * clears suspend_pending and wakes any waiter.
>+	 * cleanup rather than leave it suspended forever. The suspend fence is
>+	 * not signalled here, the queue may still be running on the hardware,
>+	 * so suspend_pending stays set until teardown. The waiter that timed
>+	 * out is the caller, so no wake up is needed either.
> 	 *
> 	 * @q is the primary here; it owns the group's GuC context, so a failure
> 	 * to suspend it wedges the whole group. Ban and tear down the entire
>@@ -2402,11 +2419,9 @@ static void guc_exec_queue_suspend_timeout_ban(struct xe_exec_queue *q)
> 	 */
> 	if (xe_exec_queue_is_multi_queue(q)) {
> 		set_exec_queue_group_banned(q);
>-		__suspend_fence_signal(q);
> 		xe_guc_exec_queue_group_trigger_cleanup(q);
> 	} else {
> 		set_exec_queue_banned(q);
>-		__suspend_fence_signal(q);
> 		xe_guc_exec_queue_trigger_cleanup(q);
> 	}
> }
>@@ -2429,9 +2444,9 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
> 	int ret;
>
> 	/*
>-	 * Likely don't need to check exec_queue_killed() as we clear
>-	 * suspend_pending upon kill but to be paranoid but races in which
>-	 * suspend_pending is set after kill also check kill here.
>+	 * A kill does not clear suspend_pending, the queue may still be running
>+	 * on the hardware, so exec_queue_killed() is what ends the wait in that
>+	 * case and the queue is torn down asynchronously.
> 	 */
> #define WAIT_COND \
> 	(!READ_ONCE(q->guc->suspend_pending) ||	exec_queue_killed(q) || \
>@@ -2624,10 +2639,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> 		if (exec_queue_destroyed(q))
> 			do_destroy = true;
> 	}
>+	xe_sched_msg_lock(sched);
> 	if (q->guc->suspend_pending) {
> 		set_exec_queue_suspended(q);
> 		suspend_fence_signal(q);
> 	}
>+	xe_sched_msg_unlock(sched);
> 	atomic_and(EXEC_QUEUE_STATE_WEDGED | EXEC_QUEUE_STATE_BANNED |
> 		   EXEC_QUEUE_STATE_KILLED | EXEC_QUEUE_STATE_DESTROYED |
> 		   EXEC_QUEUE_STATE_SUSPENDED,
>@@ -3232,13 +3249,20 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> 		smp_wmb();
> 		wake_up_all(&guc->ct.wq);
> 	} else {
>+		bool was_pending;
>+
> 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>
>-		if (q->guc->suspend_pending) {
>+		xe_sched_msg_lock(&q->guc->sched);
>+		was_pending = q->guc->suspend_pending;
>+		if (was_pending) {
> 			clear_exec_queue_pending_disable(q);
> 			suspend_fence_signal(q);
>-		} else {
>+		}
>+		xe_sched_msg_unlock(&q->guc->sched);
>+
>+		if (!was_pending) {
> 			if (exec_queue_banned(q)) {
> 				smp_wmb();
> 				wake_up_all(&guc->ct.wq);
>-- 
>2.43.0
>
