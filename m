Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5421CC48BC1
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B06510E7F0;
	Tue, 13 Feb 2024 15:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mExmghrY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D7110E801
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707839057; x=1739375057;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZjLqCiSZqFETg3I9QLOs64cY8+6dNM39G0/zauniZxQ=;
 b=mExmghrYPilPs3joYVwn20eZdRENXlmwbFw3JyKfsLbrTTgB3TFiGkAY
 IQc4otdmWgAy+FoXsBVeeGBrex7lcquQCYXso3gZAeqi2OrIbAxNs40KB
 YjlbaEJSGutK7DXcopP42vPiQg6js4Xmi52u09ETxyR9/ZPO7tVw7Hfu0
 OfqnP7sz02SoNrpU33ZpHVhu7auwEVW0MXdUbp/nGzV/iwPFZVyg9suVI
 TP8zoupVrev4aGV7RRyMHMdNOwt25hcxU84ZYH5Crt2d/vLErnS5XnD9X
 a/rAu/zbYbxRpjBPVMZAk/iuku7N5pS7VnOKwctuRpO7Vglcax0nryft2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19262925"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="19262925"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7564507"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:17 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 6/8] drm/xe/vf: Don't enable hwmon if VF
Date: Tue, 13 Feb 2024 16:43:53 +0100
Message-Id: <20240213154355.1221-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240213154355.1221-1-michal.wajdeczko@intel.com>
References: <20240213154355.1221-1-michal.wajdeczko@intel.com>
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

Registers used by hwmon are not available for VF drivers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index f0194d5121a5..b82233a41606 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -17,6 +17,7 @@
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
+#include "xe_sriov.h"
 
 enum xe_hwmon_reg {
 	REG_PKG_RAPL_LIMIT,
@@ -746,6 +747,10 @@ void xe_hwmon_register(struct xe_device *xe)
 	if (!IS_DGFX(xe))
 		return;
 
+	/* hwmon is not available on VFs */
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return;
-- 
2.43.0

