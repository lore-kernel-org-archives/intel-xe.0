Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627FECD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 20:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E835F10E292;
	Tue, 16 Jun 2026 20:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+AGqQhY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A1E10E292
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 20:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781641519; x=1813177519;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aVrVjo6PauZAz0pD5PnwSAA0VZk80aPOD+f7zJXBoIE=;
 b=b+AGqQhYN5sbEeT8K4gV1iRd2eP6xHejeRRHdUgF3kJv/z3xcCQ73COJ
 +YblXAvpRaa7WF4VBBaJFakQvrEeNeiWwV3bOgcVnGMd2B7t94yUyTT76
 eN71IXow5EegXWaqMaDUMhMIogvBLcSsa4IyFnWFi1xR601W5QGtS9LHJ
 0UDPgmULTWOErO98E2NHjqlT+saykq6WRTKHj9GFiWLWkmN17ngh1y41F
 dmHG0qzP4DzE8digRXB2KZsca7wxT/Bss8QtqdqKeYHPlkyDHDZwOqPt5
 n1L31mBA1VhZU5WfALBOe4PEHrDvc2+KpiQpyebG+yeHg5KaCYfYgimMJ Q==;
X-CSE-ConnectionGUID: 1lTzzEuDRquhIOgwJIDbww==
X-CSE-MsgGUID: ymFu8PsIQ4KRMy5wO3dVHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="92745724"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="92745724"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 13:25:19 -0700
X-CSE-ConnectionGUID: U75bDPdXSK+a2UptRLkgKw==
X-CSE-MsgGUID: EpXBDjJhSV2/ogkd7o9USw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="271946829"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 13:25:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 13:25:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 13:25:18 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 13:25:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+L8bS+QrSUudmfP8sokInBtcK0N/iwICl+ws9MCQjIPjWO5lNDuWkETEGiB2r/oY/HWm7WPEZ9QxlsjW6boVrm40zUKC2oWu9k6fBh7yabwu3C/LRa2mAld9PHNJ8FXRLg+6dw+rg1wDOFCcUhd0Ux66IoAGPo/iW/TnwBOdBNn8nxVzypgbrRKPjlSyU8CbgwYXqv5Qp+pfRo9clnKESaVuhDopT68CVlrEsxicFp1WXyYjGLwrot90tvQGRkmaMSKRjIf0BYTkCQOE+KNxwHWIzhGt99mby800PIHKe2s8BuTNOrz2QWiFpWrlxeDS+Vh0tb1uwVmP6GsBkOxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4d9GavkLc1FEKskVKzE7CXFgC58lEhagsHR8HEAvrzA=;
 b=ilqjS3qidgObLQHaGX4Xp/IIr5owNKJhs41nQQ+BURcoDjK8TTc0TvYZIuWdK8JRurSUk1OvVuK4lWJ55pfNkk8zHlxCS/5WePIYKyo+8G4YHSWiZV3tOip1hSDJXWauqm0PZOH+jPMWBm8Jaf8wPuVYvWLYzJcJAxucAZf44YuIDgIlGmjEE06i0Pn96xWqj2MqwQhfxTOxs93kTJnaz8SZmkXcYVxDR9bLBHbG8c2Q+BdF6MXVmxNNGj9TZfzYS4jxouDvq1bY0bVzCu5sT1FySptiC9jasLYNUBbZErxej3LJvpT4LHvvWa1i7w0ej8+mqYR/75YxfZGJdIzMVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 20:25:10 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 20:25:10 +0000
