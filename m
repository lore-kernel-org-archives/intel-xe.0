Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C13C05027
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FC510E09C;
	Fri,  3 Feb 2023 20:25:09 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835FF10E09C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455907; x=1706991907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=k1dGwWsQTLEqxbdWTwHVY0AebavuIGwlv4A9moHD4oU=;
 b=UnMgPceCjylBfgmiZ8hPVDIN11D4GlFjIG9HqdyqN5+WPvp/8Z3hSWcp
 +hrd/YieTV7Z8K6d3/5IbMJAhEtaU9U368Fi26ZOpy9k5mENnYmZjhzBs
 CWxnG8jA46h3pnzSbncRFMQPmZnjZyZ0vKLjgkw19+KW4cQoIT2gWJsAa
 Ib1nszRnKczoef+jzfk4sk/OoIDmmu/4J7JulYz7KxH7vEh1smQASIbf7
 fQgadC15sRYn81qJnbyKDmlRUaEuJDl+IWR4Fd89gLWxAMIenfn9orPFD
 hPQaq2WxHzhklBxOP7blazOJ4wjH43gM1m7UXFdk2PsK+SQPKgrLN3iGa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312503084"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="312503084"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:25:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="789809046"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="789809046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 03 Feb 2023 12:25:07 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:25:06 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f85Bpv2NouTnQmFiCsUW+9RYE6ldUYKsnbgTZmrj4ROU44Pt+02PQ+emiW+u81gRypUBCDZgOwmuBPYaYgnLWFZJgT5rd+lLDCIw7K6EoEgNrTpO7HaipM30WhDQFNpTN42BHOqWnBrgrZKaX8IV3ZI9RyI3uwcVt8Mtg6U8Cs3xLpngTWG3DVcubwL4/5J1ZsdBLcSUpExjLZ293HIYS1n3shcyd/1pMN8Zh4Z8XuGUy7Rg273ub+Hf+1J+B4LClL9d2nVWzfe1IFOJyrHGmKyPzkk6LEHSuv529tho7iS5VT3O/QSkspI3UfrRp6ttQn5/ynjVBcSGJbMF9uV5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfdRoA88Ln2iu7YT3rvVeN06AgdCsVfmbNIG1EZcAdg=;
 b=QYKCVwX1DU26NPOpLtQ7QpPZ8Gn22jqTW3QU4U70L3BFxQ/xqc1iEg5tFCNoeEivpfF8ee3yqsRQlVArhobeZcvBMnRZSg6mc9yTM5bpX84mFPMJpLfE43Dgxi9t+2RdwNdBsjY/R5z5f9psqHO4ZBZmRPrYSt7ETP1s46ntJiF3WtJXMrJUapWNLt4Cwado7Q0PsZzf8rwDqN91D5pIk6iH2JptJjNpYzoG7glh2pFxAfsS8er6KI0zEVpjG968/lLkxSQxGGzsBJJEt846frnX3kCguy0DaTbI+lwEH2noMs850E76NnFnJO1AMEVfS5qwNFQulBAnb76kXniFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 20:25:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:25:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:24:00 -0500
