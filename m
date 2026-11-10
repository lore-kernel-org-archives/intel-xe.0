Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47BF606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kvqWBpdz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E6A10E33F;
	Tue, 10 Nov 2026 18:35:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45B810E33F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 18:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794335722; x=1825871722;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eJeOTiBTBqYNvEb7mZ7RC2BJ+w9di6yxQX+5UZKqwRk=;
 b=kvqWBpdz1Y7xTsavDH7PnrazuxE3AGnARn6cSSs1pU/rKJW6dSeSQa9m
 LpX1R/NKzTk3l5LCDt+agEc+ijhOmWniK9jPGF1iJrF8ZBIzH5Uiy7Uqn
 gyCS0o0YZ3hPjUYWft90c7FLy/t09yd03aAe0L7NXcozDxXONXu2S6W1a
 MecrUl+rWDl6rfyEUcDLE7iqkg6lYqtnLpr1RMMnN+K0ZlF8vki9yGylj
 +tJriubFAxBl/gcDH+iZGgrmqLniUZwtlyfCeQ4GCo5UCATJleX7LMCnM
 cau7y3WY/GImrQcre6QlToXrzDOYFGlmasmZG3bKKCzbJizsx8EKObz4J w==;
X-CSE-ConnectionGUID: KnpTXBbbQYGzR0UJx5kiyQ==
X-CSE-MsgGUID: KH3Ur5Q+TWSW9xT5pf3Kwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2990083"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2990083"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:35:15 -0800
X-CSE-ConnectionGUID: 8XHveHNxTq6bWx77c6Fvjg==
X-CSE-MsgGUID: TqaeGqE9QRKcncCcBxy0bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8253117"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:35:15 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v14 05/17] drm/xe/vsec: Add DOC text for VSEC
Date: Tue, 10 Nov 2026 10:35:10 -0800
Message-ID: <20261110183505.694124-24-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110183505.694124-19-michael.j.ruhl@intel.com>
References: <20261110183505.694124-19-michael.j.ruhl@intel.com>
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
index 0247a255f7e6..89f013418cf5 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -36,3 +36,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
    xe_configfs
    xe_gt_stats
    xe_sigid
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

