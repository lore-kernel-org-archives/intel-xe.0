Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B746CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2736010EB8F;
	Fri,  7 Nov 2025 18:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhUsiSc1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0225110EB7F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539211; x=1794075211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4FbyF4kfrpQP8qPxsF2grjc6b8BOQe2lLYzZUfHP3pU=;
 b=LhUsiSc1PzexAkSoYml48WjeR5p4i3KCNlnws82T+3qbZNhurxFGbtjQ
 cC2z3Vxe4pKTvuk8wotzS63+QsIOTNFDxygUOT8S2nIDL+QajjaX2PiI2
 TUmoY4KqV4yioc98mt1J2zsGjk//DnT2eNgoCMCdOxkwE0wTqHaRUbQHw
 Rv4NASdzG7vXpYP57LyUgjb2YonjLdeN+auaaCMBttgNKg/58udGsmVLr
 MDtcYZ5wZyp6eDXCqXLQLP8X4S9LXmosOCHPOjaTLQlb3YIFi+M+pR4yG
 ayRhjPhAkd/CNsyvvQ+MsYaEBdqNtkbZ2qRJMZfKp/G5ERpCJ6kODDFWi w==;
X-CSE-ConnectionGUID: UXD91h1UTgeetmwJ2aExGA==
X-CSE-MsgGUID: sJFynoT0SaOKShXdv6Gt6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733153"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
X-CSE-ConnectionGUID: RbfVQ+2uQ/+YhMD12ya9aQ==
X-CSE-MsgGUID: XeYahGHSQu+xFh+X+FUF1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271210"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 20/33] drm/xe: Create scoped cleanup class for
 force_wake_get_any_engine()
Date: Fri,  7 Nov 2025 10:13:36 -0800
Message-ID: <20251107181315.631642-55-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

force_wake_get_any_engine() is a single-use function to pick any engine
present on the platform and grab its forcewake.  The signature
(returning a boolean success and both the engine pointer and a forcewake
ref by reference) is a bit awkward.  Rewrite it such that the
forcewake ref is the function's return value and the caller can
determine success/failure by checking the engine pointer against NULL.

With this new signature, the function can serve as a scoped cleanup
class constructor, so define the corresponding class.  Note that if we
fail to obtain forcewake (or if the platform somehow has no engines),
the constructor can fail, returning an invalid fw_ref.  In such cases,
fw_ref.fw will be NULL, making it clear that the reference is invalid;
this fact can be used to create a thin wrapper around xe_force_wake_put
that can be used as a destructor for this class.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 45 ++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 182526864286..6e0a05eeb587 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_print.h>
 #include <uapi/drm/xe_drm.h>
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -285,34 +286,49 @@ static struct xe_hw_engine *any_engine(struct xe_device *xe)
 	return NULL;
 }
 
-static bool force_wake_get_any_engine(struct xe_device *xe,
-				      struct xe_hw_engine **phwe,
-				      struct xe_force_wake_ref *pfw_ref)
+/*
+ * Pick any engine and grab its forcewake.  On error phwe will be NULL and
+ * the returned forcewake reference will be invalid.  Callers should check
+ * phwe against NULL.
+ */
+static struct xe_force_wake_ref force_wake_get_any_engine(struct xe_device *xe,
+							  struct xe_hw_engine **phwe)
 {
 	enum xe_force_wake_domains domain;
-	struct xe_force_wake_ref fw_ref;
+	struct xe_force_wake_ref fw_ref = {};
 	struct xe_hw_engine *hwe;
 	struct xe_force_wake *fw;
 
+	*phwe = NULL;
+
 	hwe = any_engine(xe);
 	if (!hwe)
-		return false;
+		return fw_ref;	/* will be invalid */
 
 	domain = xe_hw_engine_to_fw_domain(hwe);
 	fw = gt_to_fw(hwe->gt);
 
 	fw_ref = xe_force_wake_get(fw, domain);
-	if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
+	if (xe_force_wake_ref_has_domain(fw_ref, domain))
+		*phwe = hwe;	/* valid forcewake */
+
+	return fw_ref;
+}
+
+static void drop_fw_if_valid(struct xe_force_wake_ref fw_ref)
+{
+	/*
+	 * If force_wake_get_any_engine() fails, there's no real forcewake
+	 * reference to drop, and fw_ref.fw will be NULL.
+	 */
+	if (fw_ref.fw)
 		xe_force_wake_put(fw_ref);
-		return false;
-	}
-
-	*phwe = hwe;
-	*pfw_ref = fw_ref;
-
-	return true;
 }
 
+DEFINE_CLASS(xe_force_wake_any_engine, struct xe_force_wake_ref,
+	     drop_fw_if_valid(_T), force_wake_get_any_engine(xe, phwe),
+	     struct xe_device *xe, struct xe_hw_engine **phwe);
+
 static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 {
 	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
@@ -340,7 +356,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		       !atomic_read(&xef->exec_queue.pending_removal));
 
 	xe_pm_runtime_get(xe);
-	if (!force_wake_get_any_engine(xe, &hwe, &fw_ref)) {
+	fw_ref = force_wake_get_any_engine(xe, &hwe);
+	if (!hwe) {
 		xe_pm_runtime_put(xe);
 		return;
 	}
-- 
2.51.1