Message-ID: <20230203202409.577032-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202409.577032-1-rodrigo.vivi@intel.com>
References: <20230203202409.577032-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 15821853-eee8-4760-6c2f-08db0624bb1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NF1u2Th6FqsoEkIAz1o5aZFGMoYT/OVG/Kw+4ri7fzQ37fu8KZULsylpVnXip9/0MwZ37m+K2LD/D+BZozNwgS8LC9W+NLtDUXfE31TPRTNbzgEiZV+NXkdUXoeqeOPq+quBHvNf8O7+8Z78RNbcUN3MKG64xCY1bxuQyl4aO/QLBxIbXhVJQ93lLNctgbhtiGvIo+SVquhGHjWRHkWtfLT7pGn5169WSYVbViGsXT5KwfZ8hu/Ujy7F1bSYR+dgJkObpC/8qWm2hRLw952H45bqyJbTEXIIInwj2E1RqxDoA91zIAJPp83/7XvRL1g99QheBKxbuJX0EVdw8jjJznWG+R0H4gwb03rnQY6UpKUjKCVy8AENNp+sxlnR3MLDKXzW4OI/z/rmPB0yrx3WrDDolJom1HDWzMlxZeYOdH3lcsaUVzYwjh0S5UF7SBomgWwZK3wOX3YMvUhuUeDQNLMfTfFTMxZXvqZ+OA9+NoqB06/fJQEB7vbyiIAVAOnu+wbMKYt6MENlP3Ovh9z2LxhbjbWb2VWr8kB/2tvyETGIo5gkh8wS+FfYEk8BEzFJ4otXjR6RFVjzq3WdSZw0yTMlSA4hL5wjZQEjpBXKiV2ITRex+2DJRUne/5hg+GAWAs+s9GHWzAilW+edvOZPLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(82960400001)(2906002)(186003)(6486002)(107886003)(6916009)(26005)(478600001)(6512007)(66946007)(316002)(1076003)(6506007)(54906003)(66476007)(8676002)(66556008)(4326008)(41300700001)(44832011)(5660300002)(38100700002)(8936002)(2616005)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ASkuWaBVLjLC6sqsJ+pAknqcEYS6dnNrBuE2n+EOfFpV8ItT8WOtioRg+v+?=
 =?us-ascii?Q?WFyui2s1LB6KbRFlUYIXxYtPIbewlcnMHScqwu28xIOfhvXYoEUKMqtd6p//?=
 =?us-ascii?Q?QKcUc0yTjX/z4FQJxQ+BNC6oU8oCdLdSQZT1dEPyFN+RPP2NnhMI99ubSJMC?=
 =?us-ascii?Q?DGWiSJkVT07D5XNIbrL2F5MdHs/kOa042jxLqdGuS1TWuwWMnTP+0ChvhPwR?=
 =?us-ascii?Q?G7GltXnQLU7vSDK/B2pv2r9qwAz95b6PglNiCRtfh2w3h1AXn+5AZMKzSrep?=
 =?us-ascii?Q?Ol9kQ1nM2vWObSLUyPHitel5AimBwClhZcJaMHZQ8IuWrlrEnK4cBsvJ3O3W?=
 =?us-ascii?Q?uiWmSLLtgYZbUhPto7TsKxeq7OheHWBYXIxpIh/bGlDfbjLHQcRX641Rw7RL?=
 =?us-ascii?Q?ko25CML5+SqTWpFcx4meVziil9tIOXDvUgAROPXq6LvbbLrtwiUF9muBkq0u?=
 =?us-ascii?Q?lInvHsG+K1XS4BEsrcsgxZbqEI32ZaMDTFNyY04yhRsMrGCY8S+LLIYvwwHJ?=
 =?us-ascii?Q?fyuO0KEPGXLSLop04U47XlkbNlKUd3kE1UOyra10x79IIR+MGqz89/cza/oU?=
 =?us-ascii?Q?WfZwzQhDvwVUBDxjHUXwAbVal/eGRua/sF2g8xztAtJCs2i/bYrw3hiXyRsm?=
 =?us-ascii?Q?ZO9ubEs/didoU5x/gMbkgRR6ZSkiifY95eqFE2jlIVN3cEirN2dSNOJLTrel?=
 =?us-ascii?Q?YMFu52SjP2XxvhuNeZR6t8tmh2hiZpAUPpx4g276+rkzYDMzcoRToUJLoozN?=
 =?us-ascii?Q?Fp815asgt+jkeTNxTgClJS9QTDmke54oBSbQX9WzucIoJ7yFltj+my2/Qz6K?=
 =?us-ascii?Q?XPknZDljes2/31R4fDSTyhDUiGc95enP1NGIjIdsNv1FK9GRLzYYmz1hicet?=
 =?us-ascii?Q?NIc6UKd57MCcPds8V9UDPXjy/iqx6GE/YvSIaQQU/okcz9oIA4vXjZr4kDF5?=
 =?us-ascii?Q?6jV7kJMYB+PiHD31AslpKoJpYaSwOkrlBQOLzQJEBvzZU4XrJZNuX+Pwnktf?=
 =?us-ascii?Q?k+krjMJ/F5Kz26xsZXNrs1ZcREYrVcSTGwbmQpXfK9e2jM07YMDh6tJ+f/8G?=
 =?us-ascii?Q?aH97XU4Mal2S59C2r2fr5egJNi87VKPqtut/a86IaBWWk1fp3YgPEITgKPWr?=
 =?us-ascii?Q?qXQ8+R6lLq2ScRCIT3KpmwVvHOc87T1merrLUifAeWZnfM0kZmd5V2EeQLqU?=
 =?us-ascii?Q?vGvgMAri4TSXuuWN6z5edts+RjVyKeCa1GgwBcGzQ65CXgK2wyVRac9WoAbL?=
 =?us-ascii?Q?jFBzCwTMQQRFo/sTpktTg4aPYaJYD2IJCNECubOVxyukFbGLHuhor8WL+Pql?=
 =?us-ascii?Q?Hf4JcFKgW6LSkGgAETZ9fxvBRjUi4haXFaOyYKkj1OkCikI/boPG02wVWXNc?=
 =?us-ascii?Q?TTShp+BEXJ785zFCVwpkNFM+inoHkeu0IZoyDfd+C/rpekPMvu6xPp5M2k5l?=
 =?us-ascii?Q?lk4QnLlxWvygGNitzj2zz5NGU7DB02ibUKBvZfqcxez2x1An+oFoPvEerxQ0?=
 =?us-ascii?Q?LimvZycM+eSwSXJTc4yh9EQg+FzlnHAxKSvgKJGOndsmC/H3qFquumjXnzgn?=
 =?us-ascii?Q?JtE+jnNEXSRY7Ncn6chXLGdbxDX9rdj6STPh3iYKyF74WdL+ZJyBO+CcvjWJ?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15821853-eee8-4760-6c2f-08db0624bb1a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:25:03.4949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NJrNqWM3SZlz8gpfNMe8UJPoVIzcyXYOwuDJpg0AoeK7DElLfindxzeewqcb+bSYsxd5b50xtmf9hbWUtCBOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 13/22] drm/xe: Add range based TLB invalidations
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

