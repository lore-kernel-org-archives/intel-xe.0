Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C06ECD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 15:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D220010EAB9;
	Wed, 10 Jun 2026 15:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzZyhJmj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293A410EAB9
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781105161; x=1812641161;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ZkyCii2Lh36ijv7UcATxpCvCPSnCtKFvQBSnP/j4utY=;
 b=HzZyhJmjWq4Ead/oiRtvYoP5xU67tj3VEweFJ3IRWC/0mfZ6/pmU1p8Z
 948zQOKPTln4kV3jc1FaH6Yu+mElw9NG77DQiPKfpG5LDJhDpE3K9kb8+
 cT7qEumLT2fBT+RmKFd/kxBZIPFR3aYmQRP2anjHdUYvt8o4VyM2ZD7Q0
 A+bYWDrRPxzLOZgvOqSKpnJkgY484qDS22Q5nl3rzn8RyOewdsHrdRORq
 fztWhDbgw+P+/qvl2trnAkiQIAdSK9LHCqYjmjt4Jrtq5z7VFOdRDOsaD
 fnocmGhA4OxlBHlBgoJMS1xrzgJb91V/Rk4tmAYcV9B4wcXuOMYjgzyfI w==;
X-CSE-ConnectionGUID: vzXAXQSzQGGzriUh416iAg==
X-CSE-MsgGUID: calp1yUxQqSyps0XuRFYRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92575976"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92575976"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:25:58 -0700
X-CSE-ConnectionGUID: k68rb/RaQmeaDSx5846AJg==
X-CSE-MsgGUID: MYKI+WeUQ5CmPf+eDggs8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="246284579"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:25:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 08:25:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 08:25:55 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 08:25:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqmSWURm1GDhE3eEMEdGJZKPTCb+pYy7CAc84xRzUUhDEbACEcBX7MGtTB4CwuwSOZH2jNz0daqyOmyjzM8w1oS+bh87W1otCCAf6nbCU67P6wpGXma3MVpVYCff1vmX8bAVBjcpCJdZd+mlZLG1zosD92EyYPMNdTLouNmccPpGBBHeBJRw3j/V+dau7yfgU/Ba9v79Jj5KOvzIUDdCCHmXYqa5qoa2kpXdBilHOslW6SCpcyN1dS4hNIUs2+OK30MOI2yjHdmornImhxcoA+t1IMVFHGJCorz10z3OIeZvSyW4QCegpZp7YZqpUu3YzJ+dtz1MxSzxePaKOBOwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5NqLUGKMxUeKb/DKsMmgGvNZWHO9Ms80OY4d+V4EWQ=;
 b=EhNyvL0X/b1/rWcGur1bEduXchRZhgWPOTQPGJRXuiaFLj4Xnqn3eRs6ziEAukAQ4vuZDbYXishhiRRxY68el0u38cETzsT2KA40erRn76DZQmPTpEuMaTSgfnCQwYtxVsXBTKlu+q/XAdSI24oPFO5xlng+pljG2ky1Ya1+l03X9AbLKnu2lFpi/kb8yoFCLQAgqjsPnmzn7b+H1Oj5DC1SxH8kcUO++s3EYdfCee5m6tjMXLOFC5dUUyhXnTc2pEZO7QhxrvKWLcYxfqKNiJbBxxoWqI2ePRN7t+utQrOfFQkLwdEZfx4nctVNN3KO9wMr6VEcgAP74ctbmRV60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SA2PR11MB4843.namprd11.prod.outlook.com (2603:10b6:806:fb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Wed, 10 Jun
 2026 15:25:53 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 15:25:53 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Sanjay
 Yadav" <sanjay.kumar.yadav@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/2] drm/xe: fix job timeout recovery for unstarted jobs and
 kernel queues
Date: Wed, 10 Jun 2026 11:25:49 -0400
Message-ID: <20260610152548.404575-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::14) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SA2PR11MB4843:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e229633-9efc-4c57-e1c4-08dec7048efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: BORznmRVDBNSFgGimcKa6a61hNVXO1fJxVRYjFKy6Xzt+CtLwNsgsC8sKPABbD3JQuBK6G3RbYOLbROCwnOAkUluxHn/MuE+rAyOacTZHWUC0my10x5yE2WIq7Fjax/bL8tgBobNiHJy9ZMp0eDE6mINHZRe5EtdP9hRpoCT58LU4MHZxE2RyOZHnkxkozwLnRejqwB3sXGZxlwNcFvtjFEIUj4QlHHGdq4Xx1/GhNvNoQSf1qfVQs77/9ybv18HITxystPZL+0KLiU3Hd4WqY1weYLoVN2+McZmzFCsGg4GwV+L/TpS89H8AWAGhXrv8rFh/six/lm6oloF2I1lgMf1NDd2nU7ZF/nnJS2ws7SYbK40SlyCQwSoRkpDn9gHoWm8gSm7QGCP15KymtgRn37cC4CaV5NdSxihgIk90hM4HveTnf7EczwUkYC3O/pNxSXYqhhyUYMTaEh3vekkmPhHdpPh/M15KSkRlk4z4HJpbr2cl/BU3K9okLKbhuSCjuG2Cu1pmZOvBXzonCpmwLl14Bibx4pkRHRhuEpsexJlt9bfla+MmGyjQjmMsG7QCn7C/d9PUr6X6jaTEfpvqPvBFaipgIuUuZwInW16HEXoNSwS/sVfDW4doeMQDGv1phsL8VhFqryJopJcah8zU3+9/AXA3naUhixXDF09J2NT6j4kPlouFXaLnw5fvqNU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5QhfMv1o1j7SeDgPlUCN01l5wmAMWwFX7Qpj43owT8ONwRxVWmYda0nmumEm?=
 =?us-ascii?Q?dyO44H0HYcI7hCAMe+gZr0M0tLdTvWwuHLPcr8nJGq1BUNOHo2E/VmGSzGi6?=
 =?us-ascii?Q?DJxFPXDtqMuy+BJczQBx8t8Y/ICWV2p8lWaDtYkMOpPuQOaeix3c61k9ACa3?=
 =?us-ascii?Q?7duPAW1KUU3A8l3697cnJh32y9BwdODtl7jx7Ic+/oLzNg1h84LuvZeK5uWX?=
 =?us-ascii?Q?DlllhKnkaGbiK2d3p6JfFj3q1gdDAgyAnWUCXg7m4mx4C7CHq3NVnvX2oF3W?=
 =?us-ascii?Q?f+NQNpqOOiig1Nh4XVySuqbBmBAMK5PppzlOP9LkrAvXw0W+EcXsVjCFjfal?=
 =?us-ascii?Q?PTMtI2TA3l3u1n0c2h+EBT8s9I+vpR9fprL982TgjKMov/Rq94nAIbZIBqke?=
 =?us-ascii?Q?8xJ1Yy4fCLxPJwt/TWuponu8l0VmF8VOO5MIjf5XkM2ZRl/iIPZJMB8pCDw1?=
 =?us-ascii?Q?e+ggX66gM/5MMKITd0OP9v72l9qWb6xNpuJtGyQHKAZMAxRyIrmfVLb7B/Zc?=
 =?us-ascii?Q?8WOIrQFf0fuUEdY6Hm9+IAXJDByziNeUO3r5riTohncW2aHn6b6BEdca4FvL?=
 =?us-ascii?Q?wTsn70b7qm3TnoMGyU6TfW+cpI09AttcAatwlYkQ0iFjQxQThU6eEvDsCZoT?=
 =?us-ascii?Q?azSfImuNCILEon+653222aGoODLGlmHcYuwp0cxcd23pT/D9YWlfUxDmwxIv?=
 =?us-ascii?Q?4LLCptWfr72LeENXV08E/8xmCExw8TLcb+PTWz9VmM9716Et3tbF78UPJ8HU?=
 =?us-ascii?Q?wr/SuVpYSaEdGMEhFHGhBbN82B2tpIV1JqowSnm6a3cfvQ80i4c1/uPk6tPU?=
 =?us-ascii?Q?42WNit5etNaO3oQY0TwN4AM9ENU/4t/KzBJAtCCzkHnZfiq5GKDpsRlyVegt?=
 =?us-ascii?Q?JkdHtIRAlvKDpJZyAdOvbodDCTtz4cG47EmUvEInk87G8vHNSgX9zDUYQQmB?=
 =?us-ascii?Q?za8N1Mhp+5wdVJJ+EgLeG3tiFjzKJ9cADDYGO9NrB2ssuS8je7ghcxhf46xn?=
 =?us-ascii?Q?mD/JnKuJwoKeC5bZM8Z1NAVagaImK7eXyo4+9cHUsc3CoQJkBbXs1yM90ziQ?=
 =?us-ascii?Q?cv9mEOZsrmNiFXgHgpefJW+B2R2qjL6QDZ73WS5tnohvxWrLtWEbDwP/QHK+?=
 =?us-ascii?Q?oOAEr6F+ycNms9b5krJPqfIJEO22Gs1aRd6w9izAUwp/ymA7nGUQLK+TkyU3?=
 =?us-ascii?Q?/yIVC2l+DrOPFn3MroVEMaxBq5mHDZ3l0HiI4itTZgIRf0VjnoDBb/FKPl8L?=
 =?us-ascii?Q?Rgfidsn/Yzs7Ufi8mpcpK4rKJFi1bDKh7ZmFt2/JHuf2TbsVdFSXIWJNTv0W?=
 =?us-ascii?Q?oRf+PnYKIaar+vhBYkQGRlk5T/QCdDKdYO9fBruX+RiaaejbbEhz1NgQejH1?=
 =?us-ascii?Q?tO9X0s01SfrL++zlp+4JvqULW3EYy9PMJ6cwnA0c/Z4ux3bBRK/LKwfOu0a/?=
 =?us-ascii?Q?Ivp5bbHkiAYQzxWTy1ujmEL2riMDvi7EzHRwr1NlITj5wiMWgjGFHgHETUvW?=
 =?us-ascii?Q?K6cJlZ3w3tczXSHSe85h34LbOWz9F0/ikS1XrbMDntk7OjmCe1kUsU796fPZ?=
 =?us-ascii?Q?8AX3cq6qiAF7gzqIK8jf5YEDel+NUaByVopox1LhSo+vjYn5sCh+37RTanvz?=
 =?us-ascii?Q?SeJi+bV0rvIX4BEncu4WAeqp4tYqLH2+wGbJTDPbVq07umwvlwANFQSKRIp2?=
 =?us-ascii?Q?GHindLTpzTWWqp61MD3j8h91VC+fC6yl+fOBsnfPvy0pUs4pWfU3L3ScXw37?=
 =?us-ascii?Q?VdUHDzZT7A=3D=3D?=
