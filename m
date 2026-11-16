Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF39606A331
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Od+F2z2Y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AFF10E433;
	Mon, 16 Nov 2026 15:07:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A109310E23D
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794841621; x=1826377621;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=prgSxi1FX+nYoYm0BCX8xny5QzKp079AhJ6Rq9zOB9k=;
 b=Od+F2z2YL4Dp16TQtvNj4JdpmtUROj7FrlbTQ1zzVTGJ8dm4hsSnz3Nx
 DiZt7MSWk8F+ZEC7ty1J9MMViPth4eTyyfFp5b7b5cYk+RfoQCTBYUoYW
 orWmEWmScbeAAHGfP3G6tVdpFBF74EdEtVdSCCmnKP8Qrn7eZ6cjd8J73
 pLn1NLRW2H/+0qgHWBc9LVMzAF0Q8r+hLHWpVueViUzhvnXAlkwdWisXh
 AwuaaWGJU/ISnSac/DQEQhVqTIuguoTauhcS6z0kDMBnp9uDrVXQFn2wV
 l8aFehV04QPWMrTrhxcgOmhtA+j3gxCM/NNIniXaWCftDT63hmHHlwzEd w==;
X-CSE-ConnectionGUID: YO4wGZM5S6esce2UdVOeGg==
X-CSE-MsgGUID: P77Ba5xsRtiBCrgdvPrRaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3611811"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3611811"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 07:07:01 -0800
X-CSE-ConnectionGUID: xgpznlfURiW/3WE9lg+Msw==
X-CSE-MsgGUID: FLpsk++fTyKBNvnUU0qxkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208";a="11359404"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 07:07:02 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v16 01/17] drm/xe/vsec: VSEC requires soc-remapper
Date: Mon, 16 Nov 2026 07:06:50 -0800
Message-ID: <20261116150649.368686-20-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116150649.368686-19-michael.j.ruhl@intel.com>
References: <20261116150649.368686-19-michael.j.ruhl@intel.com>
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

