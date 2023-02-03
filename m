Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFC4C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9BC10E09C;
	Fri,  3 Feb 2023 20:24:53 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BCE10E0A4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455892; x=1706991892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3uaO+Yj3r5oSexDbRzgaELaUdRPsBoF3AdPuo8iyjSA=;
 b=MOFM2SEj7pco6wJGENGUeHCpglgnAL4snNJD+mC8Ib4ix5pzqvEs0yv9
 bse3aVH/GALL8KJSQeLUOqL0nl1JmFWQNUUb96u+O4GOD3T0ZQL2IdOoz
 5s614UY3vzbaUhU/QNQGk6dVhbX562YkJcB9JVbS7qpyjVCPMHxkxBfHy
 aIYbHzqrS7ZKvCdPDJ2a7cTwKByTe9Xtm6u+k7C3aRwfUXhC4NwvCjqMD
 TiqoXlZK9bihjI3dIpfftZt5DtTqPhFkUezAOJhAYFRSPJ24pIKIaMJL2
 5Tb9k+vhA1hF2CJ1mEGv4JTWFaWsFwhX4cQfexIe364SjJzhtCBSk9h+f g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330975797"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="330975797"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729376824"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="729376824"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 12:24:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:51 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQG7qxpiHSoHxfUMpzQvTnSI8McHfoYup+aJ7cQLcKsicl3EeiQ1OHjEWzPE8ACY/vyCiSomQm1RcZhWfDkN+UAQ28KhBFxGo9za2t/8QUeFE3mzRETEx8IvajIZKguVQxNKB6koa3QQ26qk5hac3U3Vz0s1rKDdX8zBm/sx6lyNtxBe8fQyxXVj3xkgybnxADjAzBFA3CIKumHRFgj2QZ7LJ9wslxRT5BMPdGt1vs8GIYlyqgYLXPC1c3kas6w9ZiJhU0XPpovb3BvfAzQ2MFZpxlqkm/afVYJE7R3L5J7Q+HaJ7LESa2mxs4Q1BMFShOoWA33hf0V+iNJA3njO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtS3NTl25bOtTGhS7jodk9CbP8VWclvg2vlxPY1UIDc=;
 b=QXJSBTC79ekfZO6iCuBS2Ksz4gasRXD9HptLQwx1oA5ONIqltP3/lz3j9xs9c3zPLqE84PuwNWLL7t+DkLEx6JSg05vo1GbJ3bFKrUGANNfZVzlva0XaFJkcT9cWmb+1c8DCOQLQfXGq9dw4tgoovOm15NaHm/eoKl2ykOJX+R1sBRhq4tsWYDA4oGz7XOVmMufcbYyDTht+XFlcrf2k+EBl5eTIFra9x3SIUE+ggUpOYCf69fY4Me+So1NE0zE0y7OQ9To31Dr4DmR1FugZba46OtDjAtykywhP8CBsSvJZjNaZg+Pafv+zk1CorRHwWq2oKtkqUoIyyDdQihBC3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 20:24:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:48 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:56 -0500
