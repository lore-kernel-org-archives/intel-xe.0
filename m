Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C232DC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE5F10E791;
	Mon,  7 Sep 2026 10:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFf7P4Sp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C438410E790
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 10:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788778420; x=1820314420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5wVaMphDqWt5BYZtrKzQcMnFwYzacn3Y4FMlF9RTyHw=;
 b=iFf7P4SpGAnLyuesaRqjv2JjuNJ31q+awtolJ5fDk/YrPL5xk8VQF8FZ
 CjnAK4mBXJawaqJzV4JPdPLJDvA/MKPxxOD2TY2K7LskEvxKq+VAIKUP+
 H1DupGAQSYQ+d2JGuC/9kkHK8KGWbjUujxgMCY5lj8/dpxqNJK7RSQ+8P
 7UGDBjMJm9CPT5VU1IOugyCLo0fxCAdvYP86OvszK7ysF2uOZbPewB8Yn
 LI6KjYrv75QDo5VfQEXzD4ttYVa9XJnevypam9rbJIqvzBp+DPXtYt7aa
 4mkslpMyr94vEUYnqVvozRHngIq9rq7xSwmV5iGGTLo9cU3kJdPgmiVs5 Q==;
X-CSE-ConnectionGUID: Isp2KH3hTXuZovuvuo7VFg==
X-CSE-MsgGUID: 7hkRTMx1RnGkHaFbt8kAZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89024507"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89024507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:53:40 -0700
X-CSE-ConnectionGUID: OzrcYpyqRNq/1SubPuYP4w==
X-CSE-MsgGUID: v6ScUBk0RiubqfqNSw8ALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="308908383"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 07 Sep 2026 03:53:36 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 3/9] drm/xe/sysctrl: Make sysctrl_write_frame() void
Date: Mon,  7 Sep 2026 16:23:17 +0530
Message-ID: <20260907105313.2208003-14-mallesh.koujalagi@intel.com>
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

The function always returned 0, so the int return type is misleading.
Convert to void and drop the error handling in the caller.

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index b3d1538c8990..3ef60067e226 100644
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
@@ -156,10 +154,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
 	for (frame = 0; frame < total_frames; frame++) {
 		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
 
-		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
-			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
-			return -EIO;
-		}
+		sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size);
 
 		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
 			   REG_FIELD_PREP(SYSCTRL_FRAME_CURRENT_MASK, frame) |
-- 
2.48.1

