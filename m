Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D614C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 18:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075EB10E633;
	Tue, 11 Mar 2025 18:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QywZAJfO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E5910E056
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741718125; x=1773254125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qQ88KJCvkbJdAJ+iL0nsQI35o7G1xG5G7mA603NFdJo=;
 b=QywZAJfOfDkFnnjzJiMZwX8OTc6tDAtibQtFqM9Rl8xh7UNdCf3cliKh
 hAXrx/tuuHuz6K37iBPhf8et/3/18L47bNUsTTi3G18M7tsapY/6HaYXK
 Uac2hwSUSFaY8pcTUWSca0lMPZN6oLGSrA7mGbNwoptVjPURv8uNPY+pF
 pQ61kXfdcSd1c6ew6e+j+P2uebiBlI0J4hzaMG2cHd0JTWCyjhoR2q5In
 VJzaJv1cOvtc9jThtPoIYGB1KJ6tfTl3bXcKgn6DTW92UUwqEw36TIupT
 fyksTiUZuRtMYj0iricrTPppmp3mB8/P4IMAsdI4+xUufDwh4K4uCm/sc Q==;
X-CSE-ConnectionGUID: cOcjFy0NQam/3Sn3GzzfcQ==
X-CSE-MsgGUID: JIVAAoKEQPupYrtYhvNHIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42983303"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42983303"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:35:24 -0700
X-CSE-ConnectionGUID: lUMml6BySZaKoij1RcGgkw==
X-CSE-MsgGUID: cIgzfX+SRjquadSfmXUhtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="121301502"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:35:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Allow to inject error in early probe
Date: Tue, 11 Mar 2025 11:34:56 -0700
Message-ID: <20250311-fix-survivability-v2-2-729ce081155e@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311-fix-survivability-v2-0-729ce081155e@intel.com>
References: <20250311-fix-survivability-v2-0-729ce081155e@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 +
 drivers/gpu/drm/xe/xe_mmio.c   | 1 +
 drivers/gpu/drm/xe/xe_pcode.c  | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 023290e5be392..1b443f54ee16a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -728,6 +728,7 @@ int xe_device_probe_early(struct xe_device *xe)
 
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

