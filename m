Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B27CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 01:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5163D10E2E3;
	Wed,  1 Oct 2025 01:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiwrFymP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D0810E2E3
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 01:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759280981; x=1790816981;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qkYOiNe2+YckdhYy69FBUaIvVezjmdx0T4s6TzppsKo=;
 b=OiwrFymPPfSh9pstZ3Abaqzfjcz/zk7LfBeEIBDERH9fDlY8KvY113vf
 xbA+SUyXW5Z4GMq+iRo2OwZIaZuhBlSDM0QRGlWYd44PcGJPwULC54rTB
 yLI/pjWO+yPkjD5+9tJhIBw2CJ+MOgd8T37jzW6iQbW3Y1RjwaYiEWYrM
 KC38fyHP43k9MU0ORpyYZp+h+bL2L22RC/t3rkLP0ekqKGfdhGVs9T+if
 0XXY9OSd7Xx9t7L8fYRA7KZ6vmu4UZAV+WsktPYeqV28ixgQUdFXjpHht
 AQTs8m2cducjBBkFs97MLhZZVPm1/+EYx1+Chvv8gWXBJO97rSt79phYi w==;
X-CSE-ConnectionGUID: yLe2cuv0QamGyWVVI/0NMw==
X-CSE-MsgGUID: gnhdqxsGSsONsdSOQrbMqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65405590"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65405590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 18:09:41 -0700
X-CSE-ConnectionGUID: VG+3MZM6QUK2JFO28gM0ag==
X-CSE-MsgGUID: zhd98Oj6SU+XRqKiDE+NZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="183069184"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 30 Sep 2025 18:09:38 -0700
From: mallesh.koujalagi@intel.com
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] drm/xe/xe_late_bind_fw: Initialize uval variable in
 xe_late_bind_fw_num_fans()
Date: Wed,  1 Oct 2025 06:39:33 +0530
Message-Id: <20251001010933.3179753-1-mallesh.koujalagi@intel.com>
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

Fixes: 45832bf9c10f3 ("drm/xe/xe_late_bind_fw: Initialize late binding firmware")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 38f3feb2aecd..46981a6f28ae 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -188,13 +188,11 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-	u32 uval;
+	u32 uval = 0;
 
-	if (!xe_pcode_read(root_tile,
-			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
-		return uval;
-	else
-		return 0;
+	xe_pcode_read(root_tile,
+		      PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL);
+	return uval;
 }
 
 void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
-- 
2.34.1

