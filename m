Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2615BCA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 06:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3F310E537;
	Tue, 19 Aug 2025 06:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dguw0BpI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975AA10E537
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 06:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755585576; x=1787121576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gh6JUzzug+8bS6bHoEWsqCH6CALTDrhbKshLZtu2Ywk=;
 b=dguw0BpIe1nhvOdWbqXK3tUbOEJZSi/PUyV7GWqjfLX0h7XNRYN34XVr
 QD37VBtjHwLwBRtqmf5kbwxuXdljOkgqM3e82LorutwdSI7xU/2MXS2R5
 2Y2icpbDXEXkYHtuNhNRe9cPHieky87H2DI69c5DIol1VBgLEnP1Kzx1n
 ZnKiwVHr95aRraMBH5cE1FWpCJLDcws6owNFWBLZ9lvbQWfnzDjztlT7I
 VbpC3yvv7Chb/J58CVfkUgkA34VLUywujGGVOk2+RjSi0o5UYmadJ4jKj
 mbltrwlmYrHWO4tnEEo+r3LfMqnb1RAvaZlmJlujgC1/o6Q+JyCS9JyJJ w==;
X-CSE-ConnectionGUID: KRYuAv/WTMOMVEEMuzHufQ==
X-CSE-MsgGUID: 3dmcFyAYQ8OAp0FlpTBX8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57966989"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57966989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 23:39:36 -0700
X-CSE-ConnectionGUID: F+mNYy3MT1SoSzYOzubZuw==
X-CSE-MsgGUID: 9A1K7jHvTaOjmZR2BtNyuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172009513"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa003.jf.intel.com with ESMTP; 18 Aug 2025 23:39:36 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH 6/8] drm/xe: Add GPU frequency tracer to build system
Date: Tue, 19 Aug 2025 12:04:15 +0530
Message-Id: <20250819063417.918666-7-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819063417.918666-1-s.sebinraj@intel.com>
References: <20250819063417.918666-1-s.sebinraj@intel.com>
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

Add xe_gpufreqtracer.o to the Makefile, conditionally compiled
when CONFIG_DRM_XE_GPUFREQTRACER is enabled.

This integrates the GPU frequency tracer into the XE driver
build process.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/xe/Makefile          | 3 +++
 drivers/gpu/drm/xe/xe_device_types.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8e0c3412a757..61d46cc4dc25 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -170,6 +170,9 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_sriov_pf.o \
 	xe_sriov_pf_service.o
 
+# GPU frequency tracer
+xe-$(CONFIG_DRM_XE_GPUFREQTRACER) += xe_gpufreqtracer.o
+
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
 xe-y += tests/xe_kunit_helpers.o
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 01e8fa0d2f9f..0634dbbbdc3f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -35,6 +35,7 @@ struct dram_info;
 struct intel_display;
 struct intel_dg_nvm_dev;
 struct xe_ggtt;
+struct xe_gpufreqtracer_data;
 struct xe_i2c;
 struct xe_pat_ops;
 struct xe_pxp;
@@ -529,6 +530,9 @@ struct xe_device {
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
+	/** @gpufreqtracer_data: GPU frequency tracer data */
+	struct xe_gpufreqtracer_data *gpufreqtracer_data;
+
 	/** @pxp: Encapsulate Protected Xe Path support */
 	struct xe_pxp *pxp;
 
-- 
2.34.1

