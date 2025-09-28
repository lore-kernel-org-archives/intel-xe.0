Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5900FCAC5BB
	for <intel-xe@archiver.kernel.org>; Sun, 28 Sep 2025 14:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C46510E124;
	Sun, 28 Sep 2025 14:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiIU4k6D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A847610E12E
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Sep 2025 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759068052; x=1790604052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mwNQHkI9QPpuVHf0dLBpVEjoafCJK05O7Tv1pFavbFg=;
 b=UiIU4k6DHLatDyyjKF1r+Q4+geemQhiTbSL96SzSQiWdgJKJwuze5HTu
 FCApd6u2tsYsXbDPnt4d7Pke2FQuHES+HMBurHk4KWh0PMgc4hrUbkEgF
 jWbVtb0ib5m3gnAnedJJ+GpFpAmWw1JAXqN327T3mpd8rzQFJ+DXVvS1M
 /AVLl05itDic3bzmwOhiSsEHyWcbkVum9c1z3IZmcGK9qxNaEnHPzI//i
 0LA/tSdOJus8bB8DPbaH8yZTRjrRBfY3puIgwq8Qg0e4NKGKyNQImKNfo
 6sgFZS2YQb8uJkqG+LSgEfPzcZb0fq4+hgT5kYN1u8Z6l9tVAtOaXG195 w==;
X-CSE-ConnectionGUID: 1WSarj0/TH20uo0V3Y663w==
X-CSE-MsgGUID: wstJ1eI+Sdaap3lmcbK82Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="48893890"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="48893890"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 07:00:52 -0700
X-CSE-ConnectionGUID: crHc578IRMe9tkdXC/QIUQ==
X-CSE-MsgGUID: 32c9VqD9Tj2uR3RqjCuYHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; d="scan'208";a="178761861"
Received: from jkhalil-mobl.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.85])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 07:00:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 5/6] drm/xe/debugfs: Promote xe_tile_debugfs_simple_show
Date: Sun, 28 Sep 2025 16:00:27 +0200
Message-ID: <20250928140029.198847-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250928140029.198847-1-michal.wajdeczko@intel.com>
References: <20250928140029.198847-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