Message-ID: <20230203202409.577032-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: ad43a2e8-5191-4587-32fc-08db0624b24a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +lYmOke+fNbHp+M1fOHMWKuztB4kcQUloP++L2bUkfMa0NTqlt54Oe6F6nQSpxNsxFTIr4/cWNp9AJleVgBxZpYJFmKD7+PWFZ2CFgvhVGKdP5ZHO88mybODcUV1s43ZXpMKeDgwP6z4+G2pqPtMER0M1e03dqT1y+gGCplvLy1TRTl7q57SOjRSuqNc7/azEBjW57OulW66ydRLByTowszvdhUGOK4WTxUGJEREnPO1SvYpULwkufuUHyQRJ/1fHg+vt/sZeA95fGT7G1iy7BQUZI5IX0Z7jXNmdE3mRFB3jrqr694Q/uVA6/7zDAcT0Zu2ZrVSRajVU0Wv1AgQ7h0oRE205LOSK1CoZtedj1QlecVbdeYXG9gAN8cQHVylS0iDNx6iCpf12tj2dadY5tfCNEzeWoyJ9XsTmGCOtRA5yH405h1yXa0W+LaEEAfUnqduaEbO6d7ByTakfausikgbjExlTOLyfeSmWc1xjsAVANRWiBOwGgpUnz5u0hhaS6ivnjG8WgQJoJIHqCejAoXKDq0XbTT7G1c6VB9O7yU7vUQqO0YsgRW5ocJqlgBqRjiVAGSdk7WszSc9quS4zWsqLcFBRybN2XZwsqMZ7SHX8YQWhGR8JG3LY2L64vqMznRU8zZ1o05rrJvBf8c3Jz1css7l4qt57kSFjJilr9SWdAOX1f9Q93jQrfQWCDuE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(82960400001)(2906002)(186003)(6666004)(6486002)(107886003)(6916009)(26005)(478600001)(6512007)(66946007)(316002)(1076003)(6506007)(54906003)(66476007)(8676002)(66556008)(4326008)(41300700001)(44832011)(5660300002)(38100700002)(8936002)(2616005)(36756003)(86362001)(66899018)(83380400001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pPA0iIzgCD6AVqftoMCM03dREkPeh4tsO9/TcQsfFqn9eJSqB7j+AvJ3oUKU?=
 =?us-ascii?Q?/JPDvEvaH/UsdEzXsBMFbdfEr9wPShK/pvejPmFwXXDAWCYM/dH8sT2Wo0rY?=
 =?us-ascii?Q?FeQWdVVi3eUGJEdvXG/Okx4Uq8V6kEv0P858ha5r6QjSooydUyQpHks4eCYD?=
 =?us-ascii?Q?/kLNcgwgDamsZ6hw9qxqHZMoMelQUS8u4UF3hjqLGVw5sLUwNHoKhMYNzMRh?=
 =?us-ascii?Q?9lrGg9UntX6X0VFiw6aQbMOrdGf7yexfazM8E4gx6jE1EILATAQq6y2ABZRB?=
 =?us-ascii?Q?gqXFeZgJaOnZBeI0JB14LzCbMNr81B6vydFmQGUfHrZmrfIimwmDC4oUNLNU?=
 =?us-ascii?Q?oV4DOR6ghsSs7v0VnsgpuGqyn5Zhkx40KnzVIKKdFBvpV9yzYxkI6mwNBqYV?=
 =?us-ascii?Q?/ad3SW0csw8pJIDmHJNGosRKyQwBNgghCTBka42rbTcPcmskkxOuhsx+xj9d?=
 =?us-ascii?Q?ioDG3urP4THL5MQ+HwjnLBRMzvhsKE2GhpAC/qQF6bHtRth4CsNgTKtzxrnA?=
 =?us-ascii?Q?yqsHhEl1CBcqF871nmINYXU3h65QzEP47VEBfNBCOQCM9TFq64bBP05aUWMz?=
 =?us-ascii?Q?uiO7MjKfuKRI5i09HkJhazukQJc9sJXySHIhia8vCJkpGxStQvCMr+bfsf4L?=
 =?us-ascii?Q?dv36phr6eE0WLFQSq5MTUHyP579zQeVkcpRmUjU4TYmlhuIOS2KKONEhCu52?=
 =?us-ascii?Q?X+bZQpuiwqwOYNkrGXv65ZwAQ/IFjUOS7gBaUF7lvh3if7mzJoZ9OCkWzmrI?=
 =?us-ascii?Q?XKE3oMkrM98X6/AW96FE90k1CuvaNH11RrDwEpBOjvN7Z/OJIomePDOOZWjX?=
 =?us-ascii?Q?XAE1Hn67irFeo3ZmZ4gZOgJgJog0DBVjsqw307DNQfbkziSmRgRAOjApOH2x?=
 =?us-ascii?Q?0lGJn2joWS/8mU8pGlh5hYi2AgetuDohKY3mvYvD4ufXWgXIDWUEyrAjx8a+?=
 =?us-ascii?Q?vngPH4qh0munbwsQ7RkOtSjm5f9cVvEKkGxkHYQ8sVW4htUk0oxPmOm5WWly?=
 =?us-ascii?Q?1a53MKnnuYp2Mnobcfo7m6Rn3t189dcwhXdGkA/t/0+M/2xmj4p9VS/1lTZJ?=
 =?us-ascii?Q?bZ40TtjRavHdowo34j2mX+24Ec/gcyrBZSQYzRs9LuSm6lG6VqIWOIROHeTe?=
 =?us-ascii?Q?N3ZXTdsCvVuC1zy2LMSVa0hyFmDv+qbtp/kgSI0qYv48392LaBwIcDC1uqGe?=
 =?us-ascii?Q?70j1Yo2bAP0aj3Tq18IKI2Ra7MUu5zjEJLp7ENXKYUnrJZAq9Z9rO/F2PjNL?=
 =?us-ascii?Q?j5YjWLPNxBoAsD0bDf3Pd7AfXbfnUG1rr6lBTH1YDZAR1YSCAtbfjT0MmaEG?=
 =?us-ascii?Q?Ehj6pJgm4XDV5o7XubB5t4jcGjBYe+Z+aL+oFQly7pf4NQS52O0C8t0SUVtc?=
 =?us-ascii?Q?1fa8iV/E282FWf+VBpSQddSCPDEgd+Xu8jPse+f/QO+RM3SFm2xph1vy2RPX?=
 =?us-ascii?Q?F4AIx65d+YcjCbujZpVfXLskjQSRFhtV43vfIC0VfZWmLbvS8g1HNFZ5+X4u?=
 =?us-ascii?Q?kMqm3whSGAmE9dMbX9QnRPtp1TI4Z1+MJSJ6HdbyuH+EDq96DXDptRKe+9um?=
 =?us-ascii?Q?+swbwbtjQU9p8OXs811d909h3hwMwKPD7HYg/BM/L9z8/D/2m0IYVrAgIcvg?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad43a2e8-5191-4587-32fc-08db0624b24a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:48.5040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAjTUVc4rfrKXtugZbbzg2AB4CSD0uGxWsZZcm2EGfo5a+ptYT0bK/XgGDhdpvvZRFy+4vIpUXIHX6WMETX9YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 09/22] drm/xe: Add TDR for invalidation fence
 timeout cleanup
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
Cc: niranjana.vishwanathapura@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Endless fences are not good, add a TDR to cleanup any invalidation
fences which have not received an invalidation message within a timeout
period.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 58 +++++++++++++++++--
 .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  2 +
 drivers/gpu/drm/xe/xe_gt_types.h              |  5 ++
 drivers/gpu/drm/xe/xe_trace.h                 |  5 ++
 4 files changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 4d179357ce65..9e026fd0a45d 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -9,12 +9,45 @@
 #include "xe_guc_ct.h"
 #include "xe_trace.h"
 
