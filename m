Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5314FED2E4
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEAD10E9BB;
	Thu, 12 Mar 2026 08:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0tRrd8i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A453C10E9B9;
 Thu, 12 Mar 2026 08:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302838; x=1804838838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XsmZE1Z21n5+fS7HALmDFSPnoDEc6I8P0GUYavm2pDc=;
 b=P0tRrd8iNqm3OPxmQxfhHYf+mMoLFlaVuRF73okkLyWs2qz5ESIYwLL0
 Xmr+Y2YNcUKNXjwivC8qzunnlywY56VibMv7as3Lpyta77m5abflmQ/IF
 hxLmeOwifsZwZ0eW51/p8y4/lLl9OTm0JX9OZBzechVhZTr81xExb66AC
 cY/YiOLV+kw8ODT3aH0LAtDS6hyiL0LebJwRCORerIOlDA25KAodwPeUe
 64EoO24OzKXKYlVNBdoP1rOIQa1BAf0o4TSONFu3lkuirbANbQV8L6mEw
 8bK/IQjpdWrGCtSJWOS3/HhEhP3JqXfX3kmMsMo8zDuFQQB/7y24d15CT Q==;
X-CSE-ConnectionGUID: T519J+MPSuebj6XyiVyo7A==
X-CSE-MsgGUID: 4rbQhUnqR1SS4gGmniYcyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85013732"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85013732"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:07:18 -0700
X-CSE-ConnectionGUID: lQTT8wQNSrWx5n4cBAc5HA==
X-CSE-MsgGUID: 9dmoiSyiRv+R0Xegy/Si/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="223206866"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 01:07:17 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [CI v3 15/24] drm/i915/lt_phy: Add xe3plpd .crtc_get_dpll
Date: Thu, 12 Mar 2026 08:06:48 +0000
Message-ID: <20260312080657.2648265-16-mika.kahola@intel.com>
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

