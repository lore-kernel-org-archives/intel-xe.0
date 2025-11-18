Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1C2CEE33C
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A034910E4FA;
	Tue, 18 Nov 2025 16:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+LidIyu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4117910E4F7
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484229; x=1795020229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JhsEMIjsL0HB45d4eTmp12OulLBxCXIdsMmHDJw4l/0=;
 b=E+LidIyuH1wtgx+dn2I6uTHeRdJfXvZZc2ZIHqjXi7pHdl+4Ml+bR2wn
 YBcOU853visv5yTVZuZ3Zp+FIRvtso7lwJo6SxYDp3CeYeGOnqqvyWhk5
 m8z5yXD+WVFLnepkz6K7cc1rqSQ942FfKROcrEeGN7YqGtTjI93CEvpNY
 l7JWD3/Jrw1eMflKyI62s6SfWj0yKoLcQRUTR0AJNUWWfbZnem9IZ7o6y
 YJy9NKXeSyPj4NTTw1ok/e6qUQStKJ0RbjWF6U1itzMICQnN4WzHhMOXb
 dYctVtV1RqljNeOmrGiyCX7cwFmJ7OYTGoj3EhfDz4ISNafKrGkR6VXvD w==;
X-CSE-ConnectionGUID: lmlG5agpQuKatZaU4FvYdw==
X-CSE-MsgGUID: BZaUI0T5RWOax7/XGRwnVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544755"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544755"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:49 -0800
X-CSE-ConnectionGUID: m9ni7D6oTpifKEzD6lNoyA==
X-CSE-MsgGUID: wE7eD6QjQN2yJD2AvgXxdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952194"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 01/27] drm/xe/forcewake: Add scope-based cleanup for forcewake
Date: Tue, 18 Nov 2025 08:43:40 -0800
Message-ID: <20251118164338.3572146-30-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

v4:
 - Add NULL check on fw in release_only variant.  (Gustavo)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
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
index 0e3e84bfa51c..1e2198f6a007 100644
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
+	     if (_T.fw) xe_force_wake_put(_T.fw, _T.domains), fw_ref,
+	     struct xe_force_wake_ref fw_ref);
+
 #endif
-- 
2.51.1

