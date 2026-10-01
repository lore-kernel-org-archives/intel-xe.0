Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81D8CA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 20:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CAB10E296;
	Thu,  1 Oct 2026 20:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SrUEwP9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406E510E296
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 20:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790887002; x=1822423002;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2PQPPD7udx20CDG6xEapo3PrmIDalM3+FgXO/5Bs5Us=;
 b=SrUEwP9pRhMS4Q9mZ8cXlug1uAuqzvwkEX8oPGHyPeg9XaZH9YclV5bq
 r/NaHE36Xh9TSD277wFDx+LwBHVYprKD08KuJsGHHHKRtK0FkESnzVKan
 E46++6LyesxXAlLYXJ6GSFxysqmnJ1zmxNyNxozZ9aIodZjFBclXyHRtF
 zu8OTkBOAU6HrsGDu7XVPAq3Q7l7Cy6udK19rVWpqYDyx7OXN8dZN8KjA
 WxKoMveCXn3UonGgkEwOzPKUgRNhmDQBy7QAsAcPsZFCkOh8gTApgVauL
 oV2b2vrFpdWl+POAoskLeLs1uUVA5QR0HZ5rpd9xWLQA2LKMk98a5982X Q==;
X-CSE-ConnectionGUID: pW2QRFBQQeeBx6sibfdVBg==
X-CSE-MsgGUID: OsT8BWUHQmWozygHk6x6mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="95468181"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="95468181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 13:36:42 -0700
X-CSE-ConnectionGUID: zgNbt8VhQHCkwhpELas14Q==
X-CSE-MsgGUID: PtK16+kbTpq/KQviYc7o7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="279383827"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 13:36:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 13:36:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 13:36:41 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 13:36:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfUUS4tqUynIj8+K9fZbG6OIcDtZbH/9DNDeP7p0HJESElrqvtze0r58SM4uyPHoLR8aVgWYOM/shmO1l4oq92mEJCmqsCOY2tSWW9ihWEp+oUyUgvYFRE7Np9kbi4reklu9hlflkW5Bvb7AdZogxA7hpS4uudnSr2o8aJBPwucj253SNg3hp33d5ZeCfdfeBVl8NjdFGEC19eI9Sb7Kw6Jl4QV4AHqVHPQ1ptd2KT6NR1wbQRTy+W4JXzfzZy9Hz7TN2wKboiESrPd4WMo4plHpOqMbtjvBIo0xyWFLa4kyFT+w6gsxhY4kljUF+dWv/JhrOOQfMz8CYgz2cLxTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nietKutvoKXoslWjXPZ/opbDz0MtWu4YgtmEi7W3lzY=;
 b=LWjFagc20VI1QTVpQzYwC2EVYe/MvlrJr1r0OkphPpIfdxmKwoBNVygG98yIhWhY936i/tOT9YnbJlFtjiILsLq2ZyE5y0/7RUF0kXgs7wWubfIXLgRh7Tt6cWxUbzRtI1MBjIZPHQaOHaSzF8CxCn7YmaoAsq4zKzSDVsLUVH6hD0cGqMaQ2XBPavHBzH2FWc9BmccqwnptHKwlGxBHknxJ+05grxG/XLjJJvJb45xzTKnW0yKC4mlJcyw3XSdJk66+yqLpkvPwQsKOZUo5UFChSK7gjmOQn9AOkmdNcZHAje5UqjgTx/vF5uTWx1lWbQqjEu/CDlMdzZ1Rj0ZU4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SN7PR11MB7602.namprd11.prod.outlook.com (2603:10b6:806:348::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Thu, 1 Oct
 2026 20:36:38 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%2]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 20:36:38 +0000
Date: Thu, 1 Oct 2026 13:36:35 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH, v3] drm/xe/guc: Fix race around q->guc->suspend_pending
 access
