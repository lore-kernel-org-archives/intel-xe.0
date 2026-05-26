Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51012CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C4210E505;
	Tue, 26 May 2026 19:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxGlsILK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB20310E505
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 19:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779825314; x=1811361314;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XPnlpsX7/2Q1HVkk82+HOpi7oDgMyhLo/MoZoR/FBhE=;
 b=gxGlsILK0/U35bDt0yMRp+fgHatShFvOpqlj7NGL9xmw7LY+EmS0huBe
 RVrdF4tVt7U6+iOxmX9Kdf5lPPDGN+qPCZUncpD3E64TSctYoNa51dkJM
 od0N0jZf29YpplS0cBEg73o/q9zmMrow3BODCUwLP9msv+V0Fjyn72sZG
 wBisb+6fZ51eac0dUv0Tlq+PwrtADbOvKFm3IAt1Jz3KeSrP67YIbMOmN
 SDIOzjmFpi8A1FEjY9PMxviK3Wvbuohv/VjRzk8NhhjqgzvrdroRClAEz
 mf6WndWGd090ajvefFtVsX/+gSxsikUp53k1i2kHV8yeQCliwrMYYjCMl g==;
X-CSE-ConnectionGUID: 3FfbbdTjS4GVVW/2YNiqNg==
X-CSE-MsgGUID: COS/QO95Rj+qNmx62nEFFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80498775"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80498775"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:55:14 -0700
X-CSE-ConnectionGUID: lH8PNx7OTYmtLm2TjsjMQg==
X-CSE-MsgGUID: C7nmpAuRS7mCtHQevd00lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="239013316"
Received: from adobrzyn-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:55:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/xe/pm: Do early initialization in init_early()
Date: Tue, 26 May 2026 21:54:52 +0200
Message-ID: <20260526195452.20545-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526195452.20545-1-michal.wajdeczko@intel.com>
References: <20260526195452.20545-1-michal.wajdeczko@intel.com>
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

There is no need nor gain in splitting mutex or list initializations
between two init functions as all of this is just pure software state
and all this could be done at once.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 5d1a3a26cb6e..99562f691080 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -363,6 +363,9 @@ int xe_pm_init_early(struct xe_device *xe)
 {
 	int err;
 
+	init_completion(&xe->pm_block);
+	complete_all(&xe->pm_block);
+	INIT_LIST_HEAD(&xe->rebind_resume_list);
 	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
 
 	err = drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
@@ -373,6 +376,10 @@ int xe_pm_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = drmm_mutex_init(&xe->drm, &xe->rebind_resume_lock);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
@@ -484,14 +491,6 @@ int xe_pm_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = drmm_mutex_init(&xe->drm, &xe->rebind_resume_lock);
-	if (err)
-		goto err_unregister;
-
-	init_completion(&xe->pm_block);
-	complete_all(&xe->pm_block);
-	INIT_LIST_HEAD(&xe->rebind_resume_list);
-
 	/* For now suspend/resume is only allowed with GuC */
 	if (!xe_device_uc_enabled(xe))
 		return 0;
-- 
2.47.1

