Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D43C001B0
	for <intel-xe@archiver.kernel.org>; Tue, 15 Aug 2023 23:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA6110E02B;
	Tue, 15 Aug 2023 23:56:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A16510E02B
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Aug 2023 23:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692143771; x=1723679771;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N/sJytqYdtAzeRRWcLbgHit2bo9iq/kdtBoI0AVP6lk=;
 b=VczMRv7DUTUC+vq9lSZme0fok6Snk7hSAD+k9d1XYfSWHpDGJIwvgbjH
 S1BgbKrLIjskWzBXPNEBVfUCutPxsGmnUTvSGSSoDqwfbrzGcUNa9FXfm
 tuXBTWoISEYjOrU0AKEu0DY5keJZWT5DQEu1WDrBq4OBUVrJGNQgjYXG1
 G+Khi9XWw/sW3IEeuD2TDeiDUNOOx20MzvQS7dVJ+/0mMv0B87fWcqdk5
 KxoIpDWkNAEbFU756riY/WlhMdrGMN+YPm+XvNZVIlcX8PEwMU2k1xcrf
 8rslqWkIK4DokIHhSZM7NxQhDLHSJ6GhgTgswGTUw4cqCPuwEiXszTsD/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352733305"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="352733305"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 16:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980515270"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="980515270"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.12])
 by fmsmga006.fm.intel.com with ESMTP; 15 Aug 2023 16:56:10 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 15 Aug 2023 16:56:06 -0700
Message-Id: <20230815235606.804366-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add patch version on guc firmware init
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add patch version info on GuC firmware init. This is required info for
GuC log decoder.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c       | 7 +++++--
 drivers/gpu/drm/xe/xe_uc_fw_types.h | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6c95a3e4c3f2..408b816f9e40 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -403,11 +403,14 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 					   css->sw_version);
 	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
 					   css->sw_version);
+	uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
+					   css->sw_version);
 
-	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s\n",
+	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s version %u.%u.%u\n",
 		 xe_uc_fw_type_repr(uc_fw->type),
 		 uc_fw->major_ver_found, uc_fw->minor_ver_found,
-		 uc_fw->path);
+		 uc_fw->path,
+		 uc_fw->major_ver_found, uc_fw->minor_ver_found, uc_fw->patch_ver_found);
 
 	err = uc_fw_check_version_requirements(uc_fw);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 837f49a2347e..444bff83cdbe 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -106,6 +106,8 @@ struct xe_uc_fw {
 	u16 major_ver_found;
 	/** @minor_ver_found: major version found in firmware blob */
 	u16 minor_ver_found;
+	/** @patch_ver_found: patch version found in firmware blob */
+	u16 patch_ver_found;
 
 	/** @rsa_size: RSA size */
 	u32 rsa_size;
-- 
2.34.1

