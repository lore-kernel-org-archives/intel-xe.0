Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6561125839
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADDB10E3EA;
	Wed, 11 Mar 2026 14:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmE/SUVS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D4310E8FA;
 Wed, 11 Mar 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238759; x=1804774759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=29GBgUZU7DhVGLj1I9LQo0QA0eCYb5ZaivVtiTJQSBs=;
 b=YmE/SUVS5vWGBWefGJohV1Yi9TA/yzn62PLWMW97E+1hBJliA7xRD5j0
 G+WgS0TXPkTgDkNv8IPZao4rAd0ATz8hN9tytEy1LhlzvIGiEmqrn0tRm
 2U1Rdelg0QP2Vf8BIbYV/Ef9qrLYnxnyeJALpuMhGrOVvYObAFMfHVOAH
 oC4pfYFlqn6Sl7jw9cUk8tsP4X4lM05tbpa8ifAgz+WDoHiPBsSP8ggBA
 Cm/ez8OCzFX3kxkdJYLNfboFgC/duk4sXjvP1vjsiUSqiz1JQ3QWv/9P4
 wIlsv3ywWJNuLVjkkn2Yk1DiSPRt4tcHBHwdD0jJfulEPr/EloxaRUM38 w==;
X-CSE-ConnectionGUID: y8jm+tLUTIqfdrTIEIuv6g==
X-CSE-MsgGUID: 2t7G4jIjQNuGpnWdfan2bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99775202"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99775202"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:19:18 -0700
X-CSE-ConnectionGUID: qZPoYdEkQ0qIC3w4KJ0+RQ==
X-CSE-MsgGUID: 61ujcOm0SwqmCqBvUt4a5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216730445"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2026 07:19:17 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 08/24] drm/i915/lt_phy: Add xe3plpd .put_dplls hook
Date: Wed, 11 Mar 2026 14:18:49 +0000
Message-ID: <20260311141905.2526418-9-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311141905.2526418-1-mika.kahola@intel.com>
References: <20260311141905.2526418-1-mika.kahola@intel.com>
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

Add .put_dplls function pointer to support xe3plpd platform
on dpll framework. Reuse ICL function pointer.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 9aa8eb0a7d4a..af2613eeaf92 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4654,6 +4654,7 @@ static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.dpll_info = xe3plpd_plls,
 	.compute_dplls = xe3plpd_compute_dplls,
 	.get_dplls = mtl_get_dplls,
+	.put_dplls = icl_put_dplls,
 };
 
 /**
-- 
2.43.0

