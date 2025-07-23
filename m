Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BFFC83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 04:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF4610E332;
	Wed, 23 Jul 2025 04:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPW6qz/R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519B810E332
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 04:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753244349; x=1784780349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zHqrFzwJHeoezJo0+03eNw3Huu1HLCbKFkDxxSSn6n0=;
 b=QPW6qz/RVTWu2/sYLl3g2XdJZi9M/phzEhu9c4LwpVXIntk++w0jRm+A
 nTY0ntonk9Y9O5OGmgqfgq01haZ4yYCaBfjC53lMErvSAqtAtAtNgk5JJ
 Bbtkra0Bnq3GQAP8cVy4S7i5sNLQz+xR3lru+fOmAvmYWez2BOtEJ+9rJ
 fUommuy4wVIPbd8I+rgmL5s8LEpFrfqYhguXEi0wQWKRVGj8yEMkaZWdB
 AOG/0p9MgrVWfxkKOrfoafbxB6aeSS6RIKF6Zga4Ixd1XzWDm8GLsxQBm
 GCcdIWJ9NeNnqJ0stX62RV4zxc8reTI7iAykSffHSF4YY9w5zPvxx4xZL w==;
X-CSE-ConnectionGUID: H+LA3tmtSVOUiRtUvSXBrA==
X-CSE-MsgGUID: HHkPCgXiR+uvjlBbv4g9CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="73082957"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="73082957"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 21:19:09 -0700
X-CSE-ConnectionGUID: /USsFiSTQ/C5DO/PLWcWfA==
X-CSE-MsgGUID: ZFh4ZqtnTtyN8r3KGe5+Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="183025742"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 21:19:08 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH] drm/xe/gsc: Don't create mei-gscfi auxiliary device in a
 Guest VM
Date: Tue, 22 Jul 2025 21:16:57 -0700
Message-ID: <20250723041657.2496991-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.49.0
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

While running in a Guest Virtual Machine (VM), we do not have to
initialize and enable the mei-gscfi auxiliary device. This is
because communication with the GSC/CSC firmware -- which is the
main purpose of the aux device -- is unlikely to work in the VM
environment, and can result in the following errors while loading
the Xe driver:

[  762.274208] mei_gsc xe.mei-gscfi.24: H_RST is not set = 0x00000000
[  764.299203] mei_gsc xe.mei-gscfi.24: wait hw ready failed
[  764.300334] mei_gsc xe.mei-gscfi.24: hw_start failed ret = -62 fw status = 00000000 00000000 00000000 00000000 00000000 00000000
[  768.333706] mei_gsc xe.mei-gscfi.24: reset: reached maximal consecutive resets: disabling the device
[  768.334466] mei_gsc xe.mei-gscfi.24: reset failed ret = -19
[  768.334941] mei_gsc xe.mei-gscfi.24: link layer initialization failed.
[  768.335346] mei_gsc xe.mei-gscfi.24: init hw failure.

Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_heci_gsc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 6d7b62724126..eb94fcb3f03b 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -13,6 +13,7 @@
 #include "xe_heci_gsc.h"
 #include "regs/xe_gsc_regs.h"
 #include "xe_platform_types.h"
+#include "xe_sriov.h"
 #include "xe_survivability_mode.h"
 
 #define GSC_BAR_LENGTH  0x00000FFC
@@ -176,6 +177,9 @@ int xe_heci_gsc_init(struct xe_device *xe)
 	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
 		return 0;
 
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
 	heci_gsc->irq = -1;
 
 	if (xe->info.platform == XE_BATTLEMAGE) {
-- 
2.49.0

