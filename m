Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB8AC5DF82
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 10:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4628A10EFC3;
	Thu, 20 Aug 2026 10:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chz8KZZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC76610EFBC
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787221032; x=1818757032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eC10Acvl9rhNnXTWa/yGHPoBAQM2xoowUBmYsglzPXM=;
 b=chz8KZZcCKnoBq6uo8Ez2HNyy4sLRHJHEGbSE5qJ6dhIsypx1QruasNV
 n7mev2wVHPn099kX339XpyeJ0jr9vlZaZm7V2mxJIXJ9vK9Cdc/bMBRfL
 RAnniwhakfxGX5Fb/pMdNgrSWwA/h33jR8geV/Bp01oPNdEikMPhxyrmy
 9gVfHZBYN4RIQU5JlSVW64W95g6Ha1SbRskO0qUrAI2gLhRW0lvXVrva+
 RcEIokWzPA1wnXp9tfY144xmwI9HtGcetGb0kOsAjXi0IYVUDQAwp248h
 wBh7BJspcZmSmQtIP+WXhkXs/5ez9KBUzmrIK85biRrMFpIXHRx/9lyQ7 Q==;
X-CSE-ConnectionGUID: YGQdF2P1S1G04NgHrlPzUQ==
X-CSE-MsgGUID: 8IqyuFD1ST+p2mg7W7j+UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="113290948"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="113290948"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 03:17:12 -0700
X-CSE-ConnectionGUID: YgtJehISSS2uLZa+WjI+AA==
X-CSE-MsgGUID: MW50c1BhSXW1hqIBxRiE9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="271176459"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 20 Aug 2026 03:17:09 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 7/7] drm/xe/sysctrl: Report 'System Controller event' error
 using SIGID
Date: Thu, 20 Aug 2026 15:46:40 +0530
Message-ID: <20260820101632.527214-16-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
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
---
 drivers/gpu/drm/xe/xe_sysctrl_event.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index da395148ee9d..29d6fedd95d9 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_device.h"
+#include "xe_log.h"
 #include "xe_irq.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
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
+			xe_log_err(xe, SYSCTRL, -EMSGSIZE,
+				   "Unexpected event response length %zu (expected %zu)\n",
+				   len, sizeof(*response));
 			return;
 		}
 
 		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
 			xe_ras_counter_threshold_crossed(xe, response);
 		else
-			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);
+			xe_log_err_info(xe, SYSCTRL, -EPROTO,
+					"Unexpected event %#x\n", response->event);
 
 		if (!--count) {
-			xe_err(xe, "sysctrl: event flooding\n");
+			xe_log_err(xe, SYSCTRL, -EOVERFLOW,
+				   "Event flooding: response count=%u\n", response->count);
 			return;
 		}
 
-- 
2.48.1

