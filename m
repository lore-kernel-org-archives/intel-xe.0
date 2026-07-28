Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9364EC531F9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A6B10E981;
	Tue, 28 Jul 2026 16:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRqQh+2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC1510E88A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255093; x=1816791093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zfpw+jJoxPPRjY4U+q64S4VKA5J4OmBH+jiSSedLeJY=;
 b=eRqQh+2Gt5J1LH+1ZMU7p6yV9f6RFpKIvX9l9CiT0Q2XRqODtEzE4hwC
 RbzO+lS5L0GiYDlDsUsecvg7b2+DYV+cEVkd8ynd+7/9h13ug9qO5TCSp
 Jh3xMVRTkUoYCf+7m9pZ4FVYvZ20QWw5pYPM5uruAi+ELCYyQogxNyUMP
 CsKUXoAHFzxygwfque6hYPC5/DmFVGFplOwwaz4RFUKACCh4zCp5dxZ6j
 rXjnLgC9tVhCqSlzD3Gu2W7CvcVKjf4RyMcsCEdrsvIQyVayom+Gr6mEr
 XJT+YUShDctj6Yor4TgoDgTPxNY6N1QcbTX72P/fyxR9sfRRfViaatEg8 Q==;
X-CSE-ConnectionGUID: qW5KCaogQHOw1bZDcOwllg==
X-CSE-MsgGUID: 8nb2HHgwQ/GdnfWQ9DOnig==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386288"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386288"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:33 -0700
X-CSE-ConnectionGUID: 2Me5o1eiSWOiN3hv+n7iyg==
X-CSE-MsgGUID: Svo3rHW8QC2m/OE+wz4tPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819405"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 15/22] drm/xe: Report 'probe blocked' error using SIGID
Date: Tue, 28 Jul 2026 18:10:30 +0200
Message-ID: <20260728161039.579-16-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
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

Report 'probe blocked' error using xe_log_info() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: use info severity (Aravind)
---
 drivers/gpu/drm/xe/xe_pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 36d62927b969..a3c4046b56cf 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -25,6 +25,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pci_error.h"
@@ -1172,8 +1173,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	if (id_blocked(pdev->device)) {
-		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
-			 pdev->vendor, pdev->device);
+		xe_log_info(pdev, PROBE, "Probe blocked for device [%04x:%04x]\n",
+			    pdev->vendor, pdev->device);
 		return -ENODEV;
 	}
 
-- 
2.47.1

