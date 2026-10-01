Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB679CA5FD4
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 19:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFA210F75E;
	Thu,  1 Oct 2026 19:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/fuhsbc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F253010F75E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 19:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790884321; x=1822420321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iV31PE4Xqv8NU1F0R3NAz+tzSSGJNzqVDgccxZDB5mo=;
 b=Q/fuhsbcTI5amEpr5kebim0Aywfm1TWCT5SL3nuWiocD5lRItTqtLFhe
 fRVi5vdg15LkaZOi3C5l8SVwOkM3XNmHpymGP6DbUtmCo6EuS1WA6OrbH
 D2TInlAyiwhCFZF+vFJ4kofLhcSCQjbP8Spr/OKEPHchbla1uAQtCRit3
 +Sw9e72/l8m9zSHfUCj51mFbOkH3VgTN0ivgCpMy1P/t7pOaWRYY4SHaO
 a0BKsah3f/8GntuY3yd30OrPuwd4eLbLNDpRrufID9bIixfCumjFQNv6A
 AEvkK2DCSxXFXeFNtTC1wd4ZFJIE8qzXfBC/CPCN74u7yFfHiEjnYxHN8 Q==;
X-CSE-ConnectionGUID: qeO3pIFhTjOZFEGb4KThHQ==
X-CSE-MsgGUID: oIQ497xLRXqWpbVTcBn++w==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102177986"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="102177986"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:52:00 -0700
X-CSE-ConnectionGUID: h2h9YOlzTXulnidW78zcmg==
X-CSE-MsgGUID: 14/UAGTkQ5i+Gwn8SoFXMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="273893881"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:58 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 14/15] drm/xe/hwmon: Add CRI PCIe temperature sensor offset
Date: Fri,  2 Oct 2026 01:20:32 +0530
Message-Id: <20261001195033.3466205-15-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001195033.3466205-1-karthik.poosa@intel.com>
References: <20261001195033.3466205-1-karthik.poosa@intel.com>
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

