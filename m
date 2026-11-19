Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3121B606A90D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jcCy0O4V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B3E10F0D3;
	Thu, 19 Nov 2026 20:51:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA4010E8D5;
 Thu, 19 Nov 2026 20:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795121470; x=1826657470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oDtiC29BSEVsuHTzMby83o6O/X8McvItIpmqt285m98=;
 b=jcCy0O4V42hN0qvhiijs7tzLHul8QAueXOWeYWr9lTuXUQyts6wxjabj
 5HYAob7v07Rhr7aGSdC7TY1O2vC0Hg8ufYsKSPLOcJY5wwaq6Qe7oHf5S
 +ie49ob5tNI8S9iNlccGKlMuChcJGa4GeNZYd0Qaiy0cWr03nzOt3m/m7
 rArkg8Ew64FGv/Mm5CUwlWY170WbIQlzRk1sq99IfoiTJs0aBWiYDlp6c
 NIApW5Gtp7aZrPNDII7p+txCDVipVQnEzIuUmoCQ2ZGr6DK8iQUmimZQA
 qWxiiwOD0I+SvObucJhAD+e+mHjDMJxSKxwSmd2pj7n7GL8Vooikwijqi A==;
X-CSE-ConnectionGUID: 6rvzoZf4Q5m1sEQIZakmpQ==
X-CSE-MsgGUID: C+JlkcT+QNWyTgPcfdVAfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4030632"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4030632"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:51:10 -0800
X-CSE-ConnectionGUID: WAK+yfUmRq2o7Ftgg0N17Q==
X-CSE-MsgGUID: 2OQQLrqAR2aCIEql2RFj9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="12511693"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 12:51:08 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 5/6] drm/i915/de: Optimize the mmio_debug checks in
 intel_de_{read, write}()
Date: Thu, 19 Nov 2026 22:50:39 +0200
Message-ID: <20261119205040.31935-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
References: <20261119205040.31935-1-ville.syrjala@linux.intel.com>
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

v2: mmio_debug is still an int

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 44 ++++++++++++++-----------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 82ed1c6a55c9..ebe3789e5441 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -242,18 +242,9 @@ static bool vlv_check_for_unclaimed_mmio(struct intel_display *display)
 	return true;
 }
 
-static bool mmio_debug_is_enabled(struct intel_display *display)
-{
-	return !!READ_ONCE(display->params.mmio_debug) ||
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
+	return unlikely(!!READ_ONCE(display->params.mmio_debug) |
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

