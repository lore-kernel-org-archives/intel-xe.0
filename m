Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23140C982D8
	for <intel-xe@archiver.kernel.org>; Sat, 19 Sep 2026 05:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C1B10E6D9;
	Sat, 19 Sep 2026 05:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXLnPKdf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662F610E536
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Sep 2026 05:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789794064; x=1821330064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hot+iwMYRZfF8rYMdZ0MYynmtQaK6ltKZG4iAv2vjcI=;
 b=UXLnPKdfoOZJzmvfUMWk+HLy0HJ+Hw/FhVbtzLrzU9FxT4Cel6ZgWDoN
 j/ImT7W8Ph2ws1gr4DPCQ8vjSmqZdBdfg+h3MvSgGgeQghtxbR0aee7hR
 XYItpmZNgjxbFJeonyUVSzNVl+9U2b8Zk/PINUHlqeD7bfhlauDzD20/V
 0zUB9Nk8M1OTET/CCuO5Yav9nhiajrekx7hdURja+AYI4ygv5m8IY+Cv9
 t1MOZ72/2swTbSTCw44tHIXD07s8Hlz3P+D1FowbERYDU7a5kv1/yMOor
 pCwWO6UhWEVQpqKkVheDfROUrGUqaTXlIyoHa+8vj+cb58m132wP/dWmM A==;
X-CSE-ConnectionGUID: dc7N8rHHR6KPvoFMkCpqWA==
X-CSE-MsgGUID: 07B+pq9jSHutkJgmUswlsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="89463553"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="89463553"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 22:01:04 -0700
X-CSE-ConnectionGUID: VlrfBh9uR1+s46oj/A+gpg==
X-CSE-MsgGUID: VQsemfykTY6dPHoq4wEuLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2926716"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 22:01:04 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@intel.com, mallesh.koujalagi@intel.com,
 alan.previn.teres.alexis@intel.com, julia.filipchuk@intel.com
Subject: [PATCH v5 6/7] drm/xe/guc: Report major GuC failures using SIGID
Date: Fri, 18 Sep 2026 22:01:02 -0700
Message-ID: <20260919050055.2092579-15-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919050055.2092579-9-umesh.nerlige.ramappa@intel.com>
References: <20260919050055.2092579-9-umesh.nerlige.ramappa@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Convert errors during critical GuC flows (init, load, reset, suspend)
to use the xe_log_err() helper.
While at it, simplify the error log for the GuC load failure to use the
cached frequency values instead of fetching them again.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: split guc_load_done changes to their own patch, use available ret
value for reset errors (Michal)
v3: Remove 'GuC' string from logs and cleanup logs (Michal)
v4: (Michal)
- Add s-o-b
- Differentiate Early vs later initialization messages
- Use %u for frequencies
- Remove unnecessary newline
---
 drivers/gpu/drm/xe/xe_guc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 5285d4cecbc8..3bb4aea30a5c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -777,7 +777,7 @@ int xe_guc_init_noalloc(struct xe_guc *guc)
 	return 0;
 
 out:
-	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
+	xe_log_err(gt, GUC, ret, "Early initialization error\n");
 	return ret;
 }
 
@@ -845,7 +845,7 @@ int xe_guc_init(struct xe_guc *guc)
 	return 0;
 
 out:
-	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
+	xe_log_err(gt, GUC, ret, "Initialization error\n");
 	return ret;
 }
 
@@ -998,15 +998,15 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
 	if (ret) {
-		xe_gt_err(gt, "GuC reset timed out, GDRST=%#x\n", gdrst);
+		xe_log_err(gt, GUC, ret, "Reset timeout, GDRST=%#x\n", gdrst);
 		goto err_out;
 	}
 
 	guc_status = xe_mmio_read32(mmio, GUC_STATUS);
 	if (!(guc_status & GS_MIA_IN_RESET)) {
-		xe_gt_err(gt, "GuC status: %#x, MIA core expected to be in reset\n",
-			  guc_status);
 		ret = -EIO;
+		xe_log_err(gt, GUC, ret, "MIA core not in reset, GUC_STATUS=%#x\n",
+			   guc_status);
 		goto err_out;
 	}
 
@@ -1224,9 +1224,9 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
 
 	if (ret || load_result) {
-		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
-			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
-			  xe_guc_pc_get_cur_freq_fw(guc_pc));
+		xe_log_err(gt, GUC, ret ?: load_result,
+			   "Load failed, GUC_STATUS=%#x, time = %lldms, freq = %uMHz (req %uMHz)\n",
+			   status, delta_ms, act_freq, cur_freq);
 		print_load_status_err(gt, status);
 
 		return ret ?: load_result;
@@ -1463,7 +1463,7 @@ int xe_guc_suspend(struct xe_guc *guc)
 
 	ret = xe_guc_softreset(guc);
 	if (ret) {
-		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
+		xe_log_err(gt, GUC, ret, "Suspend aborted\n");
 		return ret;
 	}
 
-- 
2.55.0

