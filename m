Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E03CD98F6
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 15:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7930610F333;
	Thu, 18 Jun 2026 15:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbpvqZ1K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F5F10F333
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 15:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781796975; x=1813332975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/MRgUNnoLo6uOspPYRPUtdFmtKVOlUSBqRpwxup9QJo=;
 b=ZbpvqZ1KxM+LEGOuA8l266OWvPkvfPP/vAh9hn+sNNi8GEEuFkGRnZT7
 an+0HdsDaHhesqfJOzQxg17/5Hv7asFCvJWHwhSE3gZBaRLw2ey3HIiQC
 OxDOTobp7mMnSmafOK5UZCK1uTbLw1HHsSmGrxnWyTb/HFQ+34aki/fw6
 bRvG7Qj1HPQMdigvJ+96LU86bnwb+IRQZq2RTgrfSuVcydtPfKvcKdEtp
 reIeFfGqASN/D3xTNW0gPJd2ypuRcKjHUcDnsYJrUxrixkMgTuXudPebT
 TP6pdavaLyXYqaO+Ar81nRKuWeyiV5FyDJ2BX/+TIWZB5H0sH3JXFHKCH Q==;
X-CSE-ConnectionGUID: TDqvNqFEQYCx/71bVhcczg==
X-CSE-MsgGUID: xmn0BA8uQVm/ryYPzArl3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="94136291"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="94136291"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 08:36:15 -0700
X-CSE-ConnectionGUID: Nv5SCrvVSg2ohZqKLi95IA==
X-CSE-MsgGUID: dcQsr4DtQpyUPr3l5xKkGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="253487972"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 18 Jun 2026 08:36:13 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, matthew.d.roper@intel.com,
 mallesh.koujalagi@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 1/1] drm/xe/hw_error: Defeature hardware error handling
 with system controller
Date: Thu, 18 Jun 2026 21:01:26 +0530
Message-ID: <20260618153209.110899-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618153209.110899-1-raag.jadav@intel.com>
References: <20260618153209.110899-1-raag.jadav@intel.com>
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

Hardware errors are reported through System Controller on the platforms
that support it, and never routed as direct IRQ to SGUnit. Defeature
their handling to prevent unexpected side effects.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 3c1dc9f83d1a..4a4b363fc844 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -437,6 +437,16 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 	if (!IS_DGFX(xe))
 		return;
 
+	/*
+	 * Hardware errors are reported through System Controller on the platforms that
+	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
+	 * here for those platforms.
+	 */
+	if (xe->info.has_sysctrl) {
+		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
+		return;
+	}
+
 	spin_lock_irqsave(&xe->irq.lock, flags);
 	err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
 	if (!err_src) {
-- 
2.43.0

