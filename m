Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA82AEB3643
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 00:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDD710E037;
	Tue,  3 Mar 2026 00:17:59 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C1C10E037
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 00:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772497073; x=1804033073;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4fTN+GNuwjCjaBloPm9ucLDHpWD2AZOkjVToT5GeH/g=;
 b=hzph5Kadrh8kYaT+OqRTVtRPLD0pOB+jCyV6jYgqgZ5vYycvc2/hws8Z
 P2FzXHg/tHlS3pGn9I3O82lARC8vcc9UZJY1KbBYY3eC5ZPf1bq0Vqvv/
 /IKHzW1MkeNU/WKnbApotHB2pYhPAvm4/5vtCFLbwNWPNvYeys+fEMIy9
 I9zRMfkomDsH7UeEhP+8S8eFAcph3fCE+zYhpM6K+b7S0+LcGgE34WXYC
 kL3gK35hVFhYfrbty8M0gOfABl0Ri2+G+CFaDujtjSKlpi3jxKRGiub8N
 PqxlW8GeXs6403iWz+7zAtl2iIYIPReMm7IqzyZ3I36Ja6u48bTCv839R A==;
X-CSE-ConnectionGUID: XOZf+1AzRCOV/6T+d5G6TA==
X-CSE-MsgGUID: zHMQHMv1QxmqbgeXmNxUtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84158822"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="84158822"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 16:17:43 -0800
X-CSE-ConnectionGUID: 73WzB6/SRxSjhI+cdgMDOA==
X-CSE-MsgGUID: fD9aj6xAQCS6Gdr4JjCSWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222320490"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 16:17:42 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [CI] drm/xe/guc: Fail immediately on GuC load error
Date: Mon,  2 Mar 2026 16:17:33 -0800
Message-ID: <20260303001732.2540493-2-daniele.ceraolospurio@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 8534fa9645c2..0e06c2f8c5d0 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1176,14 +1176,14 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
 	u32 before_freq, act_freq, cur_freq;
 	u32 status = 0, tries = 0;
+	int load_result, ret;
 	ktime_t before;
 	u64 delta_ms;
-	int ret;
 
 	before_freq = xe_guc_pc_get_act_freq(guc_pc);
 	before = ktime_get();
 
-	ret = poll_timeout_us(ret = guc_load_done(gt, &status, &tries), ret,
+	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries), load_result,
 			      10 * USEC_PER_MSEC,
 			      GUC_LOAD_TIMEOUT_SEC * USEC_PER_SEC, false);
 
@@ -1191,7 +1191,7 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	act_freq = xe_guc_pc_get_act_freq(guc_pc);
 	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
 
-	if (ret) {
+	if (ret || load_result <= 0) {
 		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
 			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
 			  xe_guc_pc_get_cur_freq_fw(guc_pc));
-- 
2.43.0