X-Exchange-RoutingPolicyChecked: brm0IPuQpeRL920/35KSezqBUwRwUheHw/UMMjHPa7IWp/2L3q+0cpj1VBK1h83OT7l2t6rOk8BpUUC6KcQeTEOD4iEpm2aFQW6NLkK20Kc0F7nTxgytGs3TPX0tdRKenRSyltr7Cs5Wpsg+om0Ma4yZ2tuhnUQji3C56zke3fuKx6iFqFPaG3LAcTn9gguxHeDDwogy8KS6QxUUxb89RSAhC2+0NC3ldqD79Ny51LvHWuAGbczrLiDruk7j2uIccmJxGaiammMQqdCzZo7nEgrSVLFahE9OC0X0MDL+wNaU/2f24XzfS0jOxACLUH1B6u+6rVSvEPnVqMIRteJ5CQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e229633-9efc-4c57-e1c4-08dec7048efc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:25:53.1032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kK/RVlvi9i0Wn5gt3iO821LDYU1zFm/ys2Q4+YCVELKoOzt51OGagzouHEDZ0bg7ac3PZLBZr9C8SLss1+rd3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4843
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

A job that GuC never scheduled (never started) indicates a GuC
scheduling failure; previously such jobs were silently errored out
instead of triggering a GT reset to recover. Trigger a GT reset and
resubmit them, but only when the queue was not already killed or banned:
an unstarted job on an already banned queue is the ban working as
intended and must neither clear the ban nor kick off a reset, otherwise
a banned userspace queue could be resurrected and spam GT resets.

