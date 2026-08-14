Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25DCC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 14:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B246910E56E;
	Fri, 14 Aug 2026 14:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m74OZGv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6425810E56E
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786717932; x=1818253932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C9gtDzui4/vdwzVQI5Qqux1Tg08ZGb5e5kEieI89rFo=;
 b=m74OZGv+R3nW3N/n/GFCO+V/F8c6yuQEmPK9WkdGIojvdDjYihnc1OWV
 6iKHpjlLnu9q7WdToNEnRPnAE/vhqgaJ/X7p8XWGXBk0n3K7m+hYLb+EK
 oKLy+u9ZqO3D6eITHTqeSVz2RxsG62kH8921Og4fWLcXB8+vmIiVunMDW
 dRCCH53WHpsdg0SFYQqfW8p2h7dAit+C4IvmisqwKIPRSOVU6c7fdXLc0
 jjixZBT0LurZvGmKs1e9ZhllZq2d0iUklE+nEFmlREwDgAklVCr0vvKWA
 jxlEyDFcERmYFhiC+rskUjMtn5Q+n8o93uXAsnduIUVtYQvPkobf1srut Q==;
X-CSE-ConnectionGUID: 0Pkf/05eRYKSxe9vFH3H5Q==
X-CSE-MsgGUID: q+qnCWDjTSWFE0KrSblWQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97886849"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97886849"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 07:32:12 -0700
X-CSE-ConnectionGUID: V+t6z40RSNmHDbqPYmtzgQ==
X-CSE-MsgGUID: wKi438PcQDacIzx76lBftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="287718595"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2026 07:32:10 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/pci_error: Allow debugging PCI errors
Date: Fri, 14 Aug 2026 20:01:21 +0530
Message-ID: <20260814143121.390791-1-raag.jadav@intel.com>
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
 drivers/gpu/drm/xe/xe_pci_error.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index e41af2ac7f23..4858ce2f9c19 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -63,6 +63,12 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
 	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
 		return PCI_ERS_RESULT_DISCONNECT;
 
+	/* User wants to debug the error, prevent reset */
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
+		xe_device_declare_wedged(xe);
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
 	switch (state) {
 	case pci_channel_io_normal:
 		return PCI_ERS_RESULT_CAN_RECOVER;
-- 
2.43.0