+#define TLB_TIMEOUT	(HZ / 4)
+
 static struct xe_gt *
 guc_to_gt(struct xe_guc *guc)
 {
 	return container_of(guc, struct xe_gt, uc.guc);
 }
 
+static void xe_gt_tlb_fence_timeout(struct work_struct *work)
+{
+	struct xe_gt *gt = container_of(work, struct xe_gt,
+					tlb_invalidation.fence_tdr.work);
+	struct xe_gt_tlb_invalidation_fence *fence, *next;
+
+	mutex_lock(&gt->uc.guc.ct.lock);
+	list_for_each_entry_safe(fence, next,
+				 &gt->tlb_invalidation.pending_fences, link) {
+		s64 since_inval_ms = ktime_ms_delta(ktime_get(),
+						    fence->invalidation_time);
+
+		if (msecs_to_jiffies(since_inval_ms) < TLB_TIMEOUT)
+			break;
+
+		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
+		drm_err(&gt_to_xe(gt)->drm, "TLB invalidation fence timeout, seqno=%d",
+			fence->seqno);
+
+		list_del(&fence->link);
+		fence->base.error = -ETIME;
+		dma_fence_signal(&fence->base);
+		dma_fence_put(&fence->base);
+	}
+	if (!list_empty(&gt->tlb_invalidation.pending_fences))
+		queue_delayed_work(system_wq,
+				   &gt->tlb_invalidation.fence_tdr,
+				   TLB_TIMEOUT);
+	mutex_unlock(&gt->uc.guc.ct.lock);
+}
+
 /**
  * xe_gt_tlb_invalidation_init - Initialize GT TLB invalidation state
  * @gt: graphics tile
@@ -30,6 +63,8 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
 	spin_lock_init(&gt->tlb_invalidation.lock);
 	gt->tlb_invalidation.fence_context = dma_fence_context_alloc(1);
+	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
+			  xe_gt_tlb_fence_timeout);
 
 	return 0;
 }
@@ -44,6 +79,8 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 {
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 
+	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
+
 	mutex_lock(&gt->uc.guc.ct.lock);
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link) {
@@ -67,6 +104,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	};
 	int seqno;
 	int ret;
+	bool queue_work;
 
 	/*
 	 * XXX: The seqno algorithm relies on TLB invalidation being processed
@@ -76,10 +114,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	mutex_lock(&guc->ct.lock);
 	seqno = gt->tlb_invalidation.seqno;
 	if (fence) {
-		/*
-		 * FIXME: How to deal TLB invalidation timeout, right now we
-		 * just have an endless fence which isn't ideal.
-		 */
+		queue_work = list_empty(&gt->tlb_invalidation.pending_fences);
 		fence->seqno = seqno;
 		list_add_tail(&fence->link,
 			      &gt->tlb_invalidation.pending_fences);
