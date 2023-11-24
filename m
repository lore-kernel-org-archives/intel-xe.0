Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C05C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 14:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B6D10E7F7;
	Fri, 24 Nov 2023 14:03:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB10E10E0AD
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700834636; x=1732370636;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cSOwYOv0Qv4/fc9baxTQicEwreHgT5PAkyWztiMvrGU=;
 b=ctpwJqpo4j0JpKNhAkuSjyTMt2BqCR6HgkRKwLAlddX5F8WN5Nl8Z8pl
 URwvlVTeorMM0Y3cY1zaqTVchzkWp7ZEt7Uq0cIxq3ozDu/gDVijBwt4l
 7XGXs6GoqOYt9NBcVubCjeyfdew8svtcIypKB2yT8977YgRTCA2osBw1I
 LNCB3etdQ/4N5IczxT2M2btM3FmbNHCkcq8S+744UYiN6mBh1X7gpaMU8
 XXFyOPY/ozCdtSbd74CtNhG3TDjP1Y+JfIWplepKeZVP2HQSXdM3lSXWR
 UBee9KWpKyzX9kVVMrgAppl+yWiqL4NG3vl+dDDGdQDnZhuSAw996pDWV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391302253"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="391302253"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 06:03:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="760968466"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="760968466"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 06:03:54 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 19:43:09 +0530
Message-Id: <20231124141311.3894165-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 1/3] drm/xe: Track if platform has csc uid
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

Some platforms, like ATS-M has CSC firmware calculated unique
device id. This flag will help to identify if platform has it.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index be11cadccbd4..a28257b26355 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -261,6 +261,8 @@ struct xe_device {
 		u8 supports_mmio_ext:1;
 		/** @has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
+		/** @has_csc_uid: device has CSC FW calculated uid, used for generating uuid */
+		u8 has_csc_uid:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 682ba188e456..b7127b3724cc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -60,6 +60,7 @@ struct xe_device_desc {
 	u8 has_heci_gscfi:1;
 
 	u8 has_llc:1;
+	u8 has_csc_uid;
 	u8 bypass_mtcfg:1;
 	u8 supports_mmio_ext:1;
 };
@@ -298,6 +299,7 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
+	.has_csc_uid = true,
 };
 
 static const struct xe_device_desc dg2_desc = {
@@ -578,6 +580,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_llc = desc->has_llc;
+	xe->info.has_csc_uid = desc->has_csc_uid;
 	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
 	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
-- 
2.25.1

