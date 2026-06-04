Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130ADCD6E68
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 07:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00D0113D4E;
	Thu,  4 Jun 2026 07:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCtDWvNd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A721C113D4E
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 07:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780559147; x=1812095147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UfxtRZfHjPdthIZKrnU7I4WWeJD6WBqqn2L2PaNv0XI=;
 b=MCtDWvNdQRx2rutUHK7vOjraQDLhOW0xZKbCxNhxrIPrvvsMOipdWghJ
 NmHawMQ5jC+88evAme+sUIrkTLT+iGKQABMj9e86kZX1KSzM3gdWK/Ski
 SDNsNmxUke56tuFILbkpXPzF7FdQs6O6OSAmKDkBQKohq7pbM7B+knAPY
 Bz4zvC801GX0WRBR6T4+ra3Na6eBQCj+Y8AtTIHvcc2jzF6s42pm8zZs9
 vUxUQMCJRGZen9FW+q9xm8w9xVOrMWw4tYaTynXr05TvReNQZj1AMOfrX
 wsdrD+hGzxyd0381I2smcK3ciwMCxEJC7L77Af49YeoCu+HFkULI/PKyD w==;
X-CSE-ConnectionGUID: T0dIavWiRNOnEAeRVDGqkQ==
X-CSE-MsgGUID: oY88WckuT3Wq57qXOs2fGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81122348"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="81122348"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 00:45:47 -0700
X-CSE-ConnectionGUID: 1j5+s1t7RyShqgiw0aVIQQ==
X-CSE-MsgGUID: wrX+9AxPRi6jX+DQlM8Mfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="241504869"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO fedora) ([10.245.245.65])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 00:45:44 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe: Fix wa_oob codegen recipe for external module builds
Date: Thu,  4 Jun 2026 09:45:00 +0200
Message-ID: <20260604074501.172129-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When building with 'make M=drivers/gpu/drm/xe modules', kbuild invokes
scripts/Makefile.build with obj=., causing $(obj) to expand to '.'.
Make normalizes './xe_gen_wa_oob' to 'xe_gen_wa_oob' when constructing
the $^ automatic variable (target name normalization), so the recipe
command becomes just 'xe_gen_wa_oob ...' without any path prefix, and
the shell cannot find the tool.

Fix by replacing $^ with explicit $(obj)/xe_gen_wa_oob and
$(src)/<rules-file> references in both wa_oob recipe commands.
In recipe strings, make does not apply target name normalization, so
$(obj)/xe_gen_wa_oob correctly expands to './xe_gen_wa_oob' and the
shell can execute it. This matches the pattern already used by other
DRM drivers (e.g. radeon's mkregtable).

Fixes: f037e0b78e6d ("drm/xe: add xe_device_wa infrastructure")
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 09661f079d03..8e7b146880f4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -16,14 +16,14 @@ subdir-ccflags-y += -I$(obj) -I$(src)
 hostprogs := xe_gen_wa_oob
 generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
 quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
-      cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
+      cmd_wa_oob = mkdir -p $(@D); $(obj)/xe_gen_wa_oob $(src)/xe_wa_oob.rules $(generated_oob)
 $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 		 $(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
 generated_device_oob := $(obj)/generated/xe_device_wa_oob.c $(obj)/generated/xe_device_wa_oob.h
 quiet_cmd_device_wa_oob = GEN	$(notdir $(generated_device_oob))
-      cmd_device_wa_oob = mkdir -p $(@D); $^ $(generated_device_oob)
+      cmd_device_wa_oob = mkdir -p $(@D); $(obj)/xe_gen_wa_oob $(src)/xe_device_wa_oob.rules $(generated_device_oob)
 $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe_gen_wa_oob \
 		 $(src)/xe_device_wa_oob.rules
 	$(call cmd,device_wa_oob)
-- 
2.54.0

