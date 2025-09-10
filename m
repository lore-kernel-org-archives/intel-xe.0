Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F86CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 21:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81C910E9E5;
	Wed, 10 Sep 2025 21:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DICpNBgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE4810E9E5
 for <Intel-Xe@lists.freedesktop.org>; Wed, 10 Sep 2025 21:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757538159; x=1789074159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F8DUoR10+deQ7sRN4xZBc90bCnOAbn4cHLrsQJfVha0=;
 b=DICpNBgrPfOB1wLQNUtfsCbJwHDAhTSqzfHgOTzXTZOQmftl6oBGTZDW
 bd29hzoN1KO+uGmuTo9KJB+ewETp6HfVuKiCzJGvnldFj/cgdcbygbOY7
 DbAi7qjzhRswkOJ5fnavXa7KLInDxTetX/WkH8TzMLOXwUzlZm8mheFkc
 EwnfFHb39exhQJsJdEZcQdaPfWx/KKxExXieYty9R03iihFZA1k2iOmHo
 9v4rWPR3omIk6qFM/QIqDRkUHCrlmcHydkS9vvNLZoIg/N2TVdnkzbbvP
 KrQtG5zqehm05O+advcYn634kNBp36lwDnKAhfO8AhMUCYZCqejJvntz4 A==;
X-CSE-ConnectionGUID: nJIkmeNKQL+2bYL7Nx8wZQ==
X-CSE-MsgGUID: NozLbd/vR7+mE9JQfo8MaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70958643"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="70958643"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 14:02:38 -0700
X-CSE-ConnectionGUID: WAkPPBcxSGCW8QWJMb1GEg==
X-CSE-MsgGUID: 2eAvRCr+TImJNf0rPB4vXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="174311951"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2025 14:02:38 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 1/4] drm/xe/guc: Update CSS header structures
Date: Wed, 10 Sep 2025 14:02:32 -0700
Message-ID: <20250910210237.603576-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250910210237.603576-1-John.C.Harrison@Intel.com>
References: <20250910210237.603576-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Rework the CSS header structure according to recent updates to the GuC
API spec. Also include more field definitions.

v2: Also pass the new GuC specific structure to a GuC specific
function instead of the higher level, generic structure (review
feedback from Daniele).
Also correct naming of CSS_TIME_* fields.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c     | 24 ++++++------
 drivers/gpu/drm/xe/xe_uc_fw_abi.h | 64 ++++++++++++++++++++-----------
 2 files changed, 53 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index ec58bbad4b9f..8957990846bb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -329,7 +329,7 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
 	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
 }
 
-static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
+static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_guc_info *guc_info)
 {
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
@@ -344,11 +344,11 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 		return -EINVAL;
 	}
 
-	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->submission_version);
-	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->submission_version);
-	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->submission_version);
+	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, guc_info->submission_version);
+	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, guc_info->submission_version);
+	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, guc_info->submission_version);
 
-	uc_fw->private_data_size = css->private_data_size;
+	uc_fw->private_data_size = guc_info->private_data_size;
 
 	return 0;
 }
@@ -417,8 +417,8 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
 	css = (struct uc_css_header *)fw_data;
 
 	/* Check integrity of size values inside CSS header */
-	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
-		css->exponent_size_dw) * sizeof(u32);
+	size = (css->header_size_dw - css->rsa_info.key_size_dw - css->rsa_info.modulus_size_dw -
+		css->rsa_info.exponent_size_dw) * sizeof(u32);
 	if (unlikely(size != sizeof(struct uc_css_header))) {
 		drm_warn(&xe->drm,
 			 "%s firmware %s: unexpected header size: %zu != %zu\n",
@@ -431,7 +431,7 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
 	uc_fw->ucode_size = (css->size_dw - css->header_size_dw) * sizeof(u32);
 
 	/* now RSA */
-	uc_fw->rsa_size = css->key_size_dw * sizeof(u32);
+	uc_fw->rsa_size = css->rsa_info.key_size_dw * sizeof(u32);
 
 	/* At least, it should have header, uCode and RSA. Size of all three. */
 	size = sizeof(struct uc_css_header) + uc_fw->ucode_size +
@@ -444,12 +444,12 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
 	}
 
 	/* Get version numbers from the CSS header */
-	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->sw_version);
-	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->sw_version);
-	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
+	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->guc_info.sw_version);
+	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->guc_info.sw_version);
+	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->guc_info.sw_version);
 
 	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
