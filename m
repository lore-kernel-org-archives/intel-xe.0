Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F99CD37A7
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 16:20:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40D410F20A;
	Thu,  7 May 2026 16:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwU1c0Tc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857B110E0BD
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778170826; x=1809706826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+f51F5KUautzIn9eEhXUgyrTlqf3O6WrktzLrPmm5Cg=;
 b=dwU1c0TcDbOgO/ljaqNKNzK79MN8R5KxZzAojBtoHW9Mxnb0Pc6S64KT
 k7py6tNGAUr+TgVCBOAQDiewcdgzU5No4zdVUU91yEO5vTAhAFLZKe31a
 F0MFh3kAsW7LgpPboYQhxpYipc0eZn9oGVRBd4Ibrn3JydupD7+6TMerg
 cyiNPB3IOfD7RBpC8BeefHoj/+QAr3SiKZU2OUsOTJPzmFRv9X2tEmuwn
 NJn6xPf2iWqBDIzXux6FGj5vxUjScc4qnmQc8S7vgWLZIMJfhqpUPkKHO
 lwQ5dS1s0j1jt7ocjklpKFmlZtOZPVq/mIFi3NMxJH7yMsR38NttGLyX9 A==;
X-CSE-ConnectionGUID: l2iQuhOfS4u8t6+IHRJNEA==
X-CSE-MsgGUID: I8ohbLbIQ4+24mBBpGWgMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79063609"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79063609"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
X-CSE-ConnectionGUID: vAKLOxSPSPmazu89OJgpWA==
X-CSE-MsgGUID: X4tPK5USQ5q+xO6YmRFerA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="266876592"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 09:20:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v5 10/11] drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job
 timestamp for multi-queue
Date: Thu,  7 May 2026 09:20:27 -0700
Message-ID: <20260507162016.3888309-23-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
References: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Each queue in a multi queue group has a dedicated timestamp counter. Use
this QUEUE TIMESTAMP register to capture the start timestamp for the
job.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
v2: Use xe_lrc_is_multi_queue for check (Niranjana)
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index cfeb4fc7d217..39a670e91ba7 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -269,8 +269,12 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
 static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
 			       u32 *dw, int i)
 {
+	const struct xe_reg reg = xe_lrc_is_multi_queue(lrc) ?
+				   RING_QUEUE_TIMESTAMP(0) :
+				   RING_CTX_TIMESTAMP(0);
+
 	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
-	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
+	dw[i++] = reg.addr;
 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
 	dw[i++] = 0;
 
@@ -281,7 +285,7 @@ static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
 	if (IS_SRIOV_VF(xe)) {
 		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
 			MI_SRM_ADD_CS_OFFSET;
-		dw[i++] = RING_CTX_TIMESTAMP(0).addr;
+		dw[i++] = reg.addr;
 		dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
 		dw[i++] = 0;
 	}
-- 
2.51.0

