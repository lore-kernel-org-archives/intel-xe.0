Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A20F30934
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA7210E25A;
	Thu,  5 Mar 2026 10:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j5sMYMYP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5651B10E25A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 10:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772706839; x=1804242839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S0LHhmuN+qIeoS1LEuZZc1Vg4aelkOcl7LCgiEcdkTw=;
 b=j5sMYMYPMOrqhV3k0H49w4MBfd+4YiAvIcwvSj5sONco61N6ZpJDbpIl
 2GzXQCmiow8dNBGFIi9j5A4PbrWUm62yG7+F8JuspINdRpmL+aMqDR7B2
 Of3CNxdf/ijVnW1BzugjWTChT7RMzFXIahuyShKlJ92w+7ucfDwNdsH/b
 fBlJ1odQH/hYsT6nLm+i1Wxc8RQgScHQOzz9omIRWpBJCrBYaE0jVcYVN
 hxgIvPAE58EKnT00upwLVxEGrJBxX56y0pDPrX2+r+BTHtYVnyCXStAn0
 3vVFaTIf45vG3U+CPTz1KHZEV4BZMbK+oHNBzqtZgw4ZU9ndIWnlfrEJN A==;
X-CSE-ConnectionGUID: 7YuV+KkaSRSmLzOxo8VEyg==
X-CSE-MsgGUID: D1k18V8dSeKqY03y9qkdhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73859096"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73859096"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:33:59 -0800
X-CSE-ConnectionGUID: O8O6XvoTSWuLdmtSOr3Puw==
X-CSE-MsgGUID: gj/vw2s/R1+oqM+LfQyl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="223326151"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:33:57 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [RFC PATCH 4/4] drm/xe/xe_late_bind_fw: Enable late binding support
 for CRI
Date: Thu,  5 Mar 2026 16:14:45 +0530
Message-ID: <20260305104441.2857181-10-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305104441.2857181-6-badal.nilawar@intel.com>
References: <20260305104441.2857181-6-badal.nilawar@intel.com>
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

Enable late binding support for CRI

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 29f976e66848c..7564eebd6a654 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -461,6 +461,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_mbx_power_limits = true,
 	.has_mbx_thermal_info = true,
 	.has_mert = true,
+	.has_late_bind = true,
 	.has_pre_prod_wa = 1,
 	.has_soc_remapper_sysctrl = true,
 	.has_soc_remapper_telem = true,
-- 
2.52.0