Date: Tue, 16 Jun 2026 13:25:08 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Message-ID: <ajGxJEYsYwseO_Oh@nvishwa1-desk>
References: <20260613013859.3886196-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260613013859.3886196-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::19) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ0PR11MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: 927ca830-1996-4960-f479-08decbe55d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 1WLqyKKdRTljdSoxlKNWG9pl2vEB9EkhZexl5zDqoE0wmhXB2zJt5S62PljJlMuA3Kx3h2GiO/DsqdyovHV4V8QKZZs9MxrbabcnO/LFB3kpqFrKFNShSdFKKSHYKbiooA3eHex75/LT//JxXOA4f2UCl84osU96Ilw0fZp+SXzGfqglU908x4vNqPDAVNJZktU3U3wsz7aXjx/CPJ95Z1pPjnzGHd97skKLhTWou/AsO1uiJ2NWSSHi/37pCMmnNE9jxo1/LMFG6g7Jv4SRl09qCmiltvPDnen4QLhoB2/MM8obPTyVbkXAKS04f17YJYCLQArjcltGFFpEX/i0BqjtoIY3ZUGq1oFODQb8B0j87R1q4RR9PZXm9qMc93CrJu5eiDCFhmNjnHCEgt/vdDFfE4JR0PnZykUtRQyJ7rDRYG9f1MsehA1AJmOSli/BkSgNOrWZWqeP3CNUCf8SPPNipdmS+FJLGPe5uXMUqRFiOp2qDqXwE4UszYmwaAvkD9wlT2swb1LRqqqpGD7fIckE6c3RzRw91INuCI10z7sqiW56s5I8fAppAmMexwu0vKCgzU7yvTOT7eoMRjyHYFJAPKdoKtxxPPd6eqDh064c8dSGRdo6SkG0/7iCSew4RjQhPxKQc3ayoyn3SolhaX2z1Pg3EdGsheTi8eUkZzW+jdWSnv3C2Ioj8n/SNRkh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?At0lTEDTt3sIKFkyYOPihIJI48hrVsJ6fK7PCknaUhE8oyTjHA5d78p4zX0u?=
 =?us-ascii?Q?Lct3UboDwvvyxp5Bkm2GkvamLQqnYGU3bVIx9qD9PjESZ1ahdSMxgo6GsTd9?=
 =?us-ascii?Q?OnXyvU/qCYI4vZZ7YwR/raPa2DHwHTdrFXsV7hjGFp1ekNXC7uFK2NNnb9WZ?=
 =?us-ascii?Q?LS5GIGnC4FlM9Ee1CCjcuDh2lB8pcbdWkexStvolV1p1tcHg/Iivg3/1O/lR?=
 =?us-ascii?Q?R6QDLXos22XWyduvH9WiU5za2QXKLJvQNiRKjPsagAA4Mq9KnWaBL/YinpT2?=
 =?us-ascii?Q?VKIoXnv5B/bg1rz9N3NWFCJXD+ubhwFb+VfYB6PggFE0h8k675sPcPYfhvdY?=
 =?us-ascii?Q?OnU/fpJacHf/h8PZhIw7qUenIr8v4CKfQiqtqtiYJCENDCTQUZ5qfD8Dbld/?=
 =?us-ascii?Q?sR0U3LSultzFbRiow5j+tv1V3kHwpa0ujIgxw62qxYzo0WlMwROuo7ogenNc?=
 =?us-ascii?Q?qb5tIIyrTKXSKp0aEPLSneOavo7hWljaKalRShoGS+F18sP/sarRqlq/d5xG?=
 =?us-ascii?Q?XjW47W9cl9YoT95Q2moyZhrvihPUG8X2AT83Qs8jARkJvpxx2Pz/0elOjTMd?=
 =?us-ascii?Q?n2gCKnk32vKtK9HcdHzvgthYQEcUAc1kR709MAIg+3EtAEGuYlVpNZiL7VH7?=
 =?us-ascii?Q?5K3B2UKidDMycsQ+xm3gHvWlx+IMLn+2dlgmh94Yl8ir3IxbSStd0nQCqnEU?=
 =?us-ascii?Q?nM/+MbIVnHAOR+NtGO4zP1bNAOtDrp2JDzow8R/jRV8dtzFXgeuN5KJmmea6?=
 =?us-ascii?Q?mAcbeQEZwOU19XyYFx3t2cw6kPkv4mr2zaugY0nhqIBkv4gghnxBkPctqHOA?=
 =?us-ascii?Q?MfGBWIhndv3b/ak8S6RkQuqH768kaHCdJYmRSVaZDttI/MDuSy11Umk+zojb?=
 =?us-ascii?Q?1NmeBZSfWGodUQV3IJmItbjh7dFNRa4K0BRHcoUgA3LDtrc8bhcgL4ntk/YV?=
 =?us-ascii?Q?YlaM/Gh8/di/iY1iDqatAePsAuF7NmKf6GlYGOFjkZGHq21vk46ndCGcFSYJ?=
 =?us-ascii?Q?ZDTqGAJqHXLOMJNzvXf8fBSMj+v3fKwoBvoe+9Cv1iVVvl4+4A/KuIWBoosn?=
 =?us-ascii?Q?1Mm+B6wK7sm7MbRCYt8v6P2g2gKeBxJcU/W4gwKtzcmfIcS0UoGspD//qA8A?=
 =?us-ascii?Q?2KL6IpWvLx5xB8rfibjmEpnyRgqshgPi3ahIPqOurop/g8/kxdMu2D+b93EY?=
 =?us-ascii?Q?XDVm9Mig7aSs0yQvEKjq0a/UXNgUsrTuCJcOaLsvsmudX0BCESFq+MeLaJPw?=
 =?us-ascii?Q?Zznzw0oKB4KaMkgkGQ/rDw5E1sjTgsKDe7SvNdqGzyUJxM2fdkilARKDDwTe?=
 =?us-ascii?Q?bc2KiCHltExI2vYigaOfa9e6lV4igxSZDFNUJ1vIq6xdmeOWUxEbQdHd6uN4?=
 =?us-ascii?Q?BzQU7+he3VftZ3QQKpdEnw0bR9Udak8UXzctsK98BfxTlo2BJB8AIiMMuj8X?=
 =?us-ascii?Q?ATKrOh4M0WzvemamzIDVW4NQVqZLimcxuocq4kgq5pIKFg+HK4bfWyiv2quf?=
 =?us-ascii?Q?tBYeI8l0nHawrSpbjJfB2VjfAkZ/RYuPQ//28Pb7FkpfaQ2EWBvueDGrINK2?=
 =?us-ascii?Q?t0vFZvjVH4g3ltge9YF64rXmaJDWqM3xtkgLxyncOLzYRqIj+CBzRGJF0MYD?=
 =?us-ascii?Q?blzoKiMn3liv2VET2qeE5cgH047OsYd94vRdJo5wYIjnIQtP0vhKf8V/QhIy?=
 =?us-ascii?Q?A0udLOT5jvxBxARhZg5RPPSqhqEM7eIBVIAgmTAH3MTGbU4pjtKzNFmtTi/P?=
 =?us-ascii?Q?fUPhUMxgzSDiv8fElR2nZLAmERjNb24Qm+TTdUFvOf9fCTPfdMRE?=
