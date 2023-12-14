Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9B2C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 21:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD0B10E209;
	Thu, 14 Dec 2023 21:41:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E6610EA01
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 21:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702590033; x=1734126033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ve/SQpfgXdJZaWwMMtfA7VqN2z8Ua0zldmxgYiV+Yio=;
 b=Ll/PKQkrCwW/PbR6A3zcWgVuEloKImE+bdm4bhuRcBuwFl24pavp99u/
 sDEV8zTBJUkABaM5mnsHrPtVKP5phFLB0TTZf5+CieKs5vVNLnhq2xu/8
 QgSyxngSfDCu+82kVCWAD5h6zsj+KlOygX38N6Bk1HWyC2IU63hB5OKFt
 sRnb3sqb608hgWUfLaEtggvht4JMKVMJGqgMLvUMZFAQUVm/BTIFyubst
 3MRiqKicLnZPc4AanP0LqWhjZAHOREAlqjdxYPeeqBrBCASikuxLwldK4
 G5LpSmeNEMbudaZsBL7BD+qDpyJcwCKo78fhmatMUHkPCt/xhHM32Osas w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="374696752"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="374696752"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="844878451"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="844878451"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:40:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/xe: Enable W=1 warnings by default
Date: Thu, 14 Dec 2023 13:39:54 -0800
Message-Id: <20231214213954.3223263-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231214213954.3223263-1-lucas.demarchi@intel.com>
References: <20231214213954.3223263-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Like done in commit 2250c7ead8ad ("drm/i915: enable W=1 warnings by default")
for i915, enable W=1 warnings by default in xe.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 47 ++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f4ae063a7005..6790c049d89e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -3,25 +3,34 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-# Add a set of useful warning flags and enable -Werror for CI to prevent
-# trivial mistakes from creeping in. We have to do this piecemeal as we reject
-# any patch that isn't warning clean, so turning on -Wall -Wextra (or W=1) we
-# need to filter out dubious warnings.  Still it is our interest
-# to keep running locally with W=1 C=1 until we are completely clean.
-#
-# Note the danger in using -Wall -Wextra is that when CI updates gcc we
-# will most likely get a sudden build breakage... Hopefully we will fix
-# new warnings before CI updates!
-subdir-ccflags-y := -Wall -Wextra
-subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
-subdir-ccflags-y += $(call cc-disable-warning, type-limits)
-subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
-subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
-# clang warnings
-subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
-subdir-ccflags-y += $(call cc-disable-warning, sometimes-uninitialized)
-subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
-subdir-ccflags-y += $(call cc-disable-warning, frame-address)
+# Unconditionally enable W=1 warnings locally
+# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
+subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
+subdir-ccflags-y += -Wmissing-declarations
+subdir-ccflags-y += $(call cc-option, -Wrestrict)
+subdir-ccflags-y += -Wmissing-format-attribute
+subdir-ccflags-y += -Wmissing-prototypes
+subdir-ccflags-y += -Wold-style-definition
+subdir-ccflags-y += -Wmissing-include-dirs
+subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
+subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
+subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
+subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
+subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
+subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
+subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
+# The following turn off the warnings enabled by -Wextra
+ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
+subdir-ccflags-y += -Wno-missing-field-initializers
+subdir-ccflags-y += -Wno-type-limits
+subdir-ccflags-y += -Wno-shift-negative-value
+endif
+ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
+subdir-ccflags-y += -Wno-sign-compare
+endif
+# --- end copy-paste
+
+# Enable -Werror in CI and development
 subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
 
 subdir-ccflags-y += -I$(obj) -I$(srctree)/$(src)
-- 
2.40.1

