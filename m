Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1DBCD6136
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 20:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9649B10E2E8;
	Mon,  9 Oct 2023 20:22:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D210910E2E8
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 20:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696882919; x=1728418919;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZZdMxgsQrDhHTdmIuvKqAxuxF9+MgKgWkgByUAiPbGg=;
 b=aOy7nzSxa0Gr/nrVOBzK0YCkQuadCRfYw3mamgDKZTGIcehBgJbKV5ko
 +PcfKs9pQL8fuR6/j8Y/Ov6CKpD8eXDvPcNXltSNJEEuRzS8aEbN27CZA
 fg/XZhxTMuu8PtR4qN9OotfRoHAbugx7FOVxCUjJguCoKaXIOiJrwL3L+
 x3BCXV4IioBdUlcIzJpsczbsF9GySN5rfd7i6w+T4D8UxTGggRtrWvfVD
 CuwjErmJC3u254tDVvpeh8FF6D1kgsM98xZ9Q+2pVApmWl+cSd7VGZgX2
 jEQHfYlI0Qd9kODRNrkIvyjGcxtkc7ArrWM9JxIrkxV1kVRoa2LCk81v6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2824782"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="2824782"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 13:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="788288398"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="788288398"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 13:21:57 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  9 Oct 2023 13:21:47 -0700
Message-ID: <20231009202149.245718-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/3] drm/xe: Store xe_he_engine in
 xe_hw_engine_snapshot
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A future patch will require gt and xe device structs, so here
replacing class by hwe.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 6 +++---
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b5b0845908887..37b3ee1268090 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -684,7 +684,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	if (snapshot->name)
 		strscpy(snapshot->name, hwe->name, len);
 
-	snapshot->class = hwe->class;
+	snapshot->hwe = hwe;
 	snapshot->logical_instance = hwe->logical_instance;
 	snapshot->forcewake.domain = hwe->domain;
 	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
@@ -731,7 +731,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
 	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
 
-	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
 
 	return snapshot;
@@ -786,7 +786,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 		   snapshot->reg.ring_dma_fadd_udw,
 		   snapshot->reg.ring_dma_fadd);
 	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
-	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			   snapshot->reg.rcu_mode);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 5d4ee29042407..71c0a0169e62a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -156,8 +156,8 @@ struct xe_hw_engine {
 struct xe_hw_engine_snapshot {
 	/** @name: name of the hw engine */
 	char *name;
-	/** @class: class of this hw engine */
-	enum xe_engine_class class;
+	/** @hwe: hw engine */
+	struct xe_hw_engine *hwe;
 	/** @logical_instance: logical instance of this hw engine */
 	u16 logical_instance;
 	/** @forcewake: Force Wake information snapshot */
-- 
2.42.0

