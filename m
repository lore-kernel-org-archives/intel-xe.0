Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF95C636CC
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3C410E0A4;
	Fri,  3 Feb 2023 20:24:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967F310E0A4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455883; x=1706991883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3KBnuD5W20zoggSO7/zW2AuSC+XB1MR71qsQJNxmTyM=;
 b=NgMzXLLf7k3OSa+pZkK0AT1h1gHB2pREFy5Xhj9JmeT3bPIBUrFz8+nZ
 fmcthbe+driqIZLDJpY6CAkngUjQaL6I+694KCizetGDa/nXitVsRYEkm
 xWKKMPBCM3QG/Nc+KULjpneg5qImIbadzERrhV0JlHQBEUbVVCJCmLuGP
 GRiWJydGW8KWzd/R584bpUBhN1AW0e9OfoVF+B/CHZ0iuJZ4x0K09SV7b
 5+Z62bIEGqZaCF3otItR0fE3ddl9yJtNEzyY2M06RK+ePNAWvZzyo4lAs
 NgjRMMIMQwE+LOsUnsdA/huMSPfRuoMeejDiL7b05Cu/GhM8Xj9vPfYQE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="327483431"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="327483431"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:24:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="774449918"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="774449918"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 12:24:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:24:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:24:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Huc6YikIP/dneELWyu2Jlgc7N795MLrAj+CqBIllwoesvb34HoP74MPFJoefetZtOWHqtqT0Qp9lhu9xlazDHt9Jr7eqXN/1h4dKXQE08xhVBFAfMMr1DynMF3MZalqYo0rOsZpHqXvRXz9oTvcwm4Tlq71Sfl23FCq9ds6eoboyZ3W61RH0OG6dFCSZMJC5vSoZ7lVVtKy/jft8B+mJQCI5WwoxVkYFOdsd1Xj9PZB9EKrwbjn7PY3ER7xFNdeeo7xgoR1Ny9A85aMNV+8eVIJiRyjVGrfjbYcYkkDI12N6Ee88AL+3AiqE7PIlLTMRT+guU0MEjY7OJPCQEm11uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkxqUxy5oNY3Cle/UJsqvrknkXo7b0paHWscjdgnUHY=;
 b=me59qDBtA2busgtpasrLuDIDN3UwB4VkvZLx9phGDeTrtgUMKnNVPz0ivIR26mePxTPAJwlMRsG9tot0lrO5P9tuGYj5WHZZRJ9MRsqHBYYUDKukpaz15jT+Ojhub3WZkcpKU8aM3m0iaeGVYEGnMd4veuDh2Rep+E9c4N0S4wBRpI73GTSgvzIKD7FRwg1JeQNuvKWU1g0yuq9JgigLk9L7PAkluRKv9f3C93DfjtKWAa6dVtZY3Gh6lBGR4w91M5RAHi/cK03RYnqo9/y6Pv7UFBNyOAjzXe0WCL5dLcw0ZV5+wDtA9CQjRfkCMk+fOYmYasIAAPC+kp/MJplAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5817.namprd11.prod.outlook.com (2603:10b6:510:13a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 20:24:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:24:40 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:23:54 -0500
Message-ID: <20230203202409.577032-8-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:74::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: a22a56b3-3a31-4a64-9d7f-08db0624ad87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljxJWkG2hxXPmwE8/etVfoycYIc8fA5ZOk1VWASPb3OojxGrFfr8AlsSpKo0wFGHNmotGm9Ek83WLrNdr8W9hgJmEonRDPw/a58wJZLnK6ZSdCem8wtc2yzDHSH3GRSEiZ6X13wKHFRO7NzRDa4vaY+klNpk2xIPIHh8wLq3eF3NcS7uWdpExdYt+ABsnIX0rgwCvRgS32gdlgDC9bYuqw7CMl4Nv3jndKo13nXiYpFS1al9qQN/C+POgNdjHmgIJTEJyBp3cdpDRro9SIrR0J0lnuZdfzYKfrF+ah6jXmf5n5NpM7g2+ZuvgSF77vFG77SMNFSZCu+G938RuwbE2DxYBnDoTCem5LwlXXMAz+3w4tkN6FurlbTXF2muUZeX/5rK81wx4+MZ31O7d8B9mS/7qAxYUdtqU7mB4C8X5COv/lL0YOOSeDTKKCcOFTduG+h7ezg2TQsPrtNdIE1iETAdOsVerCX9QlxTO0spPQqvlJsne/cAx23NU+4d//0+DbsrR0wHQfG47QJhUGPkNkI6vIwSy9bdEaOaR9J9REFrhVxqL1tmcL3TfIl/5CTxGsAmFVcceHGS5lwPb3y1rLa7cbduF99aFJV1RJkOhZwf83vylHH7Hi4yIXaAajHoqtGW9FmwoSKuwJw5jQNp6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(6666004)(316002)(4326008)(36756003)(6916009)(66556008)(54906003)(8936002)(66476007)(8676002)(5660300002)(82960400001)(66946007)(38100700002)(86362001)(107886003)(26005)(186003)(1076003)(6512007)(41300700001)(6506007)(2906002)(44832011)(478600001)(2616005)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AdovDAg9g158WkpTCI33bH3sgJBDVZaqPLS4GqfybZrynedTwY3FuogCPVLX?=
 =?us-ascii?Q?bhAi69BKL54P9OvgWJo0cg+4SnzKCEb4pcAMAEsxEl2a/TR+7z+fv4U3zw/3?=
 =?us-ascii?Q?Uqz/qMHGZsq7oEWUJCfjT41LqsLfA84PPvhH/diHQ81/zd40FIJ1uC0QMAGK?=
 =?us-ascii?Q?cCOznOnjrfCOy3ZffSEEOQVJ1AfagRNCJ9v5vVbNVHtN+pGDaILMTfbZ64bH?=
 =?us-ascii?Q?0+gnLMsvF6xDcercBZmxNyOiw+Zy3EtkcMpPT3ufq16z3GqzVz6MVXArT5YZ?=
 =?us-ascii?Q?BxxGbDDtspitHisOWayTqEMC4nz/nSm5ydqSdAt6/XCBl0ru3+fcdTtMubAN?=
 =?us-ascii?Q?DMTalPvzoG7ykpTmqRnlVnc2uRAGh8n2lK7HqX6O2SYvmRN+/I/3RY1A/05S?=
 =?us-ascii?Q?lTYPhdrB0ARVl+GcYF+P8OsIOJWMq01/9fBhKk6H13pzkpp1IYehORGLsfQr?=
 =?us-ascii?Q?EIlJ10K1nKzzCFmKUSyd3mSQky1hxYBd5tKLau55BGE2qoSB1uVF267h6YDT?=
 =?us-ascii?Q?qmDLY+67pr9oMn20txFHCu3Xr/3iuISjlX88pLUhEmzi7Cfc9dP4atQlONHR?=
 =?us-ascii?Q?e5uAL3VqvyryqHSEUK06AvcvSyInrcsWJYjE+r8yy8tlKx3y++xOFrnTifnd?=
 =?us-ascii?Q?35UavuRCIPvW0upU7mMXeBTXAPnYyCcDB72iKpHMW1QcHvqn6MJ/UrZlVc1S?=
 =?us-ascii?Q?Oeixb5THEdyrMUHTW5/g4gvF2ERjWIZch9kU7dymT0dgEiWQmtvBizcz8y7j?=
 =?us-ascii?Q?QAzTB3J/cuv/YkgwGoK7YwY/ERTmtSdLZc0ZIsq1SGymsmk8CeME87zIZj5L?=
 =?us-ascii?Q?JsXFUtuLXHJz8HfJZXqV0D7G7fIMyNh6zxULhOvi1ObMlxcU4eW97KGu6cfi?=
 =?us-ascii?Q?RWVgohGlJPyyuI6pk7i6JtaAN1xg0LvOuV0r1zKJcMxzxHMFXHIFwOGebhsn?=
 =?us-ascii?Q?biV2OO27BQ5Rgq2Xel5GQS1sNo0XrafOyJ+SYRaduUMHfuUkEYQmi0U5/Pzv?=
 =?us-ascii?Q?X78bXDsOWYTbcW0RvXWux8sAg/D2uYVMFEqNY9TN5PGJ4z0dZgpDLOyz0HqY?=
 =?us-ascii?Q?hIrYrOoTDwbOEsspQt+Vkul4FdvTi7cYblk978KiBJzfIDSsCcQEJ0NuU4bu?=
 =?us-ascii?Q?8/qa+jF6bb4u64CMwbpofDQI3jRURiBsX1kF1/tfxwSUZNGaHIP/sUMBivVi?=
 =?us-ascii?Q?QBYASywSXPG67nLXqoxAzY1OrE5G1nRP4+k63pfq6Ms7W+166dCPUSM4R9tf?=
 =?us-ascii?Q?mxR1KrNLwG8946eXFX6t3V/uLvgXKVZmahOUW68/vJrBWgES80e/MyPECUKq?=
 =?us-ascii?Q?wrM1qkZmhWL5bM334BvSx9WsOURwrcgbC5XaGCxp/pXxvUsiS98YEYATcJ1O?=
 =?us-ascii?Q?90Q2r4nQPtP5tdLcgnwpr3jwWR90PdjgWCtitfE/Kdtl4xFKjiyyCiCZ6g+i?=
 =?us-ascii?Q?OdixP6qZVGCQ+JrapbTfyYolmvHTikvnHt3FOwlnvKPulM2wlxrmcl9WYaWi?=
 =?us-ascii?Q?HJ/lG1QdOvJrHJsPdMtWf9V8X1ssjs99rDTTDe2omWs5c8dS9G7eMYDf9qY6?=
 =?us-ascii?Q?PjaFfloIn1rzOAM6fXaJwgYPnKhpVCROdbR+pvDuroihzI+A61+ZeFXf3xe8?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a22a56b3-3a31-4a64-9d7f-08db0624ad87
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:24:40.5317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZ/cDifYUBkqERfY7vm4kl6i3FRI59bOZ889cXS+J74eIRvUgzhhLPdMM01GgF1TKCO/L8KNyhhm5EjpRmsl9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5817
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 07/22] drm/xe: Add TLB invalidation fence ftrace
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

