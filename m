Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9701C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 19:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF5710EACF;
	Mon, 25 Mar 2024 19:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRUUkhIf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C13D10EAC6
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 19:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711393621; x=1742929621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e1thLZ1KvM1+knoy8obWtHWHrF757rU9nyfWRundfWk=;
 b=iRUUkhIfU+hPo6Xg2HXX2QJznzlxFtWBh6bWMrR5CeUX6zGALfW1mpaH
 RXxUkwcLCkxQ0KFoa35mMu+XJLyvjE05RWBwHfer/fB+IG//e5TO7aJC6
 Nujg04IH3tifeBo08Mk+freQ83sPUgI/BZmLnknD4WLzO69XWLA/+Oy7P
 DSv4GjzFfe2Wt85ZDHKkIYEV59T6wWOJCCCuIF4T+DBahPZAAHZnEe9Lo
 3obszkuUfiAngGIzklNlKk2n3/7Oj6+ME2ClsBKYVjxZwZb2Ia74iEAlC
 dh8qujuvrkRQe2oRc71rePZOrsxhPiWrABLA2i756tTVi+hZ7eY9pvK6k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6310310"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6310310"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 12:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20441799"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 12:06:53 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 1/3] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
Date: Mon, 25 Mar 2024 12:06:41 -0700
Message-ID: <20240325190643.150648-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A future patch will require gt and xe device structs, so here
replacing class by hwe.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 6 +++---
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b94924a4f3190..6e75803c963ae 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -795,7 +795,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 		return NULL;
 
 	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
-	snapshot->class = hwe->class;
+	snapshot->hwe = hwe;
 	snapshot->logical_instance = hwe->logical_instance;
 	snapshot->forcewake.domain = hwe->domain;
 	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
@@ -846,7 +846,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
 	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
 
-	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
 
 	return snapshot;
@@ -891,7 +891,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
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
2.44.0

