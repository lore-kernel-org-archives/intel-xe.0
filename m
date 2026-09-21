Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EBEC982F0
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 13:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD94C10E791;
	Mon, 21 Sep 2026 13:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpiyhguo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72AC10E791
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789998002; x=1821534002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hw24BleyfSSvmQwzlZtndP3E8KkQDdWp2LT5MX9w5c0=;
 b=lpiyhguomeXM8iX8Xz2/O6i7irI2tYcYlrFEieAAEIKy8GTF10qAjt/u
 I1ug4HmcA4eSW/vSlnRQtf+qVRcvuVaAPG/V6yzKpzuxJjwFDZIcIaQK8
 67D66ZQ8rZxrK2ArYjaoCmSXpWS4+4Me2OAn/o6F+ynwPLtewO/babQ36
 pCfnhx1H6+uSpe0qufi/75gX209K/n4t82KNkAxtFiVybg0v3qXfxs488
 mRCN4ZvUUf+sPQ1BafXrSPZSJhEZXeAUyvfYiQFV6FnSL5wqgTKBI1tec
 Ckww65OOWsnUZ4bqGANM0BOCuhmQBfSp6u7QkKufkcQVl05/T1VcsRvrY w==;
X-CSE-ConnectionGUID: MlRGL8UqT3O/L7WsHeHQ7Q==
X-CSE-MsgGUID: CwAW8AWFT9SMbev9bbPghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="116036273"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="116036273"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:40:02 -0700
X-CSE-ConnectionGUID: GREKGzNgSEObp1dwSpDStg==
X-CSE-MsgGUID: Go850I2DRrCBuRa46O/BMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="298898806"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2026 06:39:56 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v8 04/10] drm/xe/sysctrl: Make sysctrl_read_frame() void
Date: Mon, 21 Sep 2026 19:09:31 +0530
Message-ID: <20260921133927.128281-16-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
References: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
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

