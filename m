Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E90C531F7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E016010F209;
	Thu, 23 Jul 2026 20:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaYJr/xP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD8D10F200
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839108; x=1816375108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O9R+/Pk66Q5RdqHT/qyomQ1b+8CAu2/9tZn5u5Z2/lY=;
 b=DaYJr/xPFun3Zmtkrw7LbREFLMSoCqvm9bLtB/oQyE1Q6DIN3N2D+MZE
 rtSu5u7mqURmAI+fdMqo/DMTQP3KT7+Oy40EAr9o9mCxxALJP8JPhWtsf
 JacXqfWDCBG8St2RmROareVvbDck2riyopqN83wN7QCvcLRjfSMOmhfw4
 +6gESOaD0dnuSPvZ80WQbEM9UacZoN+S2xVpoQsc3vOLaTCHgF4AnxcXf
 0mSalfY5EAwM70EoG7fiCGVubIvgjzwBsKT3c0+TcctpZjepKgPX/IVnL
 M6XGjCEdasIRFUVcY6LyDAOsV/UDivQF0spYHVgHTFppM9h9LJSXCP6Zy A==;
X-CSE-ConnectionGUID: 1i2eqckHSfeCn1HH+f43DQ==
X-CSE-MsgGUID: RHG5nECgTpaZdn1fcItXDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484316"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484316"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:28 -0700
X-CSE-ConnectionGUID: LLBr6VmrQsGWja+WbKSpRw==
X-CSE-MsgGUID: tPRXCnMYRr2bh7le/XoD4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578615"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 12/19] drm/xe: Report 'probe blocked' error using SIGID
Date: Thu, 23 Jul 2026 22:37:45 +0200
Message-ID: <20260723203754.3782-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723203754.3782-1-michal.wajdeczko@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
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

Report 'probe blocked' error using xe_log_err() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 36d62927b969..a9ada8e4f081 100644
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
+		xe_log_err(pdev, PROBE, -ENODEV, "Probe blocked for device [%04x:%04x]\n",
+			   pdev->vendor, pdev->device);
 		return -ENODEV;
 	}
 
-- 
2.47.1

