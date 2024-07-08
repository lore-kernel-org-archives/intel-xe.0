Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9C5C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 21:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D26E10E3CF;
	Mon,  8 Jul 2024 21:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbaeTDqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364E510E3CF
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 21:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720474263; x=1752010263;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+NutWdEbn7jP54wZQNx0+rZqq5ssmq7YA7zFosJ9JPM=;
 b=FbaeTDqX5joQrNBM16X1WuNjOnN5HZc0nopno1W8VJbgWMorimEni9pz
 8yMfyUaDtYqnHAdK45qU9Zr3L1GlfbAStWmy+3hX47o/pnbsTBPMFq94U
 7vdK9LiEv1QjT/jBkmO/v0tT1XTozitWDmoBr9ZaTgxAuy7uO73bR5nzX
 EGvnL1cc8qg9N1JwtUunRD4o7YBiVHghjxj4g7Ha+QKAgQRN3b8CNCiY8
 4c/cheRTHy0kHBDROCxnmSgpFnvRbaiDbElbg35chNUKEN9lXl5nyhD+b
 8RBWz6hdyZRqlnPFqwU48c7J92ciXGIzny3SC9bQqVg1a0C6YA6XHhQoU A==;
X-CSE-ConnectionGUID: wmTrBzEySG+1KGOSO9+oKQ==
X-CSE-MsgGUID: 9W3pTk2JQFqDVZNwdwcu5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="35137982"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="35137982"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 14:31:02 -0700
X-CSE-ConnectionGUID: kG1k+WrjQsKNq8I4Jskwpw==
X-CSE-MsgGUID: HwtRROPvR3yn2Fbm3CYjRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47711806"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 14:31:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2] drm/xe: Generate oob before compiling anything
Date: Mon,  8 Jul 2024 14:29:06 -0700
Message-ID: <20240708213041.1734028-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Instead of keep adding more dependencies as WAs are needed in different
places of the driver, just add a rule with all the objects so the code
generation happens before anything else.

While at it, group lines related to wa_oob in the Makefile.

v2: Prefix $(obj) when declaring dependency

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

This v2 is now built-tested with the same container CI is using, so
hopefully it's now compatible with make < 4.3.

 drivers/gpu/drm/xe/Makefile | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 0eb0acc4f198..1ff9602a52f6 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -12,35 +12,15 @@ subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
 subdir-ccflags-y += -I$(obj) -I$(src)
 
 # generated sources
-hostprogs := xe_gen_wa_oob
 
+hostprogs := xe_gen_wa_oob
 generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
-
 quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
       cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
-
 $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 		 $(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
-uses_generated_oob := \
-	$(obj)/xe_ggtt.o \
-	$(obj)/xe_device.o \
-	$(obj)/xe_gsc.o \
-	$(obj)/xe_gt.o \
-	$(obj)/xe_guc.o \
-	$(obj)/xe_guc_ads.o \
-	$(obj)/xe_guc_pc.o \
-	$(obj)/xe_migrate.o \
-	$(obj)/xe_pat.o \
-	$(obj)/xe_ring_ops.o \
-	$(obj)/xe_vm.o \
-	$(obj)/xe_wa.o \
-	$(obj)/xe_ttm_stolen_mgr.o \
-	$(obj)/display/xe_display_wa.o
-
-$(uses_generated_oob): $(generated_oob)
-
 # Please keep these build lists sorted!
 
 # core driver code
@@ -324,3 +304,6 @@ quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
+
+uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
+$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
-- 
2.43.0

