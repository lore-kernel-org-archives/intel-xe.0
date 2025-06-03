Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6EDC5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 23:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D9910E684;
	Tue,  3 Jun 2025 23:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1n+Zdle";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFCB610E6D8
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 23:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748994883; x=1780530883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ysFXggRF4yGE+W12ygsl+wiXtyUCd/1DNmm5htpl04=;
 b=g1n+ZdleVURknEvbLzoJv3/eVvALn/v51C6Fu1s4lfexi/pC04UBDsWT
 znD5hXpz70mugosLRwml/vFQH2cCny65cGsxywUYc6z5BEGmAqyS8Cs6q
 hqWaeKb3nxykBFQLqvW6+uDirF+SqaDh+jt56/Zv06teUbucLfgDbCY1f
 93NYWZJid+NBPPi9/3NMFtBvOyfPP83ipRvUW7Od40U1RqEBQ1VqJCVD2
 icOBI9MK3y2ZtQFRXyxhu/qP6HVvcsVKVbSpSUFSOMuOslRiypzF8rtmn
 rruFaAwuaGvMyh0eh4mgv78pidtbqVDhgtHhj7BnEOVk8upfwVP+ZVt/s g==;
X-CSE-ConnectionGUID: 6KPx8zgSScq5NAZN+pO3Qw==
X-CSE-MsgGUID: m+3cMcr8TKmwImJCSSgGrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50970536"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="50970536"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:54:42 -0700
X-CSE-ConnectionGUID: z+l/qh7gTg+hYKLIQNgKPg==
X-CSE-MsgGUID: RP0U+yFbQruTF/VPHC2Ghw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="168176354"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:54:42 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 1/4] drm/xe/uc: Prepare uc_fw_version for storing the VF
 ABI version
Date: Tue,  3 Jun 2025 16:54:34 -0700
Message-ID: <20250603235432.720833-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603235432.720833-6-daniele.ceraolospurio@intel.com>
References: <20250603235432.720833-6-daniele.ceraolospurio@intel.com>
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

The VF ABI version has a branch field, so to store it inside the
uc_fw_version we need to add a new branch variable to the latter.
Existing code needs to be updated to handle the fact that we have the
new field.

v2: split out to its own patch (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c | 2 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 0fb48f8f05d8..92e1f9f41b8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -124,7 +124,7 @@ static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
 static bool is_engine_activity_supported(struct xe_guc *guc)
 {
 	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
-	struct xe_uc_fw_version required = { 1, 14, 1 };
+	struct xe_uc_fw_version required = { .major = 1, .minor = 14, .patch = 1 };
 	struct xe_gt *gt = guc_to_gt(guc);
 
 	if (IS_SRIOV_VF(gt_to_xe(gt))) {
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index ad3b35a0e6eb..914026015019 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -65,6 +65,8 @@ enum xe_uc_fw_type {
  * struct xe_uc_fw_version - Version for XE micro controller firmware
  */
 struct xe_uc_fw_version {
+	/** @branch: branch version of the FW (not always available) */
+	u16 branch;
 	/** @major: major version of the FW */
 	u16 major;
 	/** @minor: minor version of the FW */
-- 
2.43.0

