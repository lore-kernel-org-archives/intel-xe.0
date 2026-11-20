Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E15606A693
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RhUxHzUs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B303010E419;
	Fri, 20 Nov 2026 20:56:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCC810E340
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795208156; x=1826744156;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NuDV/lqBLFYg5Wc4D4u773Li/GKPyfBWlL8alEGMaRM=;
 b=RhUxHzUsidpprrm9kVDrw1eIdjDmk2FFB8TGDGpB3BMnwBSUlJ1Gh6d6
 8XiABCXQiRpMCvkpjn7pqg5GA2X9gvDeJryj48DUXfDtRyVlzqhc6R114
 rBbhIbXyr6aNAL4sLP3OL0xqmPdxn6almsI99IbSyqxMihvcGoK5u0cKo
 tDIlw0hk2rO5ZWnO2xzVGNrHq9fZmCBm+iVIqKmFUtqAcZWxgZKOWeMel
 3smwcOdUhxSlG2nOn7fPC+1wVHvcx1rYePgwaSgIducBV2ZCTuuvhzsKB
 sI7T7SZOHAEBarvqLfuIuTiBrmINE+52ELvI+hkTnsis1X/Py9Y+j3Tr8 g==;
X-CSE-ConnectionGUID: +XA6yXmMTU68/3d9B60ymg==
X-CSE-MsgGUID: Ud/Gd8w4ScaseP3eLFKq3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136352"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136352"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:55:50 -0800
X-CSE-ConnectionGUID: ZHv7/7vdScCJwWD5/oTyqA==
X-CSE-MsgGUID: yNlK6AURQmCc7+6QhmkuTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10908695"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 12:55:48 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v21 03/19] drm/xe/vsec: VSEC requires soc-remapper
Date: Fri, 20 Nov 2026 12:55:43 -0800
Message-ID: <20261120205540.1220643-24-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Survivability mode includes xe_vsec_init().  VSEC requires
the soc remapper to be initialized.

Add the correct init to allow correct VSEC behavior.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Fixes: 32eab46a6160 ("drm/xe/soc_remapper: Use SoC remapper helper from VSEC code")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 91a0680e449b..10f9de4eb03b 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -21,6 +21,7 @@
 #include "xe_nvm.h"
 #include "xe_pcode_api.h"
 #include "xe_printk.h"
+#include "xe_soc_remapper.h"
 #include "xe_vsec.h"
 #include "xe_wedge.h"
 
@@ -354,6 +355,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 
 	xe_heci_gsc_init(xe);
 
+	xe_soc_remapper_init(xe);
 	xe_vsec_init(xe);
 
 	if (survivability->fdo_mode) {
-- 
2.43.0

