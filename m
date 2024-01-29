Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1A2C48285
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 18:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DF4112A8C;
	Mon, 29 Jan 2024 18:18:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA38112A8A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 18:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706552275; x=1738088275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N5jmBV9dx12WVl76d7iudgqArK2ZuFNhwdJJBRTTjKc=;
 b=HBWgeMUJP9xLKeyHZohSYgdkCSG8Z+LAuxFbPzltiMHuE6uUkFdkuSJb
 0ErmJh9l4eSXF+0JDQ3sJF/W1C0jp6drUBBmwsdhBikPcXMA0awsw6QPf
 LUsA6Qrg1PlJlncfs+mvD+WyKXFVW11NQ119TXE52cN5pBPvkrJT3TARz
 wOOc+svZKWY9SF4r5YTF6S2Q92pBUxxnDn+Xos9zIiGf2cyESJFkzZ5ut
 jDya3f7PatqvyJevCbLCfSUjAax1Cf8UPe4NaU4VJJAOTZATIeSnM36te
 yqmykHvEG7eizZJ5Ur8nLNRBTjyYUNYUMmP4Qn1yrjDDLrfgtWNBosA3J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2903279"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2903279"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:17:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3439234"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:17:52 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 3/6] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
Date: Mon, 29 Jan 2024 10:17:39 -0800
Message-ID: <20240129181742.183694-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129181742.183694-1-jose.souza@intel.com>
References: <20240129181742.183694-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A future patch will require gt and xe device structs, so here
replacing class by hwe.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 6 +++---
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0d17e32d70c87..61b0c18d8b624 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -760,7 +760,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 		return NULL;
 
 	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
-	snapshot->class = hwe->class;
+	snapshot->hwe = hwe;
 	snapshot->logical_instance = hwe->logical_instance;
 	snapshot->forcewake.domain = hwe->domain;
 	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
@@ -807,7 +807,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
 	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
 
-	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
 
 	return snapshot;
@@ -852,7 +852,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
 	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
 	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
-	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			   snapshot->reg.rcu_mode);
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index d7f828c76cc5f..27deaa31efd31 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -158,8 +158,8 @@ struct xe_hw_engine {
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
2.43.0

