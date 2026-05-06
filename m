Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E7FCD3439
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 22:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185D810EEED;
	Wed,  6 May 2026 22:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dcqn9Y39";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF9D10E1FE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778106912; x=1809642912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+f51F5KUautzIn9eEhXUgyrTlqf3O6WrktzLrPmm5Cg=;
 b=Dcqn9Y39K0cIFyBDKR+PtSsk3YKjERe+/Oy8j+YPFpSJiJ8MWB0nVvlW
 KRRkRk7fSe/+bC3j8C+y0M3C564qERFN5pnAGV6Y3AcUYeSLRgNC9almH
 1CMoPgGK9pelqnaMIjSyc6Pm63yK8I6rotVessSchnoqjYJOTX0wPS0Gd
 FLQ1Vwzyw8XYaIYAWw5HWJSGcyYvkq5K3EG8+xsmvFoH+t3zqX/ytn5TY
 jIBqa/27jxHudVtT+gHY8sJ3eTZHrMA+FzEF15AA08CHbqOs+hgMlvwaq
 m/9ytUCbZZX3HQXcISa1Uh5nLJA1Cwbj5gXjYv7Sk8rsj9GayHfHMVnBU A==;
X-CSE-ConnectionGUID: 42CIduBMQpuRavhx3du5aw==
X-CSE-MsgGUID: wukpB4WOSJ+VZYMGe+VBHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90429721"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90429721"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:12 -0700
X-CSE-ConnectionGUID: ho+pWYVhSIq9o1yQzMbjlw==
X-CSE-MsgGUID: gqkFVV4ETfOhn23aAjNERA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259707493"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 15:35:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v4 10/11] drm/xe/multi_queue: Use QUEUE_TIMESTAMP as job
 timestamp for multi-queue
Date: Wed,  6 May 2026 15:35:11 -0700
Message-ID: <20260506223500.3769614-23-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
References: <20260506223500.3769614-13-umesh.nerlige.ramappa@intel.com>
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

