Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6503CC3065B
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 05:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7824F10E76A;
	Wed, 26 Jun 2024 05:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfL8Qllk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28D810E76D;
 Wed, 26 Jun 2024 05:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719378026; x=1750914026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kis3AcKmG8a2RgcMQdmfmg5V0GJ+Jn92dnhpzXC/BDE=;
 b=GfL8QllkMdrLTIAEWK/CZWYpZD852jeZeAaInJhW4R7xchExdOKUVfCE
 vm1hkrHrnJuskc/zjOjHX1oxlMQdvY34WyQGNdr5dBQi4BxWM3bIDKd3A
 QSjteqtI8TWAipx4z9PzDc931qK33IN79Bj+1J8s6N5v6Un2n4pweglKv
 yyWDqYbCmR9GJbuMGDz+IAKJSkFmTr69rgu7R5L0j5yEEO/a3rg5wqVeZ
 kjTU0PVuBRe5BODLTqH0NXv3MlDbLHsZN+ue77kAA13IxFEAewfQsrKkT
 lSATHmgfLz1yG88XdtgFSafkvFz7o6PCslXe9tJngXIrtGg/6MshshY65 A==;
X-CSE-ConnectionGUID: 266MmokET9aKkv+m2GozGw==
X-CSE-MsgGUID: pKjWztptRRCX81ug/RnU2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33962386"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="33962386"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 22:00:26 -0700
X-CSE-ConnectionGUID: 5tsU6flUQWadE16RAevb5A==
X-CSE-MsgGUID: SwoxHEawT4uVkye2kkUEMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="44588306"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 22:00:23 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com,
 mika.kahola@intel.com, matthew.d.roper@intel.com
Subject: [PATCH 5/5] drm/xe: Add intel_pll_algorithm in Makefile
Date: Wed, 26 Jun 2024 10:30:56 +0530
Message-Id: <20240626050056.3996349-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240626050056.3996349-1-ankit.k.nautiyal@intel.com>
References: <20240626050056.3996349-1-ankit.k.nautiyal@intel.com>
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

Include the intel_pll_algorithm for xe driver.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 478acc94a71c..30b63c2eadd0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -261,6 +261,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_modeset_setup.o \
 	i915-display/intel_modeset_verify.o \
 	i915-display/intel_panel.o \
+	i915-display/intel_pll_algorithm.o \
 	i915-display/intel_pmdemand.o \
 	i915-display/intel_pps.o \
 	i915-display/intel_psr.o \
-- 
2.40.1

