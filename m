Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790CB606A323
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 11:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RBn50/4W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2652010F1E9;
	Mon,  9 Nov 2026 11:46:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4602810F1E5
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794224771; x=1825760771;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2qLhpyVOUFLziyAfzE5mc3haZvWIiHW59PktCirbtcM=;
 b=RBn50/4WTGSE06YqGooljtzSFhQYB8+AseeWn8Ro286/+EybbGJ7dbhh
 BaLzr2ldmxzgc1g3PV8SA8DazvAz/URT0q7SljSt+5NdHXhQQvPBCOl4Y
 /cCyrW8Sikc1QXBSaBmydr3kEXjCaq80mlPF3/WBoMvjtsWRRhIeUoTKj
 aIrpakH7Y8F43Q+xYvL3ZSymdV05sJcKFn6tMP9wBD+GX5HLQIODIP9tK
 txsv9eUa1518zgXNnTYtDm1VycGiKzXmFv8K4ljnfDQ+cQlOJ5wHwg85H
 VJ3+iQifbH3Bfqrj3BlQKA93y3DwKkuDLIwB1UlmI+0up6kVHt0mUk664 g==;
X-CSE-ConnectionGUID: nyAZoJbiQQe8JqJvRWKn9A==
X-CSE-MsgGUID: MMXHpc+ZSQKzVnYY7PXoTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2944068"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2944068"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:46:11 -0800
X-CSE-ConnectionGUID: jpVgKqX6QTO5rvTR+nxqpw==
X-CSE-MsgGUID: l+UVcaXFSraOmFv3E0rOwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8174669"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:46:11 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe: Only enable the GSE interrupt when display needs
 it
Date: Mon,  9 Nov 2026 13:45:53 +0200
Message-ID: <20261109114554.19597-4-ville.syrjala@linux.intel.com>
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

Display is the only user of the GSE interrupt. Only enable
it when the display needs it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/display/xe_display.h |  2 ++
 drivers/gpu/drm/xe/xe_irq.c             |  7 ++-----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index f5538e450e3e..21692408f9be 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -195,6 +195,23 @@ void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
 		intel_display_irq_handler(display, NULL);
 }
 
+u32 xe_display_gse_irq_bit(struct xe_device *xe)
+{
+	struct intel_display *display = xe->display;
+
+	if (!xe->info.probe_display)
+		return 0;
+
+	if (!intel_display_device_present(display))
+		return 0;
+
+	/*
+	 * ASLE backlight operations are reported via GUnit GSE interrupts
+	 * on the root tile.
+	 */
+	return GU_MISC_GSE;
+}
+
 void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir)
 {
 	struct intel_display *display = xe->display;
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 370be8ec1044..6c580d9593b0 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -33,6 +33,7 @@ void xe_display_shutdown(struct xe_device *xe);
 void xe_display_shutdown_late(struct xe_device *xe);
 
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
+u32 xe_display_gse_irq_bit(struct xe_device *xe);
 void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe);
@@ -71,6 +72,7 @@ static inline void xe_display_shutdown(struct xe_device *xe) {}
 static inline void xe_display_shutdown_late(struct xe_device *xe) {}
 
 static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
+static inline u32 xe_display_gse_irq_bit(struct xe_device *xe) { return 0; }
 static inline void xe_display_gse_irq_handler(struct xe_device *xe, u32 gu_misc_iir) {}
 static inline void xe_display_irq_reset(struct xe_device *xe) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 7c39d7a3cf8a..050c73283bbd 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -703,12 +703,9 @@ static void vf_irq_postinstall(struct xe_device *xe)
 
 static void xe_gu_misc_irq_postinstall(struct xe_device *xe)
 {
-	/*
-	 * ASLE backlight operations are reported via GUnit GSE interrupts
-	 * on the root tile.
-	 */
 	unmask_and_enable(xe_device_get_root_tile(xe),
-			  GU_MISC_IRQ_OFFSET, GU_MISC_GSE);
+			  GU_MISC_IRQ_OFFSET,
+			  xe_display_gse_irq_bit(xe));
 }
 
 static void xe_irq_postinstall(struct xe_device *xe)
-- 
2.56.0

