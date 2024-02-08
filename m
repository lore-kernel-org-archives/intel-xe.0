Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33FFC4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 18:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEDD10E9DC;
	Thu,  8 Feb 2024 18:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LP8e6Eyd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA5E10E9DC
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 18:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707417355; x=1738953355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7rhKdoDH8fKtClcucK4kzY1Zz+AOVCKt5ESgeR9JkSU=;
 b=LP8e6EydR5oURc5mNmWjM7NvRFlLRhcTuvXdIrgtF68jJYTlVzjayxTY
 YzEtRrpE0lw3EPQd78SQYyKwdwDyF9wYsVXo2H161Z0qI8cl8oi46XTMk
 TyORggTPcph8xk0dbfbCzb38BiMmPqcIkE0IFfT5+kETuKIEpFGCK472x
 0aFNTyxBqmoU0HhJgtGhcSAYidix67y/F+34maETpMc5Sq5zPLLmqYJcq
 JjiexgG+2jzveZBFXGbOFRhXwwh4QpYICJsUp93s211h8c9whu1nQEpJj
 /E1q/w2g9xnu4YsEfIQyG+n7ZYKzAxB6LnLMoZE/b636XdWTIZncaAv+T g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="23764895"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="23764895"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:35:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="32798591"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:35:54 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Extend uAPI to query HuC micro-controler
 firmware version
Date: Thu,  8 Feb 2024 10:35:39 -0800
Message-ID: <20240208183539.185095-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208183539.185095-1-jose.souza@intel.com>
References: <20240208183539.185095-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Francois Dugast <francois.dugast@intel.com>

The infrastructure to query GuC firmware version is already in place. It
is extended with a new micro-controller type to query the HuC firmware
version. It can be used from user space to know if HuC is running.

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 38 +++++++++++++++++++++++++++++++----
 include/uapi/drm/xe_drm.h     |  1 +
 2 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 92bb06c0586eb..7855d04e032f2 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -544,14 +544,44 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 		version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
 		break;
 	}
+	case XE_QUERY_UC_TYPE_HUC: {
+		struct xe_gt *media_gt = NULL;
+		struct xe_huc *huc;
+
+		if (MEDIA_VER(xe) >= 13) {
+			struct xe_tile *tile;
+			u8 gt_id;
+
+			for_each_tile(tile, xe, gt_id) {
+				if (tile->media_gt) {
+					media_gt = tile->media_gt;
+					break;
+				}
+			}
+		} else {
+			media_gt = xe->tiles[0].primary_gt;
+		}
+
+		if (!media_gt)
+			break;
+
+		huc = &media_gt->uc.huc;
+		if (huc->fw.status == XE_UC_FIRMWARE_RUNNING)
+			version = &huc->fw.versions.found[XE_UC_FW_VER_RELEASE];
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
 
-	resp.branch_ver = 0;
-	resp.major_ver = version->major;
-	resp.minor_ver = version->minor;
-	resp.patch_ver = version->patch;
+	if (version) {
+		resp.branch_ver = 0;
+		resp.major_ver = version->major;
+		resp.minor_ver = version->minor;
+		resp.patch_ver = version->patch;
+	} else {
+		return -ENODEV;
+	}
 
 	if (copy_to_user(query_ptr, &resp, size))
 		return -EFAULT;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0819959a52227..03d12b8f33744 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -583,6 +583,7 @@ struct drm_xe_query_engine_cycles {
 struct drm_xe_query_uc_fw_version {
 	/** @uc_type: The micro-controller type to query firmware version */
 #define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
+#define XE_QUERY_UC_TYPE_HUC 1
 	__u16 uc_type;
 
 	/** @pad: MBZ */
-- 
2.43.0

