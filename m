Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D430DCA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 16:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948A510E19E;
	Mon, 22 Sep 2025 16:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5sqjmtI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5550210E19E
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758557829; x=1790093829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sQYTOzq2d+sobhch5801rSrbk2NmiPggiXwCjbxDMTw=;
 b=U5sqjmtI52QT8W9rWLK7uodY7XPmyoTGRjQu5Sve0wp4AzBolYGD2GfU
 QsZkKeWcnB2fhoBAbD/pDFO+oA8LwHxv7NNk3bD7VXQ4DoTpkCDNh1aO4
 tmEkjb38zKYpYGaxMaTRsdYZa7JQt3x5l3Q5Ob/JzNubnnVohFFI9cMl1
 EIeIamiX+qKhFYe7YNhM59e+DE4r7wGcirAkegs+CapSect1SCh+IHCtY
 KXw0otQxTtgmfw2c1MuTeLtDoit9Rxa0OAAAYQZo5c2BusEcbLuDaxy1m
 NVta5PhV9upakWeTAtqpvuuFPSpm9qD1jeYbckPJqgmaeTH9dT55SKnAl A==;
X-CSE-ConnectionGUID: cpIhUqlNQliHdt2exHMiEg==
X-CSE-MsgGUID: YZ/vi/K5TSOxVGTye+QsZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60740152"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60740152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:17:09 -0700
X-CSE-ConnectionGUID: RWh5AXGITA+HDPS37t//cA==
X-CSE-MsgGUID: vbwm1PYhQn2oZqBLLwc6uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="213657769"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:17:09 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	saurabhg.gupta@intel.com,
	alex.zuo@intel.com
Subject: [PATCH] drm/xe/xe_late_bind_fw: Various uninitialized variable fixes
Date: Mon, 22 Sep 2025 16:17:09 +0000
Message-ID: <20250922161708.71155-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

There are a few variables in xe_late_bind_fw that can theoretically
be used while uninitialized.  Initialize them.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 38f3feb2aecd..2a57f7d28e9a 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -60,7 +60,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
 	const struct gsc_manifest_header *manifest;
 	const struct gsc_cpd_entry *entry;
 	size_t min_size = sizeof(*header);
-	u32 offset;
+	u32 offset = 0;
 	int i;
 
 	/* manifest_entry is mandatory */
@@ -116,7 +116,7 @@ static int parse_lb_layout(struct xe_late_bind_fw *lb_fw,
 	const struct csc_fpt_header *header = data;
 	const struct csc_fpt_entry *entry;
 	size_t min_size = sizeof(*header);
-	u32 offset;
+	u32 offset = 0;
 	int i;
 
 	/* fpt_entry is mandatory */
@@ -188,7 +188,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-	u32 uval;
+	u32 uval = 0;
 
 	if (!xe_pcode_read(root_tile,
 			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
-- 
2.43.0

