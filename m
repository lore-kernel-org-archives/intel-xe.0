Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84EEC25B7A
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3729D10E7B8;
	Mon, 20 May 2024 15:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/YOXBdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E84210E4C2
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219952; x=1747755952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VF3U1Tjcd7XuvkNyiV2P7SC8PGo4ZZZGr1eWva2FolE=;
 b=k/YOXBdheKydsdmGkhP+dc4qVlrgcv7glCk47XBASVgP9pIGTIj2pdK5
 SetJwU3J1fr2MAK91u4fVe993odFm9f/P2zN9zlaBYrUYudoH2bkrh/Xg
 /DXNCxD5bkIPZnvC4pfUOmGDnoA6hpzE41b3tOngMGPl7fjueUFPFXCC0
 oF0imUbAdUzoxDOxVDjbruDezDikD9KkSUZNsSOS9o0XuL0inL5NkBJTN
 El6kULHpXd/mFZio5fdc7lVAINvcl+sMOAg4SAs8Wqv9wz4RZf9B+w9yY
 fMEEz/32h+/26SNjcKuZLdn5aDaO7kr9QzVp6QJJ+Ndvn95n2khJqqUUf w==;
X-CSE-ConnectionGUID: tc6qPScRQruZc+X6IZ0YSQ==
X-CSE-MsgGUID: oNu+rY3qRpu7hO67LFRBRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873227"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873227"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:51 -0700
X-CSE-ConnectionGUID: KXx4cDykSrS0+uJ0JsHbdA==
X-CSE-MsgGUID: DLzdiYQjRYe0YxBFJgQOnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610517"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI v2 14/18] drm/xe/mmio: move mmio_fini over to devm
Date: Mon, 20 May 2024 16:43:03 +0100
Message-ID: <20240520154249.52888-32-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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

