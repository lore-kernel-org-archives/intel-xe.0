Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA09C28B30
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 13:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BAF10E9FA;
	Fri, 14 Mar 2025 13:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZBo+AD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E6110E9F9
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 13:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741960497; x=1773496497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qgzDZAarO9IaseJmiKKGDwHIACjv0RVZ6vgKXknzMD4=;
 b=iZBo+AD0Q8TDwVf5SruSp28njy72rAdJ6thGf3fwotVhx1fBmNfcBHmI
 YwjqMBM198GSLrc5U2phwuhA6kOVDNf9B6wiRrbiQpasqXa5+CH8NUIa2
 GvpzrZzHPU2xD/oUl4NidGcY/5H57IreHjBsYRSIBjzJVCqhRaiRJWWRO
 MecoxL7F+deDAHh6K8Wp9+2O5KYU0PDOMx1xVmYY5GuzmN4Xevph6hUaa
 8Snsr+B+FuVzgQAm9m/WjgoxIrX4xEsGYnHT4wbWvqSCh22j/nGP6Wgfh
 IYYRLR8zhAIl7nGuM5WXRFVb+HqAdIoODSxfm0wOXreyqGbcYCLCgjXo2 w==;
X-CSE-ConnectionGUID: Njitgoz1SP2oUzGRTV5hVA==
X-CSE-MsgGUID: dQDygLo2QNOxaHHYKGQnGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43000753"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43000753"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:54:55 -0700
X-CSE-ConnectionGUID: iKYRGY8tSkGqAUSlyWhHGg==
X-CSE-MsgGUID: 6ffz9Ia3Ruab1mNZl1X1aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121333193"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:54:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 3/3] drm/xe: Allow to inject error in early probe
Date: Fri, 14 Mar 2025 06:54:27 -0700
Message-ID: <20250314-fix-survivability-v5-3-fdb3559ea965@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314-fix-survivability-v5-0-fdb3559ea965@intel.com>
References: <20250314-fix-survivability-v5-0-fdb3559ea965@intel.com>
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
index 0e8805f93468d..1ffb7d1f6be66 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -735,6 +735,7 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
 
 static int probe_has_flat_ccs(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 13e06a956ceb0..096c38cc51c83 100644
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

