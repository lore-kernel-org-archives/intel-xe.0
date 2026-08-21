Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5596C5DF97
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 21:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F9C10F3B1;
	Fri, 21 Aug 2026 21:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="asSpCyju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7776010F3B1
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 21:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787348231; x=1818884231;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=mxsPb4UgAs/zndhkRMGe2hm++VbWmq12MHp2DNCVZMY=;
 b=asSpCyjuIfeQAXRTGtqnlqvRC4C1PBmxtmrQ2DolnMbegAA1RmFtV0jn
 KY33juUY+elA4rP+b+WNUhgQySXnwvVBJXcocZIsuEatWNiUoPAkJWtnB
 tSnHvuQBR/jZUj8BHRBjhz8H/7tdRfAB+qopLyw9NyMdXSMINoLUSdY50
 U+kkQeYKO/iA0oreLkMbTEjkOEzGaEXZAEbKCQ/BNtEqSiOkSyoQJDT6a
 9izCZ8wYHDO29LCII6CR1eJ4KctuWVBaIMstYnKcYqs1gYmgrKEh1U3B0
 b8IhV8pMMmuAi40b0kQrG/u35neNuAuVCTeGrZks2J+KRwulvnMko3xp+ w==;
X-CSE-ConnectionGUID: DkxaEWJCRFOBp+60W6IxHg==
X-CSE-MsgGUID: aGUjCraQQJSSmkL5KOvx4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="91776298"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="91776298"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:37:10 -0700
X-CSE-ConnectionGUID: kmpksvYbSRq4cXllPGAQIw==
X-CSE-MsgGUID: +9b8fkMxQmGZRI6LuqqMPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="266502698"
Received: from arnabgho-mobl.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.173])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:37:09 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 21 Aug 2026 18:36:47 -0300
Subject: [PATCH v3 1/3] drm/xe: Extract override_has_cached_pt()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-wa_14026539277-v3-1-1f98c2af12f6@intel.com>
References: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
In-Reply-To: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.15-dev
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

Some platforms support cached page tables, but some workarounds might
require disabling the cached access on the CPU side.  One such example
is Wa_16029380221, but there could be others as well.  Extract the
code responsible for overriding xe->info.has_cached_pt into a new
function called override_has_cached_pt(), so that we have a common
place to add the necessary runtime checks specific for has_cached_pt.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 74d566693dfd..ccf7ef3cf3e7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -842,6 +842,21 @@ int xe_device_probe_early(struct xe_device *xe)
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
 
+static void override_has_cached_pt(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	/*
+	 * Wa_16029380221: The affected GT will always use non-coherent
+	 * access to page tables, so we must do uncached writes from the
+	 * CPU.
+	 */
+	for_each_gt(gt, xe, id)
+		if (XE_GT_WA(gt, 16029380221))
+			xe->info.has_cached_pt = false;
+}
+
 static int probe_has_flat_ccs(struct xe_device *xe)
 {
 	struct xe_gt *gt;
@@ -982,14 +997,7 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
-	/*
-	 * Wa_16029380221: The affected GT will always use non-coherent
-	 * access to page tables, so we must do uncached writes from the
-	 * CPU.
-	 */
-	for_each_gt(gt, xe, id)
-		if (XE_GT_WA(gt, 16029380221))
-			xe->info.has_cached_pt = false;
+	override_has_cached_pt(xe);
 
 	for_each_tile(tile, xe, id) {
 		err = xe_ggtt_init_early(tile->mem.ggtt);

-- 
2.55.0

