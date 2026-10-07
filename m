Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A19BCA5FFF
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 10:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C1010F0F3;
	Wed,  7 Oct 2026 10:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9JISi34";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0A910F0F3
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 10:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791367398; x=1822903398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VGgvQNwRyB9dxdslAOCrR45MevcRd1HDon/YEPUPv+U=;
 b=M9JISi342hkHRIqzOi17Zl5YPBq/+fORwsGdzWNpGiDT9tO2yhdyTyce
 OXOQhb2IeAsvmPRyFCvDKFhAt8EFfrS2Vsgu4h70rhGjD0mc70zgszv3P
 S5d1Ig2l2ZVBKJ0OeXIJoz4eSAg4TEGALcXat/zU0MFYCUWXeirxUCetm
 94UC1pauLZKAyg7ENXQ+L/OpRqVmjcWWXfHQXx6lKFe3JMqhLVeH/Gg7z
 PmiQGBC1FYPpRKHbZYQ1/UhysSFcFV4yA54q09cu/TSahNVrXr6fl+j03
 IMgAcFS3dCvuvRIhIRc1o92/0Y++TOFyM86W/uCDfTqaU7+ZDkNIXC149 Q==;
X-CSE-ConnectionGUID: 07efEr2aR9a2No0b6DpEaQ==
X-CSE-MsgGUID: tl8tXvwSREK77CWYJsX7SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="9194"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="9194"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 03:03:18 -0700
X-CSE-ConnectionGUID: Fe6sG9zwQaGxs+oWvUOPoQ==
X-CSE-MsgGUID: cJrQyWWbSbS0F1oShRGGCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="306889591"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 03:03:16 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, matthew.d.roper@intel.com
Cc: riana.tauro@intel.com,
	soham.purkait@intel.com
Subject: [PATCH] drm/xe/survivability: Do not call xe_vsec_init() in boot
 survivability path
Date: Wed,  7 Oct 2026 15:33:00 +0530
Message-ID: <20261007100259.2661003-2-soham.purkait@intel.com>
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

Boot survivability mode exists only for device recovery and firmware
flashing. It does not need PMT/telemetry. Since xe_vsec_init() only
sets up VSEC/PMT, there is no reason to call it on the boot survivability
path.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 45d44ebe288b..f5985938c60b 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -351,8 +351,6 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 
 	xe_heci_gsc_init(xe);
 
-	xe_vsec_init(xe);
-
 	if (survivability->fdo_mode) {
 		ret = xe_nvm_init(xe);
 		if (ret)
-- 
2.43.0