Message-ID: <ar7EU21pbIpl4R2j@nvishwa1-desk>
References: <20260902201222.30022-1-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260902201222.30022-1-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SN7PR11MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: d28e0205-4cdf-40e8-83b1-08df1ffbb17a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|56012099006|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zjVBwr0e6YSJ9x/Tl/TS0pnufUy7fQA0kAMohHM0yEZ5lnH4Q0KE5IPtdUusd/O7csEq+zJvxHKzseQDystOpfqwu/8Q3RBpTZ9Y0UJojmaP3zA+tjltjAweZaG8418Xr7Fdi7hOQZBgrWLI5Sm4ywSYHjfJ1N/zN+oBrBTq211FIEziNLcapHvRZcU6UIQ/gEJMPTUmn2SiyCDaI3Pv92mMOYzJ9XSUuEFPbmL/QSqofNAmAhTx9cH4ffkLnO9D47xL79zglEuS4HatCn7g7ZrHLGcNOluvxnCxmusq/V0Xla4wOhGzcKYVzSBdNG15cXhhwyebQjuSGMd7sboxAUo5KwqmMvawkxkZ1U/+rUTGkQXqp73EOwwOVZWGfoh3dJfr4EWXuZP0rv4FU4xnhAITx8/nuw+pdH8nhBgku8sobZvCQL2SUzDeXlm1ToObSjfRiPShvUmY9XRCf1DiB4q/KraLKA25ErU7I6MMHfXhxR9iXVCMUHqrFBzdKNUfdan+X/4VtM4kr5ysgo10TS8JbCOYF025jKyOapJHwIUoMkQhi7JTHvLU1V5ekHNE4lTuiyT8FH3sxqv4oo7zdSUuWhGNktsEN8zL/hhYa/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8kVhtKKNhgCZnQqoaTTlEBAD2T200NS5d0pJc5pW4bPRSvRTXY9HPOjzZSOp?=
 =?us-ascii?Q?seXmALNgAz1+5f7aJQjD1qVSPIdd0IM4N/n+9Ga7bWUk0XQRJZ1vv23qYcD1?=
 =?us-ascii?Q?AxUyzFZyk3YhOcCBuKzO9Fs91Agr70focJEoqglENZH54RwpH0pJkjzQz5/r?=
 =?us-ascii?Q?Pjj36jnryHFkP2cqt0fqS58OisNQTDdvSnXCumDmWqGUg7I2uLMB1f8tgryi?=
 =?us-ascii?Q?9HQtUXzePEBWQRnv+W6EebKCmDao0pJ5QMBiKEI38NnHkiNsbQtqCsT9mIRi?=
 =?us-ascii?Q?tssmSqOoRNUVxfeiXtO1YmOw5J0OdEhyITSiVJeY+Lh8pjZjfZk88rF++sJb?=
 =?us-ascii?Q?BZdoeRvihuTq8xWaoM6wxWYVd6Y49ewVFWt5MhcPVGz4eDKYzOVsiDqikeGC?=
 =?us-ascii?Q?tx/rZmEkuywkdSXQqWBDwAOo1HEx3yxq+9YHD7BQBwJR0oWp1fe/cLAK8BJf?=
 =?us-ascii?Q?Nvfc2JCLQFmy+lWkQFzfap9EhAcczdtMbBWI22WFmQ6W13O113LI45jYsQi0?=
 =?us-ascii?Q?7bwfVe9/YFHW3cTtKB8rQ9rAWjBwIv13uNTIcq9mG95Ds+eWimZSimHL7X04?=
 =?us-ascii?Q?rZdsQD6fdkGUSL39Ew0Ty9njUPAKGnb56NciwFEIwSu7gvebQhwtQSih/QGZ?=
 =?us-ascii?Q?aha+Y7eXW1Cty48fZ1tdCt9de6+Km++T7z+OIATGpTUblemCQpKF9U1e7p8O?=
 =?us-ascii?Q?BoFnmRY/sa4ETDGWGVnJ6VmrX4LXLRt4g7SzVEa7bjTAH3MkgcR4TQxmwjYJ?=
 =?us-ascii?Q?i3fOcAGhwO1zLfC2E7Fs3NpwpO+CeLWwqWyyg+h65n1MClSEjGQDgsN0toTY?=
 =?us-ascii?Q?N2YnNlhxL5nnY/S2SnsyKBo/E1u6r9QHUACg+JTSJ93w3zz/E45irPqdBE5M?=
 =?us-ascii?Q?nxCVTuuuP9iMC+2/DSwu1Gh+LPie15AxG2/Wz9A2t9Q8Zcr5okA3LOs+RJdd?=
 =?us-ascii?Q?lLoJku/0jLgJFU0BxZ4I/XdrA/gitk/s5g1U7hlww8fO99hA7jr8JPIgoEg1?=
 =?us-ascii?Q?VwacRfOA8AVRfZiU/Z3odut9QJLlhyjmo4c1+sl7QW/l8T72Cc0hI8uiQkjv?=
 =?us-ascii?Q?LWH+dMMKu3WhvWUau4z39Wcx+aVGWVasJatFWe0OyA6DwnyiebeWUqHtZd9Y?=
 =?us-ascii?Q?ADAKVNoX5yje9DaTKIO+kGPNywSzLwM6Z1Z75NTXvuoQlMjkNJoycUH8uvrI?=
 =?us-ascii?Q?D759SV5DS+iBCv6gtdsST3wya3kfeo9ia9Yiptyvr3yEFIoIVTr1dJQEcqGa?=
 =?us-ascii?Q?ziKAh5/Gn5a4tDCvoNJLAEPQPmu9BBjiozl+gGQGXJ1xf/Gik9oUlOvzuqHB?=
 =?us-ascii?Q?c237vQM3vA1HrNprFUh4QF+0xBlrv3ycWYUhA+UkllggUSRxWNw67FyGV0Gl?=
 =?us-ascii?Q?xsrypH4L2SyN/pCTuErIqcsAaJlP2sSqJqnNEpXjD8/SFvyKCNPPKyiswnUp?=
 =?us-ascii?Q?9eXjXbe+t9AW1Z++fRc57MnDhYyMwMA+KfhNwQqf1+rFb+8yXThBv0ssoQ+Z?=
 =?us-ascii?Q?cNLU5ESFwHSnpSvreSsrT41vcR9Kr7mtvhAnDorTTl5S8hrR0UqUdC7u7kov?=
 =?us-ascii?Q?z4mu9Hz2Si1L4XkV7U6G/NOcoIDndXPTa6zg+SDdmtvSevERb6VSumcVzTiB?=
 =?us-ascii?Q?yAw/ULa9j3MS8C4JM6pGKj0fyjVjmXgnyPrwBgVyZTMjCF+1l7DQEfe49Ouj?=
 =?us-ascii?Q?B+54gSAaRTwpB/uH6I7UmWS51hVQHiWpdZBM99Z2dwkRkhO9KxM3wBTu7ZEI?=
 =?us-ascii?Q?XiZXV6tmVg4KPgMzsrmhej5Iww+UoZq4hJIouRubKTZ1Amqglk6v?=