@@ -92,6 +127,13 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		gt->tlb_invalidation.seqno = 1;
 	ret = xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
 				    G2H_LEN_DW_TLB_INVALIDATE, 1);
+	if (!ret && fence) {
+		fence->invalidation_time = ktime_get();
+		if (queue_work)
+			queue_delayed_work(system_wq,
+					   &gt->tlb_invalidation.fence_tdr,
+					   TLB_TIMEOUT);
+	}
 	if (!ret)
 		ret = seqno;
 	mutex_unlock(&guc->ct.lock);
@@ -152,7 +194,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 	 */
 	ret = wait_event_timeout(guc->ct.wq,
 				 tlb_invalidation_seqno_past(gt, seqno),
-				 HZ / 5);
+				 TLB_TIMEOUT);
 	if (!ret) {
 		drm_err(&xe->drm, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
 			seqno, gt->tlb_invalidation.seqno_recv);
@@ -201,6 +243,12 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (fence && tlb_invalidation_seqno_past(gt, fence->seqno)) {
 		trace_xe_gt_tlb_invalidation_fence_signal(fence);
 		list_del(&fence->link);
+		if (!list_empty(&gt->tlb_invalidation.pending_fences))
+			mod_delayed_work(system_wq,
+					 &gt->tlb_invalidation.fence_tdr,
+					 TLB_TIMEOUT);
+		else
+			cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
 		dma_fence_signal(&fence->base);
 		dma_fence_put(&fence->base);
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
index ab57c14c6d14..934c828efe31 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
@@ -21,6 +21,8 @@ struct xe_gt_tlb_invalidation_fence {
 	struct list_head link;
 	/** @seqno: seqno of TLB invalidation to signal fence one */
 	int seqno;
+	/** @invalidation_time: time of TLB invalidation */
+	ktime_t invalidation_time;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 3b2d9842add7..a40fab262ac9 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -174,6 +174,11 @@ struct xe_gt {
 		 * invaliations, protected by CT lock
 		 */
 		struct list_head pending_fences;
+		/**
+		 * @fence_tdr: schedules a delayed call to
+		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
+		 */
+		struct delayed_work fence_tdr;
 		/** @fence_context: context for TLB invalidation fences */
 		u64 fence_context;
 		/**
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 373b0825ec79..1774658b18b7 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -69,6 +69,11 @@ DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_signal,
 	     TP_ARGS(fence)
 );
 
+DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_timeout,
+	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(fence)
+);
+
 DECLARE_EVENT_CLASS(xe_bo,
 		    TP_PROTO(struct xe_bo *bo),
 		    TP_ARGS(bo),
-- 
2.39.1

