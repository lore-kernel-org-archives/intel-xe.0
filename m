Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716E2C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 17:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D33110EDA3;
	Wed, 26 Aug 2026 17:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6BoK28C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62E110EDA2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 17:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787764325; x=1819300325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZGAHRrdR/1O0ITgckn/GjLQQzY8easYmvc8aLa9WMrI=;
 b=c6BoK28CVT/wX7sSFjs2Nw4NsFUm4yk+NApTCsy3CVt8+k93k+4hwmCc
 6a4BXVBP3JKi1WH04RhnAN7piSUL+rU42WlLZH2/Z21b8wlC5Cui7iIBO
 DcXda4QAqWg07yPvrXfha8ljWbGlL2UD9KEwr0Je8W7uGB2CoqEI2MYms
 gZCd7lS6BQw4tGiPfD+mZ8rlWqjwJ3EgECf8jRsJ88HT9iZWpLjP7FTUu
 dAlcM6NIaqOWfr4B8T7kbqEpwB+Z6hjQmzKAmedI8DHIQIyCN4nVP5GHx
 BhLz3EaaID7QCHq+uFQmRSG6DdJSQfw/x2VxtP7yAbE8/dOixtVFB8Grt Q==;
X-CSE-ConnectionGUID: 1arTNEEmTS62rDBEr4a64Q==
X-CSE-MsgGUID: NQMNMC38SFeQwVhsQ0EEnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88379123"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88379123"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:05 -0700
X-CSE-ConnectionGUID: YUN6Np+GRK+QTZHhE+qbsw==
X-CSE-MsgGUID: uFwO0oFuRi+7dBPDxwUN4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="261493131"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:04 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 2/6] drm/xe/uc: Add FW file fallback support
Date: Wed, 26 Aug 2026 17:11:45 +0000
Message-ID: <20260826171149.708378-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
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

The GSC team is splitting their PTL release to have a dedicated fork for
WCL. Since we currently ship WCL with the PTL GSC release, we need to
support both binaries, with a preference for the WCL one.
To do so, we need support for falling back to an older entry in the
binary list. This complicates the version tracking a bit, because now we
have a main wanted version (the one of the newer binary), but also
minimal versions to check against for the fallback binary; for example,
if we fell back from GuC v71 to GuC v70, the wanted version would be
v71 but the one we want to compare against for the fall-back binary is
v70. To track both of those, a new "comparison" version has been added,
which is used just to check against what's in the fetched binary.

Assisted-by: GitHub-Copilot:claude-sonnet-5
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c       | 68 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_uc_fw_types.h |  9 ++++
 2 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e29878b255ba..f918135cc96f 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -229,7 +229,7 @@ void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw, enum xe_uc_fw_status status)
 }
 #endif
 
-static void
+static bool
 uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 {
 	static const struct uc_fw_entry entries_guc[] = {
@@ -270,12 +270,31 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 		    entries[i].gt_type != gt->info.type)
 			continue;
 
+		if (uc_fw->path) {
+			/*
+			 * Continuing an earlier search after a found blob
+			 * failed to load. Once the previously chosen path has
+			 * been found, clear it out and let the search continue
+			 * from there.
+			 */
+			if (uc_fw->path == entries[i].path)
+				uc_fw->path = NULL;
+			continue;
+		}
+
 		uc_fw->path = entries[i].path;
-		uc_fw->versions.wanted.major = entries[i].major;
-		uc_fw->versions.wanted.minor = entries[i].minor;
-		uc_fw->versions.wanted.patch = entries[i].patch;
+		uc_fw->versions.comparison.major = entries[i].major;
+		uc_fw->versions.comparison.minor = entries[i].minor;
+		uc_fw->versions.comparison.patch = entries[i].patch;
 		uc_fw->full_ver_required = entries[i].full_ver_required;
 
+		if (!uc_fw->wanted_path) {
+			uc_fw->wanted_path = uc_fw->path;
+			uc_fw->versions.wanted.major = entries[i].major;
+			uc_fw->versions.wanted.minor = entries[i].minor;
+			uc_fw->versions.wanted.patch = entries[i].patch;
+		}
+
 		if (uc_fw->type == XE_UC_FW_TYPE_GSC)
 			uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
 		else
@@ -283,6 +302,8 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 
 		break;
 	}
