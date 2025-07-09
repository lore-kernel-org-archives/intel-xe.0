Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B86EC83F18
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 22:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0E910E86B;
	Wed,  9 Jul 2025 22:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJoeyMky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8E710E0E5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 22:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752099372; x=1783635372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IaTLPhTauVHBh3/Icsu00pbss+3qM1rpFteipS7/uJE=;
 b=XJoeyMkybNxjrmtteaeiL1dlPRecF9b4czlCc4JtovAq44wB2fpawTsQ
 Ddwj4RBIYKVqKYUu2b85zuwFEb6x+hHn4eubNJ7gZgC4q4Rxal557vv00
 6buw550WGZWrQCnHJDJarC5Y1IbuDsq4zMALkdIYCwh4Y22PWEQsE4git
 /EKLvZsV95bPwhaDDnFyL04BxwhJ9e/z2m8ERAMeO54CWyeCLChXbbjLi
 RgR/5jlsx1Mg6zJRaY3sAvkCwsdo6YAEMRFfKlTwC1i/ke/hoi0gNXRlP
 zRqEpha8LqL7caN18tbK7cA4dQxpKmT1cKe/L93kgLFYh5iS0DOntus26 A==;
X-CSE-ConnectionGUID: 8y59nEEoQF+nXSoXQhKJrw==
X-CSE-MsgGUID: bYJcuiVtRz6yQt/ye3UHUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54518065"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54518065"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:12 -0700
X-CSE-ConnectionGUID: 9r11/5IhSBSJmQVVvA5SQw==
X-CSE-MsgGUID: 3+lHfWmhRkOQmfRZjHWtCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="193096149"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:12 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v6 6/6] drm/xe: extend Wa_15015404425 to apply to PTL
Date: Wed,  9 Jul 2025 15:16:05 -0700
Message-ID: <20250709221605.172516-7-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709221605.172516-1-matthew.s.atwood@intel.com>
References: <20250709221605.172516-1-matthew.s.atwood@intel.com>
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
v6: squash extension and b0 support into 1 patch

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c            | 5 +++++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
 drivers/gpu/drm/xe/xe_wa.h                | 5 +++++
 drivers/gpu/drm/xe/xe_wa_oob.rules        | 2 ++
 4 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 53df142c1031..2df34589ecb9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -67,6 +67,7 @@
 #include "xe_wait_user_fence.h"
 #include "xe_wa.h"
 
+#include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
@@ -863,6 +864,10 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	if (xe->tiles->media_gt &&
+	    XE_WA(xe->tiles->media_gt, 15015404425_disable))
+		XE_DEVICE_WA_DISABLE(xe, 15015404425);
+
 	xe_nvm_init(xe);
 
 	err = xe_heci_gsc_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index b7d12ea4d65c..3a0c4ccc4224 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -1 +1,2 @@
 15015404425     PLATFORM(LUNARLAKE)
+		PLATFORM(PANTHERLAKE)
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index c290f449716b..f3880c65cb8d 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -45,4 +45,9 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
 	test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);	\
 })
 
+#define XE_DEVICE_WA_DISABLE(xe__, id__) ({				\
+	xe_assert(xe__, (xe__)->wa_active.oob_initialized);		\
+	clear_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->wa_active.oob);	\
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

