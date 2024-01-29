Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C389C48285
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 18:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D06112A7A;
	Mon, 29 Jan 2024 18:17:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387E9112A7A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 18:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706552272; x=1738088272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e289fe5YAi5BMUi4304HBdsUj02zDijEN3gsPR/oHBo=;
 b=dl5d6ePxQjU4B1RkF/fAZ8S8leXBVfpM55k3Ze5Wcmr+BLeolHz4182u
 O3el7Andd7P6f+G+YjAeSorL6DXvDyxJ1RQu2+gQtyB8fTChL2RlFgAsj
 vSnC/j+b0UNUtHlf3t2x3BKPE+wpPryXYmnLtIAXcCKKXW2PpwYhQsSP6
 eIyc2pAAkfke2wyAxPNrcC4o0xx5IB+hOB+UHe6rSWfY1S3/VUGw2tJQ2
 qi1lxik9bir49P4dv2Y8EeQjGnjB1T2rIuHSN0PGnRDmKb8IZne1SxfJi
 gpnQtgIVHbMaZ031kmHpregR1sF1fqjmIt+N0UWGB6yEDxzCsQqh3jgxr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2903217"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2903217"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:17:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3439216"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:17:49 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/6] drm/xe: Add functions to convert regular address to
 canonical address and back
Date: Mon, 29 Jan 2024 10:17:37 -0800
Message-ID: <20240129181742.183694-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some instructions requires canonical address like
MI_BATCH_BUFFER_START(UMDs must call xe_exec with a canonical address
for Xe2+).

So here adding functions to convert regular address to canonical
address and back, the first user of this functions will be added
in the next patches.

v3:
- inline removed
- rename highest_address_bit_get() to ppgtt_msb_get()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_device.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6faa7865b1aab..6172d4f987937 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -747,3 +747,18 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 		drm_printf(p, "\tCS reference clock: %u\n", gt->info.reference_clock);
 	}
 }
+
+static int ppgtt_msb_get(struct xe_device *xe)
+{
+	return xe->info.dma_mask_size > 48 ? 57 : 47;
+}
+
+u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address)
+{
+	return sign_extend64(address, ppgtt_msb_get(xe));
+}
+
+u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
+{
+	return address & GENMASK_ULL(ppgtt_msb_get(xe), 0);
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 270124da1e00e..462f59e902b12 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -177,4 +177,7 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 
+u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
+u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
+
 #endif
-- 
2.43.0

