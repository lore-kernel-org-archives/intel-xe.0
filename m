Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC3AC55162
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 15:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402A310EFC0;
	Thu, 30 Jul 2026 15:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MH1IC+jO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398B310EFC0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 15:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785425617; x=1816961617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=554A9tzEwUm7qq+REg3bp7JbtQSIQ39S33GIeFG1Z58=;
 b=MH1IC+jO11dAJwvNOTkvd4arwgDx/7PtlW5txzfHV8syXSHLXlwvEKrT
 JegDVWE+zEL+bwZbjLx9GgRc5NinjtQ6i1bh9h9SKqP5DBOBBAddUVmp1
 sickS2P+dZxh3getn9/flAy29WEILOPtSA6KbNjVaRd3f69wNQfvFDQCU
 RMmrH341ZmOnfPYqKwFWYNHxVtL5HPv8E3AdW2UIwv/x3XHAtKPKR7YfT
 x4ibtdYvpiWpm8NBFn7DqhvMyoOuMnx3EuJE89sgPuK8qcOLjm1/JrFK2
 VU3uop8Q/4t7Z9B0f5/bGtnNq2Ce3BIiaFbEakdfIk+9piyxp7H/gi37m A==;
X-CSE-ConnectionGUID: h7/GxQzrQzO69A7ZfQXJPg==
X-CSE-MsgGUID: 8o5uvM/5SrO3YUn+8fW9fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73583130"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="73583130"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:35 -0700
X-CSE-ConnectionGUID: b83VHwpYR7GSvYuMZecTOA==
X-CSE-MsgGUID: NI5FYrbHRJubdO6cIHCQ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="260387645"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 08:33:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3 20/23] drm/xe/pcode: Report 'Mailbox failed' error using
 SIGID
Date: Thu, 30 Jul 2026 17:21:16 +0200
Message-ID: <20260730152121.576-21-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730152121.576-1-michal.wajdeczko@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
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

Report 'Mailbox failed' error using xe_log() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index ccc3bdeed6bb..014632e11338 100644
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
@@ -61,9 +62,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
 	}
 
 	if (err) {
-		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
-			err_decode, err_str);
-
+		xe_log_err(tile, PCODE, err_decode, "Mailbox failed: %s\n", err_str);
 		return err_decode;
 	}
 
-- 
2.47.1

