Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA054CFB443
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6C010E1AD;
	Mon,  7 Oct 2024 06:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kok9CBdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC96710E1AD
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283320; x=1759819320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wSent/ZpgtnOP+eS0LQIionXlAuo4pj1ziZbOevUX2c=;
 b=kok9CBdQedVDcoqBWGy0BK4Y+ceXAiKqx8oVF+E0Ulq+PwSkwWlGJrUr
 UUlM45uMwpxCRXG5olxk73et1YBYnn+AznuUVZ2K11m+kNXrMnqm5XH+9
 p1gTPcloBmWQO+Qb7nyR3V7LFvv3Nem+4TAYBykd6z05VPquyZQ5TJnJN
 ZsH5oYeCOIUx6GT1mP1G6iMQ5tvvDzv3B8i4OK8GHoHK3cFTHXlZcl+Pr
 kfanxg3QfYhDDRSZ5jiBSt/OMoiutEpi/ON+ViUK6hueegsTuzZqXK2s0
 pabMCTMa3d06UzBeufbGy/L6eT8jd72VEHV8Fv4N6ki7nRV6G9DKo44o1 g==;
X-CSE-ConnectionGUID: 85IY6kV7T8m9bKSxJXGZPA==
X-CSE-MsgGUID: vpbtPoFFTKSo8fGx7bgcLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548438"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548438"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:42:00 -0700
X-CSE-ConnectionGUID: gK9ZMBBtQAqvEhyzI8flLA==
X-CSE-MsgGUID: V63fm51STEWnfnGyabR1uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842356"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:41:58 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 06/26] drm/xe/device: Update handling of xe_force_wake_get
 return
Date: Mon,  7 Oct 2024 12:29:57 +0530
Message-Id: <20241007070017.1732886-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_get() now returns the reference count-incremented domain
mask. If it fails for individual domains, the return value will always
be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
in the event of failure. Update the return handling of xe_force_wake_get()
to reflect this behavior, and ensure that the return value is passed as
input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be escalated/considered as
probing error. It internally WARNS on domain ack failure.

v5
- return unsigned int xe_force_wake_get()

v7
- Fix commit message(Badal)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1940cd3229f4..f922a7bc43be 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -604,8 +604,8 @@ int xe_device_probe_early(struct xe_device *xe)
 static int probe_has_flat_ccs(struct xe_device *xe)
 {
 	struct xe_gt *gt;
+	unsigned int fw_ref;
 	u32 reg;
-	int err;
 
 	/* Always enabled/disabled, no runtime check to do */
 	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
@@ -613,9 +613,9 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 
 	gt = xe_root_mmio_gt(xe);
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		return err;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return -ETIMEDOUT;
 
 	reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
 	xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
@@ -624,7 +624,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 		drm_dbg(&xe->drm,
 			"Flat CCS has been disabled in bios, May lead to performance impact");
 
-	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	return 0;
 }
 
 int xe_device_probe(struct xe_device *xe)
@@ -875,6 +876,7 @@ void xe_device_wmb(struct xe_device *xe)
 void xe_device_td_flush(struct xe_device *xe)
 {
 	struct xe_gt *gt;
+	unsigned int fw_ref;
 	u8 id;
 
 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
@@ -889,7 +891,8 @@ void xe_device_td_flush(struct xe_device *xe)
 		if (xe_gt_is_media_type(gt))
 			continue;
 
-		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref)
 			return;
 
 		xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
@@ -904,22 +907,22 @@ void xe_device_td_flush(struct xe_device *xe)
 				   150, NULL, false))
 			xe_gt_err_once(gt, "TD flush timeout\n");
 
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 }
 
 void xe_device_l2_flush(struct xe_device *xe)
 {
 	struct xe_gt *gt;
-	int err;
+	uint fw_ref;
 
 	gt = xe_root_mmio_gt(xe);
 
 	if (!XE_WA(gt, 16023588340))
 		return;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		return;
 
 	spin_lock(&gt->global_invl_lock);
@@ -929,7 +932,7 @@ void xe_device_l2_flush(struct xe_device *xe)
 		xe_gt_err_once(gt, "Global invalidation timeout\n");
 	spin_unlock(&gt->global_invl_lock);
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
-- 
2.34.1

