Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B88F606A333
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bq2Wb4v/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20B510F20A;
	Mon,  9 Nov 2026 11:46:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CFB10F1D6
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794224763; x=1825760763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dx/ohkkDK7NXdfm/c2KJQVeA99vecAR7BLcUsldzcHY=;
 b=Bq2Wb4v/ufv3eapq4ZbMhaRhI/8oSINKW9Bh9kK2R6Wojw+DGxGyHYaH
 cojW/rBxmqINXFYnXFPslhF++sdyr/J1+aotN7FrFuP84Un1cfu1MW5B5
 2Vfj+DExyxRaq1uIqbAzu3ZUMvFAZ73ExchxwKBt5rOzDURChkKqS/7+H
 xyRRkRE75n5iztPOwCgQeu+UAGoJbHawM/PcoVIf9flvpn+77E3Q1OA7a
 q0kTc5CvbYjR9JN+gh9lth9iuiELJBtffCnt/bYti1I5/XIXE23U8adpV
 of3bt31XdRce8LdzohsdxWSZBFiezNDqUuBGo9jEUiMXb6aU3xbOCrvYN g==;
X-CSE-ConnectionGUID: gQ2w1i6LSO+PqdDuSzy9gQ==
X-CSE-MsgGUID: tRKM9JXnS8apupvDVq9zXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2944061"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2944061"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:46:02 -0800
X-CSE-ConnectionGUID: 1CumGtBfQFOMStSgScmcHw==
X-CSE-MsgGUID: SJeCcBbcShWH/iT2+UNLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8174649"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:46:02 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/xe:
 s/xe_display_irq_enable()/xe_display_gse_irq_handler()/
Date: Mon,  9 Nov 2026 13:45:51 +0200
Message-ID: <20261109114554.19597-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
References: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

xe_display_irq_enable() is actually the GSE interrupt *handler*,
not some irq enable function. Rename it accordingly.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 +-
 drivers/gpu/drm/xe/display/xe_display.h | 4 ++--
 drivers/gpu/drm/xe/xe_irq.c             | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index aab416485e3e..f5538e450e3e 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -195,7 +195,7 @@ void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
 		intel_display_irq_handler(display, NULL);
 }
 
-void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
+void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir)
 {
 	struct intel_display *display = xe->display;
 
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 0babb50bfc77..370be8ec1044 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -33,7 +33,7 @@ void xe_display_shutdown(struct xe_device *xe);
 void xe_display_shutdown_late(struct xe_device *xe);
 
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
-void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
+void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe);
 
@@ -71,7 +71,7 @@ static inline void xe_display_shutdown(struct xe_device *xe) {}
 static inline void xe_display_shutdown_late(struct xe_device *xe) {}
 
 static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
-static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
+static inline void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir) {}
 static inline void xe_display_irq_reset(struct xe_device *xe) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b394c8edf89c..320fc64e7d4f 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -435,7 +435,7 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
 
 	xelp_intr_enable(xe, false);
 
-	xe_display_irq_enable(xe, gu_misc_iir);
+	xe_display_gse_irq_handler(xe, gu_misc_iir);
 
 	return IRQ_HANDLED;
 }
@@ -533,7 +533,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	}
 
 	dg1_intr_enable(xe, false);
-	xe_display_irq_enable(xe, gu_misc_iir);
+
+	xe_display_gse_irq_handler(xe, gu_misc_iir);
 
 	return IRQ_HANDLED;
 }
-- 
2.56.0

