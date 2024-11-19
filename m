Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9879D60D09
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 01:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859B910E1A6;
	Tue, 19 Nov 2024 01:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4ogAc2Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EDE10E1A6
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 01:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731979984; x=1763515984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zj9eQ/MmBrp6+nGGPlXV/N0brJWhdo+peR52Wsnfwlw=;
 b=e4ogAc2ZkQ/p4QFKObc9923R8CR7P/XJZsIkHV8jX1aKbctH5o1kI2aM
 z1fENcuOUtxOdHqDAsMafp+9OknVSXNU2QDbB7DEjQrGFstR9istcnu1I
 t0U38s/aAQ2jYBLgn3vUY+IBXRhpW/CgLNVaDByqBU9KxQ1l7Z2vXHYPc
 W5WgpenE+kqcdG3qYadBbQMi6A9CrNAt65rktYH0/JvhgiGewll4wnUWM
 psRYo0o7e+sDgM1HpBcYWaUj2toyNgYLr/WbbUX84n46+8Lr56QXmxfMQ
 leyY6T2pZ3htN5aED7S25XNdz/1d+8Glro9WxQgNVp9C+9+hQQt9WGlqP w==;
X-CSE-ConnectionGUID: gRB3nHhISLazw4TobAk9ag==
X-CSE-MsgGUID: aqqc0otDR4+e/jO+BVzjYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42478658"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="42478658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 17:33:04 -0800
X-CSE-ConnectionGUID: OEiRHTp0SOawYUIP7huodQ==
X-CSE-MsgGUID: 8YyrrLAlQeiXARnL/3RyaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="126938197"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 17:33:04 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/oa: Disallow OA from being enabled on active
 exec_queue's
Date: Mon, 18 Nov 2024 17:32:56 -0800
Message-ID: <20241119013256.680030-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Enabling OA on an exec_queue toggles the OAC_CONTEXT_ENABLE bit in
CTXT_SR_CTL register. Toggling this bit changes the size and layout of the
underlying HW context image. Therefore, enabling OA on an already active
exec_queue (as currently implemented in xe) is an invalid operation and can
cause hangs. Therefore, disallow OA from being enabled on active
exec_queue's (here, by active we mean a context on which submissions have
previously happened).

Transition from 1 -> 0 for this bit was disallowed in
'0c8650b09a36 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream
close")'. Here we disallow the 0 -> 1 transition on active contexts.

v2: Don't export exec_queue_enabled, define new xe_exec_queue_op (M Brost)
    Directly check OAC_CONTEXT_ENABLE bit from context image (J Cavitt)

Bspec: 60314
Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
Cc: stable@vger.kernel.org
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  1 +
 drivers/gpu/drm/xe/xe_oa.c               | 13 +++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1158b6062a6cd..b88d617c37b33 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -184,6 +184,8 @@ struct xe_exec_queue_ops {
 	void (*resume)(struct xe_exec_queue *q);
 	/** @reset_status: check exec queue reset status */
 	bool (*reset_status)(struct xe_exec_queue *q);
+	/** @enabled: check if exec queue is in enabled state */
+	bool (*enabled)(struct xe_exec_queue *q);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f9ecee5364d82..b9b9cdb6f768b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1660,6 +1660,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
 	.reset_status = guc_exec_queue_reset_status,
+	.enabled = exec_queue_enabled,
 };
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 8dd55798ab312..4a7440c40978c 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2066,6 +2066,19 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
 		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
 			return -ENOENT;
 
+		/*
+		 * Disallow OA from being enabled on active exec_queue's. Enabling OA sets the
+		 * OAC_CONTEXT_ENABLE bit in CTXT_SR_CTL register. Toggling the bit changes
+		 * the size and layout of the underlying HW context image and can cause hangs.
+		 */
+		if (XE_IOCTL_DBG(oa->xe,
+				 !(xe_lrc_read_ctx_reg(param.exec_q->lrc[0],
+				       CTX_CONTEXT_CONTROL) & CTX_CTRL_OAC_CONTEXT_ENABLE) &&
+				 param.exec_q->ops->enabled(param.exec_q))) {
+			ret = -EADDRINUSE;
+			goto err_exec_q;
+		}
+
 		if (param.exec_q->width > 1)
 			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lrc[0]\n");
 	}
-- 
2.41.0

