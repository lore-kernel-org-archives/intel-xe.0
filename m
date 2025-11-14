Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301F9CEACDC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB74B10EB34;
	Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S//tVt9y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A2110EB2D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156629; x=1794692629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ZnQ0N2t7nE5Rn0MxiW+F3bRn/6vzVj/ezoK1dJAP44=;
 b=S//tVt9yMT1UDxSPKyZT14E4W8NSenQbVRwcI4jxet5XMP6gZXTkjABU
 +q4TKdhIjydHnnRN2BJBykLOKrOh2TH5ko40U4fkzCfttSF4G3/XCrqYt
 nF8JXFhXKKiv8UmhBDcz2bmVaPdmfu9tFLWVU6XjCqtVA6J9MHljo3iRN
 hcoIo7QUOnJNdpkdgv76mfjt51cxwsDLoyUf3uli0AKVDlpUd3NFlL4tM
 DoqQETodNWLoxJUBoIV0yxPTH0tc+B2NrG0sqB00Vd3mhoV2yOzttC4Lu
 gWTXLy/X02hV//7MbfSeSVF+QrtdzXBqxlt+QeO+aHQgrk3KrAshUVKBR Q==;
X-CSE-ConnectionGUID: BBmmpv64QQqliBtZsX4Q+g==
X-CSE-MsgGUID: OYjedIXJRSaydd3NT2QkXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648302"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648302"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:49 -0800
X-CSE-ConnectionGUID: SD+EBww6SwSTyv51OYWhLA==
X-CSE-MsgGUID: 3G92OjsGQG6sa1656//yyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308275"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 01/27] drm/xe/forcewake: Add scope-based cleanup for
 forcewake
Date: Fri, 14 Nov 2025 13:43:37 -0800
Message-ID: <20251114214335.2388972-30-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

Since forcewake uses a reference counting get/put model, there are many
places where we need to be careful to drop the forcewake reference when
bailing out of a function early on an error path.  Add scope-based
cleanup options that can be used in place of explicit get/put to help
prevent mistakes in this area.

Examples:

   CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);

       Obtain forcewake on the XE_FW_GT domain and hold it until the
       end of the current block.  The wakeref will be dropped
       automatically when the current scope is exited by any means
       (return, break, reaching the end of the block, etc.).

   xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
        ...
   }

       Hold all forcewake domains for the following block.  As with the
       CLASS usage, forcewake will be dropped automatically when the
       block is exited by any means.

Use of these cleanup helpers should allow us to remove some ugly
goto-based error handling and help avoid mistakes in functions with lots
of early error exits.

An 'xe_force_wake_release_only' class is also added for cases where a
forcewake reference is passed in from another function and the current
function is responsible for releasing it in every flow and error path.

v2:
 - Create a separate constructor that just wraps xe_force_wake_get for
   use in the class.  This eliminates the need to update the signature
   of xe_force_wake_get().  (Michal)

v3:
 - Wrap xe_with_force_wake's 'done' marker in __UNIQUE_ID.  (Gustavo)
 - Add a note to xe_force_wake_get()'s kerneldoc explaining that
   scope-based cleanup is preferred when possible.  (Gustavo)
 - Add an xe_force_wake_release_only class.  (Gustavo)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c |  7 ++++++
 drivers/gpu/drm/xe/xe_force_wake.h | 40 ++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index c59a9b330697..76e054f314ee 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -166,6 +166,13 @@ static int domain_sleep_wait(struct xe_gt *gt,
  * xe_force_wake_ref_has_domain() function. Caller must call
  * xe_force_wake_put() function to decrease incremented refcounts.
  *
+ * When possible, scope-based forcewake (through CLASS(xe_force_wake, ...) or
+ * xe_with_force_wake()) should be used instead of direct calls to this
+ * function.  Direct usage of get/put should only be used when the function
+ * has goto-based flows that can interfere with scope-based cleanup, or when
+ * the lifetime of the forcewake reference does not match a specific scope
+ * (e.g., forcewake obtained in one function and released in a different one).
+ *
  * Return: opaque reference to woken domains or zero if none of requested
  * domains were awake.
  */
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 0e3e84bfa51c..ffc4e103fe31 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -61,4 +61,44 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains dom
 	return fw_ref & domain;
 }
 
+struct xe_force_wake_ref {
+	struct xe_force_wake *fw;
+	unsigned int domains;
+};
+
+static struct xe_force_wake_ref
+xe_force_wake_constructor(struct xe_force_wake *fw, unsigned int domains)
+{
+	struct xe_force_wake_ref fw_ref = { .fw = fw };
+
+	fw_ref.domains = xe_force_wake_get(fw, domains);
+
+	return fw_ref;
+}
+
+DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
+	     xe_force_wake_put(_T.fw, _T.domains),
+	     xe_force_wake_constructor(fw, domains),
+	     struct xe_force_wake *fw, unsigned int domains);
+
+/*
+ * Scoped helper for the forcewake class, using the same trick as scoped_guard()
+ * to bind the lifetime to the next statement/block.
+ */
+#define __xe_with_force_wake(ref, fw, domains, done) \
+	for (CLASS(xe_force_wake, ref)(fw, domains), *(done) = NULL; \
+	     !(done); (done) = (void *)1)
+
+#define xe_with_force_wake(ref, fw, domains) \
+	__xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
+
+/*
+ * Used when xe_force_wake_constructor() has already been called by another
+ * function and the current function is responsible for releasing the forcewake
+ * reference in all possible cases and error paths.
+ */
+DEFINE_CLASS(xe_force_wake_release_only, struct xe_force_wake_ref,
+	     xe_force_wake_put(_T.fw, _T.domains), fw_ref,
+	     struct xe_force_wake_ref fw_ref);
+
 #endif
-- 
2.51.1

