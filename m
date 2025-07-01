Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F09C83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 12:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E409610E59F;
	Tue,  1 Jul 2025 12:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdezUrW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8847A10E59F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751372603; x=1782908603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gSq3WGMYzI+A+QnZWcrD3MEiKdYLg+CcJwmyoCfVs74=;
 b=SdezUrW5hxczyIZnete0rAlkISREO2846GzF5g+3h3jnagi5y9Lv9tN9
 AUUsZW123hv3OaO1GOIy13AgTpPe0fn20nyepBXJXTpGFJyyuztGXlruP
 9crXdPYlClz1VEq/Nj0eHyNQlSvsm51YZvVP/SW7asIrjqiTP3U0TLVli
 g+u+Ckf518wR/uNRfo+iql13n2SHQfFjOYr6FH7g3u17Y+1Gn7HXxe8zX
 h5TKDNC8RQANRf3HNZ2Ygi0JJSbtJXLpzb4qjSjB7Rqc8EH4/a1BmjWjj
 GqyhjkXUinljdhV9gx8mi1QFRGZAtRyvwDrCqAP/OYz8sgsPzoCfwYFfL w==;
X-CSE-ConnectionGUID: 0qhjwbEfT4+9M/w6A131Zw==
X-CSE-MsgGUID: SamIpYY/RiSusUnJsOZm6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71196743"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="71196743"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:23:23 -0700
X-CSE-ConnectionGUID: t+h40ustS4ub470TWJPQ2w==
X-CSE-MsgGUID: pwwSlZYKQK+CGBavYDtJeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153157528"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 05:23:18 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v6 5/5] drm/xe/xe_i2c: Add support for i2c in survivability
 mode
Date: Tue,  1 Jul 2025 15:22:52 +0300
Message-ID: <20250701122252.2590230-6-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
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
2.47.2

