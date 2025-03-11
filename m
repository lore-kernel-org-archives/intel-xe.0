Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C15C28B30
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 13:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A9610E200;
	Tue, 11 Mar 2025 13:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8/SrdbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C257A10E1E1
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 13:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741701458; x=1773237458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+6rSmOUzRmhS0Q3R8DvJKwvMBIRWFBBP2VNc8i0aQ1Y=;
 b=g8/SrdbQTqKV4PrSEYp30D5FxPilSDFx7xnxrtzg0HQafzNZHETNpK5l
 HM3O4EMSsxf3o8nABrUvUV+HbPbPZc6sPVKVQ2YtMCreRPB3W4EkDNLXh
 oFkSY0daSP2DLovkSk5qAJMexdiG674VKj54wZTOSD6kE4e3+AlX0tUAo
 vOw3VcYOVEj/K5gTdCgy/fIQ5xt9SRQdVWlZs4M440Hfx4H4cOGErO70g
 H7TiA0OFC/qQriGiHJv/fy/Phm+15pEvJiRDt9smg17IK8twIzcTACITi
 u9zt+WvcPbix4hs2+eMzt/shVdX54A33FIzShMCSGorD31WzN3pp02ic+ w==;
X-CSE-ConnectionGUID: +jH3vG9oSIuTon7qJtFgqg==
X-CSE-MsgGUID: 8NtDXWI3SXmXQ+Mi4pHhMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54122577"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="54122577"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:57:38 -0700
X-CSE-ConnectionGUID: lfSAjd0vTdqCWoT8wjKBbg==
X-CSE-MsgGUID: XkXJKn3ZRx+0QuEcGIwxTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="121034400"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:57:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe/vf: Don't try Driver-FLR if VF
Date: Tue, 11 Mar 2025 14:57:25 +0100
Message-Id: <20250311135726.1998-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250311135726.1998-1-michal.wajdeczko@intel.com>
References: <20250311135726.1998-1-michal.wajdeczko@intel.com>
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

Driver-FLR can't be triggered from the VF driver, so treat it
as disabled if VF. While around, fix also the message, as it
shouldn't be printed just 'once' as we may have many devices.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5d79b439dd62..a2afa8a88997 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -504,7 +504,15 @@ ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
 
 static bool xe_driver_flr_disabled(struct xe_device *xe)
 {
-	return xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS;
+	if (IS_SRIOV_VF(xe))
+		return true;
+
+	if (xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
+		drm_info(&xe->drm, "Driver-FLR disabled by BIOS\n");
+		return true;
+	}
+
+	return false;
 }
 
 /*
@@ -568,10 +576,8 @@ static void __xe_driver_flr(struct xe_device *xe)
 
 static void xe_driver_flr(struct xe_device *xe)
 {
-	if (xe_driver_flr_disabled(xe)) {
-		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
+	if (xe_driver_flr_disabled(xe))
 		return;
-	}
 
 	__xe_driver_flr(xe);
 }
-- 
2.47.1