If the platform supports range based TLB invalidations use them. Hide
these details in the xe_gt_tlb_invalidation layer.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |  7 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 87 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  4 +-
 drivers/gpu/drm/xe/xe_pt.c                  |  9 ++-
 drivers/gpu/drm/xe/xe_vm.c                  |  2 +-
 5 files changed, 84 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 705093cb63d7..e1a5a3a70c92 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -240,12 +240,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto retry_userptr;
 
 	if (!ret) {
-		/*
-		 * FIXME: Doing a full TLB invalidation for now, likely could
-		 * defer TLB invalidate + fault response to a callback of fence
-		 * too
-		 */
-		ret = xe_gt_tlb_invalidation(gt, NULL);
+		ret = xe_gt_tlb_invalidation(gt, NULL, vma);
 		if (ret >= 0)
 			ret = 0;
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 9e026fd0a45d..0b37cd09a59a 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -92,16 +92,10 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 }
 
 static int send_tlb_invalidation(struct xe_guc *guc,
-				 struct xe_gt_tlb_invalidation_fence *fence)
+				 struct xe_gt_tlb_invalidation_fence *fence,
+				 u32 *action, int len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
-	u32 action[] = {
-		XE_GUC_ACTION_TLB_INVALIDATION,
-		0,
-		XE_GUC_TLB_INVAL_FULL << XE_GUC_TLB_INVAL_TYPE_SHIFT |
-		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT |
-		XE_GUC_TLB_INVAL_FLUSH_CACHE,
-	};
 	int seqno;
 	int ret;
 	bool queue_work;
@@ -125,7 +119,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		TLB_INVALIDATION_SEQNO_MAX;
 	if (!gt->tlb_invalidation.seqno)
 		gt->tlb_invalidation.seqno = 1;
