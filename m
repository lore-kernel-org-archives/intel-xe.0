Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471F1C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 10:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E31210E195;
	Mon, 31 Aug 2026 10:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgebyS9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3D110E195
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 10:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788173123; x=1819709123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5wVaMphDqWt5BYZtrKzQcMnFwYzacn3Y4FMlF9RTyHw=;
 b=dgebyS9BgDMu8mcwM/p02IGXaZxm8Ssz8oOyApp9XHVWmFtzKj+b47dY
 iaH1X7rSzeFMNT0lt0/fjSYOI9aczXbOpk/CEcUV2L3Vg+tdlggueM0rW
 u1u94MDCf//6G6usHi77F9We5PY43lcj4X2OepXJT71Vy8Nv8LMPf61Wg
 PCL6nD8rxNGi8CQcSROUGK+ulmdbs7pS/v9z1Zhu0pNQrUr8kDG21at5m
 JoMeLkEUwY89pH5FRwJKBIP36JkuYGifDw3cNcL2mNES1kmadxyKqKQYx
 m4RXSwwvSNXb9FqjyTsRH6pp0tDqQ0HOkOFHyx++yBw7CDtM3KtjCn2Zp Q==;
X-CSE-ConnectionGUID: unDUwGzZRmmj71nTm9Kl4A==
X-CSE-MsgGUID: Ot5ltan/Tum1WKpgubnTHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92264626"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92264626"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 03:45:22 -0700
X-CSE-ConnectionGUID: GMCKa7TrTHyvIwODsteuvw==
X-CSE-MsgGUID: TkBhW/6vQqezzYfxeX2QiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="270685490"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 31 Aug 2026 03:45:18 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v6 3/9] drm/xe/sysctrl: Make sysctrl_write_frame() void
Date: Mon, 31 Aug 2026 16:15:00 +0530
Message-ID: <20260831104456.1770605-14-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
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

