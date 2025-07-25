Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8ADC83F26
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 00:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EAA10E0EA;
	Fri, 25 Jul 2025 00:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMenvqEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C8910E0EA
 for <Intel-Xe@lists.freedesktop.org>; Fri, 25 Jul 2025 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753402872; x=1784938872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D4Ei0YXCKsTJDNemC8L2yI34opcQOPZkA3CS14VHQUU=;
 b=aMenvqEWBT/11t1YCsf5djuKBJDZ0M5l66FRZdKNpVXM5Zpt95UgUBsU
 83liXpCCrmY7gCIhiBl97TxejV6o9ZVS3794wX0y2jbwnIcH8WtrvTxmb
 20vLplwELnSlRLFeab2K5ipXpAe8jI2O5Bg9Fk4NpRu07abUfH7DYc5my
 cbt1nlGWsq/LIJ+pMZir0U5J7X6wNZqPqWzrvM9Ij0WyrswzVs/xUBbpq
 UIhRAb6/EEuekhnf0dgVZBa7xs/WdFOug71pDM6uK0HeVhUAT8WQlPYLW
 zaG1DicW0h2iXW3EpUTiIttPIIVO6XQ3qgSK4szVGubTG8sQFOkfP9JDF Q==;
X-CSE-ConnectionGUID: UomFtcJxQ0i0xOgZdcrhJQ==
X-CSE-MsgGUID: o80ZfSOtSJyz/P5jM13I1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59549819"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="59549819"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 17:21:11 -0700
X-CSE-ConnectionGUID: 4bRipizIQkG1rvUTxWSfgg==
X-CSE-MsgGUID: hhzbxvvyToSKPyI/bW1LUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="191462858"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa002.jf.intel.com with ESMTP; 24 Jul 2025 17:21:12 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/4] drm/xe/guc: Update CSS header structures
Date: Thu, 24 Jul 2025 17:21:02 -0700
Message-ID: <20250725002111.3906267-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c     | 20 +++++-----
 drivers/gpu/drm/xe/xe_uc_fw_abi.h | 64 ++++++++++++++++++++-----------
 2 files changed, 51 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a236f1d37248..c8378f3e0032 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -344,11 +344,11 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 		return -EINVAL;
 	}
 
-	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->submission_version);
-	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->submission_version);
-	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->submission_version);
+	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->guc_info.submission_version);
+	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->guc_info.submission_version);
+	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->guc_info.submission_version);
 
-	uc_fw->private_data_size = css->private_data_size;
+	uc_fw->private_data_size = css->guc_info.private_data_size;
 
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
@@ -444,9 +444,9 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
 	}
 
 	/* Get version numbers from the CSS header */
-	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->sw_version);
-	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->sw_version);
-	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
+	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->guc_info.sw_version);
+	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->guc_info.sw_version);
+	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->guc_info.sw_version);
 
 	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
 		return guc_read_css_info(uc_fw, css);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
index 87ade41209d0..44d529dbce3b 100644
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
+#define CSS_DATE_MIN				(0xFF << 8)
+#define CSS_DATE_SEC				(0xFFFF << 16)
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

