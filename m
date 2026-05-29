Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4884FCD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 20:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D7A112465;
	Fri, 29 May 2026 20:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRPYGXwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A48112465
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 20:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780084809; x=1811620809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HkO6gIA0SMLJKerxjawHznbIQ9agn0MiX1KUaQpNKdg=;
 b=KRPYGXwxdP69gkgc+fk/IahTHfcYUdHx9mKpRW/pGLLJ5bjWL0lmZ5+0
 POzTjtDPYyBr6JBc0Ti2ekX6aJ1IU6cI1aBdOmRGsIm9eGJLvg10eeTdv
 WR9tPj4bhjI4rgxQPnWBup3iMSDLZ44Sq8xzdN6Cat9rN5STVpMQCZmD8
 TxgA5qgMd+u+nBSrnDpCGSSQZIuUAf0NRzl7LpSatQTP+PChqO0NlYjsV
 5OoY68+FBpcVF+lvjFshZtbvsjnDcpH51tmNeCF+0Yby5sZxsnyoJm8Cc
 fDyTJlN4Bmx0gHQKEW+aEUhSmuMcX4VQTNm95u+9RQyJkELZlFRBcpTcF Q==;
X-CSE-ConnectionGUID: 7/Vc7N/EQxqeK62sCb+hYA==
X-CSE-MsgGUID: J59ZWTqzSFOL2Dx+iz2BJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81129708"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="81129708"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 13:00:08 -0700
X-CSE-ConnectionGUID: wcphmVp7TCCBsXaHwboJjw==
X-CSE-MsgGUID: HPRbbcGrSJKN6lYwpc740A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="240398425"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 13:00:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pcode: Don't ignore drmm_mutex_init failure
Date: Fri, 29 May 2026 21:59:56 +0200
Message-ID: <20260529195956.25349-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

The drm_device-managed mutex_init might fail and return an error.
Add proper error handling. While around, update the function name
to clearly indicate this is an early software-only initialization.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 8 +++++---
 drivers/gpu/drm/xe/xe_pcode.h | 2 +-
 drivers/gpu/drm/xe/xe_tile.c  | 4 +++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index dc66d0c7ee06..866986694d9c 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -323,15 +323,17 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 }
 
 /**
- * xe_pcode_init: initialize components of PCODE
+ * xe_pcode_init_early() - Initialize components of PCODE
  * @tile: tile instance
  *
  * This function initializes the xe_pcode component.
  * To be called once only during probe.
+ *
+ * Return: 0 on success or a negative error code on failure.
  */
-void xe_pcode_init(struct xe_tile *tile)
+int xe_pcode_init_early(struct xe_tile *tile)
 {
-	drmm_mutex_init(&tile_to_xe(tile)->drm, &tile->pcode.lock);
+	return drmm_mutex_init(&tile_to_xe(tile)->drm, &tile->pcode.lock);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 490e4f269607..18260c29e620 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -12,7 +12,7 @@ struct drm_device;
 struct xe_device;
 struct xe_tile;
 
-void xe_pcode_init(struct xe_tile *tile);
+int xe_pcode_init_early(struct xe_tile *tile);
 int xe_pcode_probe_early(struct xe_device *xe);
 int xe_pcode_ready(struct xe_device *xe, bool locked);
 int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index c465aae7883c..74d925a337b7 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -157,7 +157,9 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 	if (err)
 		return err;
 
-	xe_pcode_init(tile);
+	err = xe_pcode_init_early(tile);
+	if (err)
+		return err;
 
 	return 0;
 }
-- 
2.47.1

