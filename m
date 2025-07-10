Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E749C83F09
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 07:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA2B10E88F;
	Thu, 10 Jul 2025 07:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKyODRN9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4C610E88F
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752132009; x=1783668009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eDgyFNCgu4JicpIGG07OSk6fqOrWP0ja+PHV9H01Oa0=;
 b=RKyODRN9tHOs+AKUzRPz3OSFCuxlur0ngU5Du6/9lvJkQIo9/oyXQGn6
 5GAO+ds8cbXwmzBeVXgvi23VgRrn/UbN9PCuB2uZm37aNUEloxlR9HG/Y
 Kdpj/ku2MB6fxo9rZLy8Mn/Y/W8btqju+Mwl+32H5NVp4fXFUXQHHgPJx
 b6JqwBKPz7rWiOKQ6nCS9Da5SVhp9bGwp8H+V6weqLnB8lv9ZpfMYrVCd
 WHAGtp9BMfotoGG6Cdd8gdjfOPdtK40zXjZEACCRfJjP+gnl2ZYc76sUO
 jLJ8MVzX7ANHk5FIFQEu6pAfd/xAKYgk44izrJpzUELKKPbM71JAChvVG w==;
X-CSE-ConnectionGUID: Auzy4RxXRhWQyL1PAc64VA==
X-CSE-MsgGUID: aSQ8iAKgTXWx3peRa/eipA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54256747"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54256747"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:20:08 -0700
X-CSE-ConnectionGUID: wxyUNwkBSaqM6p7EKD6arQ==
X-CSE-MsgGUID: c534Jed4S+e0kQ6Jkn6abQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160324007"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 10 Jul 2025 00:20:03 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: jarkko.nikula@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
 jsd@semihalf.com, andi.shyti@kernel.org, raag.jadav@intel.com,
 riana.tauro@intel.com, srinivasa.adatrao@intel.com,
 michael.j.ruhl@intel.com, intel-xe@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v7 5/5] drm/xe/xe_i2c: Add support for i2c in survivability
 mode
Date: Thu, 10 Jul 2025 12:46:12 +0530
Message-Id: <20250710071612.2714990-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710071612.2714990-1-raag.jadav@intel.com>
References: <20250710071612.2714990-1-raag.jadav@intel.com>
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

From: Riana Tauro <riana.tauro@intel.com>

Initialize i2c in survivability mode to allow firmware
update of Add-In Management Controller (AMC) in
survivability mode.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 1f710b3fc599..41705f5d52e3 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -14,6 +14,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_heci_gsc.h"
+#include "xe_i2c.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
 #include "xe_vsec.h"
@@ -173,20 +174,22 @@ static int enable_survivability_mode(struct pci_dev *pdev)
 	survivability->mode = true;
 
 	ret = xe_heci_gsc_init(xe);
-	if (ret) {
-		/*
-		 * But if it fails, device can't enter survivability
-		 * so move it back for correct error handling
-		 */
-		survivability->mode = false;
-		return ret;
-	}
+	if (ret)
+		goto err;
 
 	xe_vsec_init(xe);
 
+	ret = xe_i2c_probe(xe);
+	if (ret)
+		goto err;
+
 	dev_err(dev, "In Survivability Mode\n");
 
 	return 0;
+
+err:
+	survivability->mode = false;
+	return ret;
 }
 
 /**
-- 
2.34.1

