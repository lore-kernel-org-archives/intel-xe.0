Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04C2EDF165
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 13:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D7D10E2F1;
	Fri, 13 Feb 2026 13:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngFqLO/Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66ED10E2F1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770990945; x=1802526945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=No+7fWkjoTYo9yFxW6yGZoVJf1jvLzOly8xkChPfAVc=;
 b=ngFqLO/Zc+guDvVkp2hvg/140BO/esus3sDBw+Os2HpUa4EkcojT8X/j
 wvvwVFse+/LW4w9O3EG1lg/5Tc7s9XlbAmWV8UFMkVatDdg8VR4CgLD8G
 zgStvngbMHs+chrwc0qmiLOzNuKSpM/4wkVSMAcAYi8mE0odKzytsZg7z
 NtZOuFPXWsnqzpKB06Z0+UBM6FlTNhL/31z+vgE0lmAILKcrQ4HpigSbY
 MC/4N7w6cWZnz5agUSb6/QCrOjU0nsD3fDzqj4P0AzRrNOgHy+UHzKSfR
 qJUsxaLFQHkgzeurQyWGSETT1D71V668JeiwJ6C4IeVgCYRRMsxwiloay g==;
X-CSE-ConnectionGUID: bWtcWrtdQpyVzznnk16/qw==
X-CSE-MsgGUID: nbNp8DBrTYueFqBnQ/8B+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72079009"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72079009"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 05:55:45 -0800
X-CSE-ConnectionGUID: PefTf7lySBGRuZK9vO/iRQ==
X-CSE-MsgGUID: TcYdLNSVQCeSz+/qyqZ/EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212756573"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 05:55:43 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v1] drm/xe/guc: Increase GuC log sizes in debug builds
Date: Fri, 13 Feb 2026 15:00:08 +0100
Message-Id: <20260213140008.1473400-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

Increase event log size for GuC debug to 16MB, and for general debug
to 8MB. This allows for useful debug even if performance-affecting
DRM_XE_DEBUG_GUC is not enabled.

Without this change, GuC logs gathered by CI are useless for debug
due to limited size, which translates to time frame not even able
to cover cleanup after test.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_log.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 1b05bb60c1c7..4649a260755e 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -13,9 +13,13 @@ struct drm_printer;
 struct xe_device;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
-#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
+#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_16M
 #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
 #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_2M
+#elif IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
+#define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
+#define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_1M
 #else
 #define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_64K
 #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_16K
-- 
2.25.1

