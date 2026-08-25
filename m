Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DB9C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF8910E8F0;
	Tue, 25 Aug 2026 06:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKlVRujf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA2510E8F0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 06:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787639802; x=1819175802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rkjuB4a+gZFWDI60l1wIV6ZA5ORiXOsZ1rcB/UeN1hU=;
 b=VKlVRujf6+U1v4N+NrGVGRef5oFMRgdx1M6Z4rE489ab3xVILxE6wFLs
 gms4qPAPGSLL7YXNUtDdTXwJ4Bcqe6SUpYmoWL1+Erosl6PlPx2ba22k0
 Uz1Y3zJ0B/lPRB7B8P1/Q2DjZFXAmy4JYriBDLDGUlWqECtb3LyveOnhR
 Ac/PDA6Mox4QVH8KMYzCYcTGrjGLOYRWUuEgH8W30bwzxp1quG1BDiHDx
 u7AGWAzxv9M2iqJ1mQuGQj+jgW5j0QgCEhRcR34MwlX7SFWz5pCwt8ISf
 pGzr5RcRJ/9LLEno+NqPfmOjJO8Fw4Ict0oMgqEqR9w+0AhDsx5WaerD+ Q==;
X-CSE-ConnectionGUID: uEafIr89TAWoq8CxjKE7wA==
X-CSE-MsgGUID: 7WK01tUnSgu76ugd+xfXvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87226096"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87226096"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:42 -0700
X-CSE-ConnectionGUID: X3VOgcS6TDiStvs4nYd3rA==
X-CSE-MsgGUID: MEqVeZXoS/m39Y/WfkW/3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265428945"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:36:39 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 tejas.upadhyay@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH 1/5] drm/xe/xe_drm_ras: Rename ras to drm_ras in xe_device
Date: Tue, 25 Aug 2026 12:06:16 +0530
Message-ID: <20260825063615.3697317-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260825063615.3697317-7-riana.tauro@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
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

Rename ras to drm_ras in xe_device to distinquish drm-ras functionality
from device related RAS functionality.

No functional changes.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++--
 drivers/gpu/drm/xe/xe_drm_ras.c      | 12 ++++++------
 drivers/gpu/drm/xe/xe_hw_error.c     |  6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 180d450a6deb..1494f3a6c62b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -550,8 +550,8 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
-	/** @ras: RAS structure for device */
-	struct xe_drm_ras ras;
+	/** @drm_ras: drm-ras structure for device */
+	struct xe_drm_ras drm_ras;
 
 	/** @i2c: I2C host controller */
 	struct xe_i2c *i2c;
diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
index 78184b6ea7d4..9f37ae732770 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.c
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -20,7 +20,7 @@ static int query_error_counter(struct xe_device *xe,
 			       enum drm_xe_ras_error_severity severity,
 			       u32 error_id, const char **name, u32 *val)
 {
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->drm_ras;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 
 	if (!info || !info[error_id].name)
@@ -41,7 +41,7 @@ static int clear_error_counter(struct xe_device *xe,
 			       enum drm_xe_ras_error_severity severity,
 			       u32 error_id)
 {
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->drm_ras;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 
 	if (!info || !info[error_id].name)
@@ -110,7 +110,7 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
 			      const enum drm_xe_ras_error_severity severity)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->drm_ras;
 	const char *device_name;
 
 	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
@@ -156,7 +156,7 @@ static void cleanup_node(struct drm_device *drm, void *node)
 
 static int register_nodes(struct xe_device *xe)
 {
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->drm_ras;
 	struct drm_ras_node *node;
 	int i, ret;
 
@@ -196,7 +196,7 @@ static int register_nodes(struct xe_device *xe)
  */
 void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 value)
 {
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->drm_ras;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 	struct drm_ras_node *node;
 	int ret;
@@ -226,7 +226,7 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
  */
 int xe_drm_ras_init(struct xe_device *xe)
 {
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->drm_ras;
 	struct drm_ras_node *node;
 	int err;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 5f2abc9485ff..90b73077ef41 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -240,7 +240,7 @@ static void log_soc_error(struct xe_tile *tile, const char * const *reg_info,
 {
 	const char *severity_str = error_severity[severity];
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->drm_ras;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 	const char *name;
 
@@ -260,7 +260,7 @@ static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error
 {
 	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->drm_ras;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 	struct xe_mmio *mmio = &tile->mmio;
 	unsigned long err_stat = 0;
@@ -422,7 +422,7 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
 	const char *severity_str = error_severity[severity];
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_drm_ras *ras = &xe->ras;
+	struct xe_drm_ras *ras = &xe->drm_ras;
 	struct xe_drm_ras_counter *info = ras->info[severity];
 	unsigned long flags, err_src;
 	u32 err_bit;
-- 
2.47.1

