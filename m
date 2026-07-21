Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ED7C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 19:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0ABA10E3AE;
	Tue, 21 Jul 2026 19:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhTqrnMa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D54710E3C4
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 19:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784661046; x=1816197046;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YBQ+UrclspXbtmF0E4+/d62R99/uO8mVbgfMezLMs6w=;
 b=GhTqrnMa1btyeq6ZCfXFAxAZr9tYItEDK8BElzx6wv6V9JWCbNzXz79+
 nSX1sawKH/Bz4eNonwm3WP2mIZH9kT/tToCjwMgHlYsx92nBNKloqV/Nn
 tYQ3gHfLfpKdSYq01nXNLf5bBcrC9uuHZL5Fw0rm4Cz026fSmB/TUnZaX
 UDbSPvqNLuoGygMncLWeYKRt4kY5TCc48eci0Yi54lMBhLkQv76RYs8PR
 foZnnBtCwKY6Lsqpp2d0KtMNaSMgdEcLITIHGLYpYZJt6whLsaHF6MPIO
 BG22Ht5aWPUgAa+LlZTaUkk/JP/4Mk0TrxFc05q4uWZ9jQS2aGIBbLvuV Q==;
X-CSE-ConnectionGUID: IxT9kUc5ScyayN/4wQjzAA==
X-CSE-MsgGUID: 6RXStYplTVu/0z/CvJpZvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85295083"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="85295083"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:10:45 -0700
X-CSE-ConnectionGUID: BykUps4dRaGdUHt1IFXwCQ==
X-CSE-MsgGUID: 2tYyy5dTSLyG/dHFDfPz9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="282374154"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:10:45 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 21 Jul 2026 16:10:19 -0300
Subject: [PATCH 1/3] drm/xe: Extract override_has_cached_pt()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-wa_14026539277-v1-1-09fa102f3084@intel.com>
References: <20260721-wa_14026539277-v1-0-09fa102f3084@intel.com>
In-Reply-To: <20260721-wa_14026539277-v1-0-09fa102f3084@intel.com>
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

