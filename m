Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39998CAC5BB
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 00:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF98B10E74B;
	Thu,  2 Oct 2025 00:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RtsNNARN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B8410E74B
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 00:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759366615; x=1790902615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o7DDljz8yaJuJUeUas42NtbmsYGVOQy7D182QjEzSXc=;
 b=RtsNNARN5fbI9hiP58z5jA+uaA8PrzjnEK+BF/Nb/JixKCU3Tf1b3sNW
 +2/oLijBV0+hvswRiQiAf9FzpJu/jMw65NAWHgFiJTpPZD/Ig1OmYzOm7
 BJd/CvlGf/tZOn2DuvjZkWcjIjgMtcXqXEH+ID0UXLWnNgFs+gJA/TLiN
 28oRjuIqu7/qkwm0AWJXF31zBjyvcLrWytFwY5vytNYJV1fYqJgThTg9P
 KlCtIyVbvLyqr4Ne47FfV/ewu1VNRWJjYbBCms3JWL1DL1PbfIMKfYAeO
 +ABpasiWH0VJ41OTosIu0urH/mUAnNJt/9zTrPZb/4fY9yzbwYQ2n4CHM g==;
X-CSE-ConnectionGUID: RHQVe8BoSHaDu9h71TYnPw==
X-CSE-MsgGUID: Mjke9K1kTLKG7fMhP7YszA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="71900150"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="71900150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 17:56:54 -0700
X-CSE-ConnectionGUID: gT8PzCsqSCSU/ynzjJ3f9Q==
X-CSE-MsgGUID: g7hPq4TnS+q3YFjbyRUgpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="184210566"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 01 Oct 2025 17:56:51 -0700
From: mallesh.koujalagi@intel.com
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] drm/xe/xe_late_bind_fw: Initialize uval variable in
 xe_late_bind_fw_num_fans()
Date: Thu,  2 Oct 2025 06:26:48 +0530
Message-Id: <20251002005648.3185636-1-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Initialize the uval variable to 0 in xe_late_bind_fw_num_fans() to fix
a potential use of uninitialized variable warning and ensure predictable
behavior.

The variable is passed by reference to xe_pcode_read() which should
populate it on success, but initializing it to 0 provides a safe
default value and follows kernel coding best practices.

v2:
- uval = 0 which serves as both a safe default and the fallback
  value when the pcode read operation fails.

v3:
- Handle MMIO failure (Rodrigo)
- The function should probably return the error and make the uval as
  pointer-argument, like the pcode_read.
- Change the caller of this function to propagate the error
  upwards if mmio failed.

Fixes: 45832bf9c10f3 ("drm/xe/xe_late_bind_fw: Initialize late binding firmware")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 8f5082e689dc..768442ca7da6 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -184,17 +184,13 @@ static const char *xe_late_bind_parse_status(uint32_t status)
 	}
 }
 
-static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
+static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fans)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-	u32 uval;
 
-	if (!xe_pcode_read(root_tile,
-			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
-		return uval;
-	else
-		return 0;
+	return xe_pcode_read(root_tile,
+			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
 }
 
 void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
@@ -314,7 +310,11 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 	lb_fw->flags &= ~INTEL_LB_FLAG_IS_PERSISTENT;
 
 	if (lb_fw->type == INTEL_LB_TYPE_FAN_CONTROL) {
-		num_fans = xe_late_bind_fw_num_fans(late_bind);
+		ret = xe_late_bind_fw_num_fans(late_bind, &num_fans);
+		if (ret) {
+			drm_dbg(&xe->drm, "Failed to read number of fans: %d\n", ret);
+			return 0; /* Not a fatal error, continue without fan control */
+		}
 		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
 		if (!num_fans)
 			return 0;
-- 
2.43.0

