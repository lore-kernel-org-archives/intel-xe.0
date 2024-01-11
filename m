Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DAAC47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 18:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D5910E921;
	Thu, 11 Jan 2024 18:56:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B7010E921
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 18:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704999385; x=1736535385;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ry6LoboJlwgRr1VDrux51WuKSUZ/nQsd+pnmyqzFffI=;
 b=azFm19U0+rXYZtkS2yxJgtiMzqfyFR99l6HGGQ0udmBAjQRguSGQ2MSE
 Zg+DZrgZ/mSCtcX5etaECZJPTsbr4IHjJH6NLrjt9zutk4a/2X9uwA+yv
 juKRsfTaGlb4/D5uqz0yW1sIiIJl3SJEybVrNofdGDEwWX7i/3Th3ua4F
 evQcVqps8RTAqp0oIctBXiaQlsOY+EPKR6NxA1zjf0iSEXND7xZaWzZzm
 bqUW6Kvww2L23Dj1w47PYZ+hPXuorcOXUfAdJTUj20Y764U20t2dQixji
 FD59my79qDa8pNG9+XqQFarBODtJkkRzkDXqO4g1i0loclGeziLDynj3p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="463240157"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="463240157"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 10:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="24736466"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.150.229])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 10:56:23 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix potential deadlock in __fini_dbm
Date: Thu, 11 Jan 2024 19:56:03 +0100
Message-Id: <20240111185603.673-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

If Doorbell Manager is in unclean state during fini phase, for
debug purposes we try to print it's state, but we missed the fact
that we are already holding a lock so the xe_guc_db_mgr_print()
will deadlock since it also attempts to grab the same lock.

Fixes: 990fe6e6ed3c ("drm/xe: Introduce GuC Doorbells Manager")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_db_mgr.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index c1c04575d82d..8d9a0287df6b 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -46,6 +46,8 @@ static struct xe_device *dbm_to_xe(struct xe_guc_db_mgr *dbm)
 #define dbm_assert(_dbm, _cond)		xe_gt_assert(dbm_to_gt(_dbm), _cond)
 #define dbm_mutex(_dbm)			(&dbm_to_guc(_dbm)->submission_state.lock)
 
+static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent);
+
 static void __fini_dbm(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_db_mgr *dbm = arg;
@@ -59,7 +61,7 @@ static void __fini_dbm(struct drm_device *drm, void *arg)
 
 		xe_gt_err(dbm_to_gt(dbm), "GuC doorbells manager unclean (%u/%u)\n",
 			  weight, dbm->count);
-		xe_guc_db_mgr_print(dbm, &p, 1);
+		dbm_print_locked(dbm, &p, 1);
 	}
 
 	bitmap_free(dbm->bitmap);
@@ -219,14 +221,7 @@ void xe_guc_db_mgr_release_range(struct xe_guc_db_mgr *dbm,
 	mutex_unlock(dbm_mutex(dbm));
 }
 
-/**
- * xe_guc_db_mgr_print() - Print status of GuC Doorbells Manager.
- * @dbm: the &xe_guc_db_mgr to print
- * @p: the &drm_printer to print to
- * @indent: tab indentation level
- */
-void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
-			 struct drm_printer *p, int indent)
+static void dbm_print_locked(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent)
 {
 	unsigned int rs, re;
 	unsigned int total;
@@ -235,8 +230,6 @@ void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
 	if (!dbm->bitmap)
 		return;
 
-	mutex_lock(dbm_mutex(dbm));
-
 	total = 0;
 	for_each_clear_bitrange(rs, re, dbm->bitmap, dbm->count) {
 		drm_printf_indent(p, indent, "available range: %u..%u (%u)\n",
@@ -252,7 +245,19 @@ void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
 		total += re - rs;
 	}
 	drm_printf_indent(p, indent, "reserved total: %u\n", total);
+}
 
+/**
+ * xe_guc_db_mgr_print() - Print status of GuC Doorbells Manager.
+ * @dbm: the &xe_guc_db_mgr to print
+ * @p: the &drm_printer to print to
+ * @indent: tab indentation level
+ */
+void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
+			 struct drm_printer *p, int indent)
+{
+	mutex_lock(dbm_mutex(dbm));
+	dbm_print_locked(dbm, p, indent);
 	mutex_unlock(dbm_mutex(dbm));
 }
 

base-commit: 39d854dbde14bef5cabe3cf3a49de8894cd99ba7
-- 
2.25.1

