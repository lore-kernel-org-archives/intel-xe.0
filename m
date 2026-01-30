Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8209E6BF13
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 14:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A974F10E256;
	Fri, 30 Jan 2026 14:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFXiQU3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A1A10E256;
 Fri, 30 Jan 2026 14:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769782645; x=1801318645;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HkNmYZO6flnpykDLCcdvUneB97y/hCHX7hqUPOZ8v1M=;
 b=gFXiQU3of32V4iFsOiwvdEZa8S99vJ1jaj6JnH+kE+lRBccToVFbTht6
 9VJ1FsbhplayvkT9tnSlR7kbA9oPXLPijNnmIbl/9/y+vn2jaN+7S1rsc
 kszlihHsK7no1hL4BO8DtDmwo+imWMdnvT4jbDtZnzcQVsv8mzzZhEhSg
 B0QQSpB0hbQ1iG9fQMX9SzQrzXTKuwLodU6DZ5C/S+cZ7CFmm/VMfenpF
 vHJFnP/bLAumqlm/n7inP0mlzXfg9qfdGbTQSGRddnHN0FamDg2dWGF28
 SomRe8Ri11yAIAiQ5bPiCvwzpI+qXkNY41wfsfCcAL09pOrpUGsUkjzBd A==;
X-CSE-ConnectionGUID: 2g3UZ3+hQ3K8vlp/wb84eQ==
X-CSE-MsgGUID: IA1jb1lbRXmBM28kLw7dVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88606295"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="88606295"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:17:25 -0800
X-CSE-ConnectionGUID: sFa1IqjERcmEpoq+spwTcA==
X-CSE-MsgGUID: heH+Np2vSI2wBoSsF1C/0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="213757508"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa004.fm.intel.com with ESMTP; 30 Jan 2026 06:17:24 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	shuicheng.lin@intel.com
Subject: [PATCH v2] drm/xe/guc: Fix kernel-doc warning in GuC scheduler ABI
 header
Date: Fri, 30 Jan 2026 19:22:10 +0530
Message-Id: <20260130135210.2659200-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

The GuC scheduler ABI header contains a file-level comment that is not
intended to document a kernel-doc symbol. Using kernel-doc comment
syntax (/** */) triggers kernel-doc warnings.

With "-Werror", this causes the build to fail. Convert the comment to a
regular block comment.

HDRTEST drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
Warning: drivers/gpu/drm/xe/abi/guc_scheduler_abi.h:11 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
 * Generic defines required for registration with and submissions to the GuC
1 warnings as errors
make[6]: *** [drivers/gpu/drm/xe/Makefile:377: drivers/gpu/drm/xe/abi/guc_scheduler_abi.hdrtest] Error 3
make[5]: *** [scripts/Makefile.build:544: drivers/gpu/drm/xe] Error 2
make[4]: *** [scripts/Makefile.build:544: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:544: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:544: drivers] Error 2
make[1]: *** [/home/kbuild2/kernel/Makefile:2088: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

v2:
 - Add Fixes tag (Daniele)

Fixes: b0c5cf4f5917 ("drm/gt/guc: extract scheduler-related defines from guc_fwif.h")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
index 513b22a87428..19ec89bf39c5 100644
--- a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
@@ -8,7 +8,7 @@
 
 #include <linux/types.h>
 
-/**
+/*
  * Generic defines required for registration with and submissions to the GuC
  * scheduler. Includes engine class/instance defines and context attributes
  * (id, priority, etc)
-- 
2.25.1

