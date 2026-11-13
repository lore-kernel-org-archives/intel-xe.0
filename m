Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F73606A32E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 13:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H7so1a1L
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8EE112587;
	Fri, 13 Nov 2026 13:44:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC38911257E;
 Fri, 13 Nov 2026 13:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794577458; x=1826113458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0M46jjUmsGhbxmzPOWTd+ix6V/EV6Nz8okS2/SWuW0=;
 b=H7so1a1LLYcY9DL2BI95Roeuusv56Un9JUGr/uzS7Z4t5FO31xOt/pB1
 w8+11ka28Ark90sFocZn5LhCXptroUKuUTJHdAOmb49EgnDai+i0M+vGV
 AK882vFcT+o97b/tjEePQnfMHoZmgocQ3B8jb9ZdD2PUYk3WC/vf0YddP
 Ke1as3bN15GlCsxJUwuos6uS3xamJMfofVdbNVOAFroJhn87jMXNEprLl
 7XwmlzkyMCbHFI+knEvp9JDCWqaAXhYydEK6CNJUMC2eB4mrt+5jmoXRW
 3q+RaSnDD+nypIR1Og8h1+a6sJxIfNI33f2ZuquIHq/pLQPA7/PRuKSMj Q==;
X-CSE-ConnectionGUID: 0/O3OwfKToSf8+EOXavHBQ==
X-CSE-MsgGUID: cRdWVu+LRm2CUDuQdO1r9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3391335"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3391335"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:18 -0800
X-CSE-ConnectionGUID: Z4VjH2JJQ6Wq8//necbQ1Q==
X-CSE-MsgGUID: djyqkh72SzSvTR8Rlovu5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9245476"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 05:44:18 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/8] drm/i915/de: Optimize the mmio_debug checks in
 intel_de_{read, write}()
Date: Fri, 13 Nov 2026 15:43:52 +0200
Message-ID: <20261113134355.14579-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently we do the "is mmio_debug enabled?" check from
the non-inlined check_unclaimed_mmio_{pre,post}(). That means
we pay for two extra function calls for every register access
even when mmio_debug is disabled.

Inline the checks into the actual intel_de_{read,write}() to
avoid the pointless overhead. We have to hand hold the compiler
a bit (by using a bitwise OR instead of logical OR) or else
it'll emit a separate branch for each boolean.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 44 ++++++++++++++-----------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 5a74cf173cb8..81fd1569bb65 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -242,18 +242,9 @@ static bool vlv_check_for_unclaimed_mmio(struct intel_display *display)
 	return true;
 }
 
-static bool mmio_debug_is_enabled(struct intel_display *display)
-{
-	return READ_ONCE(display->params.mmio_debug) ||
-		READ_ONCE(display->mmio.mmio_debug_oneshot);
-}
-
 static void check_unclaimed_mmio_pre(struct intel_display *display,
 				     intel_reg_t reg, bool write)
 {
-	if (!mmio_debug_is_enabled(display))
-		return;
-
 	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
 		return;
 
@@ -266,9 +257,6 @@ static void check_unclaimed_mmio_pre(struct intel_display *display,
 static void check_unclaimed_mmio_post(struct intel_display *display,
 				      intel_reg_t reg, bool write)
 {
-	if (!mmio_debug_is_enabled(display))
-		return;
-
 	if (!display->mmio.funcs->check_for_unclaimed_mmio(display))
 		return;
 
@@ -355,19 +343,29 @@ __mmio_lock_post(struct intel_display *display, unsigned long irqflags,
 		spin_unlock_irqrestore(&display->mmio.lock, irqflags);
 }
 
+static __always_inline bool
+__mmio_debug_is_enabled(struct intel_display *display)
+{
+	/* with || gcc emits two branches for this */
+	return unlikely(READ_ONCE(display->params.mmio_debug) |
+			READ_ONCE(display->mmio.mmio_debug_oneshot));
+}
+
 static __always_inline void
 __mmio_unclaimed_pre(struct intel_display *display, intel_reg_t reg,
-		     const bool write, const unsigned int mmio_flags)
+		     const bool write, const bool mmio_debug_is_enabled,
+		     const unsigned int mmio_flags)
 {
-	if (mmio_flags & __MMIO_UNCLAIMED)
+	if (mmio_flags & __MMIO_UNCLAIMED && mmio_debug_is_enabled)
 		check_unclaimed_mmio_pre(display, reg, write);
 }
 
 static __always_inline void
 __mmio_unclaimed_post(struct intel_display *display, intel_reg_t reg,
-		      const bool write, const unsigned int mmio_flags)
+		      const bool write, const bool mmio_debug_is_enabled,
+		      const unsigned int mmio_flags)
 {
-	if (mmio_flags & __MMIO_UNCLAIMED)
+	if (mmio_flags & __MMIO_UNCLAIMED && mmio_debug_is_enabled)
 		check_unclaimed_mmio_post(display, reg, write);
 }
 
@@ -375,6 +373,7 @@ static __always_inline u32
 __intel_de_read(struct intel_display *display, intel_reg_t reg,
 		const unsigned int mmio_flags)
 {
+	const bool mmio_debug_is_enabled = __mmio_debug_is_enabled(display);
 	unsigned long irqflags;
 	u32 val;
 
@@ -382,11 +381,13 @@ __intel_de_read(struct intel_display *display, intel_reg_t reg,
 
 	__mmio_wakelock_pre(display, reg, mmio_flags);
 	__mmio_lock_pre(display, &irqflags, mmio_flags);
-	__mmio_unclaimed_pre(display, reg, false, mmio_flags);
+	__mmio_unclaimed_pre(display, reg, false,
+			     mmio_debug_is_enabled, mmio_flags);
 
 	val = __intel_de_read_fw(display, reg);
 
-	__mmio_unclaimed_post(display, reg, false, mmio_flags);
+	__mmio_unclaimed_post(display, reg, false,
+			      mmio_debug_is_enabled, mmio_flags);
 	__mmio_lock_post(display, irqflags, mmio_flags);
 	__mmio_wakelock_post(display, reg, mmio_flags);
 
@@ -397,17 +398,20 @@ static __always_inline void
 __intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
 		 const unsigned int mmio_flags)
 {
+	const bool mmio_debug_is_enabled = __mmio_debug_is_enabled(display);
 	unsigned long irqflags;
 
 	assert_display_rpm_held(display);
 
 	__mmio_wakelock_pre(display, reg, mmio_flags);
 	__mmio_lock_pre(display, &irqflags, mmio_flags);
-	__mmio_unclaimed_pre(display, reg, true, mmio_flags);
+	__mmio_unclaimed_pre(display, reg, true,
+			     mmio_debug_is_enabled, mmio_flags);
 
 	__intel_de_write_fw(display, reg, val);
 
-	__mmio_unclaimed_post(display, reg, true, mmio_flags);
+	__mmio_unclaimed_post(display, reg, true,
+			      mmio_debug_is_enabled, mmio_flags);
 	__mmio_lock_post(display, irqflags, mmio_flags);
 	__mmio_wakelock_post(display, reg, mmio_flags);
 }
-- 
2.56.0