This will help debug issues with TLB invalidation fences.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  5 +++
 drivers/gpu/drm/xe/xe_pt.c                  |  5 +++
 drivers/gpu/drm/xe/xe_trace.h               | 50 +++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 1cb4d3a6bc57..4d179357ce65 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -7,6 +7,7 @@
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_trace.h"
 
 static struct xe_gt *
 guc_to_gt(struct xe_guc *guc)
@@ -82,6 +83,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		fence->seqno = seqno;
 		list_add_tail(&fence->link,
 			      &gt->tlb_invalidation.pending_fences);
+		trace_xe_gt_tlb_invalidation_fence_send(fence);
 	}
 	action[1] = seqno;
 	gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
@@ -194,7 +196,10 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	fence = list_first_entry_or_null(&gt->tlb_invalidation.pending_fences,
 					 typeof(*fence), link);
+	if (fence)
+		trace_xe_gt_tlb_invalidation_fence_recv(fence);
 	if (fence && tlb_invalidation_seqno_past(gt, fence->seqno)) {
+		trace_xe_gt_tlb_invalidation_fence_signal(fence);
 		list_del(&fence->link);
 		dma_fence_signal(&fence->base);
 		dma_fence_put(&fence->base);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 3a1a7145effc..2e33d9eaf550 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -14,6 +14,7 @@
 #include "xe_pt_types.h"
 #include "xe_vm.h"
 #include "xe_res_cursor.h"
+#include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
 
 struct xe_pt_dir {
@@ -1497,6 +1498,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 	struct invalidation_fence *ifence =
 		container_of(cb, struct invalidation_fence, cb);
 
+	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
 	queue_work(system_wq, &ifence->work);
 	dma_fence_put(ifence->fence);
 }
@@ -1506,6 +1508,7 @@ static void invalidation_fence_work_func(struct work_struct *w)
 	struct invalidation_fence *ifence =
 		container_of(w, struct invalidation_fence, work);
 
+	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
 	xe_gt_tlb_invalidation(ifence->gt, &ifence->base);
 }
 
