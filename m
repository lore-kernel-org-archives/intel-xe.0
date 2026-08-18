Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC80C5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F2610E4B5;
	Tue, 18 Aug 2026 10:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mE0RQ4Sw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FD610E4B5
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 10:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787049163; x=1818585163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=95I/VMHwMH+zbW8HwW3eOKOYUfCMqma2YWc5/qZl8ck=;
 b=mE0RQ4SwyMsl/nFmjwOGN0M4YuRsSmrWdZ4RkWMX3OdpDpOSFzVJZ+GW
 vDyVq/ofFPzQm5DO4sVtJQOFgge1Y4qnH49c6Gb4K6yXFPWKW308wjA60
 3iFwDh1R1gvWRVT0eaEgHElw75ht3kt3rsT0IeLf6U3rDjBv1Dtlsl8Gv
 srVVihMq52fO17p92qNx8B5LkZR0ICOWNRRGmEMnjINYIbil4ZCfr4jmo
 HPtllH+koTufvvsCA1XE/a9v0veh0wW6S5a4tB/rrVQNQaWuMqozrUKQI
 p1IOCHI3khcsG1zKxQ8y+gH6cFzPcnJxvR8v2h52CXzKQ9wUZfbSeUgGi g==;
X-CSE-ConnectionGUID: eYeTZbY4Rpm9wVDXEmeasA==
X-CSE-MsgGUID: uxFalF4ERB+dATSTLJ8D2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98691109"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98691109"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:32:42 -0700
X-CSE-ConnectionGUID: LCBK6q/PTtyjjGQxElDZjQ==
X-CSE-MsgGUID: lUGZM1eHSUuVj5Kx5cXJPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="267158938"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 03:32:40 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/pci_error: Allow debugging PCI errors
Date: Tue, 18 Aug 2026 16:00:50 +0530
Message-ID: <20260818103050.493252-1-raag.jadav@intel.com>
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

XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging hangs.
Disconnect the device on AER and prevent bus reset, so that it is available
to the user for debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Process errors before wedging (Riana)
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

