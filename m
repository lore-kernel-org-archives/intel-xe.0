Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D31C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9510F10EFA9;
	Wed, 12 Aug 2026 12:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhiHeG8c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBBC10EFAA
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786538107; x=1818074107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H3JHix49L4+dyZM2VvJ2HcZuHAfshCEYQGVwPZZuDWs=;
 b=FhiHeG8cIHsvmlZ2CUb3xXZiizAEJpxnNtCR0v055wiLJcxi4Sy+Ckmx
 s9nOLzscrMToPH7hoWhPWJXNANjr/fqX1+SRWPXfhds1H6q8sLw2H1y4g
 P4yZ2smUP+jMrbHP7Zzj8ND6IVBXMev3a3EllK3UMmEj4lIb5/Oyoj4T0
 eZNURSzeiYTSDSmxmv3sSIykpM0bgWdgZLipg13j/+vh0ywTQ2Pc+zVF7
 d7GVuB9V46iowxj5779qiFiZu7VEWbpBDZ6i5biXi39eTrC2DntM4cHEU
 K/Px9GTEbRzziwx59NpdcHZdcB7eqtqPFIeXCNRzDvUk0Dv6mE4tdqqb+ A==;
X-CSE-ConnectionGUID: sk5IEW9rROy6i5XO7AFHTA==
X-CSE-MsgGUID: Db5A0Z4zSCCHGUaT1gHfXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87304393"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="87304393"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:35:07 -0700
X-CSE-ConnectionGUID: zIZ42qFrS5WR0Jto5mB6hg==
X-CSE-MsgGUID: alxfjqeiRref2uBgq96eHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="260322645"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2026 05:35:02 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 2/3] drm/xe/pcode: Improve PCODE logging using xe_log helper
Date: Wed, 12 Aug 2026 18:04:52 +0530
Message-ID: <20260812123449.239480-7-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
References: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
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

Use xe_log helper for PCODE errors instead of drm_err(). This
adds PCODE component tag, making issues easier to detect and
track with automated tools.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2:
- s/pcode/PCODE. (Michal)
- Drop PCODE in xe_log_err.
---
 drivers/gpu/drm/xe/xe_pcode.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index ccc3bdeed6bb..c69440ea477b 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -14,6 +14,7 @@
 #include "regs/xe_pmt.h"
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
 #include "xe_pm.h"
@@ -219,8 +220,8 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 	 * requests, and for any quirks of the PCODE firmware that delays
 	 * the request completion.
 	 */
-	drm_err(&tile_to_xe(tile)->drm,
-		"PCODE timeout, retrying with preemption disabled\n");
+	xe_log_err(tile, PCODE, -ETIMEDOUT,
+		   "Timeout, retrying with preemption disabled\n");
 	preempt_disable();
 	ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
 				true, 50 * 1000, true);
@@ -320,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 		mutex_unlock(&tile->pcode.lock);
 
 	if (ret)
-		drm_err(&xe->drm,
-			"PCODE initialization timedout after: 3 min\n");
+		xe_log_err(xe, PCODE, ret,
+			   "Initialization timedout after: 3 min\n");
 
 	return ret;
 }
-- 
2.48.1

