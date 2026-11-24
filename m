Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE24606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 05:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nqXj2vmk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F73310E3C2;
	Tue, 24 Nov 2026 05:47:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B04F10E3C2
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 05:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795499216; x=1827035216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q9VJ6L+U8hjm1gkX6VZAAKPvzpIzuQsMuU7kzHGw92E=;
 b=nqXj2vmk1yfUoPcKkLk636+zRE8KybGxkNIryIDUmYb2JM0Plmf3ixnQ
 vJc7hLXAE4frnc/MaTet4+9nQ5USqSq+P2w/vfWSolJ+HeqtV7TBXG5fC
 pL/RC+Ydk09dOgcgmj5yIb5DZvmFJh14FPhXjhmrj2oNCfXLa9NiBWZC5
 KceMimtGyYXji/c5y2GUAh/PZgTlVyeUtXjV6WN1JM8qpp8bPJAQgvjFP
 GltN/vH7BO2DjdSBKlCVNf+NHTvN12VyvLWf8kqrf73mNl/YBp4Ujuw3r
 PZYkSIWESU4wYoXhIWuYsnSvJq/PqqCRWFEpNdz/5rIr6SYJVtq9lgzQ5 g==;
X-CSE-ConnectionGUID: typotPJLRyy65xses8MVZw==
X-CSE-MsgGUID: qXvoyOARR+GhtIbX8zJDMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4222665"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4222665"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:56 -0800
X-CSE-ConnectionGUID: HyPne9HmQKW66mLQDi3Lkg==
X-CSE-MsgGUID: mnAusAUtQw2XrYti03j+7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11354625"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:46:53 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 10/10] drm/xe/hwmon: Enable fan support for CRI
Date: Tue, 24 Nov 2026 11:18:11 +0530
Message-Id: <20261124054811.798763-11-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124054811.798763-1-karthik.poosa@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable fan control support for CRI device IDs 0x674E, 0x674F and
0x6751; other CRI SKUs don't support fan control.
Use new fan 3 speed register offset for CRI.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  1 +
 drivers/gpu/drm/xe/xe_hwmon.c           |  3 ++-
 drivers/gpu/drm/xe/xe_pci.c             | 23 ++++++++++++++++++++++-
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index d9e4847dd68e..5657b483d18f 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -28,6 +28,7 @@
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 
 #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
+#define CRI_FAN_3_SPEED				XE_REG(0x138174)
 #define CRI_MSU_VRAM_ENABLE			XE_REG(0x138340)
 #define CRI_PACKAGE_TEMPERATURE			XE_REG(0x138344)
 #define CRI_VRAM_TEMPERATURE			XE_REG(0x138348)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 2f1d779e2784..8e732f54aae2 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -533,7 +533,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 		else if (channel == FAN_2)
 			return BMG_FAN_2_SPEED;
 		else if (channel == FAN_3)
-			return BMG_FAN_3_SPEED;
+			return (xe->info.platform == XE_CRESCENTISLAND) ? CRI_FAN_3_SPEED :
+				BMG_FAN_3_SPEED;
 		break;
 	default:
 		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e7b844f96d40..b6c1d42fba61 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -477,6 +477,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_display = false,
 	.has_device_uid = true,
 	.has_drm_ras = true,
+	.has_fan_control = true,
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
 	.has_i2c = true,
@@ -612,6 +613,26 @@ find_subplatform(const struct xe_device_desc *desc, u16 devid)
 	return NULL;
 }
 
+/* Only these CRI device IDs support fan control. */
+static const u16 cri_fan_control_ids[] = { 0x674E, 0x674F, 0x6751 };
+
+static bool xe_has_fan_control(struct xe_device *xe)
+{
+	int i;
+
+	if (!xe->desc->has_fan_control)
+		return false;
+
+	if (xe->info.platform != XE_CRESCENTISLAND)
+		return true;
+
+	for (i = 0; i < ARRAY_SIZE(cri_fan_control_ids); i++)
+		if (xe->info.devid == cri_fan_control_ids[i])
+			return true;
+
+	return false;
+}
+
 enum xe_gmdid_type {
 	GMDID_GRAPHICS,
 	GMDID_MEDIA
@@ -804,7 +825,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_cached_pt = desc->has_cached_pt;
 	xe->info.has_device_uid = desc->has_device_uid;
 	xe->info.has_drm_ras = desc->has_drm_ras;
-	xe->info.has_fan_control = desc->has_fan_control;
+	xe->info.has_fan_control = xe_has_fan_control(xe);
 	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
 	/* runtime fusing may force flat_ccs to disabled later */
 	xe->info.has_flat_ccs = desc->has_flat_ccs;
-- 
2.34.1

