Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD98CCD4F4C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 04:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4485710E152;
	Mon,  9 Sep 2024 04:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKlaMSqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C877310E152;
 Mon,  9 Sep 2024 04:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725855349; x=1757391349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fjngCTaAkgMoNGsEToo127TtuEWe/XSwUcqDyzi5e0M=;
 b=FKlaMSqVe78UikqV4O8J+PJd/PRV+EqAt5xXSdJnAa9SkCl+KY6WjXWQ
 vUgz9T+ZFchySzaFKVPh9p8W9ApZXKYjJOJfTjwyngaIVNYwp1PveS/Gk
 bdKTt5Y88ogpzeLP673GOODTNQLUXz5HMD8EEToMzSg9bRwbXPpCPUi0G
 luxYOE/lDcwLeGPIuT34Dy+O9BP6VFYjhGTbY56eT6sr7d0D4ffwU7Aym
 58ygepWBLYpRbi1GGGbDsWTGJuR8WHBBN5yE39hUcNkZTu5p2+NnWutt4
 CVxwIgy6W/VOzTIds9vph/H3WVyV+icrwCl9X1qGHYtZEsJM+U9y8HGOD A==;
X-CSE-ConnectionGUID: nKTTH9zqT/qHMk9UZMj48Q==
X-CSE-MsgGUID: 1NQmjj4TRUu8YMTRm17E3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="42004729"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="42004729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2024 21:15:47 -0700
X-CSE-ConnectionGUID: cBLtfB9ORniCfb7xg55ufg==
X-CSE-MsgGUID: NWz0a6SPRNuXt7ip6x8Rvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="66167567"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2024 21:15:45 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2] drm: Ensure Proper Unload/Reload Order of MEI Modules for
 i915/Xe Driver
Date: Mon,  9 Sep 2024 09:33:17 +0530
Message-Id: <20240909040317.17108-1-krishnaiah.bommu@intel.com>
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

This update addresses the unload/reload sequence of MEI modules in relation to
the i915/Xe graphics driver. On platforms where the MEI hardware is integrated
with the graphics device (e.g., DG2/BMG), the i915/xe driver is depend on the MEI
modules. Conversely, on newer platforms like MTL and LNL, where the MEI hardware
is separate, this dependency does not exist.

The changes introduced ensure that MEI modules are unloaded and reloaded in the
correct order based on platform-specific dependencies. This is achieved by adding
a MODULE_SOFTDEP directive to the i915 and Xe module code.

These changes enhance the robustness of MEI module handling across different hardware
platforms, ensuring that the i915/Xe driver can be cleanly unloaded and reloaded
without issues.

v2: updated commit message

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/i915/i915_module.c | 2 ++
 drivers/gpu/drm/xe/xe_module.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index 65acd7bf75d0..2ad079ad35db 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -75,6 +75,8 @@ static const struct {
 };
 static int init_progress;
 
+MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");
+
 static int __init i915_init(void)
 {
 	int err, i;
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index bfc3deebdaa2..5633ea1841b7 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -127,6 +127,8 @@ static void xe_call_exit_func(unsigned int i)
 	init_funcs[i].exit();
 }
 
+MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");
+
 static int __init xe_init(void)
 {
 	int err, i;
-- 
2.25.1