X-Exchange-RoutingPolicyChecked: sk2XGFy5VWW8JT4UeoWQagaWmGdqbGVivWvfbKHl+6NobmRiCdrjJ9oO3jGtvP5QiBghKDXJD+lqcTh3EstaLmbUsbCpXeujFqTHBn2yFn448TSHKK/oPkSrRspnNMXFk7RkvSY2inhc5azkoRBvKReZdfERmXAyW1xx6/pYYdM1/SqjI98W+4qWAsg/L0o3MuTUKV7js5AEsER2xiTo8HkxdtYvpG7suQZIJZPyFM1o8WG0K5jj8t+fXLHYjULe+9+ZoNxi+/aLt9mVm5H01tgfO2+3ydN3q3K0RuyAa2HzvL7/WVl/72R9n3OjVfF8Vv8yA4N9nqxzmbegcCobLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d28e0205-4cdf-40e8-83b1-08df1ffbb17a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 20:36:38.7708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRCKyB8kMr18DlOvyfTLV6adTaK4MOAX7o5im1r+4PdwG+nhdrar+sXjS3ezUNzgeVqWGHpIfO221XFoVX5pmOMJv0A13hFEa471L9A+psEn49esqNPdRt3JGAxw4tng
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7602
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

Looks like the failures reported by premerge-CI are false positives.
The test igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute
failure reported in https://patchwork.freedesktop.org/series/172176/#rev5 seems be be reported
in premerge-CI runs of other patches as well. So, looks like it is not due to this patch.

So, this patch LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

--
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
