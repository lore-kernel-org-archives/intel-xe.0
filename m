Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D55CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 18:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E449A10E644;
	Tue, 28 Oct 2025 18:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nc7GqFsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6515E10E644
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 18:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674995; x=1793210995;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D5gFAhTxVnP75syRo6rKIBBD6sZ6m8QynNJfMoMc03E=;
 b=nc7GqFsLn+zlfd4B687Ws2hgAHf94QzyyySqGWuW0WcyK/wajVbxPIoH
 k9U1KqoqAG21FL4QpUs2ee1rU9UFilMWkp1xvrgUzMWo9X5VeNp/JcuMt
 5RTQZzjKVaxA87jQ+KgvmKyBRKWJBaphzX9NbQx9WdnSA9Yf768DX6SgH
 X+jq0ahm7cKh5kkAnhUm7+deKCCRhNjZ2QF3a81PyIw7960ZfhXwbi8np
 slIVEnNyh0etSWXwAbFGFUwquFRLjULDZXlxWeLVzG+Nhbnw5kuVikirP
 pOXpNfYBUjqIANqo5wU78O7A60WvM9Rn3+1OjKc/jtEotcw2W+YXBoaeU A==;
X-CSE-ConnectionGUID: n1nuLDPZS/KVY3kTf0tteQ==
X-CSE-MsgGUID: aamSFXUbTRuC3tBbr2sIvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74460589"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74460589"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 11:09:55 -0700
X-CSE-ConnectionGUID: HPk18VhXQN6/VdAuLkaoyg==
X-CSE-MsgGUID: nq6Jh5O1TP6b5FbDeGHy8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185344283"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa007.jf.intel.com with ESMTP; 28 Oct 2025 11:09:54 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Fix timeout and add cpu_relax() in
 gt_engine_identity()
Date: Tue, 28 Oct 2025 18:04:55 +0000
Message-ID: <20251028180454.3599689-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

local_clock() returns u64 while time_after32() accepts u32 only.
Switch to 64-bit timestamps for timeout calculation to avoid overflow.

Add cpu_relax() in the polling loop to reduce busy-wait pressure in
IRQ context.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index e5ed0242f7b1..e1a459744ff0 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -274,7 +274,7 @@ gt_engine_identity(struct xe_device *xe,
 		   const unsigned int bank,
 		   const unsigned int bit)
 {
-	u32 timeout_ts;
+	u64 timeout_ts;
 	u32 ident;
 
 	lockdep_assert_held(&xe->irq.lock);
@@ -285,11 +285,13 @@ gt_engine_identity(struct xe_device *xe,
 	 * NB: Specs do not specify how long to spin wait,
 	 * so we do ~100us as an educated guess.
 	 */
-	timeout_ts = (local_clock() >> 10) + 100;
+	timeout_ts = local_clock() + 100 * NSEC_PER_USEC;
 	do {
 		ident = xe_mmio_read32(mmio, INTR_IDENTITY_REG(bank));
-	} while (!(ident & INTR_DATA_VALID) &&
-		 !time_after32(local_clock() >> 10, timeout_ts));
+		if (ident & INTR_DATA_VALID)
+			break;
+		cpu_relax();
+	} while (!time_after64(local_clock(), timeout_ts));
 
 	if (unlikely(!(ident & INTR_DATA_VALID))) {
 		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
-- 
2.49.0

