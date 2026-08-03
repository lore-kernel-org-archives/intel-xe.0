Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1833C55175
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 08:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE7510E009;
	Mon,  3 Aug 2026 08:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGMtsBk7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A24110E009
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 08:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785744527; x=1817280527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UcpFIdExxErby2dttDbKcAQgnOotWoJVneU3EknHcDQ=;
 b=FGMtsBk7ZwHMjIyZT3r2EWnXFUlTpfdnCJNgaNgDPqzSQK2po3UafX9m
 IRk9SRNyaJgWxbUiTeoDZWVhpL4fvmSHafpZx45dMRXu4u3UA4Z1q8kE9
 iACI/WhiPJu1Zy/sjwXuFcWZmT6FUqdUxbGkP9EeeCcMIPCnIPGXJadB5
 NHsWc+8tfqu762j0j00tg4sJYuKFuGczHs1S0YCaUauJXwSosgZD57lkz
 6Rt11nMXZQcw09jp5U9qw6+N7N71V9sWAmpeVc2q09bDTnhr4IzcomZY/
 j1YRFBj0oHkWwR6fEVHz6xUxUPOQHq6Yz9Y1NUEdNOTgVMNbnAufOsEvy w==;
X-CSE-ConnectionGUID: btqt7TnqQPGWFzvA9wcAPQ==
X-CSE-MsgGUID: j3gV+0c2QOy30WgjI8B/0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="96932381"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="96932381"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:08:46 -0700
X-CSE-ConnectionGUID: JxC4KFrBTKS0qREAiVrgEg==
X-CSE-MsgGUID: kyl7WzIOT5eZXGtUhKDuyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="264626040"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 03 Aug 2026 01:08:45 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/drm_ras: Move has_drm_ras check to drm_ras layer
Date: Mon,  3 Aug 2026 13:38:23 +0530
Message-ID: <20260803080823.1166925-1-raag.jadav@intel.com>
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

has_drm_ras flag is meant to facilitate drm_ras feature. Move it to the
correct layer where it belogs.

Fixes: 63dfab5786ca ("drm/xe/xe_ras: Add drm_ras feature flag")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_ras.c | 3 +++
 drivers/gpu/drm/xe/xe_ras.c     | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
index 4afa2ad98300..a23cfb49361b 100644
--- a/drivers/gpu/drm/xe/xe_drm_ras.c
+++ b/drivers/gpu/drm/xe/xe_drm_ras.c
@@ -233,6 +233,9 @@ int xe_drm_ras_init(struct xe_device *xe)
 	struct drm_ras_node *node;
 	int err;
 
+	if (!xe->info.has_drm_ras)
+		return 0;
+
 	node = drmm_kcalloc(&xe->drm, DRM_XE_RAS_ERR_SEV_MAX, sizeof(*node), GFP_KERNEL);
 	if (!node)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 28123f08e513..f7af4da8172c 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -816,9 +816,6 @@ void xe_ras_init(struct xe_device *xe)
 {
 	int ret;
 
-	if (!xe->info.has_drm_ras)
-		return;
-
 	xe_drm_ras_init(xe);
 
 	if (!xe->info.has_sysctrl)
-- 
2.43.0

