Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FC61125839
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01ADC10E8FB;
	Wed, 11 Mar 2026 14:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6egtR+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EE910E8C5;
 Wed, 11 Mar 2026 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238757; x=1804774757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t1jQcObCcH2Ju+ak5HWnL88ivLpZd5+RuuJ6SPRbC1I=;
 b=T6egtR+a3Iw2VCjSMYst97FDGy5JjULp6ZvO0jyizaKl9AslXkePo+Q1
 ScyKhK1A3VgkQBtOQv+v+GQDj5GE7tgtVZyHMZGjAA1Eu1A1+qLHp8Jiz
 nmjlkOJ8VRoTvOW3+pgzk7iNcA4SK6yZdCcVyKagys51S9X0jdn+DsWxT
 R4TD9VeuRE2yzqS1rvoMXNGBz3hce6hecJuBe+r4IKxMm4SXYFdB7jMfk
 mfJmh0up1ElG3s78KyMRCUC/VgF7P58iDjjDeTWPMczrTXgMmRp8L6o9O
 fdp/IApTX6MCslAFM4Qp1ou5vRpVJ9+aK0jWU5VUmS0HgBDCPn3nhQ3PZ Q==;
X-CSE-ConnectionGUID: ePq62/erQHi14qTZQb/VBQ==
X-CSE-MsgGUID: wjswkyayQZ2LIYRi1/XkbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99775194"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99775194"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:19:17 -0700
X-CSE-ConnectionGUID: 2kWoa6xxRC+AwdLK8CDX6A==
X-CSE-MsgGUID: l8aNk3wCQpms+f+nd5Jd4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216730433"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2026 07:19:15 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 07/24] drm/i915/lt_phy: Add xe3plpd .get_dplls hook
Date: Wed, 11 Mar 2026 14:18:48 +0000
Message-ID: <20260311141905.2526418-8-mika.kahola@intel.com>
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

Add .get_dplls function pointer for xe3plpd platforms
to support dpll framework. Reuse the ICL function
pointer.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 58c24e2164ca..9aa8eb0a7d4a 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4653,6 +4653,7 @@ __maybe_unused
 static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.dpll_info = xe3plpd_plls,
 	.compute_dplls = xe3plpd_compute_dplls,
+	.get_dplls = mtl_get_dplls,
 };
 
 /**
-- 
2.43.0