@@ -1515,6 +1518,8 @@ static int invalidation_fence_init(struct xe_gt *gt,
 {
 	int ret;
 
+	trace_xe_gt_tlb_invalidation_fence_create(&ifence->base);
+
 	spin_lock_irq(&gt->tlb_invalidation.lock);
 	dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
 		       &gt->tlb_invalidation.lock,
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index a00d4b210c3b..373b0825ec79 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -15,10 +15,60 @@
 #include "xe_bo_types.h"
 #include "xe_engine_types.h"
 #include "xe_gt_types.h"
+#include "xe_gt_tlb_invalidation_types.h"
 #include "xe_guc_engine_types.h"
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
 
+DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
+		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+		    TP_ARGS(fence),
+
+		    TP_STRUCT__entry(
+			     __field(u64, fence)
+			     __field(int, seqno)
+			     ),
+
+		    TP_fast_assign(
+			   __entry->fence = (u64)fence;
+			   __entry->seqno = fence->seqno;
+			   ),
+
+		    TP_printk("fence=0x%016llx, seqno=%d",
+			      __entry->fence, __entry->seqno)
+);
+
+DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_create,
+	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(fence)
+);
+
+DEFINE_EVENT(xe_gt_tlb_invalidation_fence,
+	     xe_gt_tlb_invalidation_fence_work_func,
+	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(fence)
+);
+
+DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_cb,
+	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(fence)
+);
+
+DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_send,
+	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(fence)
+);
+
+DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_recv,
+	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(fence)
+);
+
+DEFINE_EVENT(xe_gt_tlb_invalidation_fence, xe_gt_tlb_invalidation_fence_signal,
+	     TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
+	     TP_ARGS(fence)
+);
+
 DECLARE_EVENT_CLASS(xe_bo,
 		    TP_PROTO(struct xe_bo *bo),
 		    TP_ARGS(bo),
-- 
2.39.1

