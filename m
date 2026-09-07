Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E6EC79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DC110E78F;
	Mon,  7 Sep 2026 10:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGfvocc7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA13210E78F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 10:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788778443; x=1820314443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fRu2MekVfdk+UtxPLKts8/FqhhKmjJfVqaTR0C+0Wmw=;
 b=WGfvocc7uKq+bzgafgGdAUG/SyRph3y0zm3ngKhnEhK9zBy5ZlMI51Jh
 Gf0djrfdZYwojfOwEuiOWm/ebzU8p5Q3WH4uqnaL9v4vikRkiCUBF2hHp
 KNl+Xway3OfmTDLuxtM577OY9jg8vrarooEGz1iGv8CF6zQXcqCrSIDB3
 KU/y8GxvHHoz7d27+Ww1emE7xMU5EwhAMMgf2fyxfHkY2LVp2NXOsfGCX
 jvtGKfKeqJD37w2gXmyDIU596SaQ5peBRC1qCcnfEEFG59htFrO6i4Sce
 7/dO7ZaxVTeT3kJNf1EUHr8PGH/dZNcAOQzVYYsAnW0oBNUtUqNwTrKuo Q==;
X-CSE-ConnectionGUID: E+yt2dalTXya+ebSaYe18w==
X-CSE-MsgGUID: qFZ9YFhRQLC7rzZG/HpuLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89024521"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89024521"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:54:03 -0700
X-CSE-ConnectionGUID: 8fFbYzmCSr2vYdP/AbnqmQ==
X-CSE-MsgGUID: nTU7T5oTRC6oh6ocpbE32A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="308908412"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 07 Sep 2026 03:53:59 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 9/9] drm/xe/sysctrl: Report 'System Controller event' error
 using SIGID
Date: Mon,  7 Sep 2026 16:23:23 +0530
Message-ID: <20260907105313.2208003-20-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
References: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
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

Report 'System Controller event' error using xe_log() helpers.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v5:
- Change Error as EXFULL. (Michal)
- Update logging message.

v6:
- Change correct errno. (Michal)
---
 drivers/gpu/drm/xe/xe_sysctrl_event.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index 15ddd2d8bc6d..3239c110a66a 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -5,6 +5,7 @@
 
 #include "xe_device.h"
 #include "xe_irq.h"
+#include "xe_log.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_sysctrl.h"
@@ -25,23 +26,26 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
 
 		ret = xe_sysctrl_send_command(sc, command, &len);
 		if (ret) {
-			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
+			xe_log_err(xe, SYSCTRL, ret, "Failed to get pending event\n");
 			return;
 		}
 
 		if (len != sizeof(*response)) {
-			xe_err(xe, "sysctrl: unexpected event response length %zu (expected %zu)\n",
-			       len, sizeof(*response));
+			xe_log_err(xe, SYSCTRL, -EPROTO,
+				   "Unexpected event response length %zu (expected %zu)\n",
+				   len, sizeof(*response));
 			return;
 		}
 
 		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
 			xe_ras_counter_threshold_crossed(xe, response);
 		else
-			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);
+			xe_log_err_info(xe, SYSCTRL, -ENOPKG,
+					"Unexpected event %#x\n", response->event);
 
 		if (!--count) {
-			xe_err(xe, "sysctrl: event flooding\n");
+			xe_log_err(xe, SYSCTRL, -EXFULL,
+				   "Ignored %u events due to flooding\n", response->count);
 			return;
 		}
 
-- 
2.48.1

