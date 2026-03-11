Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8224112583A
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9E910E8F7;
	Wed, 11 Mar 2026 14:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+yuCp+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA3810E915;
 Wed, 11 Mar 2026 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238761; x=1804774761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HpINkNE3+VbJ+5/LVs8gqbDr3W+rueE/hMZPM9e6ctc=;
 b=R+yuCp+HarDoI2qmgITesgY7w6cbtntCxrphjtOZqHRUsHOH7t7OgNyG
 StRFJfW12gFVhwDiTCMHp1XT3TLbzQ2ottXe/XlrqdZdTfKh0yXldHsEG
 +uki8fTqfTCDlE5x3+dv0aDyahiyyk82WoZv1yL/A7Y2uu5Ro2NploR4e
 OzWkGKzDsFgOy2e6VaBVY03ozV8+kOris3SxEgsuxEtgsFiuTX23ZfA3j
 NWU/+ChsqlOuC2IrDAufuVUS7/SHngmE+IhjVgtrQP3cczRNIn14pMw+F
 TeLb662IpaGhwpFwpxrM/vj2PROvIrg0H+1wCqnbyiJxnClKpOrW9ieF9 A==;
X-CSE-ConnectionGUID: 9dfJ875TSdaEkPia8388uw==
X-CSE-MsgGUID: fWV+S+jWSb+GeTQgr0L49w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99775211"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99775211"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:19:21 -0700
X-CSE-ConnectionGUID: EFMKN2X0T7Wj/AxEkFvuZg==
X-CSE-MsgGUID: puy/P8I3RtqmRLtjoP12OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216730473"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2026 07:19:19 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 10/24] drm/i915/lt_phy: Add xe3plpd .update_dpll_ref_clks
 hook
Date: Wed, 11 Mar 2026 14:18:51 +0000
Message-ID: <20260311141905.2526418-11-mika.kahola@intel.com>
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

