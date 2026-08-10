Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB7AC5AD7B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 12:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6954910E80E;
	Mon, 10 Aug 2026 12:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKoDX5Bk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655D710E80B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 12:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786365679; x=1817901679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NXDbl4LOcHffZvY0/41aVpUXylDVjakGDT2D3g0x/0c=;
 b=OKoDX5BkcrPz569FaBjU/qxrhZ2j46rgztR8tIuJvygRj/F5iDl7jjjJ
 kPpb3WxUOeijQlW8CKFo+L/eh2rFIbvfl0fG2kDUFyx6TdPWh+FG26Yhm
 E03dRWxUMgHupTrDZHLk5bVY5/8eUNHw7NsouSaZ9iREx81f1S1LlRsmO
 EO2upyySGvY1udlTMIKkLH5Zf1sknsz0SV6lq3jUyQkbxqnAU0hL1hBd2
 H+Teru4XEYZO+7M4ar0s3Uv/YMYjF0yWZ+kMemKAiKQw05HifUkaHGs2F
 eNxU397UGP1D37W1h/7sICjLDCe/fW8mbpS5RW4hA5ceoEFJRnVpvYUNp Q==;
X-CSE-ConnectionGUID: TGnxFUQJSq6XR1W42sePRQ==
X-CSE-MsgGUID: JgcxY+n+SUaM37SMHgcDrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86729858"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="86729858"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 05:41:18 -0700
X-CSE-ConnectionGUID: 2fN3yeMZRqqaql5Nsap2uQ==
X-CSE-MsgGUID: g6pRtyraRjCzBelMNNZAyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="258759649"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa006.fm.intel.com with ESMTP; 10 Aug 2026 05:41:16 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/drm_ras: Move has_drm_ras check to drm_ras layer
Date: Mon, 10 Aug 2026 18:11:01 +0530
Message-ID: <20260810124101.105832-1-raag.jadav@intel.com>
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
correct layer where it belongs.

Fixes: 63dfab5786ca ("drm/xe/xe_ras: Add drm_ras feature flag")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
v2: Fix typo (Michal, Riana)
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
index db8bd19ad28b..4fc1b301a91b 100644
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

