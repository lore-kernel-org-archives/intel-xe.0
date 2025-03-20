Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CC0C36000
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0979010E6D2;
	Thu, 20 Mar 2025 21:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iX0pXoed";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965BA10E6D2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 21:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742504876; x=1774040876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=huDj3yGzMxTRFFwagrU2turLoJA+iugOK5KJFvxrd6A=;
 b=iX0pXoed0/aZfZfIZvcmZBLvSwGl9aEZX4SIZ9La3jPeYYtpqIUuFMaG
 pyYJiGx+PjrsdNgf9zTgNGhMJVzPwDGO3DkX6p5j5MwbnWydjf3spULnA
 VJjWuY8f+9hFUveX6XKUwFh5esY7zoyw+tYGiMbYq8cp+ayfUUA6GUWJz
 syKaLDI8tJfMHmCaHgiZ7JFRSnxbjTuBqIwkIP/+vT5L64YU2aLStlUIm
 V5Q8sEO9kY7dnBw+sCGaCN+qfplWUavXFzHMDdWxHAOyNemkp6lWpiWgc
 Pt0CgwYbVKUF5z2VNGHCHS792WNJWbgXeoe0Fj8gg3Besl1VubV2cU2Q5 g==;
X-CSE-ConnectionGUID: WuX+0wSATRy2fu+5AXebsQ==
X-CSE-MsgGUID: pPGanPMzTsaP93yMoOUraQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43875358"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43875358"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:07:56 -0700
X-CSE-ConnectionGUID: Q4J1PCcLRQScN7+qdQGDow==
X-CSE-MsgGUID: Y2klQK4dQASNTbY0OEadJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128326137"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.113.30])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:07:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe/guc: Don't expose GuC privileged debugfs files if
 VF
Date: Thu, 20 Mar 2025 22:07:37 +0100
Message-Id: <20250320210738.1733-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250320210738.1733-1-michal.wajdeczko@intel.com>
References: <20250320210738.1733-1-michal.wajdeczko@intel.com>
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

Some of the GuC debugfs files require access to the data that is
not available on the VFs. Don't expose those files on the VF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index d59408ef0b9d..27b9e531f298 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -69,9 +69,12 @@ static int guc_pc(struct xe_guc *guc, struct drm_printer *p)
 
 static const struct drm_info_list debugfs_list[] = {
 	{ "guc_info", .show = guc_debugfs_show, .data = xe_guc_print_info },
+	{ "guc_ctb", .show = guc_debugfs_show, .data = guc_ctb },
+};
+
+static const struct drm_info_list privileged_list[] = {
 	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
 	{ "guc_log_dmesg", .show = guc_debugfs_show, .data = guc_log_dmesg },
-	{ "guc_ctb", .show = guc_debugfs_show, .data = guc_ctb },
 	{ "guc_pc", .show = guc_debugfs_show, .data = guc_pc },
 };
 
@@ -82,4 +85,9 @@ void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 	drm_debugfs_create_files(debugfs_list,
 				 ARRAY_SIZE(debugfs_list),
 				 parent, minor);
+
+	if (!IS_SRIOV_VF(guc_to_xe(guc)))
+		drm_debugfs_create_files(privileged_list,
+					 ARRAY_SIZE(privileged_list),
+					 parent, minor);
 }
-- 
2.47.1

