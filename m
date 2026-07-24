Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83767C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 21:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF6A10F4A3;
	Fri, 24 Jul 2026 21:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQPFFRCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8484A10F49F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 21:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784929567; x=1816465567;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YBQ+UrclspXbtmF0E4+/d62R99/uO8mVbgfMezLMs6w=;
 b=WQPFFRCZPWarK+M7x8qmm5zrNNcFzjU5xH5JbTo1sNOiBcDYGwPD6Tve
 E3BLQz66rqr+aHAVPjoseHoW9Boviu3f5zmvrciayuhmOUaGDEFyRphB8
 AzbjrziSD3DQ6sGn5peBBdVNCdZP81Zc+qalquKcsubj1rE1YsThzCQ+z
 ohSFBtWSQUgt4gDoSfbeq4OkNRVoTaVAp4gXFOMNEpcs04UAdVtJGK7at
 HMxQh3nggT6Qj8de9ee+CW8a8OkZNljyg0enjyrHVL1i3/pVC1S8zJ4c7
 4BO17rM00GSmgZW1i/oWvR5Y6TH1+zE6Obwoc2bzR9c+8hhg221GDJWNu A==;
X-CSE-ConnectionGUID: rhNNVw9iRSCYoQnj6RWSqw==
X-CSE-MsgGUID: JbR+96dZTBGXdzzH09oC5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="108394953"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="108394953"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:45:39 -0700
X-CSE-ConnectionGUID: iBAowNBWTVG1cpFSUF2SWQ==
X-CSE-MsgGUID: Zh0yTmY5TAS60mYhYaHhpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="256165274"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.243])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:45:36 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 24 Jul 2026 18:44:17 -0300
Subject: [PATCH v2 1/3] drm/xe: Extract override_has_cached_pt()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-wa_14026539277-v2-1-ad786cc6ba1e@intel.com>
References: <20260724-wa_14026539277-v2-0-ad786cc6ba1e@intel.com>
In-Reply-To: <20260724-wa_14026539277-v2-0-ad786cc6ba1e@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4eed9a251e65..5189419a0593 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -831,6 +831,21 @@ int xe_device_probe_early(struct xe_device *xe)
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
@@ -950,14 +965,7 @@ int xe_device_probe(struct xe_device *xe)
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

