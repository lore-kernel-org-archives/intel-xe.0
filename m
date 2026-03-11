Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E73112583B
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6561C10E911;
	Wed, 11 Mar 2026 14:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMfyPoG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590F310E919;
 Wed, 11 Mar 2026 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238767; x=1804774767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XsmZE1Z21n5+fS7HALmDFSPnoDEc6I8P0GUYavm2pDc=;
 b=mMfyPoG+VFKDmmp1XYoj1WlH313IlbIIP5BmL44a3UfoPVT5g+Chg9Kw
 GW0NR8QanxDAYQpCwJ/cKPXvS1N9MEF0rIti7Oz/F60zbBaEPttLGzIvN
 ymTCsqUzjE9V4/AmtAsNJTAHu90fJzO7hoy5iZmehtciluCoWK1mlGsNl
 VyTDZ1Yi5+0bf8Gx/VpH3gF4+ErtDKPT94/dQsV6UMauzUbLIEr4D1PEZ
 /QoLDcGmCyUnPsaz6Te6YICBPdLtGu/Krza+vS3dvujX6Ea4UVrefZzyU
 UJFebdD+qNj9xFsZcRlGFnMuD6iB/kjfMRSw8f1cfVMSyNiSCaWPTb5i4 Q==;
X-CSE-ConnectionGUID: atH2w/mqQnC5BeyI1I0oUw==
X-CSE-MsgGUID: 5QMNMHnGQO+VYO1oE5Lnow==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99775244"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99775244"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:19:27 -0700
X-CSE-ConnectionGUID: BUPGPAAhSn6ShwkTm1IGWw==
X-CSE-MsgGUID: 0q30vImvTNWBKAqnRuWrOA==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216730518"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2026 07:19:26 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 15/24] drm/i915/lt_phy: Add xe3plpd .crtc_get_dpll
Date: Wed, 11 Mar 2026 14:18:56 +0000
Message-ID: <20260311141905.2526418-16-mika.kahola@intel.com>
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

Add .crtc_get_dpll function pointer to support xe3plpd
platform.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 147baa777856..e13a5e12109d 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -1696,6 +1696,7 @@ static int i8xx_crtc_compute_clock(struct intel_atomic_state *state,
 
 static const struct intel_dpll_global_funcs xe3plpd_dpll_funcs = {
 	.crtc_compute_clock = xe3plpd_crtc_compute_clock,
+	.crtc_get_dpll = hsw_crtc_get_dpll,
 };
 
 static const struct intel_dpll_global_funcs mtl_dpll_funcs = {
-- 
2.43.0

