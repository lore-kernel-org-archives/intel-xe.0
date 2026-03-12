Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B279EFED2ED
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FF910E9AF;
	Thu, 12 Mar 2026 08:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDQ2ZYVD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C10B10E9AD;
 Thu, 12 Mar 2026 08:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302832; x=1804838832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HpINkNE3+VbJ+5/LVs8gqbDr3W+rueE/hMZPM9e6ctc=;
 b=JDQ2ZYVDqpIlK2QIsTMqYpHyaCLmLv7rQTQRDqBGFw+tzAosJ/I31Wkt
 /cOhLcI9NrAQ82ubi7zS+zP1kjZ6VliClTTQgT/6cVbIqxhiyi8FYfftp
 KloG46jCvmDmkrEnPlsmjby/lrgG5KOi14cwq81kQd1uo2yd3A60ZLF+v
 JpIhl/6B86Trj4anoM3eaiuppra9Q+oPnNojPUZNPvv78Cngkkjkap9oX
 PDsZqs1B5KuXtsIQ5MTTfxeIeJ3WSeAk+uhbZAMbob/QstczFcso/a9v3
 bCPz7CyNd5JzZYKUbyfCpHYB4CJiO+czucxnRslNh50W4t5S8KkMMTwSL Q==;
X-CSE-ConnectionGUID: rhVYhnvDRGKhgi7rIIB9GQ==
X-CSE-MsgGUID: qDnk6yTMSjmbicIPHWyWbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85013725"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85013725"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:07:12 -0700
X-CSE-ConnectionGUID: bjvuQcNWT5WHm0Q5GVh3Og==
X-CSE-MsgGUID: GIvV8LCgRvCaQIhRreHqAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="223206836"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 01:07:11 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [CI v3 10/24] drm/i915/lt_phy: Add xe3plpd .update_dpll_ref_clks hook
Date: Thu, 12 Mar 2026 08:06:43 +0000
Message-ID: <20260312080657.2648265-11-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080657.2648265-1-mika.kahola@intel.com>
References: <20260312080657.2648265-1-mika.kahola@intel.com>
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

Add .update_dpll_ref_clks function pointer to xe3plpd
platform to support dpll framework. Reuse ICL
function pointer.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index c1ed44b23bba..b50f02303356 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4656,6 +4656,7 @@ static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.get_dplls = mtl_get_dplls,
 	.put_dplls = icl_put_dplls,
 	.update_active_dpll = icl_update_active_dpll,
+	.update_ref_clks = icl_update_dpll_ref_clks,
 };
 
 /**
-- 
2.43.0