Kernel queues are always recovered this way and wedge the device once
recovery attempts are exhausted, since kernel work must not silently
fail. A started job that times out on a userspace VM bind queue stays
banned rather than being reset and retried.

The queue is banned early in the timeout handler to signal the G2H
scheduling-done handler so it wakes the disable-scheduling waiter;
without it the waiter sleeps the full 5s timeout. When a reset is
warranted the ban is cleared before rearming so that
guc_exec_queue_start() can resubmit jobs after the GT reset - a
still-banned queue would block resubmission and cause an infinite TDR
loop. The already-banned case is gated out before this point via
skip_timeout_check, so it is unaffected.

v2: (Himal) Do it for any queue type, not just kernel/migration
v3: - (Sashiko and Sanjay): don't clear the ban / GT reset for already
      killed/banned queues on unstarted-job timeout
    - Update commit message
    - (Matt) Add Fixes tag

Fixes: fe05cee4d953 ("drm/xe: Don't short circuit TDR on jobs not started")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Assisted-by: GitHub-Copilot:claude-opus-4.8
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 49 +++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b29cc08e6291..e82018445b7c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -157,6 +157,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
 }
 
+static void clear_exec_queue_banned(struct xe_exec_queue *q)
+{
+	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
+}
+
 static bool exec_queue_suspended(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
@@ -1363,7 +1368,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
 			   q->guc->id);
 
