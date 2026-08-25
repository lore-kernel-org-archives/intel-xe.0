Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F0BC61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3906710E132;
	Tue, 25 Aug 2026 11:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fh7wBQui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9D510E156
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787655985; x=1819191985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mckwS+SzlU0l6JKA6+r5GhSvdm5fC3SfIv880pyu+xM=;
 b=fh7wBQuifDHCS+AKajgatpKqkCNfwf2xcWnJiSN+e2S21sqFvOE2/FNb
 UVOT5PGxZgNyu1YhSx4r7QPvpdwv8RLu1mJfzQrWXAlDwqo84pjqZHtdz
 QLUPZ9A+PipO9mL4wM8HS5jhdn1uNHVuBZ3YsDqx9O+1DXF8SGtKlKW4U
 +UktuPUcleKtxGvY9j6bOOynjJ/j795u94ZqP/wR2z3pVQB6dr9y3t1tK
 k2wCJb1nFExp6KncIFFsT8lEE0ld7g13ULvMNIHv/P1GT8SLAS72cjm2H
 bCRTaAkzdV07aGuRNQ79wfSnBkXm1rQIacMwJAk71h+fdjEjaI1H7kWKY A==;
X-CSE-ConnectionGUID: G2pLJ6h1RyaeOaESFd6RBw==
X-CSE-MsgGUID: iori+hhXRlO2vRa0dVt/sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88248271"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88248271"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 04:06:25 -0700
X-CSE-ConnectionGUID: /TbL/MpmTcqKueoa733x+g==
X-CSE-MsgGUID: VxZ7GzQiS3OmZ32+4TX41g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="261131372"
Received: from unknown (HELO jraag-Z790M-ITX-WiFi.iind.intel.com)
 ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2026 04:06:21 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 7/7] drm/xe/sysctrl: Report 'System Controller event' error
 using SIGID
Date: Tue, 25 Aug 2026 16:35:50 +0530
Message-ID: <20260825110542.1359776-16-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
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
v5:
- Change Error as EXFULL. (Michal)
- Update logging message.
---
 drivers/gpu/drm/xe/xe_sysctrl_event.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index da395148ee9d..7a3aa0aad6a3 100644
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
+			xe_log_err(xe, SYSCTRL, -EXFULL,
+				   "Ignored %u events due to flooding\n", response->count);
 			return;
 		}
 
-- 
2.48.1

