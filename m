Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6511AC61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 11:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0434510F345;
	Fri, 28 Aug 2026 11:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdKAtPgn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006F510E239
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787916696; x=1819452696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Plv9QTtSJ42qOq81gYmaS2VfzIAhEssvlXPvXW+EkjA=;
 b=gdKAtPgnHwQKuh3U8/dT99dpzGNi2Drq0F4p4AiZHdZh5Lrc64ydsS+v
 iXdgkTPgqFp6KqpLoB6otlEzawxeMbAAhIqDEL7q5ZT+FQ6lAQTHndYWi
 srqXAvEe7PhysaoV6m/p2ZIOkmVqdt8HhTsRhqyuYZsmScSGQp7fJIMs6
 crO/0UCKyQYz5CDm57ay8+PG06OnPcUhSWOfDYH3h2OHOVi+xxkMop74J
 1q1aWJ+q3BF5HqIyFPK8FI1AH3P8f4pIPjhmGrtJPqAb7ekYDHv1QYhx0
 zngHTOsfW6vCuAItQks6JWIdVgW450of1ov+emMcnmb7RpELKylNAfchy Q==;
X-CSE-ConnectionGUID: R/qG3j7mQMa6ROWMPmOFxA==
X-CSE-MsgGUID: aEzCG1tGTqKXAmQCzJ5UjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="113957120"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="113957120"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 04:31:36 -0700
X-CSE-ConnectionGUID: e3c+KP/8TQ6Py/qnkcV2Rg==
X-CSE-MsgGUID: MGWLJ15OTxiIY5FvU0ndvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="306338273"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 04:31:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, matthew.d.roper@intel.com
Subject: [PATCH 2/2] drm/xe/xe_guc: Skip GuC reset post SBR
Date: Fri, 28 Aug 2026 17:01:07 +0530
Message-ID: <20260828113104.319843-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260828113104.319843-4-riana.tauro@intel.com>
References: <20260828113104.319843-4-riana.tauro@intel.com>
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

Secondary Bus Reset causes all VRAM state to be lost along with hardware
state. The goal is to keep the device in reset till the teardown is
complete to avoid device accesses such as GuC reset in an unknown state.

Fixes: e46ee82f120f ("drm/xe: Skip device access during PCI error recovery")
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h    | 5 -----
 drivers/gpu/drm/xe/xe_guc.c       | 5 +++++
 drivers/gpu/drm/xe/xe_pci_error.c | 1 -
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6c4cfaebc44a..a1127ab7d1a2 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -191,11 +191,6 @@ static inline void xe_device_set_in_reset(struct xe_device *xe)
 	atomic_set(&xe->in_reset, 1);
 }
 
-static inline void xe_device_clear_in_reset(struct xe_device *xe)
-{
-	atomic_set(&xe->in_reset, 0);
-}
-
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c7f8bbd4cb92..2c7f411b89a7 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -986,6 +986,11 @@ int xe_guc_reset(struct xe_guc *guc)
 	u32 guc_status, gdrst;
 	int ret;
 
+	if (xe_device_is_in_reset(gt_to_xe(gt))) {
+		xe_gt_dbg(gt, "Skipping GuC reset, device is in reset\n");
+		return 0;
+	}
+
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 3e9c77f8483d..b7ac33965150 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -121,7 +121,6 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * TODO: optimize by re-initializing only the hardware state and re-creating
 	 * kernel BOs.
 	 */
-	xe_device_clear_in_reset(xe);
 	pdev->driver->remove(pdev);
 	devres_release_group(&pdev->dev, xe->devres_group);
 
-- 
2.47.1