X-Exchange-RoutingPolicyChecked: pzO9gWm5s0JVy3Xt9PWPYTCCKpvNcRRndNLQSeQSkMvJ1nbipi0GHaJgKz0OwjZojb6SOXyKpWEFLoIfmCk1aS1l1b3HnnQzwQHungx9pLfR+jI7YwqP6WJHn0wH8srfj+MQg536ZFdmi8XZM7Ymj259Dhsqr5603cyj2w69Y1ctYcIFO46KTzisIUzxW9zVqovW5cyixaqrg3DRUIWV4EfspXRkieCbzCdjqju60TNLIC8jnP0yH0zS8A23/4Wj3pTgOOLT6oYVm6/ItZvZj7RDJl+jFvOBaGf37YVSkqMODGfJ9ksXiCuS5IpsQR4PTnU/AeYKsFfFgA7h8f++dw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 927ca830-1996-4960-f479-08decbe55d3a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 20:25:10.6695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VX+p3WW8ZlBpR5SpqvGIi22Ib9TnXmxMbc9LeAxLMVnCjiksUeyOtOpgnpn/iuNKHkU0G0XFGzh+zZf4iRA69e2zP7bReq2R/WxkzOZ/iOms+aY+mbD2cyriG97qfLyv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6717
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

On Fri, Jun 12, 2026 at 06:38:59PM -0700, Matthew Brost wrote:
>When an FD is closed with many exec queues, teardown relies on the TDR
>path to clean up scheduling. However, the TDR handling is serialized
>(i.e., only one exec queue is processed at a time), which can make it
>too slow compared to GuC scheduling activity.
>
>In this window, GuC may continue to schedule contexts backed by
>invalid page tables, leading to a cascade of CAT errors and repeated
>engine resets. This significantly increases recovery time and can
>degrade system stability.
>
>To mitigate this, eagerly disable scheduling by sending a self-message
>outside of the TDR path. This prevents further scheduling of invalid
>contexts and avoids the CAT error/reset cascade.
>
>This change improves robustness and reduces recovery latency in
>multiple queue teardown scenarios.
>
>Cc: Wang Xin <x.wang@intel.com>
>Cc: Jia Yao <jia.yao@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>Tested-by: Jia Yao <jia.yao@intel.com>
>
>---
>v3:
> - Make kill message static tomake reclaim safe (CI)
> - Do not issue kill messages for queue which bypass cleanup messages
>   (sashiko)
>v4:
> - Add missing message lock
>---
> drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
> drivers/gpu/drm/xe/xe_guc_submit.c           | 44 ++++++++++++++++++--
> 2 files changed, 42 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>index e5e53b421f29..247947fd357f 100644
>--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>@@ -31,7 +31,7 @@ struct xe_guc_exec_queue {
> 	 * a message needs to sent through the GPU scheduler but memory
> 	 * allocations are not allowed.
> 	 */
>-#define MAX_STATIC_MSG_TYPE	3
>+#define MAX_STATIC_MSG_TYPE	4
> 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> 	/** @destroy_async: do final destroy async from this worker */
> 	struct work_struct destroy_async;
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index afe5d99cdd8b..5ec1dca0324c 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1875,11 +1875,21 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
> 	kfree(msg);
> }
>
>+static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg)
>+{
>+	struct xe_exec_queue *q = msg->private_data;
>+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
>+
>+	if (exec_queue_enabled(primary))
>+		disable_scheduling(primary, true);

Can it race against other path that calls disable_scheduling()?
Worried that if so, it might hit the below assert in disable_scheduling()
xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));

