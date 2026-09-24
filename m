Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9039C98312
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4E110E711;
	Thu, 24 Sep 2026 06:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goOqM5ur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882D910E711
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790230167; x=1821766167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=twglUZWXc/W6uOd02vwNup8ffQ2EZgrhlW2ZtUc1sWs=;
 b=goOqM5ur1N62HcbvAXrIxF2d4VYeNyfWTHc3qyJPmeKsvxdW4IL8P/56
 L9LE8FhMVqE1o2Y+fuSFrxKAiyqtWlO8KL2m2+2VGJyk6rnp03P1Kixup
 Lrei+4uajppu6KuIUC7xylkQU0J5eFoSFNmZGiTdEdoq0RsKYs5Zzaib+
 zkYXqwYLtlnD2VCjPBwkazw74euK+8duSTa/BFXD9e1oCYnhTtVsKiQZG
 4kon7Sa5d4slUX+7W21ClYaqiS/KoDMCu6OEnlhQQARqsg9zy9D2C5FLa
 Zl5MiYbWgVz/R8Xk4072nDYQocG7wKRzMvEkS0kEP8r9bzJlESgpjj/An A==;
X-CSE-ConnectionGUID: DUruFugjQau4AgUXYaZtZg==
X-CSE-MsgGUID: D9+mwQZ4T+iz12GACB11CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90853957"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90853957"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 23:09:27 -0700
X-CSE-ConnectionGUID: cbfEpPZhR1+dwTbK7Uv1rA==
X-CSE-MsgGUID: 9gg3I3NxSUGo6LMSBnd7Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277096626"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 23 Sep 2026 23:09:24 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v9 03/10] drm/xe/sysctrl: Make sysctrl_write_frame() void
Date: Thu, 24 Sep 2026 11:39:04 +0530
Message-ID: <20260924060900.146167-15-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
References: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
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
index d796f52076b4..745ba41ecdd7 100644
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

