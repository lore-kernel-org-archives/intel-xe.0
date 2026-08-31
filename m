Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71402C624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB0610E6E8;
	Mon, 31 Aug 2026 08:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eW2M9eJi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC62C10E6E8
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788163525; x=1819699525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OLNBdLQi1x97oYQZs9Kt8q3IbdoYjOT7I1LToyrQ6VM=;
 b=eW2M9eJilceShxiIi5tslQxKnydBGcSPdeNmG0Ge2ZPVX4/pTim5Eyg3
 9AsETMaWuZLjd9adhS+G39E+0UOwYLxh65VyjXiTIu4qAzE+r/I13cV37
 8UrU4fw7dNxl+/XCSff/wsXZwh49fk0w5VfzXYnORnf67rhwdfP5kp1XB
 HZbFbzbapuexIYqR80Oy1yGx3TvPx+4KcsuwYl1OLNj0oFIwaAsclIM7L
 UMSgcLOfkQi9YUVjcUK5Z7SpmA0Rc1ghAxC3IYCUu9BreVnyHZBPrazSy
 5xlQM2upBUZfv0plfDjU83nPaLG0Y2o0JTGtZ7bt/ltUVMDHhD8YSZUyR w==;
X-CSE-ConnectionGUID: VUyoMDQjSweBA4cwbeL3Xg==
X-CSE-MsgGUID: Mr30Ls1ARkCR838XIMkyYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92251036"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92251036"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:05:25 -0700
X-CSE-ConnectionGUID: Lb9izkYkRTOEkCwnqwJ2cQ==
X-CSE-MsgGUID: gneWlBoKTj+Q36kY8vnImQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="268172151"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:05:23 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v5 1/4] drm/xe/log: Add GUCSUBMIT component
Date: Mon, 31 Aug 2026 13:35:04 +0530
Message-ID: <20260831080507.2364687-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831080507.2364687-1-arvind.yadav@intel.com>
References: <20260831080507.2364687-1-arvind.yadav@intel.com>
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

Add a GUCSUBMIT component for structured SIGID logging.

GuC submit failures can still map to an existing SIGID, but using the
generic GT component hides the source of the report. Add GUCSUBMIT as a
separate component and map it to XE_SIGID_GT_TDR.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/abi/xe_log_abi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index d6105520173e..19976df21532 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -159,6 +159,7 @@ enum xe_log_location_bits {
 	define(DRIVER_FIRMWARE, 1, GUC, RUNTIME_FW, "GuC")			\
 	define(DRIVER_FIRMWARE, 2, HUC, RUNTIME_FW, "HuC")			\
 	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
+	define(DRIVER_FIRMWARE, 4, GUCSUBMIT, GT_TDR, "GuC Submit")		\
 	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
 	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
 
-- 
2.43.0

