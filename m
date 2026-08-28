Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9339C61DCB
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 11:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5692B10F377;
	Fri, 28 Aug 2026 11:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9YSMC0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8076E10F345
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787916691; x=1819452691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iyTKxxDxOIxyOG6OuhwbCaxCklEvDR7P6OacQYeHjPI=;
 b=l9YSMC0o8UX8HAmcHQv4/mvP0CnE037Q4Hxix/X3dtP03EG5V2+PJetv
 Xc/yUtr9Bdq3P0aZnrdnCyGcTBOAb85+h+YvX4LrjGxzIlcC4Jf7kecrD
 5AaZ3LLYo7LHmj4bNsKmAaEVnDtoiShU8suM+rOpkKvYAe+rYkvpiC32h
 nJ9TUkSXsggeEdILvPk5dpH8eQlBOabwrGhhzBlX/r3kRxHIpgpAEPeTh
 /KMgUJJDU6lOkYF6l1jIEMSlKBcx0JnGGyN0V8RLnH/PePROd0wXNZDzw
 eF6XuMblJRcCaMEDgnMueQJMblcIUBkMZ770Mk9GOptQxK7fGkqJC4It2 g==;
X-CSE-ConnectionGUID: /kW8TdlvR/qDKqYRfpgRgw==
X-CSE-MsgGUID: VNVpwNY+RTGrkUdEOEshVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="113957102"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="113957102"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 04:31:31 -0700
X-CSE-ConnectionGUID: +WImiS+mTRuLJ3KSXzBKkQ==
X-CSE-MsgGUID: FvhFC/gbSOmGnc9cY+Z1PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="306338267"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 04:31:29 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, matthew.d.roper@intel.com
Subject: [PATCH 1/2] drm/xe/xe_pci_error: Wait for pcode init post SBR
Date: Fri, 28 Aug 2026 17:01:06 +0530
Message-ID: <20260828113104.319843-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260828113104.319843-4-riana.tauro@intel.com>
References: <20260828113104.319843-4-riana.tauro@intel.com>
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

Pcode init complete indicates the device is ready, with device memory 
initialization complete. Wait for Pcode init before accessing the
device post Secondary Bus Reset (SBR).

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_error.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 79ce0c671549..3e9c77f8483d 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -9,6 +9,7 @@
 #include "xe_gt.h"
 #include "xe_log.h"
 #include "xe_pci.h"
+#include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
@@ -109,6 +110,10 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 		return PCI_ERS_RESULT_DISCONNECT;
 	}
 
+	err = xe_pcode_probe_early(xe);
+	if (err)
+		return PCI_ERS_RESULT_DISCONNECT;
+
 	/*
 	 * Secondary Bus Reset causes all VRAM state to be lost along with
 	 * hardware state. As an initial step, re-probe the device to
-- 
2.47.1

