Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1486EC5478A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 17:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99A910E415;
	Wed, 21 Feb 2024 17:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MupC6xzJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2939A10E0FE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 17:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708535438; x=1740071438;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uuBLP2MOmrROwiy192PzrrhjYq11d9G15raVqTpIvcM=;
 b=MupC6xzJ80YTEw8BuA6XTohM9e0OFjHTMdu23hEGr/LhZustodx2IVQJ
 9MWDagt6M7a04t7wIO6RrgqPlIUJjcJud6HnMkE+JcBrPfbAB/IE8Z53u
 Kwm2tkWGGk8BMOc7BDn7/CXD604i53gcEPr6jQ/QDZgxMKYrndTMwhMQQ
 IF4qPXT1g179RNu+N1rpK5x+nQoVdOQy+QMAvTlCyCkf6uTbzTjAMKHXw
 2pf37aSXpL3sJ1kIclVZBIdksanDGITtt1ZKYh6hyva2uOVnvGJJm2ccX
 46mBRpnbxvrZ2zsvxVat4lIZFShuZhsALICfLCHfdM7G2TYf+efYdZocM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6485968"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="6485968"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 09:10:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5200490"
Received: from conorwoo-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.22.137])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 09:10:35 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/pm: hide d3cold sysfs threshold
Date: Wed, 21 Feb 2024 17:10:09 +0000
Message-ID: <20240221171008.196673-2-matthew.auld@intel.com>
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

There are known deadlocks and lockdep splats with d3cold and dgpu, which
is why it is disabled by default. However we still don't want CI or
actual users trying to override the DEFAULT_VRAM_THRESHOLD and then end
up enabling d3cold support. For now keep the sysfs hidden if
DEFAULT_VRAM_THRESHOLD is zero.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1246
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ab283e9a8b4e..829f165e30b4 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -189,7 +189,8 @@ void xe_pm_init(struct xe_device *xe)
 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
 
 	if (xe->d3cold.capable) {
-		xe_device_sysfs_init(xe);
+		if (DEFAULT_VRAM_THRESHOLD)
+			xe_device_sysfs_init(xe);
 		xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
 	}
 
-- 
2.43.0

