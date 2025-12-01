Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0AFD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 10:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3203A10E237;
	Mon,  1 Dec 2025 10:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c21kHeNT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634D710E237
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764585131; x=1796121131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1nlur+NOy4SULoojDcLzMeXfKPmmnbYDfh12kzM9T8U=;
 b=c21kHeNTgEgzb6QlMpTfqncxmOk0NFbCVrDCj9h6gf/dB7/2RF9mBrTr
 wXIqpSOnaJ/+aTchStPz7wGhaqxPu2Qx0+ikFLQ14XMYPWLMxqKM99/tF
 nCTPUrajW3Xj+c1Frni7klhK1vm2IWDxlo9pRAYrFw9UnKqOKXjlcDvmX
 KqSybctypRLG6WxTtqtVM/TxyMN2byrTKb6hEKPzVoKSOYyE+GJ7pu+gw
 bAuY296Io8fwnztTOKrsXopd4Al3EdXYs2bAZ2WVBrjIYKETby1nfLfF3
 XV26WDR8aLLhrFARbWfx1UXTQPbGxYtZUSmt+ME37ImizSP+FDaIhimaI w==;
X-CSE-ConnectionGUID: SwJeftTTTtuROL685QYT1A==
X-CSE-MsgGUID: VNczEgtDRYu8KzrcfHNVzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70131300"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="70131300"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 02:32:11 -0800
X-CSE-ConnectionGUID: vjY9QoUjQIOuKHc3H6Fsbg==
X-CSE-MsgGUID: ywSf2l1PSZCz3fjch74Y9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194134193"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 01 Dec 2025 02:32:08 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: rodrigo.vivi@intel.com,
	jani.nikula@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 4/4] drm/xe/late_bind: Use PCODE_FALLBACK_MAGIC
Date: Mon,  1 Dec 2025 15:57:58 +0530
Message-ID: <20251201102902.362650-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201102902.362650-1-raag.jadav@intel.com>
References: <20251201102902.362650-1-raag.jadav@intel.com>
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

Use PCODE_FALLBACK_MAGIC to check for mailbox command support on the
device while initializing late binding firmware.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 768442ca7da6..997c8bb4b910 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -188,9 +188,9 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fan
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	u32 mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0);
 
-	return xe_pcode_read(root_tile,
-			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
+	return xe_pcode_read(root_tile, mbox | PCODE_FALLBACK_MAGIC, num_fans, NULL);
 }
 
 void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
@@ -312,8 +312,11 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 	if (lb_fw->type == INTEL_LB_TYPE_FAN_CONTROL) {
 		ret = xe_late_bind_fw_num_fans(late_bind, &num_fans);
 		if (ret) {
-			drm_dbg(&xe->drm, "Failed to read number of fans: %d\n", ret);
-			return 0; /* Not a fatal error, continue without fan control */
+			if (ret == -EOPNOTSUPP) {
+				drm_info(&xe->drm, "Fan control not supported\n");
+				ret = 0;
+			}
+			return ret;
 		}
 		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
 		if (!num_fans)
-- 
2.43.0

