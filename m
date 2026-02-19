Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40E2C531E1
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 21:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAEA10E1AF;
	Thu, 19 Feb 2026 21:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/+2GVaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021B110E1AF
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 21:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771537539; x=1803073539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qax+XdHsIvJdoI4nk3Bx5s56LMmPe2+B1hNXNerPp+0=;
 b=P/+2GVaMqG0QmE0Dz9XJtkqkJ+lTIu1DpCLAgtPLKM207OdPymSWBhPB
 cyO1AYPpCNc0wLvllSpY8eqPvP6pY8GGo29o3nGIa/ye3yD7s67NE3jZa
 Omx+2nyNLo/lxEApqjQtC58+ufMO4rXspbhBJYSL4i8notOEIoA0lBq/S
 0fxRSjkzfP0XPwBqNu2oxVhr5eoWbk5nT7AiYs7/CHNJEYv5FmzJPcFtQ
 iSD17FlR1G1Wwvss0IyMaYigup33+ubxirLyTv6sNMeb0vltXaKlauUO/
 sKB9GVQSMth90a5BBCfs/JzJ3HHLAGtnggK7JGmx4YpNmJUs3rBeU3DSp A==;
X-CSE-ConnectionGUID: uZ5B3u3QQKW8+l2aywYmUA==
X-CSE-MsgGUID: lq/7FsqvQpOeUAPln3GJhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71842146"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="71842146"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 13:45:38 -0800
X-CSE-ConnectionGUID: oSIKiiEXQeaNXjwhZqE/jw==
X-CSE-MsgGUID: 2KO+If4aR+2AbvFFWSkm5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245248737"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 13:45:38 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/guc: Fail immediately on GuC load error
Date: Thu, 19 Feb 2026 13:45:30 -0800
Message-ID: <20260219214529.1235106-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

By using the same variable for both the return of poll_timeout_us and
the return of the polled function guc_wait_ucode, the return value of
the latter is overwritten and lost after exiting the polling loop. Since
guc_wait_ucode returns -1 on GuC load failure, we lose that information
and always continue as if the GuC had been loaded correctly.

This is fixed by simply using 2 separate variables.

Fixes: a4916b4da448 ("drm/xe/guc: Refactor GuC load to use poll_timeout_us()")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cbbb4d665b8f..aacf77f09522 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1179,6 +1179,7 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
 	u32 before_freq, act_freq, cur_freq;
 	u32 status = 0, tries = 0;
+	int load_result;
 	ktime_t before;
 	u64 delta_ms;
 	int ret;
@@ -1186,7 +1187,7 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	before_freq = xe_guc_pc_get_act_freq(guc_pc);
 	before = ktime_get();
 
-	ret = poll_timeout_us(ret = guc_load_done(gt, &status, &tries), ret,
+	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries), load_result,
 			      10 * USEC_PER_MSEC,
 			      GUC_LOAD_TIMEOUT_SEC * USEC_PER_SEC, false);
 
@@ -1194,7 +1195,7 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	act_freq = xe_guc_pc_get_act_freq(guc_pc);
 	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
 
-	if (ret) {
+	if (ret || load_result <= 0) {
 		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
 			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
 			  xe_guc_pc_get_cur_freq_fw(guc_pc));
-- 
2.43.0

