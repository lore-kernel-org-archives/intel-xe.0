Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32901C47DA2
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 15:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE0110EB4D;
	Fri, 12 Jan 2024 15:27:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754DE10EB47
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 15:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705073228; x=1736609228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FWCAyUWUljKqEByrcDdy3DF4KmykkLrhFKekS0P0rek=;
 b=bFf8GMa3sUP9la7BAKUnD/7BU4BNb2vJ/I18ajgPrDr8+K5rqJqxYlc4
 sZTK5tMwLh7UWfdkD159e/3Ub2HvoVQIhFGhW2yP+Nf+7XIAeMxtAPpVU
 ofydcBjsvhxdpdQ2Vfxeu0+GI7sUz/0iy3HGOREO0Mzov87tTINWnPqN4
 AuRybeh926ZCYqRUr6STPgmppJfg+Czxa68ttw0WsgHLkSY4oCpK56Gub
 ESisy3ne/nwVRoCXBK9wZv76EqRCNCO/VWoCxug8D/Gt8lTv/hLIUOq+R
 9o+DQ6C4YHxMwvnAREg+oQDLqVbdj8QPOO/qj4czdrSEQSHdbAEkudsoF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6566378"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6566378"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902003191"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="902003191"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:05 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/8] drm/xe/vf: Don't enable hwmon if VF
Date: Fri, 12 Jan 2024 16:26:47 +0100
Message-Id: <20240112152649.849-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240112152649.849-1-michal.wajdeczko@intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_hwmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 6ef2aa1eae8b..9848bf84b58b 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -16,6 +16,7 @@
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
+#include "xe_sriov.h"
 
 enum xe_hwmon_reg {
 	REG_PKG_RAPL_LIMIT,
@@ -745,6 +746,10 @@ void xe_hwmon_register(struct xe_device *xe)
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
2.25.1

