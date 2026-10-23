Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4383D606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 03:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hElL/ipk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9D110E1DE;
	Fri, 23 Oct 2026 03:05:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0C910E1DE
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 03:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792724741; x=1824260741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YYA97XZ4LkQEJUbop2elWLO5Ao4uFdo4fvZpLPr2ZUw=;
 b=hElL/ipkis9vLpq01Gm+6pGwuTBmOb/co9DjWQE7X+QshQX0Rz3FyzVo
 VXodQqCWWo0e4nDLdVHsyBL7HrnZOuAroleArXeW4vpYg9JYDKe84qE/Z
 T/U6LQ3xZ2gnhu/ZrAMeWElO9v9FdXLjegGZwBOctugoH7Dj8MIas34s3
 GOugZEi4we9AhtTHOKir2lXW1loKt2MZsGLyShBY6NtE8NFKjpGGyEnKs
 f11wgOv5cmsGRwa0e2RwYkYaaWS/GyauZ+WpaaXLWLrcp4e3k10ZeXBlW
 wkCkOP5/FBJXvI3UDInF3tX0tXrhZq06ypHILwCmpud5yEXleRi9uvrY5 Q==;
X-CSE-ConnectionGUID: j83eKyGjSSm1fMUi9bNW2A==
X-CSE-MsgGUID: bp5FYOH8R1arqITw8zu99g==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1383352"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1383352"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 20:05:41 -0700
X-CSE-ConnectionGUID: 6u7cZ0+jQ3mG4Brx+uj68Q==
X-CSE-MsgGUID: szqglLbQRv6VKH1vpKA2Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3913424"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa010.jf.intel.com with ESMTP; 22 Oct 2026 20:05:39 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 jani.nikula@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe: Register drm device at the end of probe
Date: Fri, 23 Oct 2026 08:34:46 +0530
Message-ID: <20261023030446.337222-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Call drm_dev_register() to advertice the device to user space and register
it with other core subsystems. As per documentation, this should be done
last in the device initialization sequence to make sure userspace can't
access an inconsistent state. Also reflect this reordering in driver
remove sequence.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 --------
 drivers/gpu/drm/xe/xe_pci.c    | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a07655b4c7a9..6fbcc06c0e45 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1052,10 +1052,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	err = drm_dev_register(&xe->drm, 0);
-	if (err)
-		return err;
-
 	xe_display_register(xe);
 
 	err = xe_oa_register(xe);
@@ -1099,8 +1095,6 @@ int xe_device_probe(struct xe_device *xe)
 
 err_unregister_display:
 	xe_display_unregister(xe);
-	drm_dev_unregister(&xe->drm);
-
 	return err;
 }
 
@@ -1108,8 +1102,6 @@ void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
 
-	drm_dev_unplug(&xe->drm);
-
 	xe_bo_pci_dev_remove_all(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 605c452a9c33..e71e48ad1564 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1119,6 +1119,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
+	drm_dev_unplug(&xe->drm);
+
 	if (IS_SRIOV_PF(xe))
 		xe_pci_sriov_configure(pdev, 0);
 
@@ -1297,6 +1299,11 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 	if (err)
 		goto err_driver_cleanup;
 
+	/* Must be last */
+	err = drm_dev_register(&xe->drm, 0);
+	if (err)
+		goto err_driver_cleanup;
+
 	return 0;
 
 err_driver_cleanup:
-- 
2.43.0

