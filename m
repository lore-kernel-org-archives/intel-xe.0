Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A01C79F88
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2652810F802;
	Thu,  3 Sep 2026 23:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eshgutTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D4410F7E7
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479931; x=1820015931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tFV2D7I5QQ1QVytaaVZ+afHw01cS7wg6UiF5jPNAkFY=;
 b=eshgutTIgN57Oxz+TG+5p423Z1dadJa50gQahXE3LRT9erUVXp9QgVBG
 SZM5A278kwvqp1S9yPViqU3xmt2JSQIDON+m6BVrAVMIoViFmY4iK9oPp
 alt4REN2/S5fhohppCHkZMI+ne3Y1HJrp8ZjDEvr3xHvMhi825gfO+GKN
 elE4Z+fHBSf9rTnEVReIdH5twraLg9xOx+5ZoCxDaj1oWuWfwi4u1L/tb
 SShTqOdHiRwI//KvTOPRtjs/x4Qk1tKhk/hUe/u+BQhnJVd0FpvpmUXcv
 DdV5kNeE0c4IU9hfIQ6KaDGIIZm03n9MNNxT3K3j2uj1Y7LOgKKRbbsKW g==;
X-CSE-ConnectionGUID: gcs6cjC2Qlyi1nO6n40afA==
X-CSE-MsgGUID: 9oXvUZrtQ7WUGq6DwCOOrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637819"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637819"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
X-CSE-ConnectionGUID: b9x76fzrS3iVfLZeUqSbTg==
X-CSE-MsgGUID: zxPSHsBfSHme4mSJF/gXaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029060"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 18/25] drm/xe: Add xe_hw_engine_write_ring_tail
Date: Thu,  3 Sep 2026 16:58:35 -0700
Message-Id: <20260903235842.3401722-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
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

ULLS for migration jobs need to directly set hw engine ring tail, add
function to support this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-19-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 010499766fce..635744f79be6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -282,6 +282,26 @@ static void hw_engine_fini(void *arg)
 	hwe->gt = NULL;
 }
 
+static void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val)
+{
+	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
+	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
+
+	reg.addr += hwe->mmio_base;
+
+	xe_mmio_write32(&hwe->gt->mmio, reg, val);
+}
+
+/**
+ * xe_hw_engine_write_ring_tail() - Write ring tail
+ * @hwe: engine
+ * @val: desired 32-bit value to write
+ */
+void xe_hw_engine_write_ring_tail(struct xe_hw_engine *hwe, u32 val)
+{
+	xe_hw_engine_mmio_write32(hwe, RING_TAIL(0), val);
+}
+
 /**
  * xe_hw_engine_mmio_read32() - Read engine register
  * @hwe: engine
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index c3ee37f8cfc0..e13610a56ad7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -77,5 +77,6 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
 enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
 u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
+void xe_hw_engine_write_ring_tail(struct xe_hw_engine *hwe, u32 val);
 
 #endif
-- 
2.34.1

