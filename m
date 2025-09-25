Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04126CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 22:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B730B10E9BF;
	Thu, 25 Sep 2025 22:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AsYH6xSu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29FA10E9C7
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 22:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758837903; x=1790373903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=js+E6BdcJmO3p5aF+W3igi6g0HayD2EpAj8s/haRwfM=;
 b=AsYH6xSufFk23pGwZu5MbBuAjsn6daXtHFWYwPrZoX/ZRMI7HUsGNyQJ
 32JI+QN3oCYRPnicTKFCGXlUTST0jFxbKjen7atcI2EAC3ltPRd1AHU9G
 2QvT5AYcncvXmpBdlGVJxNoR8LsMmpS++ibx6iHkc4v3b1aSA6PMDn3FZ
 lissUo2PZaspW/B7cs0TmRyozGxQ/4Wggz4JtpEDHfhMh1cMagtCbXgLd
 SYbMvAYG1x9OGFBWc7OwE5QXe0NNvSysEpm5dvXl4gZbUALW8KRCBrLo1
 n3D9brqkd4qaNLrVfJ0P0TIs+1rexFznC8q+pW03N2Khw7z+wdb3kvUH3 A==;
X-CSE-ConnectionGUID: kGVajKBvR6KmoEaZtGRl7A==
X-CSE-MsgGUID: P1sc1CMMR9C5QofMV7ll2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61222140"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="61222140"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:05:03 -0700
X-CSE-ConnectionGUID: ZS86NllfT6uxnVuE5kNSxQ==
X-CSE-MsgGUID: nUYorkv/SraBb8nkTHOByQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="201129472"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:04:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 5/6] drm/xe/debugfs: Promote xe_tile_debugfs_simple_show
Date: Fri, 26 Sep 2025 00:04:22 +0200
Message-ID: <20250925220425.196860-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925220425.196860-1-michal.wajdeczko@intel.com>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
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

We will want to use this helper function in other files.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_tile_debugfs.c | 14 +++++++-------
 drivers/gpu/drm/xe/xe_tile_debugfs.h |  3 +++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_tile_debugfs.c
index a3f437d38f86..fff242a5ae56 100644
--- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
@@ -17,7 +17,7 @@ static struct xe_tile *node_to_tile(struct drm_info_node *node)
 }
 
 /**
- * tile_debugfs_simple_show - A show callback for struct drm_info_list
+ * xe_tile_debugfs_simple_show() - A show callback for struct drm_info_list
  * @m: the &seq_file
  * @data: data used by the drm debugfs helpers
  *
@@ -58,7 +58,7 @@ static struct xe_tile *node_to_tile(struct drm_info_node *node)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-static int tile_debugfs_simple_show(struct seq_file *m, void *data)
+int xe_tile_debugfs_simple_show(struct seq_file *m, void *data)
 {
 	struct drm_printer p = drm_seq_file_printer(m);
 	struct drm_info_node *node = m->private;
@@ -69,7 +69,7 @@ static int tile_debugfs_simple_show(struct seq_file *m, void *data)
 }
 
 /**
- * tile_debugfs_show_with_rpm - A show callback for struct drm_info_list
+ * xe_tile_debugfs_show_with_rpm() - A show callback for struct drm_info_list
  * @m: the &seq_file
  * @data: data used by the drm debugfs helpers
  *
@@ -77,7 +77,7 @@ static int tile_debugfs_simple_show(struct seq_file *m, void *data)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-static int tile_debugfs_show_with_rpm(struct seq_file *m, void *data)
+int xe_tile_debugfs_show_with_rpm(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = m->private;
 	struct xe_tile *tile = node_to_tile(node);
@@ -85,7 +85,7 @@ static int tile_debugfs_show_with_rpm(struct seq_file *m, void *data)
 	int ret;
 
 	xe_pm_runtime_get(xe);
-	ret = tile_debugfs_simple_show(m, data);
+	ret = xe_tile_debugfs_simple_show(m, data);
 	xe_pm_runtime_put(xe);
 
 	return ret;
@@ -106,8 +106,8 @@ static int sa_info(struct xe_tile *tile, struct drm_printer *p)
 
 /* only for debugfs files which can be safely used on the VF */
 static const struct drm_info_list vf_safe_debugfs_list[] = {
-	{ "ggtt", .show = tile_debugfs_show_with_rpm, .data = ggtt },
-	{ "sa_info", .show = tile_debugfs_show_with_rpm, .data = sa_info },
+	{ "ggtt", .show = xe_tile_debugfs_show_with_rpm, .data = ggtt },
+	{ "sa_info", .show = xe_tile_debugfs_show_with_rpm, .data = sa_info },
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.h b/drivers/gpu/drm/xe/xe_tile_debugfs.h
index 0e5f724de37f..4429c22542f4 100644
--- a/drivers/gpu/drm/xe/xe_tile_debugfs.h
+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.h
@@ -6,8 +6,11 @@
 #ifndef _XE_TILE_DEBUGFS_H_
 #define _XE_TILE_DEBUGFS_H_
 
+struct seq_file;
 struct xe_tile;
 
 void xe_tile_debugfs_register(struct xe_tile *tile);
+int xe_tile_debugfs_simple_show(struct seq_file *m, void *data);
+int xe_tile_debugfs_show_with_rpm(struct seq_file *m, void *data);
 
 #endif
-- 
2.47.1

