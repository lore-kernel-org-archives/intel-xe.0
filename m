Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA66606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KQBP2lJ+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2AA10FC7A;
	Thu, 12 Nov 2026 21:35:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4409B10EA09
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 21:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794519312; x=1826055312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ffDS2vgrLdXS519+Nt6LTcY5Mrobsy41KulPQTzor3I=;
 b=KQBP2lJ+txWemyYAx/Sn9JujF3D2qzNE1SbOEXFLxjEQk0zlMn4MWm49
 tApGkI3lvadwRZFFZQ0t+VWEBeFcdyntFcWOy6kiwtQE3q2aezCZWSozH
 ORV57NYhCmaGO4NlCwj5CNeyqnOxLBgp2pxMTkzmmQ+sEDkYwJiMYIS0S
 DQd+92M8tknayA7l/lkcAuLmgRKJ3D2FcB/FBeCr3a3Yt6zzCKt0AlPwh
 REltP19wrEgUINvo/nhJM1iXju+7Ke6FKo/54UaR4Zkgc0Il0tW8wNZEz
 KBPa6M65HhSl9GMZHenBTQR+JhP1Fyd3OwSuPy3pR5oSnwWcapgMkm9ZV Q==;
X-CSE-ConnectionGUID: mI5cI1rNSz6HnkcB1wTr8g==
X-CSE-MsgGUID: 5a/EI54PRfK0wvMRR8Cu3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3351720"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3351720"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:11 -0800
X-CSE-ConnectionGUID: aGuL8qCcSlyaxcSF+CiDiQ==
X-CSE-MsgGUID: fGFJlHNRRCqvRC2T30sdaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8754517"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:10 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 1/8] drm/xe: Guard configfs attribute reads in getters
Date: Thu, 12 Nov 2026 21:35:06 +0000
Message-ID: <20261112213508.457213-11-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112213508.457213-10-stuart.summers@intel.com>
References: <20261112213508.457213-10-stuart.summers@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The configfs getters read dev->config members without holding dev->lock,
so a concurrent store can tear the value being returned. The store paths
and a few of the getters already take the lock; make it consistent by
wrapping every read of dev->config in the getters with a scoped_guard(),
covering the surrounding checks that consume those values as well.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 2ddd707a6dbd..cc442014cf12 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -1282,7 +1282,8 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.survivability_mode;
 
-	mode = dev->config.survivability_mode;
+	scoped_guard(mutex, &dev->lock)
+		mode = dev->config.survivability_mode;
 	config_group_put(&dev->group);
 
 	return mode;
@@ -1296,7 +1297,8 @@ static u64 get_gt_types_allowed(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.gt_types_allowed;
 
-	mask = dev->config.gt_types_allowed;
+	scoped_guard(mutex, &dev->lock)
+		mask = dev->config.gt_types_allowed;
 	config_group_put(&dev->group);
 
 	return mask;
@@ -1340,7 +1342,8 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.engines_allowed;
 
-	engines_allowed = dev->config.engines_allowed;
+	scoped_guard(mutex, &dev->lock)
+		engines_allowed = dev->config.engines_allowed;
 	config_group_put(&dev->group);
 
 	return engines_allowed;
@@ -1360,7 +1363,8 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 	if (!dev)
 		return false;
 
-	ret = dev->config.enable_psmi;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_psmi;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -1381,7 +1385,8 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
 	if (!dev)
 		return true;
 
-	ret = dev->config.enable_multi_queue;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.enable_multi_queue;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -1421,7 +1426,8 @@ bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
 	if (!dev)
 		return device_defaults.disable_vram_page_offline;
 
-	ret = dev->config.disable_vram_page_offline;
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.disable_vram_page_offline;
 	config_group_put(&dev->group);
 
 	return ret;
@@ -1445,10 +1451,12 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 	if (!dev)
 		return 0;
 
-	if (cs)
-		*cs = dev->config.ctx_restore_mid_bb[class].cs;
+	scoped_guard(mutex, &dev->lock) {
+		if (cs)
+			*cs = dev->config.ctx_restore_mid_bb[class].cs;
 
-	len = dev->config.ctx_restore_mid_bb[class].len;
+		len = dev->config.ctx_restore_mid_bb[class].len;
+	}
 	config_group_put(&dev->group);
 
 	return len;
@@ -1472,8 +1480,10 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 	if (!dev)
 		return 0;
 
-	*cs = dev->config.ctx_restore_post_bb[class].cs;
-	len = dev->config.ctx_restore_post_bb[class].len;
+	scoped_guard(mutex, &dev->lock) {
+		*cs = dev->config.ctx_restore_post_bb[class].cs;
+		len = dev->config.ctx_restore_post_bb[class].len;
+	}
 	config_group_put(&dev->group);
 
 	return len;
-- 
2.43.0

