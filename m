Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC089C369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 13:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDAF10E3A6;
	Mon, 21 Apr 2025 13:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SujgN6EO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B110010E3A6
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745243449; x=1776779449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=udwrPn6Fc3BNqC3TmnHt56oYTzt748EuIbYBtsRhfms=;
 b=SujgN6EO+O9kCdJyJd8pXxWwFx2LtDKAJwaN5VMcohvBfTgBuA1iOG4G
 VSyyNA9E8NpHpM1dIOJ1UgPgYna30a3jYfIXUqOs9T5lh1g5zTOeJ/zo2
 RDIYHZSiEQz6yMSavrhECJjsu2EKbvYR53de4DvlV8aLPisvYHHfS72fR
 VKvr6eQWQD6CF2pe/EgP55wOHjVJ9/oTG/EmMVtnSIiWmBDeGdgA5WTWc
 kL/Kw2LHWqH9jiWJHN182PSQs+eDLItRL2sgMIxiYYMHWpfj3XBbSUOB+
 oUtxleVxuwsWfSSz++5Zv7F3ioUSLKfo7D8Yz6w1iBbrXPsqqbfP5caqT w==;
X-CSE-ConnectionGUID: pp29eUZtSrCATibUrlgVzQ==
X-CSE-MsgGUID: UgLj7dZYQ++/OlzBliqKvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="34393138"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="34393138"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 06:50:48 -0700
X-CSE-ConnectionGUID: m1flY0XuQ7Sfc7V85gY6MQ==
X-CSE-MsgGUID: O1msYDNdSSaR5ffkaLQC6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="162681599"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 06:50:46 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 riana.tauro@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1 1/2] drm/xe: Rename wait_for_lmem_ready and make it
 non-static
Date: Mon, 21 Apr 2025 19:20:28 +0530
Message-Id: <20250421135029.3489950-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250421135029.3489950-1-karthik.poosa@intel.com>
References: <20250421135029.3489950-1-karthik.poosa@intel.com>
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

Rename wait_for_lmem_ready to wait_for_vram_ready.
Convert it to non-static to enable calls from other functions.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 6 +++---
 drivers/gpu/drm/xe/xe_device.h | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 75e753e0a682..fb178315d3df 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -630,7 +630,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
 	return !!val;
 }
 
-static int wait_for_lmem_ready(struct xe_device *xe)
+int wait_for_vram_ready(struct xe_device *xe)
 {
 	unsigned long timeout, start;
 
@@ -676,7 +676,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 
 	return 0;
 }
-ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
+ALLOW_ERROR_INJECTION(wait_for_vram_ready, ERRNO); /* See xe_pci_probe() */
 
 static void sriov_update_device_info(struct xe_device *xe)
 {
@@ -727,7 +727,7 @@ int xe_device_probe_early(struct xe_device *xe)
 		return save_err;
 	}
 
-	err = wait_for_lmem_ready(xe);
+	err = wait_for_vram_ready(xe);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..dc79b3812d66 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
+int wait_for_vram_ready(struct xe_device *xe);
 
 void xe_device_wmb(struct xe_device *xe);
 
-- 
2.25.1

