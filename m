Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B3EC5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C84D10EE9C;
	Wed, 19 Aug 2026 19:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKKNUdta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B74210EEAF
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166895; x=1818702895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7chFjZNXdtyrLKoev8OFD0PnU9k/kWzSkbdwr4SPFZ0=;
 b=QKKNUdtamlNNUZPqJAVzqWCtyod8s6sZcmjF+NRDxR0cU+iFDlJNkrv/
 xQeM5KrVje1EbqsZH92hpTIbfsgKzZhbQCarHzGZTgP+hfjsx106lsI/r
 JQ+HvdTDlfq2S2ycWr5kpnE95mWVjMqOiVhuCN9CfKUaO9d1HfPysUAeB
 LNACAWGHwZZPcMHqRwLvq0xmi4lFfy0WRWx89jHe8rUHttrCo9eCQdGDl
 j8NFD7alQMQtMFZBgu64tPuc7WT3039VTwfXAsQw2cb+a8HtxvuXgDFUX
 oY4Lc7xo1UKYRwQ0Y39jDdPTPKYPvzR1LwvOOJNnTLkUXuaZcLRpW53m/ g==;
X-CSE-ConnectionGUID: V5eaVGm7Qr+WY6DcyppSBw==
X-CSE-MsgGUID: bI7EN+ZITd2DTJJckK6YQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647292"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647292"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:14:55 -0700
X-CSE-ConnectionGUID: dIqOdzqZSnmEf09E1bfsBg==
X-CSE-MsgGUID: /JlTe1g6RYKAGVIHmOwCMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556758"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:14:54 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 06/12] drm/xe/reg_whitelist: Report whitelist overflow using
 structured xe_log API
Date: Thu, 20 Aug 2026 00:44:35 +0530
Message-ID: <20260819191442.1957986-7-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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

Replace xe_gt_err() with xe_log_err() using the REGS component tag
when the maximum register whitelist slots are exhausted.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index cab1b578ca0e..d58c31b30199 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -14,6 +14,7 @@
 #include "xe_gt.h"
 #include "xe_gt_types.h"
 #include "xe_gt_printk.h"
+#include "xe_log.h"
 #include "xe_platform_types.h"
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
@@ -186,9 +187,9 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe, struct xe_reg_sr *in
 		};
 
 		if (slot == RING_MAX_NONPRIV_SLOTS) {
-			xe_gt_err(hwe->gt,
-				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
-				  hwe->name, RING_MAX_NONPRIV_SLOTS);
+			xe_log_err(hwe->gt, REGS, EPERM,
+				   "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
+				   hwe->name, RING_MAX_NONPRIV_SLOTS);
 			break;
 		}
 
-- 
2.54.0

