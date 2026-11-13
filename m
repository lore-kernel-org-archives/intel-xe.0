Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FCE606A331
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bc9DLt4q
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C4110E038;
	Fri, 13 Nov 2026 16:51:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBBD10E640
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 16:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794588698; x=1826124698;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=prgSxi1FX+nYoYm0BCX8xny5QzKp079AhJ6Rq9zOB9k=;
 b=Bc9DLt4qhTz72FmqUKBIOCXi10WYarD56wr2SfWFuzqwcLKyeKduMpfr
 73YbB+/asB/z3+QTM5FCwXK3VWg4UsLIOJ1YTc1dU/1BHR7C1HnG+4SOq
 hC+YgT2ZVx9f4RrSy6H07PIm3OVHywH7XSwhv+Oh7B+i7KWPIOyt+EaNz
 6YNlBlYFA+lS247Xeo+V3J0JQxjwOF/M5WdnX1Pba1NTxeRlmYZ9dXsuz
 KhurujGuUx6bpCsrXDBa2Z/qD1owoTSERlfuKub35bLw70kEYpuX0MyI0
 TEwBf6J5KRKzgWI47xBWFg/Hw+UJQQCWeY5d2/zF3g6JAnQOz0yYRcK8N w==;
X-CSE-ConnectionGUID: ia9kr+6/R+SYH5pihsrxNA==
X-CSE-MsgGUID: yOiUHev/SW+TPqxyQ4RnHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3392119"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3392119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:51:36 -0800
X-CSE-ConnectionGUID: AEkwKDX8T2Ce26DEdSEV6w==
X-CSE-MsgGUID: 9YJ20KVrSbiw0cV+jKa4JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9230782"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:51:36 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v15 01/17] drm/xe/vsec: VSEC requires soc-remapper
Date: Fri, 13 Nov 2026 08:51:27 -0800
Message-ID: <20261113165127.1989471-20-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113165127.1989471-19-michael.j.ruhl@intel.com>
References: <20261113165127.1989471-19-michael.j.ruhl@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Survivability mode includes xe_vsec_init().  VSEC requires
the soc remapper to be initialized.

Add the correct init to allow correct VSEC behavior.

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

