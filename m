Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC239C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 21:06:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587AF10F390;
	Thu, 11 Apr 2024 21:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0HwDdfK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE3E10F390
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 21:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712869586; x=1744405586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6xp8544B4r33laAVl3egK4XHdufZdY09DG/A95bjZAc=;
 b=l0HwDdfKzLss47t0SF1qu0Dh74oLMBnX+8wGGTXvdsY7XXMA8XL1HFZm
 ZbRsFRWtgxAC2zjBOaNN0UewK1sxjhFPRZFKOrYSef26DHwZYUzhhDm1k
 xze49WZZE22JdnDrhka7INMTWYpXcR3z57WA+GOQwFf9VQBPo4h0efm+l
 gvF+8FA3rEWXT78w+oth3PE68ldHsPQM9CPDz7Dsb6xjtvJxHM33QdqUD
 RmUcW88STNHiRLLbmU/Y5n60PzKGRCQ/rHX6N4W7PHDmgDsSNSVnouO9Y
 i3Y/Lv3AiGWACHcABh4UuyUCDiWFPi+326DC2yMKe8enTQIhVbJQgob6s w==;
X-CSE-ConnectionGUID: KvFAjHcuTrS3KJ2odTuiwQ==
X-CSE-MsgGUID: vH15dMBpRbOPa9QQDLi/Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19460605"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="19460605"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 14:06:25 -0700
X-CSE-ConnectionGUID: yFxUkO7cRQ2THaeA20/JvQ==
X-CSE-MsgGUID: nMRlglQATr2t787gM4AEmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="20941740"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 14:06:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Matt Roper <matthew.d.roper@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Generate oob before compiling anything
Date: Thu, 11 Apr 2024 14:07:03 -0700
Message-ID: <20240411210703.3296782-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 6015c9e41f24..a5809b3ec8a5 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -46,18 +46,6 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 		 $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
-uses_generated_oob := \
-	$(obj)/xe_gsc.o \
-	$(obj)/xe_guc.o \
-	$(obj)/xe_guc_ads.o \
-	$(obj)/xe_migrate.o \
-	$(obj)/xe_ring_ops.o \
-	$(obj)/xe_vm.o \
-	$(obj)/xe_wa.o \
-	$(obj)/xe_ttm_stolen_mgr.o
-
-$(uses_generated_oob): $(generated_oob)
-
 # Please keep these build lists sorted!
 
 # core driver code
@@ -319,3 +307,7 @@ quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
+
+# make sure the generated header is done before any
+# compilation unit is attempted
+$(xe-y): $(generated_oob)
-- 
2.43.0

