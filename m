Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9445FC35FF1
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 21:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A6F10E7D4;
	Wed, 12 Mar 2025 21:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYKjjpGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E3010E7D2
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 21:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813928; x=1773349928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hpve7S0MYHL9QLGBchmKUV/EzptO0NxCnSDqqneMYxE=;
 b=QYKjjpGwPMnz28FNo5bG418aGrIt0jOyW7ULKm++meX55NAB5cQt/lER
 yZMaJ6uhWBu7qH2ngKHMMeb8Ll13VFQrL7ND/hmgvuS0hVkVD7IXI9yqB
 +ZB1zlPeSjwtB8c0jE+7nGx4r+OqG86QWNcth0mqNir7EcHtsO4AX0A4+
 EEfpMemoE4OF4efaKi7V45xvaZ3tk0YPGbwrPlRTLffpMXxSTfgzEs4ji
 gdxfWyd/0stuML7ZFbjqH9qWPh4IdJgidV4lyd3KnI/QPQ0TzIcXUNM0P
 vpWdb4G/ygE4dFl6xQDpHjhJWjCa2lbgdqBpt3gyoJjhjIfsXsHYDUhjN w==;
X-CSE-ConnectionGUID: 3YrB7AkOS5GV2FkrHXCQoA==
X-CSE-MsgGUID: QH2YoE+yTxmZJD4AKa/BSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42167856"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="42167856"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:12:08 -0700
X-CSE-ConnectionGUID: BDkrZj68QQasJs2nRWIvkg==
X-CSE-MsgGUID: P39duGo0Q0+56PhDG9gc3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="125825949"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:12:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 3/3] drm/xe: Allow to inject error in early probe
Date: Wed, 12 Mar 2025 14:11:51 -0700
Message-ID: <20250312-fix-survivability-v3-3-54620dbcbbd7@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312-fix-survivability-v3-0-54620dbcbbd7@intel.com>
References: <20250312-fix-survivability-v3-0-54620dbcbbd7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-c25d1
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

Allow to test if driver behaves correctly when xe_pcode_probe_early()
fails. Note that this is not sufficient for testing survivability mode
as it's still required to read the hw to check for errors, which doesn't
happen on an injected failure.

To complete the early probe coverage, allow injection in the other
functions as well: xe_mmio_probe_early() and xe_device_probe_early().

Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 +
 drivers/gpu/drm/xe/xe_mmio.c   | 1 +
 drivers/gpu/drm/xe/xe_pcode.c  | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7fce59059acf2..3f4d0f4cf992f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -729,6 +729,7 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
 
 static int probe_has_flat_ccs(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 70a36e7775466..e1470fcf95d6d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -138,6 +138,7 @@ int xe_mmio_probe_early(struct xe_device *xe)
 
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
+ALLOW_ERROR_INJECTION(xe_mmio_probe_early, ERRNO); /* See xe_pci_probe() */
 
 /**
  * xe_mmio_init() - Initialize an MMIO instance
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 9333ce776a6e5..cf955b3ed52cd 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -7,6 +7,7 @@
 
 #include <linux/delay.h>
 #include <linux/errno.h>
+#include <linux/error-injection.h>
 
 #include <drm/drm_managed.h>
 
@@ -323,3 +324,4 @@ int xe_pcode_probe_early(struct xe_device *xe)
 {
 	return xe_pcode_ready(xe, false);
 }
+ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */

-- 
2.48.1