+
+	return uc_fw->path != NULL;
 }
 
 static void
@@ -373,13 +394,21 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_guc_info *guc
 int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
-	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
+	struct xe_uc_fw_version *wanted = &uc_fw->versions.comparison;
 	struct xe_uc_fw_version *found = &uc_fw->versions.found[uc_fw->versions.wanted_type];
+	bool need_update = false;
 
 	/* Driver has no requirement on any version, any is good. */
 	if (!wanted->major)
 		return 0;
 
+	if (uc_fw->wanted_path != uc_fw->path) {
+		drm_notice(&xe->drm,
+			   "%s firmware: using fallback path %s instead of the recommended %s\n",
+			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, uc_fw->wanted_path);
+		need_update = true;
+	}
+
 	/*
 	 * If full version is required, both major and minor should match.
 	 * Otherwise, at least the major version.
@@ -397,14 +426,16 @@ int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
 
 	if (wanted->minor > found->minor ||
 	    (wanted->minor == found->minor && wanted->patch > found->patch)) {
-		drm_notice(&xe->drm, "%s firmware (%u.%u.%u) is recommended, but only (%u.%u.%u) was found in %s\n",
+		drm_notice(&xe->drm, "%s firmware (%u.%u.%u) is recommended for %s, but only (%u.%u.%u) was found\n",
 			   xe_uc_fw_type_repr(uc_fw->type),
-			   wanted->major, wanted->minor, wanted->patch,
-			   found->major, found->minor, found->patch,
-			   uc_fw->path);
+			   wanted->major, wanted->minor, wanted->patch, uc_fw->path,
+			   found->major, found->minor, found->patch);
+		need_update = true;
+	}
+
+	if (need_update)
 		drm_info(&xe->drm, "Consider updating your linux-firmware pkg or downloading from %s\n",
 			 XE_UC_FIRMWARE_URL);
-	}
 
 	return 0;
 
@@ -756,6 +787,15 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 	}
 
 	err = firmware_request_nowarn(&fw, uc_fw->path, dev);
+	if (err && (err != -ENOENT || uc_fw->user_overridden))
+		goto fail;
+
+	/* if the selected blob isn't found, keep trying other matching entries in the table */
+	while (err == -ENOENT && uc_fw_auto_select(xe, uc_fw)) {
+		xe_gt_dbg(gt, "Trying %s fallback firmware entry: %s\n",
+			  xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
+		err = firmware_request_nowarn(&fw, uc_fw->path, dev);
+	}
 	if (err)
 		goto fail;
 
@@ -785,8 +825,8 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 			       XE_UC_FIRMWARE_ERROR);
 
 	if (err == -ENOENT)
-		xe_gt_info(gt, "%s firmware %s not found\n",
-			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
+		xe_gt_info(gt, "%s firmware not found\n",
+			   xe_uc_fw_type_repr(uc_fw->type));
 	else
 		xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",
 			     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
@@ -954,8 +994,8 @@ void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p)
 {
 	int i;
 
-	drm_printf(p, "%s firmware: %s\n",
-		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
+	drm_printf(p, "%s firmware: %s [wanted %s]\n",
+		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, uc_fw->wanted_path);
 	drm_printf(p, "\tstatus: %s\n",
 		   xe_uc_fw_status_repr(uc_fw->status));
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index 2ebe8c9db6ce..2faca8e043f0 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -98,6 +98,8 @@ struct xe_uc_fw {
 		 */
 		enum xe_uc_fw_status __status;
 	};
+	/** @wanted_path: path to preferred uC firmware */
+	const char *wanted_path;
 	/** @path: path to uC firmware */
 	const char *path;
 	/** @user_overridden: user provided path to uC firmware via modparam */
@@ -129,6 +131,13 @@ struct xe_uc_fw {
 	struct {
 		/** @versions.wanted: firmware version wanted by platform */
 		struct xe_uc_fw_version wanted;
+		/**
+		 * @versions.comparison: firmware version to compare what is
+		 * found in the blob against. This can be different from the
+		 * wanted version if we're falling back to an older firmware
+		 * file.
+		 */
+		struct xe_uc_fw_version comparison;
 		/**
 		 * @versions.wanted_type: type of firmware version wanted
 		 * (release vs compatibility)
-- 
2.53.0