-	ret = xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
+	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
 				    G2H_LEN_DW_TLB_INVALIDATE, 1);
 	if (!ret && fence) {
 		fence->invalidation_time = ktime_get();
@@ -146,18 +140,83 @@ static int send_tlb_invalidation(struct xe_guc *guc,
  * @gt: graphics tile
  * @fence: invalidation fence which will be signal on TLB invalidation
  * completion, can be NULL
+ * @vma: VMA to invalidate
  *
- * Issue a full TLB invalidation on the GT. Completion of TLB is asynchronous
- * and caller can either use the invalidation fence or seqno +
- * xe_gt_tlb_invalidation_wait to wait for completion.
+ * Issue a range based TLB invalidation if supported, if not fallback to a full
+ * TLB invalidation. Completion of TLB is asynchronous and caller can either use
+ * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
+ * completion.
  *
  * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
  * negative error code on error.
  */
 int xe_gt_tlb_invalidation(struct xe_gt *gt,
-			   struct xe_gt_tlb_invalidation_fence *fence)
+			   struct xe_gt_tlb_invalidation_fence *fence,
+			   struct xe_vma *vma)
 {
-	return send_tlb_invalidation(&gt->uc.guc, fence);
+	struct xe_device *xe = gt_to_xe(gt);
+#define MAX_TLB_INVALIDATION_LEN	7
+	u32 action[MAX_TLB_INVALIDATION_LEN];
+	int len = 0;
+
+	XE_BUG_ON(!vma);
+
+	if (!xe->info.has_range_tlb_invalidation) {
+		action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
+		action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
+#define MAKE_INVAL_OP(type)	((type << XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
+		XE_GUC_TLB_INVAL_MODE_HEAVY << XE_GUC_TLB_INVAL_MODE_SHIFT | \
+		XE_GUC_TLB_INVAL_FLUSH_CACHE)
+		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
+	} else {
+		u64 start = vma->start;
+		u64 length = vma->end - vma->start + 1;
+		u64 align, end;
+
+		if (length < SZ_4K)
+			length = SZ_4K;
+
+		/*
+		 * We need to invalidate a higher granularity if start address
+		 * is not aligned to length. When start is not aligned with
+		 * length we need to find the length large enough to create an
+		 * address mask covering the required range.
+		 */
+		align = roundup_pow_of_two(length);
+		start = ALIGN_DOWN(vma->start, align);
+		end = ALIGN(vma->start + length, align);
+		length = align;
+		while (start + length < end) {
+			length <<= 1;
+			start = ALIGN_DOWN(vma->start, length);
+		}
+
+		/*
+		 * Minimum invalidation size for a 2MB page that the hardware
+		 * expects is 16MB
+		 */
+		if (length >= SZ_2M) {
+			length = max_t(u64, SZ_16M, length);
+			start = ALIGN_DOWN(vma->start, length);
+		}
+
+		XE_BUG_ON(length < SZ_4K);
+		XE_BUG_ON(!is_power_of_2(length));
+		XE_BUG_ON(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1));
+		XE_BUG_ON(!IS_ALIGNED(start, length));
+
+		action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
+		action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
+		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
+		action[len++] = vma->vm->usm.asid;
+		action[len++] = lower_32_bits(start);
+		action[len++] = upper_32_bits(start);
+		action[len++] = ilog2(length) - ilog2(SZ_4K);
+	}
+
+	XE_BUG_ON(len > MAX_TLB_INVALIDATION_LEN);
+
+	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
 }
 
 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index 7e6fbf46f0e3..b4c4f717bc8a 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -12,11 +12,13 @@
 
 struct xe_gt;
 struct xe_guc;
+struct xe_vma;
 
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
 int xe_gt_tlb_invalidation(struct xe_gt *gt,
-			   struct xe_gt_tlb_invalidation_fence *fence);
+			   struct xe_gt_tlb_invalidation_fence *fence,
+			   struct xe_vma *vma);
 int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2e33d9eaf550..5a3a0ca224e9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1470,6 +1470,7 @@ static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
 struct invalidation_fence {
 	struct xe_gt_tlb_invalidation_fence base;
 	struct xe_gt *gt;
+	struct xe_vma *vma;
 	struct dma_fence *fence;
 	struct dma_fence_cb cb;
 	struct work_struct work;
@@ -1509,12 +1510,13 @@ static void invalidation_fence_work_func(struct work_struct *w)
 		container_of(w, struct invalidation_fence, work);
 
 	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
-	xe_gt_tlb_invalidation(ifence->gt, &ifence->base);
+	xe_gt_tlb_invalidation(ifence->gt, &ifence->base, ifence->vma);
 }
 
 static int invalidation_fence_init(struct xe_gt *gt,
 				   struct invalidation_fence *ifence,
-				   struct dma_fence *fence)
+				   struct dma_fence *fence,
+				   struct xe_vma *vma)
 {
 	int ret;
 
@@ -1532,6 +1534,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
 	dma_fence_get(&ifence->base.base);	/* Ref for caller */
 	ifence->fence = fence;
 	ifence->gt = gt;
+	ifence->vma = vma;
 
 	INIT_WORK(&ifence->work, invalidation_fence_work_func);
 	ret = dma_fence_add_callback(fence, &ifence->cb, invalidation_fence_cb);
@@ -1618,7 +1621,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 		int err;
 
 		/* TLB invalidation must be done before signaling unbind */
-		err = invalidation_fence_init(gt, ifence, fence);
+		err = invalidation_fence_init(gt, ifence, fence, vma);
 		if (err) {
 			dma_fence_put(fence);
 			kfree(ifence);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2b1e79e65dbf..ca2f7d084ceb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3325,7 +3325,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 		if (xe_pt_zap_ptes(gt, vma)) {
 			gt_needs_invalidate |= BIT(id);
 			xe_device_wmb(xe);
-			seqno[id] = xe_gt_tlb_invalidation(gt, NULL);
+			seqno[id] = xe_gt_tlb_invalidation(gt, NULL, vma);
 			if (seqno[id] < 0)
 				return seqno[id];
 		}
-- 
2.39.1