-		return xe_sched_invalidate_job(job, 2);
+		/* GuC never scheduled this job - let the caller trigger a GT reset. */
+		return true;
 	}
 
 	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
@@ -1460,6 +1466,21 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
 			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
 }
 
+/*
+ * Recover via GT reset for a kernel queue, or for a GuC scheduling failure (job
+ * never started) on a queue that was not already killed or banned. An already
+ * banned queue must stay banned, so its unstarted jobs do not clear the ban or
+ * trigger a reset.
+ */
+static bool timeout_needs_gt_reset(struct xe_exec_queue *q, struct xe_sched_job *job,
+				   bool skip_timeout_check)
+{
+	if (q->flags & EXEC_QUEUE_FLAG_KERNEL)
+		return true;
+
+	return !skip_timeout_check && !xe_sched_job_started(job);
+}
+
 static enum drm_gpu_sched_stat
 guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
@@ -1608,19 +1629,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
 			       q->guc->id, q->flags);
 
-	/*
-	 * Kernel jobs should never fail, nor should VM jobs if they do
-	 * somethings has gone wrong and the GT needs a reset
-	 */
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
-		   "Kernel-submitted job timed out\n");
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
-		   "VM job timed out on non-killed execqueue\n");
-	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
-			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
-		if (!xe_sched_invalidate_job(job, 2)) {
-			xe_gt_reset_async(q->gt);
-			goto rearm;
+	if (!wedged) {
+		if (timeout_needs_gt_reset(q, job, skip_timeout_check)) {
+			if (!xe_sched_invalidate_job(job, 2)) {
+				clear_exec_queue_banned(q);
+				xe_gt_reset_async(q->gt);
+				goto rearm;
+			}
+			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
+				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
+				xe_device_declare_wedged(gt_to_xe(q->gt));
+			}
+		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
+			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
 		}
 	}
 
-- 
2.54.0

