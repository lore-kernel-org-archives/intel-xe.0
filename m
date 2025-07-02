Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B8AC83038
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 19:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493E710E786;
	Wed,  2 Jul 2025 19:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dpd+xWRL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4115D10E786
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 19:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484644; x=1783020644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VGx/YbWLiEs4vR54FS+7mT41xhP4V2h8LWdLp5jT2ns=;
 b=Dpd+xWRLr5iT2pYUDze3Mt4kW+x77OBHbLX1s6wzeZ8Ejat14Mo9iYZl
 aiEmZMz+vN4jGMo7SjlIfkCL1TNEBXqJqzyXrsYp6WAfg+mGP4TeaVR9q
 7JCieSBB4l58Q2WzrBMF0kkRpHJY2YvajFB4shjiNVlj5WjY+a8IcD/aq
 6gzlnvGoOTxgL9rcyKIOtO9vdBiu0T8kMqCf8A3xHO2QWYAKcJ0/UBejX
 MmPtj1JX6J5+TnNvmR67uy1FZo4CSKTScIfbRJVh2ixILHvZGnYArW/Rm
 fsy81IDPkNELuewWQN2NXluvQM7Oajakp6CBsUvv7jxtOwvZzpZYO3tO2 w==;
X-CSE-ConnectionGUID: JGRGCzzxQHyJJR44H7qxNQ==
X-CSE-MsgGUID: Q0OACB50RGWeKgxfgp2GdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64039104"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64039104"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:44 -0700
X-CSE-ConnectionGUID: T7US6manScGkO1xRtAqrIg==
X-CSE-MsgGUID: rDCdbhY1RUCr2r5iGIm3Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153615541"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:43 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v5 6/6] drm/xe: disable wa_15015404425 for PTL B0
Date: Wed,  2 Jul 2025 12:30:36 -0700
Message-ID: <20250702193036.1417416-7-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
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

Wa_15015404425 only needs to be applied on PTL platforms with an A step
compute die. There is no way to map PCI revid to the compute die
stepping. The easiest way to figure out compute die stepping our end is
to map the media IP's stepping to the compute die. For PTL, compute die
has an A stepping if and only if the media IP's stepping is also A-step
(This relationship is determined on a per platform basis and just
happens to be this way on PTL).

In addition this workaround is a chicken-and-egg problem. Wa_15015404425
requires that all register reads be preceded by four dummy MMIO writes
(including during early driver  init and even pre-OS firmware). The
driver needs to perform some MMIO reads during init which include the
GMD_ID register that contains the Media IPs stepping. To handle this in
the safest manner assume the workaround applies to all of PTL during
driver probe and deactivate the workaround after.

The overall solution becomes a set of two workarounds:

* 15015404425 - a Device OOB workaround that's always active for PTL
* 15015404425_disable - a GT OOB workaround that applies to PTL
  platfroms with a B0 or later stepping

The first of these workarounds issues dummy MMIO writes we do when
reading registers. The second guards logic that disables the first once
we have the necessary information later in the probe process.

v2: rename SoC to device, avoid null pointer dereference, update commit
message.
v3: rebase
v5: move disable check into xe_device_probe to avoid linking in xe_wa
into xe_pci, reword commit message

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     | 5 +++++
 drivers/gpu/drm/xe/xe_wa.h         | 5 +++++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 53df142c1031..5a771b0f8f19 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -68,6 +68,7 @@
 #include "xe_wa.h"
 
 #include <generated/xe_wa_oob.h>
+#include <generated/xe_device_wa_oob.h>
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
@@ -863,6 +864,10 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	if (xe->tiles->media_gt &&
+	    XE_WA(xe->tiles->media_gt, 15015404425_disable))
+		XE_DEVICE_WA_DISABLE(xe, 15015404425);
+
 	xe_nvm_init(xe);
 
 	err = xe_heci_gsc_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 3793fcae38a0..907eea020b9d 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -45,4 +45,9 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
 	test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);		\
 })
 
+#define XE_DEVICE_WA_DISABLE(xe__, id__) ({				\
+	xe_assert(xe__, (xe__)->wa_active.oob_initialized);			\
+	clear_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);		\
+})
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 96cc33da0fb5..255e67113406 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -70,3 +70,5 @@ no_media_l3	MEDIA_VERSION(3000)
 # SoC workaround - currently applies to all platforms with the following
 # primary GT GMDID
 14022085890	GRAPHICS_VERSION(2001)
+
+15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
-- 
2.49.0

