Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C8BC79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9937310E215;
	Mon,  7 Sep 2026 10:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZvv+JNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9477D10E215
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788778424; x=1820314424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hw24BleyfSSvmQwzlZtndP3E8KkQDdWp2LT5MX9w5c0=;
 b=QZvv+JNXXf0WhiUnpnLv3NLmrC0m+icq4/ED2DHPIjN73IdgO50e650U
 43vjfACOETcJCRuvvqsUz95oSrmGNY9saufMm8wuxoLqROdWfKtKgmccB
 36FsS8LbWpsTBhzWeOZPoGlv+AAKbhoG4o6s1s+a878sXvVuGJPpRmzVd
 cRy6yScd6FTU6ibU6qoEVGd31S5LmYGZQmtpmvrMGoyw2LzwXpn9IyYO8
 tF1Ar7PL/2gW0hDF25WRl5gtS5nOEktzgCurbKn08FcHqubXt7lTVYFCu
 t0iRxHKFmqd/G4M2nhPKXx/xlYvrM03dC7a8rOzEXMDNbwL6cuKu0gXa0 w==;
X-CSE-ConnectionGUID: KFyVvuFpTpynNlNOG8KGbA==
X-CSE-MsgGUID: qEP7xCiCQiO+dgnrPSBlqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89024511"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89024511"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:53:44 -0700
X-CSE-ConnectionGUID: f2mvqFk1TV2FbpvtOdB+4g==
X-CSE-MsgGUID: JGOtUNwLTKOFkOLxI8kEaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="308908390"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 07 Sep 2026 03:53:40 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 4/9] drm/xe/sysctrl: Make sysctrl_read_frame() void
Date: Mon,  7 Sep 2026 16:23:18 +0530
Message-ID: <20260907105313.2208003-15-mallesh.koujalagi@intel.com>
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

Convert it to return void and remove the unnecessary error
handling in sysctrl_process_frame().

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 3ef60067e226..4841dd7f2724 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -68,8 +68,8 @@ static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
 		xe_mmio_write32(sc->mmio, regs[i], val[i]);
 }
 
-static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
-			      size_t len)
+static void sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
+			       size_t len)
 {
 	static const struct xe_reg regs[] = {
 		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
@@ -85,8 +85,6 @@ static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
 		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
 
 	memcpy(frame, val, len);
-
-	return 0;
 }
 
 static void sysctrl_clear_response(struct xe_sysctrl *sc)
@@ -194,10 +192,7 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
 	total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
 	curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
 
-	ret = sysctrl_read_frame(sc, out, frame_size);
-	if (ret)
-		return ret;
-
+	sysctrl_read_frame(sc, out, frame_size);
 	sysctrl_clear_response(sc);
 
 	if (curr_frame == total_frames)
-- 
2.48.1

