Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02760FF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 06:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC56710E383;
	Mon,  4 May 2026 06:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQfh0pRm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392B010E383
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 06:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777875809; x=1809411809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PxvXSnDiU1t7Gvg5c27EqvWIq+UKUs5Dw3S74oq3rq4=;
 b=jQfh0pRm5FkSJaskJg8MU0Rc8OvBde4OzCsjduT8Wq2wbhUDY0ckh38l
 iD021n9MaYSASR9akwTHSkqiGgNBA+O2ZAYQE3j11Mj51XNK7YfHFVZ6u
 4ZhBe/0WYoGl07MK/d/WliauJqck54AKor8qS6SGFoyIyj9mvYCWsce5Y
 yzaELIxyCFuHIGU5W9JECO180ybQ53B9Gn6GrwNFaH6lEMWiYOWYY3Y74
 vDZP/Hw0wTvT/Ppp2jV0iUtNikAGWQVSHYtB76Y5Tq2/dpVJrUulCezyw
 8CBrvFHcVW2NnjHS3dxYsTpgrCWZWsZe6kHrTqkbQJRoQs67f16AjNFEl g==;
X-CSE-ConnectionGUID: 3MQG7VSnTzWkkJRl4g9Aiw==
X-CSE-MsgGUID: fXVua8+jRxWvmApX9fMQtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78592341"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="78592341"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 23:23:29 -0700
X-CSE-ConnectionGUID: sy8lpP9qQY+rd2xdySQReg==
X-CSE-MsgGUID: wM75y5hzToix5hw7+/dV7Q==
X-ExtLoop1: 1
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 23:23:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v5 6/6] drm/xe/xe_ras: Control xe drm_ras registration with a
 flag
Date: Mon,  4 May 2026 12:26:21 +0530
Message-ID: <20260504065614.3832331-14-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260504065614.3832331-8-riana.tauro@intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
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

Add a flag to control xe drm_ras registration.
Enable this flag for PVC and CRI to support exposing RAS error counters via netlink.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
v2: rename flag to drm_ras
    move drm_ras registration to ras_init (Raag)
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 3 +++
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 drivers/gpu/drm/xe/xe_ras.c          | 2 +-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 89437de3001a..4ba3dffddaf3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -155,6 +155,8 @@ struct xe_device {
 		u8 has_cached_pt:1;
 		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
 		u8 has_device_atomics_on_smem:1;
+		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
+		u8 has_drm_ras:1;
 		/** @info.has_fan_control: Device supports fan control */
 		u8 has_fan_control:1;
 		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d55e5af4f4b7..739cebef1200 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -355,6 +355,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	PLATFORM(PVC),
 	.dma_mask_size = 52,
 	.has_display = false,
+	.has_drm_ras = true,
 	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
 	.max_gt_per_tile = 1,
@@ -456,6 +457,7 @@ static const struct xe_device_desc cri_desc = {
 	PLATFORM(CRESCENTISLAND),
 	.dma_mask_size = 52,
 	.has_display = false,
+	.has_drm_ras = true,
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
 	.has_i2c = true,
@@ -747,6 +749,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_cached_pt = desc->has_cached_pt;
+	xe->info.has_drm_ras = desc->has_drm_ras;
 	xe->info.has_fan_control = desc->has_fan_control;
 	/* runtime fusing may force flat_ccs to disabled later */
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 5b85e2c24b7b..24d4a3d00517 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -40,6 +40,7 @@ struct xe_device_desc {
 
 	u8 has_cached_pt:1;
 	u8 has_display:1;
+	u8 has_drm_ras:1;
 	u8 has_fan_control:1;
 	u8 has_flat_ccs:1;
 	u8 has_gsc_nvm:1;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 7d2945bb819e..44cea530f110 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -270,7 +270,7 @@ void xe_ras_init(struct xe_device *xe)
 {
 	int ret;
 
-	if (xe->info.platform != XE_PVC)
+	if (!xe->info.has_drm_ras)
 		return;
 
 	ret = xe_drm_ras_init(xe);
-- 
2.47.1

