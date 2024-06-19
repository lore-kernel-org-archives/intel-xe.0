Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE66C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40E510E28F;
	Wed, 19 Jun 2024 21:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aoji+7gT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628DC10E366
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 21:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718833597; x=1750369597;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=i+3zhJC1asXWdlu+Pi3pZwHgxMC1MClzkm++q9ZbAgE=;
 b=Aoji+7gTQMf6c6QDd86oaeJd2sFcBaD6+9sybsM+i9w+HDsU5R8cBFdX
 S7Uv3qqmfVoU5k1266Z2ren9UjZgBLGbBpmD/gB8zJbLjBO3cnQcSh2h+
 mLYpkEkuFO0GP/OLhIBbNdKKYRXJYkH/NTZKFDmY0Qzh2ZgySbCBP94WT
 6Vlkt4njVv36zAQBv9EwpDKQnsIxJPhOdDFzGcvvbi+eG7XdlPXD570AP
 qnHt1b5pdhM4wqv3FIWqdQMogLtndDAVKN9YdoxPNnvAfV/aSAUKDdoQd
 d/IILXwyucwqFlQ1TPumRmVQxP3S8Kwre5kU6yTfnHRUH29xqPrZVmZQX g==;
X-CSE-ConnectionGUID: 0lmYlFlWSguXY+SdRqZE/g==
X-CSE-MsgGUID: 8oEEHTVBRXuzrzkImxSMGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15662987"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15662987"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:37 -0700
X-CSE-ConnectionGUID: DZtTA6xZQgSuMXpXYD2anA==
X-CSE-MsgGUID: AyJncQiKQ3i57DBHon4XdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42157820"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 9/9] drm/xe/vf: Custom HuC initialization if VF
Date: Wed, 19 Jun 2024 23:45:57 +0200
Message-Id: <20240619214557.905-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

The HuC firmware is loaded and initialized by the PF driver. Make
sure VF driver performs only limited data structure initialization.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 6238fb354914..c88761fe31c9 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -21,6 +21,7 @@
 #include "xe_guc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 #include "xe_uc_fw.h"
 
 static struct xe_gt *
@@ -92,6 +93,9 @@ int xe_huc_init(struct xe_huc *huc)
 	if (!xe_uc_fw_is_enabled(&huc->fw))
 		return 0;
 
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
 	if (huc->fw.has_gsc_headers) {
 		ret = huc_alloc_gsc_pkt(huc);
 		if (ret)
-- 
2.43.0

