Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B283CA0FF9
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 22:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A4610EAEC;
	Thu, 28 Aug 2025 22:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GXBl9sAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D697D10EAEB
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 22:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756418719; x=1787954719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VP68x7OYBIr6V7qDkPsO8TbncjVRgbP09h39Rog4p2A=;
 b=GXBl9sAvGlw6oLdwDvNF/VjyyQs38ugOcU03tgT1FbfBHT43MA0y8ZJn
 4+2uKWKpwVkOH9JZTBvhWLvklaMpgDnHltD7NgDMO/pIJa9DLALUPrYNR
 N/57oy8Eq3N8qQ5BaEOwkEA2XeKOlyFSljo4v/QDDDR3e72eTnewfP2vh
 aQjNbF1ICT5eLr5Chl6qB9SKkKFrkYB4POYdy7ZvRTu0QunE0yJuP0qhM
 DzoN2t3uWzDgteakU4Zd07qF45h0noMFCi2QjcCWkFVTyDg2WMTYPqQ/o
 5RoO/Cf5zVjjmI+ub/X/u+s/bCl0nQC1PEOwADwSJWVpPkdkOFn7l3ht7 w==;
X-CSE-ConnectionGUID: NoCWkGZtRVC5HGBEYv6gSQ==
X-CSE-MsgGUID: 2jwPqVXxQZyNZv0angTC4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84106383"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84106383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:05:19 -0700
X-CSE-ConnectionGUID: YjZ27nH7RXaUZdsEyHWXFw==
X-CSE-MsgGUID: zrZ2VPneSXCKX3E2V5dBQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170126772"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:05:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 4/4] drm/xe/pcode: Refactor pcode_try_request() to use
 poll_timeout_us()
Date: Thu, 28 Aug 2025 15:04:59 -0700
Message-ID: <20250828-xe-iopoll-v1-4-9832ccd1c8b1@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Refactor the hand rolled wait to use poll_timeout_us(). Do a 20us wait
between reads instead exponentially growing from 10.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 6a7ddb9005f99..7bf5d3b9c0cc1 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -5,7 +5,7 @@
 
 #include "xe_pcode.h"
 
-#include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/errno.h>
 #include <linux/error-injection.h>
 
@@ -135,28 +135,23 @@ static int pcode_try_request(struct xe_tile *tile, u32 mbox,
 			     u32 request, u32 reply_mask, u32 reply,
 			     u32 *status, bool atomic, int timeout_us, bool locked)
 {
-	int slept, wait = 10;
+	int (*req)(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
+		   unsigned int timeout_ms, bool return_data,
+		   bool atomic);
+	int ret;
 
 	xe_tile_assert(tile, timeout_us > 0);
 
-	for (slept = 0; slept < timeout_us; slept += wait) {
-		if (locked)
-			*status = pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
-						   atomic);
-		else
-			*status = __pcode_mailbox_rw(tile, mbox, &request, NULL, 1, true,
-						     atomic);
-		if ((*status == 0) && ((request & reply_mask) == reply))
-			return 0;
-
-		if (atomic)
-			udelay(wait);
-		else
-			usleep_range(wait, wait << 1);
-		wait <<= 1;
-	}
+	if (locked)
+		req = pcode_mailbox_rw;
+	else
+		req = __pcode_mailbox_rw;
 
-	return -ETIMEDOUT;
+	ret = poll_timeout_us(*status = req(tile, mbox, &request, NULL, 1, true, atomic),
+			      *status == 0 && (request & reply_mask) == reply,
+			      20, timeout_us, false);
+
+	return ret;
 }
 
 /**

-- 
2.50.1

