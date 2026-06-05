Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31256CD6E7B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 23:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5EF11ABC6;
	Fri,  5 Jun 2026 23:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVg1JbmO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF46311ABBF
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 23:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780701680; x=1812237680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=25D3wDMxJztTd+AyoBEzWHil5qxOkxT7usX6WGBIxa4=;
 b=bVg1JbmOoBamt4aySi5zyEj2rL6eLrjz0GPhlxVwBReJKR9eRiqaxCp4
 MgI3JtVOC59IIjYtFiLdZSAq+bxUHE2fXeHwT/N1WQfsAOs7LJmAf7ykL
 9Fe71Hmq6E9VTfbF3qX4PQ2qCFcMb5M7DLWTXwccWBgrp0y05GUw5TonZ
 pvSTMYMqGD3yg9+Z4Au5+Y1JqGPpVq/Z2jXcS4I0lrwN4xUSoO8oe+iaq
 xwBwSepjCadp4w2cPSuhhEMVmh/Uo2CBcu07k95tpvG3XuwwADmWvbxH5
 3ZIkTzItpGu9CwMC8GBKnF0nwOS00GecSfhp2vtjdZvTLnqOlSRl7tZN3 w==;
X-CSE-ConnectionGUID: LR1EW4doTsmQLB6Hzd67ag==
X-CSE-MsgGUID: 5tE9axOEQo2OBejqdJcOUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81449681"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81449681"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
X-CSE-ConnectionGUID: qbxx5Jp3Sba5n6S7rrbTFg==
X-CSE-MsgGUID: vue0g8fwT1q2muza35fT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="245018299"
Received: from dut4385arlh.fm.intel.com ([10.105.8.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 06/12] drm/xe: Change MSI-X assignment failure to drm_dbg
Date: Fri,  5 Jun 2026 23:21:13 +0000
Message-ID: <20260605232108.674580-20-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605232108.674580-14-stuart.summers@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
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

Now that we have queue based MSI-X vectors and a user
can potentially create more queues than we have vectors
available, don't spam dmesg with drm_err messages for
every failure. Change that to a drm_dbg instead.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 40d3d43e492f..871c6c5c4fac 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -768,7 +768,7 @@ static int xe_irq_msi_request_irqs(struct xe_device *xe)
 	irq = pci_irq_vector(pdev, 0);
 	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
 	if (err < 0) {
-		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
+		drm_dbg(&xe->drm, "Failed to request MSI IRQ %d\n", err);
 		return err;
 	}
 
-- 
2.43.0

