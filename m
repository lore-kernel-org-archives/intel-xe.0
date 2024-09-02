Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F1CCD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 14:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CA810E312;
	Mon,  2 Sep 2024 14:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEf09vjx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766A010E312
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725286974; x=1756822974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UiQL5rDhtoeO7M2WpQx80AISS5DuhdJvqeqWeQrVEaM=;
 b=hEf09vjxMTreQgOl8hz4IUr4gKcpyWd9xy35OxUOmgn0uSsbHIbbtO8G
 HRfFLjKdW6+8mrguoLsAb3kgWIcrD/Vrva4AX1WDeAeKu6QQ4oi4e4zQ/
 4q/gwTlqe2RjvX0MGL98QeJ+EiZJvOFcLT6lvNZAKvCOG+mBu1aalL9GJ
 pPo9vB1Cecgip/Sr7aex47Tt7YzhyyCzrJtSLM5mv2FPmAbtKW0wvkdBp
 LJ4q9MnXLV1JE7LEZlP4c7NmlCS+2yX8UgFcltPPpyZpI3jH+sIuxhY03
 GYts+9wYP6nTSl1MIWikLN67IXayDnAmgBQl1svRJWVT10gmaX9H7wY/k w==;
X-CSE-ConnectionGUID: 7yoHQr58S+CXuyFP8HUxdw==
X-CSE-MsgGUID: ekQbLanPTKuQHdqeZTUBHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35027085"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="35027085"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:22:54 -0700
X-CSE-ConnectionGUID: JBfU6ot7StGim0FkNHuagw==
X-CSE-MsgGUID: r0XgrHxIQoOUSK2UNc4wlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="95437034"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by fmviesa001.fm.intel.com with ESMTP; 02 Sep 2024 07:22:52 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules for
 i915/Xe Driver
Date: Mon,  2 Sep 2024 19:40:41 +0530
Message-Id: <20240902141041.18467-1-krishnaiah.bommu@intel.com>
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
with the graphics device (e.g., DG2/BMG), the MEI modules depend on the i915/Xe
driver. Conversely, on newer platforms like CLS, where the MEI hardware is
separate, this dependency does not exist.

The changes introduced ensure that MEI modules are unloaded and reloaded in the
correct order based on platform-specific dependencies. This is achieved by adding
a MODULE_SOFTDEP directive to the i915 and Xe module code.

These changes enhance the robustness of MEI module handling across different hardware
platforms, ensuring that the i915/Xe driver can be cleanly unloaded and reloaded
without issues.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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

