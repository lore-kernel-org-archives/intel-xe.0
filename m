Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E464C5DF6D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 11:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F69C10E544;
	Wed, 19 Aug 2026 11:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bB0bzxFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95A310E544
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787139352; x=1818675352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6v3zMLhtD2AyjC649pkekmdRu2KVvDQ5DMZBFGjHtm8=;
 b=bB0bzxFAiIfoYTCrSitjWfkWjWA7OjLaGArk1TK/rdx98HaWXjL1D1tQ
 pklKHXYbyE2fuUewDNGcp2gqoUTEUM5b2X69MF9lvq3lmIWVF5xPL+dz9
 2utkX+tWMchi2fARlsIjVp2yiWXybiotpEK1aZq1rPB95zBv8AeaA0+XS
 FGjoETnz2LmAeV0u3ZjJg2bs1HD/rc3/lYsaOHPaHiNNC2hTtRf2M++PY
 g55iRJByT/FZfR3hsU7c6L/z+xYc2Xb5D4nDV9Flbb8dEah0qqPCupwz5
 tASMNMp1Zh9H1OvP7UvX/NYUxN7zCN/E8PyiiZZPbTKiVrDUsq26ilTia g==;
X-CSE-ConnectionGUID: 1Tj7ua/QTGK8Re1VBICzSg==
X-CSE-MsgGUID: S8kD2jTCRdqrF/+EGrEn0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="105181808"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="105181808"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 04:35:51 -0700
X-CSE-ConnectionGUID: Um53rs8nSiqMwFWzL6imjQ==
X-CSE-MsgGUID: ufDPYj0ORZS7lfFnyEiVyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="262258938"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2026 04:35:49 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3] drm/xe/pci_error: Allow debugging PCI errors
Date: Wed, 19 Aug 2026 17:05:19 +0530
Message-ID: <20260819113519.510853-1-raag.jadav@intel.com>
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

Update PCI error handling path to disconnect the device when
XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is set. This prevents bus
reset and preserves the device state so that it is available to
the user for debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
v2: Process errors before wedging (Riana)
v3: Rephrase commit message (Riana)
---
 drivers/gpu/drm/xe/xe_pci_error.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index fb965f52be5e..79ce0c671549 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -84,6 +84,12 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
 	xe_info(xe, "PCI error: MMIO enabled\n");
 	action = xe_ras_process_errors(xe);
 
+	/* User wants to debug the error, prevent reset */
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
+		xe_device_declare_wedged(xe);
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
 	return ras_action_to_pci_result(pdev, action);
 }
 
-- 
2.43.0