-		return guc_read_css_info(uc_fw, css);
+		return guc_read_css_info(uc_fw, &css->guc_info);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
index 87ade41209d0..faceb437fd2f 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
@@ -44,6 +44,39 @@
  *    in fw. So driver will load a truncated firmware in this case.
  */
 
+struct uc_css_rsa_info {
+	u32 key_size_dw;
+	u32 modulus_size_dw;
+	u32 exponent_size_dw;
+} __packed;
+
+struct uc_css_guc_info {
+	u32 time;
+#define CSS_TIME_HOUR				(0xFF << 0)
+#define CSS_TIME_MIN				(0xFF << 8)
+#define CSS_TIME_SEC				(0xFFFF << 16)
+	u32 reserved0[5];
+	u32 sw_version;
+#define CSS_SW_VERSION_UC_MAJOR			(0xFF << 16)
+#define CSS_SW_VERSION_UC_MINOR			(0xFF << 8)
+#define CSS_SW_VERSION_UC_PATCH			(0xFF << 0)
+	u32 submission_version;
+	u32 reserved1[11];
+	u32 header_info;
+#define CSS_HEADER_INFO_SVN			(0xFF)
+#define CSS_HEADER_INFO_COPY_VALID		(0x1 << 31)
+	u32 private_data_size;
+	u32 ukernel_info;
+#define CSS_UKERNEL_INFO_DEVICEID		(0xFFFF << 16)
+#define CSS_UKERNEL_INFO_PRODKEY		(0xFF << 8)
+#define CSS_UKERNEL_INFO_BUILDTYPE		(0x3 << 2)
+#define CSS_UKERNEL_INFO_BUILDTYPE_PROD		0
+#define CSS_UKERNEL_INFO_BUILDTYPE_PREPROD	1
+#define CSS_UKERNEL_INFO_BUILDTYPE_DEBUG	2
+#define CSS_UKERNEL_INFO_ENCSTATUS		(0x1 << 1)
+#define CSS_UKERNEL_INFO_COPY_VALID		(0x1 << 0)
+} __packed;
+
 struct uc_css_header {
 	u32 module_type;
 	/*
@@ -52,36 +85,21 @@ struct uc_css_header {
 	 */
 	u32 header_size_dw;
 	u32 header_version;
-	u32 module_id;
+	u32 reserved0;
 	u32 module_vendor;
 	u32 date;
-#define CSS_DATE_DAY			(0xFF << 0)
-#define CSS_DATE_MONTH			(0xFF << 8)
-#define CSS_DATE_YEAR			(0xFFFF << 16)
+#define CSS_DATE_DAY				(0xFF << 0)
+#define CSS_DATE_MONTH				(0xFF << 8)
+#define CSS_DATE_YEAR				(0xFFFF << 16)
 	u32 size_dw; /* uCode plus header_size_dw */
-	u32 key_size_dw;
-	u32 modulus_size_dw;
-	u32 exponent_size_dw;
-	u32 time;
-#define CSS_TIME_HOUR			(0xFF << 0)
-#define CSS_DATE_MIN			(0xFF << 8)
-#define CSS_DATE_SEC			(0xFFFF << 16)
-	char username[8];
-	char buildnumber[12];
-	u32 sw_version;
-#define CSS_SW_VERSION_UC_MAJOR		(0xFF << 16)
-#define CSS_SW_VERSION_UC_MINOR		(0xFF << 8)
-#define CSS_SW_VERSION_UC_PATCH		(0xFF << 0)
 	union {
-		u32 submission_version; /* only applies to GuC */
-		u32 reserved2;
+		u32 reserved1[3];
+		struct uc_css_rsa_info rsa_info;
 	};
-	u32 reserved0[12];
 	union {
-		u32 private_data_size; /* only applies to GuC */
-		u32 reserved1;
+		u32 reserved2[22];
+		struct uc_css_guc_info guc_info;
 	};
-	u32 header_info;
 } __packed;
 static_assert(sizeof(struct uc_css_header) == 128);
 
-- 
2.49.0

