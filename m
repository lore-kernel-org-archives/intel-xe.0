Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C22C87FE1
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 20:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B4710E5E2;
	Thu,  1 Jun 2023 20:30:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A1A10E5D3
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 20:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651437; x=1717187437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=omplOS3TnEGvvrTy7wP+rU7a695U8hZukhOVMqfIIIk=;
 b=G8TAZW2ooYKFkI54STegQs/j8ovMSqHG/DGCHlcuL2u2URdtclVCszPM
 46o4m9jZ1e+MU1M/ofy6DxQvofvsG7zny2Z6P9kJQGjKJcS0qtFCI6QTk
 VZVV03BB6Isl15dGTyG7X6DF+tBcEovgr+RAkxlrNKiW7npUQPohxJZKk
 pzgnRbWhXH1BC2rOwzLEiuy+bHKMXaU2zLcaaAb5MXXXcjkV7mXU/P6sY
 HQj0JYqxFi4AeQ0EVngSQoukAsvhtEYqBBHdZVIhKL1qj6Sy46dCG3Ijb
 C74oDAPqkAqsuE1tCVRrGrkMUO5t5AoNvAZ28eDCkXOrlQxExNSjsbD2H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358102557"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358102557"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740493317"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="740493317"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 13:30:25 -0700
Message-Id: <20230601203025.615494-32-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601203025.615494-1-matthew.d.roper@intel.com>
References: <20230601203025.615494-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 31/31] drm/xe: Add kerneldoc description of
 multi-tile devices
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

v2:
 - Fix doubled word.  (Lucas)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/xe/index.rst   |  1 +
 Documentation/gpu/xe/xe_tile.rst | 14 ++++++++
 drivers/gpu/drm/xe/xe_tile.c     | 57 ++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_tile.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 2fddf9ed251e..5c4d6bb370f3 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -21,3 +21,4 @@ DG2, etc is provided to prototype the driver.
    xe_wa
    xe_rtp
    xe_firmware
+   xe_tile
diff --git a/Documentation/gpu/xe/xe_tile.rst b/Documentation/gpu/xe/xe_tile.rst
new file mode 100644
index 000000000000..c33f68dd95b6
--- /dev/null
+++ b/Documentation/gpu/xe/xe_tile.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==================
+Multi-tile Devices
+==================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_tile.c
+   :doc: Multi-tile Design
+
+Internal API
+============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_tile.c
+   :internal:
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index fa56323aa988..6414aa810355 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -12,6 +12,63 @@
 #include "xe_tile.h"
 #include "xe_ttm_vram_mgr.h"
 
+/**
+ * DOC: Multi-tile Design
+ *
+ * Different vendors use the term "tile" a bit differently, but in the Intel
+ * world, a 'tile' is pretty close to what most people would think of as being
+ * a complete GPU.  When multiple GPUs are placed behind a single PCI device,
+ * that's what is referred to as a "multi-tile device."  In such cases, pretty
+ * much all hardware is replicated per-tile, although certain responsibilities
+ * like PCI communication, reporting of interrupts to the OS, etc. are handled
+ * solely by the "root tile."  A multi-tile platform takes care of tying the
+ * tiles together in a way such that interrupt notifications from remote tiles
+ * are forwarded to the root tile, the per-tile vram is combined into a single
+ * address space, etc.
+ *
+ * In contrast, a "GT" (which officially stands for "Graphics Technology") is
+ * the subset of a GPU/tile that is responsible for implementing graphics
+ * and/or media operations.  The GT is where a lot of the driver implementation
+ * happens since it's where the hardware engines, the execution units, and the
+ * GuC all reside.
+ *
+ * Historically most Intel devices were single-tile devices that contained a
+ * single GT.  PVC is an example of an Intel platform built on a multi-tile
+ * design (i.e., multiple GPUs behind a single PCI device); each PVC tile only
+ * has a single GT.  In contrast, platforms like MTL that have separate chips
+ * for render and media IP are still only a single logical GPU, but the
+ * graphics and media IP blocks are each exposed as a separate GT within that
+ * single GPU.  This is important from a software perspective because multi-GT
+ * platforms like MTL only replicate a subset of the GPU hardware and behave
+ * differently than multi-tile platforms like PVC where nearly everything is
+ * replicated.
+ *
+ * Per-tile functionality (shared by all GTs within the tile):
+ *  - Complete 4MB MMIO space (containing SGunit/SoC registers, GT
+ *    registers, display registers, etc.)
+ *  - Global GTT
+ *  - VRAM (if discrete)
+ *  - Interrupt flows
+ *  - Migration context
+ *  - kernel batchbuffer pool
+ *  - Primary GT
+ *  - Media GT (if media version >= 13)
+ *
+ * Per-GT functionality:
+ *  - GuC
+ *  - Hardware engines
+ *  - Programmable hardware units (subslices, EUs)
+ *  - GSI subset of registers (multiple copies of these registers reside
+ *    within the complete MMIO space provided by the tile, but at different
+ *    offsets --- 0 for render, 0x380000 for media)
+ *  - Multicast register steering
+ *  - TLBs to cache page table translations
+ *  - Reset capability
+ *  - Low-level power management (e.g., C6)
+ *  - Clock frequency
+ *  - MOCS and PAT programming
+ */
+
 /**
  * xe_tile_alloc - Perform per-tile memory allocation
  * @tile: Tile to perform allocations for
-- 
2.40.1

