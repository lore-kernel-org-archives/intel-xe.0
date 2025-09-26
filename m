Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE91CAC5BC
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 11:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C774610EA28;
	Fri, 26 Sep 2025 11:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8c2SGEr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342BD10EA23
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758885618; x=1790421618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UNxE3rlhEHbQw7k9hNg9/CAi9lQcAgCX8Lh4pB56Wuw=;
 b=j8c2SGErvJbLPlbaE4AGplM8FXUnzq80K01mRQU6YEBlx+8ZapULr2qi
 NAdnFd6eq+eKavPYZZto4JcfLZtBE9aPoJO0TgDNwZvLFTKX1tpEwFItB
 5fUCg95rST56k9ytqRv8CohVVuLuxEcAXly9Dw5g+cL+m5C9HNsOBJhIx
 aN7e9/vF476iRwv2y9vSLo8iECCjVLbylp06U4W1DSK70JZHBPE6jz1NE
 B/KffgWpCtJvUOR7b4+PApmQkX+SUS1EoXF9j3k9MMAKlCzUO6OJoE+Ve
 qRI3dIr6608UPWt36H2zUEDULm3czZ8xeJhrlMtpKp8ZfsFQPuYASGvDr w==;
X-CSE-ConnectionGUID: GzDMysliSw231qiDKMNskw==
X-CSE-MsgGUID: 7PShSWKyRFmPKjaehNsN3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72314438"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72314438"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:20:18 -0700
X-CSE-ConnectionGUID: Of3E5ezrTLqUBx9fj0nfHA==
X-CSE-MsgGUID: jWex7xXHSISS95VN/i8LkA==
X-ExtLoop1: 1
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2025 04:20:16 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v4 9/9] Hack patch: Do not merge
Date: Fri, 26 Sep 2025 10:45:20 +0000
Message-ID: <20250926104521.1815428-10-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
References: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
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

This patch is only added so that our files are built and tested
on the CI
---
 drivers/gpu/drm/xe/Makefile  | 2 +-
 drivers/gpu/drm/xe/xe_user.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 6fc23367bdfe..ff6b584f3293 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -333,7 +333,7 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 
 	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
 
-	xe-$(CONFIG_TRACE_GPU_WORK_PERIOD) += xe_user.o
+	xe-y += xe_user.o
 
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_display_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
index e4b726f989a4..ddc6c437a7ab 100644
--- a/drivers/gpu/drm/xe/xe_user.h
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -72,7 +72,7 @@ struct xe_user {
 	u64 last_timestamp_ns;
 };
 
-#if IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)
+#if 1
 
 int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid);
 
-- 
2.49.0

