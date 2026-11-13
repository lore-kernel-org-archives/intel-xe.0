Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F951606A332
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 16:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oh0Exr0l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4D510EC58;
	Fri, 13 Nov 2026 16:51:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14CD10E176
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 16:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794588707; x=1826124707;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ezlzVcHtVeoHglV01p3bjkxy2KglS2VRWAzc2hftpZw=;
 b=Oh0Exr0lmCGFWBZsbO6UfW2sqmya1JObljs8GMncuPSRPrR6+wTSaiAe
 DGr/mqAS7qb5qeyz+FhdrNMt8tVZfLK2KchqQ2q3s9U62jZPjFtlLz3u7
 /vjLo+Y6GIAyDY83R8L/5i5mO09U9pHqcTdSW3eOxB0JWXOrtW1t13pgu
 BHqyFLhMx04CR8Pd3f0v4kBVon8RCt2LKuiHHW7yNz4H426gZqnhOjVhK
 iH5kaNT2TFnmltGrDmsXj67JHS4v12VEfV6csfhNK52TR8dP20d6D/1/H
 v4fXWaLdRg6Q9ZCSwUYrmnjQ/rFCYi6AeTqXdljIQBE44dsx0IupBe5no Q==;
X-CSE-ConnectionGUID: oa1lCZQZSpOu+ew6+s0WVg==
X-CSE-MsgGUID: HkqvcX03SaOX/ZpQX+k1hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3392132"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3392132"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:51:37 -0800
X-CSE-ConnectionGUID: dF5Up/1LSaSFPf4EQNibuQ==
X-CSE-MsgGUID: nGiRsF9AThW4Pozrsirfcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9230796"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:51:36 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v15 05/17] drm/xe/vsec: Add DOC text for VSEC
Date: Fri, 13 Nov 2026 08:51:31 -0800
Message-ID: <20261113165127.1989471-24-michael.j.ruhl@intel.com>
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

Add the necessary files and text to use the DOC system.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 Documentation/gpu/xe/index.rst   |  1 +
 Documentation/gpu/xe/xe_vsec.rst | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.c     | 24 ++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_vsec.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 497a0a4b12f6..de829aecf8f1 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -37,3 +37,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
    xe_gt_stats
    xe_sigid
    xe_pci_error
+   xe_vsec
diff --git a/Documentation/gpu/xe/xe_vsec.rst b/Documentation/gpu/xe/xe_vsec.rst
new file mode 100644
index 000000000000..1a87548489ea
--- /dev/null
+++ b/Documentation/gpu/xe/xe_vsec.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=====
+VSEC
+=====
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
+   :doc: VSEC
+
+Internal API
+============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
+   :internal:
diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 38081dacd307..082b25b017db 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -19,6 +19,17 @@
 
 #include "regs/xe_pmt.h"
 
+/**
+ * DOC: VSEC
+ *
+ * Some GPUs support the PMT feature.  For those that do, this API provides
+ * probe, discovery and usage (control and access) for GPUs that have PMT.
+ *
+ * PMT is usually accessed through a PCI function.  However, that is not always
+ * available, so the PMT intel_vsec_register() function can be used to set up
+ * PMT usage.
+ */
+
 /* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
 #define BMG_DEVICE_ID 0xE2F8
 
@@ -140,6 +151,19 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	return 0;
 }
 
+/**
+ * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
+ * @dev: valid Xe device
+ * @guid: PMT GUID (from the PMT discovery struct)
+ * @data: buffer to place data in
+ * @user_offset: a user offset relative to the beginning of the data to read
+ * @count: bytes to read
+ *
+ * Return:
+ * * -ENODATA for incorrect power state
+ * * -EINVAL for unsupported PMT feature
+ * * count   number of bytes read on success
+ */
 int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
 		      u32 count)
 {
-- 
2.43.0

