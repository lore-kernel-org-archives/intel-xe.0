Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDECCCD13D2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 13:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C5910E9D4;
	Thu, 30 Apr 2026 13:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVyBaY9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C0210E9D4;
 Thu, 30 Apr 2026 13:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777556690; x=1809092690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iyDunBMWZ91no6bBewrcLSTOF8GhQrd0f0OwYmXqC8A=;
 b=ZVyBaY9l9hQiTvzMBstm+2NPs53Bxj+UTnzHg+TLnmaSYYXTFVdm4P1U
 +pdbf8RDIY1cjGM4ijnGd61zihKaafo9db2ejicbhxpyH3a4PdNYhuQpq
 ifWcJFiPqht7kK2LGuJgjldmkZNOOTjPbegiCP9q9E4y/I6thEJPqco9x
 6TXZ8R50nebg411IskU15/OcUQpJ4m+R9yojGoJQH57M0VMXay17x5Yf+
 Tj4VM/qJg+N06bLcApms2vPbIGwUOYi3rZeM8ORruLiC8kVsDisuuTAu7
 fOcsopFWZTuipSwW4d9xWjBza48FYdS9cNSglova8suANUWVtJUEkUnFa w==;
X-CSE-ConnectionGUID: c6zS0bT5SfavLZNTaBXNsw==
X-CSE-MsgGUID: xE3WMe3eSrG0rcBLEK/iWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77532394"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="77532394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:44:50 -0700
X-CSE-ConnectionGUID: 1VwsbP32RS6OivKVlWOPyQ==
X-CSE-MsgGUID: y/QqNbz5Q0CHqeluFzeAuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="236371559"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:44:48 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, gustavo.sousa@intel.com,
 ankit.k.nautiyal@intel.com
Subject: [PATCH v2 2/3] drm/i915/dmc_wl: Expose intel_dmc_wl_supported()
Date: Thu, 30 Apr 2026 19:15:04 +0530
Message-ID: <20260430134505.1728443-3-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430134505.1728443-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260430134505.1728443-1-dibin.moolakadan.subrahmanian@intel.com>
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

Rename __intel_dmc_wl_supported() to intel_dmc_wl_supported() and expose
it via the header for use outside intel_dmc_wl.c.

This allows users to query DMC wakelock support directly and use the
DMC wakelock APIs accordingly.

Suggested-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc_wl.c | 12 ++++++------
 drivers/gpu/drm/i915/display/intel_dmc_wl.h |  1 +
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
index ddf1a1f1ebc3..c5810ee81bd6 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -277,7 +277,7 @@ static bool intel_dmc_wl_check_range(struct intel_display *display,
 	return false;
 }
 
-static bool __intel_dmc_wl_supported(struct intel_display *display)
+bool intel_dmc_wl_supported(struct intel_display *display)
 {
 	return display->params.enable_dmc_wl;
 }
@@ -344,7 +344,7 @@ void intel_dmc_wl_enable(struct intel_display *display, u32 dc_state)
 	struct intel_dmc_wl *wl = &display->wl;
 	unsigned long flags;
 
-	if (!__intel_dmc_wl_supported(display))
+	if (!intel_dmc_wl_supported(display))
 		return;
 
 	spin_lock_irqsave(&wl->lock, flags);
@@ -390,7 +390,7 @@ void intel_dmc_wl_disable(struct intel_display *display)
 	struct intel_dmc_wl *wl = &display->wl;
 	unsigned long flags;
 
-	if (!__intel_dmc_wl_supported(display))
+	if (!intel_dmc_wl_supported(display))
 		return;
 
 	intel_dmc_wl_flush_release_work(display);
@@ -425,7 +425,7 @@ void intel_dmc_wl_flush_release_work(struct intel_display *display)
 {
 	struct intel_dmc_wl *wl = &display->wl;
 
-	if (!__intel_dmc_wl_supported(display))
+	if (!intel_dmc_wl_supported(display))
 		return;
 
 	flush_delayed_work(&wl->work);
@@ -436,7 +436,7 @@ void intel_dmc_wl_get(struct intel_display *display, i915_reg_t reg)
 	struct intel_dmc_wl *wl = &display->wl;
 	unsigned long flags;
 
-	if (!__intel_dmc_wl_supported(display))
+	if (!intel_dmc_wl_supported(display))
 		return;
 
 	spin_lock_irqsave(&wl->lock, flags);
@@ -469,7 +469,7 @@ void intel_dmc_wl_put(struct intel_display *display, i915_reg_t reg)
 	struct intel_dmc_wl *wl = &display->wl;
 	unsigned long flags;
 
-	if (!__intel_dmc_wl_supported(display))
+	if (!intel_dmc_wl_supported(display))
 		return;
 
 	spin_lock_irqsave(&wl->lock, flags);
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.h b/drivers/gpu/drm/i915/display/intel_dmc_wl.h
index 5488fbdf29b8..363f6e34c89b 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.h
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.h
@@ -29,6 +29,7 @@ struct intel_dmc_wl {
 	struct delayed_work work;
 };
 
+bool intel_dmc_wl_supported(struct intel_display *display);
 void intel_dmc_wl_init(struct intel_display *display);
 void intel_dmc_wl_enable(struct intel_display *display, u32 dc_state);
 void intel_dmc_wl_disable(struct intel_display *display);
-- 
2.43.0

