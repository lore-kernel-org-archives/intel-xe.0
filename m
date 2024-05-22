Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1C2C41513
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D572410F493;
	Wed, 22 May 2024 10:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToNkP0Bg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3A910EBFE
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373337; x=1747909337;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VF3U1Tjcd7XuvkNyiV2P7SC8PGo4ZZZGr1eWva2FolE=;
 b=ToNkP0BgGiLk3cMbyEcs2/5+vhGZXLxPByMZHQiWL9Sy7z52rqQkFvpO
 VYtP/4QV+SHtDVYCVwYUk4Lr1Tv8E6eBLT1P7D6MPdrJQ+WHkAJpuvUsr
 /gEXXrRUeKWGzvzVrFuIR4Aadfab3ZtzhpkaKDe8WPdO7aO1xlNjKveAL
 jfaG+C+fkfFk+F1/WlAOUKYLKCyzyAUrCi2rZ4q3R2nREDDLAic40bxKw
 hnnVfw8Tjgj16RnNhzSxFzcuJur6Bs13Eym5HaiGclSsauRUKktUxOfV+
 ckBGLIwrkaUQ74zusNXw5yTL4MeQHeGaVXynKQvOuSkTsBCpfRDeawyl7 A==;
X-CSE-ConnectionGUID: p0jiZV2wQcCwxNS3FHp9xQ==
X-CSE-MsgGUID: lA8a4ehrTIC8jCsTD5LIjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562707"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562707"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:17 -0700
X-CSE-ConnectionGUID: 1/FIcjVJTzWYXbuakVo6Ng==
X-CSE-MsgGUID: ahH8F/BGSc+GMzj0IK1yFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195325"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 14/18] drm/xe/mmio: move mmio_fini over to devm
Date: Wed, 22 May 2024 11:21:57 +0100
Message-ID: <20240522102143.128069-32-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

Not valid to touch mmio once the device is removed, so make sure we
unmap on removal and not just when driver instance goes away. Also set
the mmio pointers to NULL to hopefully catch such issues more easily.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 05edab0e085d..a3094e741db8 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -387,13 +387,16 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 	}
 }
 
-static void mmio_fini(struct drm_device *drm, void *arg)
+static void mmio_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
 	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
 	if (xe->mem.vram.mapping)
 		iounmap(xe->mem.vram.mapping);
+
+	xe->mem.vram.mapping = NULL;
+	xe->mmio.regs = NULL;
 }
 
 int xe_mmio_init(struct xe_device *xe)
@@ -418,7 +421,7 @@ int xe_mmio_init(struct xe_device *xe)
 	root_tile->mmio.size = SZ_16M;
 	root_tile->mmio.regs = xe->mmio.regs;
 
-	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
+	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
 
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
-- 
2.45.1

