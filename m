Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E3CC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 08:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5870410F061;
	Wed,  8 Jul 2026 08:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vouve40W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AAF10F061
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 08:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783499921; x=1815035921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FlOxdFDppkb/jdZrzaaU560Sofg7bnct1+4aO2QkEo4=;
 b=Vouve40Wq2MlNKmQuFc2jruero+VtcR8QBHAdn5mj3jTLuWYdpiZgWyp
 O02ZlZM3g4RHg3ZeaHsaNOBJIDf42Uu1nrOtDhnyQGCcM4YEVYP9kS+0E
 rF0FybvbCCwBrBsyq0ZNaSuaikZyvnQcQ4RPFo4j4Nx2tcdu4g3v8taQP
 xhfkBGdbOiT7ze/fPy0LLRUR4Whqs4k6vDseDBgGm6H79YlQuk3QLFhaP
 HiD9O3cvk9ZgNUqOS+tYwX8Q+xoeKTHiV5dgLWSo677kQCxH4eIPIRFSS
 txvkwnRM3rnHYEXu4uqwo6nPLmqWBwrMhYN1dRMuc3eDxY8A2ACh9sTx7 w==;
X-CSE-ConnectionGUID: RDfZaaFISh+0qE5rJ2Rqew==
X-CSE-MsgGUID: 6hxR9GK1RYyufzXUZWk1yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94800413"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94800413"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 01:38:41 -0700
X-CSE-ConnectionGUID: dpC5vSxMTRaTufQ39990PQ==
X-CSE-MsgGUID: NhVf8Ha5RL6A4BYQBLXz4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="250240873"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2026 01:38:40 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v5 0/2] Fix UAF on dma-buf import attach failure
Date: Wed,  8 Jul 2026 14:45:06 +0530
Message-ID: <20260708091512.205482-4-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

This series fixes a use-after-free that can happen when importing a
dma-buf and dma_buf_dynamic_attach() fails.

The imported BO is created as ttm_bo_type_sg with bo->base.resv pointing
at the exporter's dma_buf->resv before the attach is attempted. If the
attach fails, the importer holds no attachment and no dma-buf reference,
yet the BO still points at the exporter's resv. Once the exporter is
freed, a later dma_resv_lock(bo->base.resv) can hit freed memory:

  Oops: general protection fault, probably for non-canonical address
        0x6b6b6b6b6b6b6b9c
  Workqueue: ttm ttm_bo_delayed_delete [ttm]
  RIP: 0010:mutex_can_spin_on_owner+0x3f/0xc0

There are two places where the stale resv can be reached:

Patch 1 fixes the TTM delayed-delete path. Failed sg imports now
individualize bo->base.resv to the private _resv, keyed on
import_attach, while successful imports keep the shared exporter resv for
normal dma-buf cleanup.

Patch 2 fixes the xe LRU-walker path raised during review. xe was
creating imported sg BOs with a ttm_resource before attach succeeded,
making them visible to LRU walkers. An LRU walker could then take a BO
reference and lock bo->base.resv before the TTM release path could
individualize it. xe now creates imported sg BOs with empty initial
placement, keeping bo->resource NULL and off the LRU until after a
successful attach.

v5:
 - Add drm/xe patch to keep imported sg BOs off the LRU before attach
   succeeds; the TTM fix alone is not sufficient for xe if the BO is
   already LRU-visible. (Thomas)
   v4 patch:
   https://patchwork.freedesktop.org/patch/736663/?series=169129&rev=2
  - Patch 1 (drm/ttm) carries Christian's Reviewed-by from v4.

v4:
 - Moved import_attach check to after dma_resv_copy_fences() so fences
   are copied before returning for successful imports (Thomas).
 - Removed exporter-alive claim from commit message (Thomas).

v3:
 - Dropped the xe-side reordering approach since importer_priv must be
   valid when dma_buf_dynamic_attach() publishes the attachment.
 - Per Christian's suggestion on the v1 thread, keyed the check on
   import_attach rather than removing the sg guard entirely.
 - Fixes both xe and amdgpu in a single TTM patch.

Nitin Gote (2):
  drm/ttm: Fix UAF on dma-buf attach failure for sg BOs
  drm/xe: Keep imported sg BOs off LRU until dma-buf attach succeeds

 drivers/gpu/drm/ttm/ttm_bo.c | 24 ++++++++++------
 drivers/gpu/drm/xe/xe_bo.c   | 53 ++++++++++++++++++++++++++----------
 2 files changed, 54 insertions(+), 23 deletions(-)

-- 
2.50.1

