Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0302DEC1EA6
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 11:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB67110E87A;
	Thu,  5 Feb 2026 11:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtRuogIs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C9210E879
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 11:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770291369; x=1801827369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cx6NHlnC+O7nZSr97GlspfKh3wpx/G8yC5VoYwIkZtU=;
 b=dtRuogIs5cUGy8pzDRVyDaIlo891W7JJ/Js9TGDRIyhjFfVsUBsrevTe
 qE7GeCHfKLlc4fgOzfUszn1cDfFuLYdMEYf2gOTexLO/GPXrjk6+a6CxD
 RHqjxTIPI5aCVlXYlVgpWnApvGyy0aQUh3mRHSZvnCK3Z+HNaI9GTa7hd
 NdAsFLCN8npBBG/o9AiNp2urTGt/wD0x+gdvwy/zLxR/AM6F0oaCQqyij
 EuwmDNR6cBOtwdg1Ddex0s7bEalAYvAyEU33lCAfxtz99bxTOa66t3UU2
 +2+CK+rTuGv40AUXEQpQBTSppmwvp7IokITVxYvGS2nh5eXkSl92vHqD9 w==;
X-CSE-ConnectionGUID: qEzWM3E/QXWnEDzTHAy3rQ==
X-CSE-MsgGUID: f0gXD9EmR/GnQZPXXiPg4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71550256"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71550256"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 03:36:08 -0800
X-CSE-ConnectionGUID: oWyrYKw/Qsm0tZJ1/uOdHg==
X-CSE-MsgGUID: SCaMoLctRLu1Xk5EZ1//yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210463019"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2026 03:36:06 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 lukasz.laguna@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe: Update xe_device_declare_wedged() error log
Date: Thu,  5 Feb 2026 17:04:24 +0530
Message-ID: <20260205113424.1629204-1-raag.jadav@intel.com>
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

Since the introduction of DRM wedged event, there are now a few different
procedures to recover the device depending on selected recovery method.
Update the error log to reflect this and point the user to correct
documentation for it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 815f0b0c9dfd..e59555896471 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1317,7 +1317,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		xe->needs_flr_on_fini = true;
 		drm_err(&xe->drm,
 			"CRITICAL: Xe has declared device %s as wedged.\n"
-			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
+			"IOCTLs and executions are blocked.\n"
+			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
 			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
 			dev_name(xe->drm.dev));
 	}
-- 
2.43.0

