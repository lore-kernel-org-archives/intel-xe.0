Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC45C606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 04:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W9i3gdoJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3B610E767;
	Tue, 20 Oct 2026 04:02:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADBB10E767
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 04:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792468942; x=1824004942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dxy8zJCjuMWa4mriIVAMFCB2MRHNY9iz82vGk3N26hs=;
 b=W9i3gdoJciv9gbcvIwQ8q5AwtXYY3pJOD2KopsWWPN5MW1EfvOJRpuCI
 wHqkibfvXXlW3/uLEZu975sc4DsPAWFTmX3xg2wBukO8fd4ppQElclGCY
 3m8TzI/zE9cUvIBv6kT3keMN2CovGYQ3OYmKCkhXhVdQtKPeNUgKtg6N9
 a4XPK50mn/S7vN1b86jqTeWkguwjU+1kEuVEVq/YBZdLWqEwqbszWwbgd
 I0ja8jKFi5BeRoSRMGawPqLWhU2ytKJm62f6DU99J0JdU7kktecbnqCdo
 0MRcVf3k90bOYMrwpNiQ/xIdXYoJHfkr8eWdIqsWleMfyIeBpAwuyJa3i A==;
X-CSE-ConnectionGUID: xPbH6ep8R0K0quk1CY8EIg==
X-CSE-MsgGUID: +2aN0wvITcasGR+LRr433w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1175696"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1175696"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 21:02:21 -0700
X-CSE-ConnectionGUID: EyW1UHS7Rs2NH1jOTDE1LQ==
X-CSE-MsgGUID: N8sMmR8+RfOcorr7R8sxFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3065419"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 21:02:19 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com
Subject: [PATCH v2] drm/xe/irq: Always free requested IRQs on uninstall
Date: Tue, 20 Oct 2026 09:32:11 +0530
Message-ID: <20261020040211.496778-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_irq_suspend() clears irq.enabled after disabling and synchronizing the
interrupts. irq_uninstall() currently returns when that flag is clear, so
a suspended device can skip free_irq() during teardown.

The managed uninstall action is registered only after the IRQ request
succeeds. Reset the interrupt registers only when interrupts are still
enabled, but always free the requested IRQs.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b394c8edf89c..f3964c6eca17 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -786,10 +786,8 @@ static void irq_uninstall(void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (!atomic_xchg(&xe->irq.enabled, 0))
-		return;
-
-	xe_irq_reset(xe);
+	if (atomic_xchg(&xe->irq.enabled, 0))
+		xe_irq_reset(xe);
 
 	if (xe_device_has_msix(xe))
 		xe_irq_msix_free(xe);
-- 
2.43.0

