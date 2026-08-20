Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E50C5DF82
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 10:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E96C10EFBC;
	Thu, 20 Aug 2026 10:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWR24qcu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED3410EFBC
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787221016; x=1818757016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0pyNra2CPlAMnom1cJa7GWGE80Ks3w4FuhctZFwAII=;
 b=FWR24qcucs4TTGnC9AVBS+RBijGod4OtLT/Wx31a/AP1ovMY0H1c1TCY
 Fe4leb9DFU7wKdPbL6+XvRB0pWVWjhTEgLFmzMChV8GiPD88bfBCJFuBm
 Gb2XhZqIjNWet2BZP8xv6BlsISWOGzEXAlcG12DaWZg9F9OpPCbahd9BE
 Ma9rBCE3QDGmYtuaufWt2LTnLeVBaS0o5OAVarguADEBlTBMZj0s+ysPn
 omtVZWxSO16qkwZeOqICa0e7MBbDpYxzmaLKzidWbe15+WTKBCTmDhQUW
 uKadnEZ1ufaA8cDpmFCO+Up6QxGGp/1UcFqHNJiqMqtWDPqQbHKe0yfh0 w==;
X-CSE-ConnectionGUID: zZ5nBFyiT+esu/iEI7p/4A==
X-CSE-MsgGUID: cQWDH9KYR6mQC2w3TkrRgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="113290929"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="113290929"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 03:16:56 -0700
X-CSE-ConnectionGUID: DCvREppKSV+wR1+meUR/sg==
X-CSE-MsgGUID: I5vY+oneRgmOlVxZ5Obx1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="271176420"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 20 Aug 2026 03:16:52 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 3/7] drm/xe/sysctrl: Make sysctrl_write_frame() void
Date: Thu, 20 Aug 2026 15:46:36 +0530
Message-ID: <20260820101632.527214-12-mallesh.koujalagi@intel.com>
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

The function always returned 0, so the int return type is misleading.
Convert to void and drop the error handling in the caller.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 3523651b467b..ac58571f2a43 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -49,8 +49,8 @@ static int sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
 			     timeout_ms * 1000, NULL, false);
 }
 
-static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
-			       size_t len)
+static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
+				size_t len)
 {
 	static const struct xe_reg regs[] = {
 		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
@@ -66,8 +66,6 @@ static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
 
 	for (i = 0; i < dw; i++)
 		xe_mmio_write32(sc->mmio, regs[i], val[i]);
-
-	return 0;
 }
 
 static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
@@ -154,11 +152,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 	for (frame = 0; frame < total_frames; frame++) {
 		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
 
-		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
-			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
-			sc->phase_bit = 0;
-			return -EIO;
-		}
+		sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size);
 
 		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
 			   REG_FIELD_PREP(SYSCTRL_FRAME_CURRENT_MASK, frame) |
-- 
2.48.1