>+}
>+
> #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
> #define SET_SCHED_PROPS			2
> #define SUSPEND				3
> #define RESUME				4
> #define SET_MULTI_QUEUE_PRIORITY	5
>+#define KILL				6
> #define OPCODE_MASK	0xf
> #define MSG_LOCKED	BIT(8)
> #define MSG_HEAD	BIT(9)
>@@ -1906,6 +1916,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
> 	case SET_MULTI_QUEUE_PRIORITY:
> 		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
> 		break;
>+	case KILL:
>+		__guc_exec_queue_process_msg_kill(msg);
>+		break;
> 	default:
> 		XE_WARN_ON("Unknown message type");
> 	}
>@@ -2018,11 +2031,39 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> 	return err;
> }
>
>+static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>+				       struct xe_sched_msg *msg,
>+				       u32 opcode);
>+
>+#define STATIC_MSG_CLEANUP	0
>+#define STATIC_MSG_SUSPEND	1
>+#define STATIC_MSG_RESUME	2
>+#define STATIC_MSG_KILL		3
> static void guc_exec_queue_kill(struct xe_exec_queue *q)
> {
>+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
>+
> 	trace_xe_exec_queue_kill(q);
> 	set_exec_queue_killed(q);
> 	__suspend_fence_signal(q);
>+
>+	/*
>+	 * We eagerly send a message to ourselves to disable scheduling, as the
>+	 * TDR is serialized (i.e., only one exec queue is processed at a time).
>+	 * If an FD is closed with many exec queues, the TDR can be slower than
>+	 * the GuC scheduling contexts with invalid page tables, creating a
>+	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
>+	 * this by immediately disabling scheduling outside of the TDR.
>+	 */
>+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) &&
>+	    kref_read(&q->refcount) && !exec_queue_wedged(q)) {
>+		struct xe_gpu_scheduler *sched = &q->guc->sched;
>+
>+		xe_sched_msg_lock(sched);
>+		guc_exec_queue_try_add_msg(q, msg, KILL);
>+		xe_sched_msg_unlock(sched);

Given we are adding a message here, do you think it will help if we do
something like below in xe_file_close()?

- xe_exec_queue_kill() all queues
- Flush work_process_msg for all queues
- xe_exec_queue_put() all queues

I know it is not suffecient as GuC may not have processed the messages
yet. But it is something we can ensure has happened before we release
queue reference?

Niranjana

>+	}
>+
> 	xe_guc_exec_queue_trigger_cleanup(q);
> }
>
>@@ -2066,9 +2107,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> 	return true;
> }
>
>-#define STATIC_MSG_CLEANUP	0
>-#define STATIC_MSG_SUSPEND	1
>-#define STATIC_MSG_RESUME	2
> static void guc_exec_queue_destroy(struct xe_exec_queue *q)
> {
> 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
>-- 
>2.34.1
>
