Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19363CA5FFD
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 03:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86F510E2C6;
	Tue,  6 Oct 2026 03:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="csXmGZtA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CFF10E2C6
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 03:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791257830; x=1822793830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iV31PE4Xqv8NU1F0R3NAz+tzSSGJNzqVDgccxZDB5mo=;
 b=csXmGZtA/nFGKMUEQZOhjoFfXLXQxR8WWA1tpdHbm3Dc83G7OCbNs92E
 PNmeEjJggY2dK+dkOJSY3BUCyqkwdthdA7jg1fvNZ/fEwJDN7Bve+eaTq
 vwB+80gwAd+Ez9OiPgIf86hCfFGiB/uZulu/ViWnPDOqa5ammO6+sNAbZ
 2c+vg+d8txcNiI6kXzgODXnTB7SzZ12diSAlbDZEADd/ItQcOPNCsssvD
 DLxx4hR8zf6ZymCVAnoTBNIb189hyuhqbtQSI2kblmrgFmEBFgXYdM1qr
 xTFIYzWD8Rpk3vnj8tEjUAkATIVdWff2gzZOpMfp84JSspr84l1xSevM5 g==;
X-CSE-ConnectionGUID: /6MQS7l6TFaqKVsJPCZlfA==
X-CSE-MsgGUID: LzWuajkMQPWBci4P1HWbng==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94427428"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="94427428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:37:10 -0700
X-CSE-ConnectionGUID: 9Dbe6oaFQUyZPIT7yneWbA==
X-CSE-MsgGUID: xxqKRg4LT2eF0rkjSmpS6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="273400990"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:37:07 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v8 14/15] drm/xe/hwmon: Add CRI PCIe temperature sensor offset
Date: Tue,  6 Oct 2026 09:05:33 +0530
Message-Id: <20261006033534.3583967-15-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261006033534.3583967-1-karthik.poosa@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
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

Describe the Crescent Island PCIe temperature sensor at byte offset 20 in
READ_THERMAL_DATA.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1cbd49933b2c..c7ab7b1abd25 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -482,6 +482,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_i2c = true,
 	.has_mbx_power_limits = true,
 	.has_mbx_thermal_info = true,
+	.pcie_temp_sensor_offset = 20,
 	.has_mert = true,
 	.has_pre_prod_wa = 1,
 	.has_soc_remapper_sysctrl = true,
-- 
2.25.1

