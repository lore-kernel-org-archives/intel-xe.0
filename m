Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B63C30659
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 20:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2E410E740;
	Tue, 25 Jun 2024 20:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hy45Y6kN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C939410E73E;
 Tue, 25 Jun 2024 20:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719347236; x=1750883236;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SblDvzMzV03r8b766tPZ60LvwKKHX+7zkU67cT8roI8=;
 b=Hy45Y6kN5c2s/bWMMj/zic8k7ilhiW5LCl2RbQ0kwrtS60J+8DfkSZUM
 c7lZKGF94KrgtPo1Li00G0Oogm4ApCcoTo3M3fYl88uNNrBlIey87sJ8Z
 G1e5w+2Mkfwr/cfAiKmnQuEpfVjrTC+GUubVcaH+yKUzqVQMMlMT1q2Fy
 LU9hhP+u6zVTgzen+IjHS9lnGb+o/fwMawlbSOog8NFQUeIbbtPkUO1kV
 l0lU0Cv4a42+umJNv/kokEAAC2BELTjqBlhB9B65tDL2feHfesmW0Yct7
 udf9eihBHczCIdm8Yoifb4BrTha8YkGm90duUDSqSCZogp/pyw+7+gWXF A==;
X-CSE-ConnectionGUID: Hu2jFNRuSsK6C+KDl9mgTg==
X-CSE-MsgGUID: 9HjNUHN6Sd+xYnCbWy4ZFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="26978795"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="26978795"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:27:15 -0700
X-CSE-ConnectionGUID: oC8X7YvhSWS5ZhaPSZiz4w==
X-CSE-MsgGUID: ZS3A0oy0QgGKqK7IuDabmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48151341"
Received: from jdoman-desk1.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.221.248])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:27:12 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915: Skip programming FIA link enable bits for MTL+
Date: Tue, 25 Jun 2024 17:26:52 -0300
Message-ID: <20240625202652.315936-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.2
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

Starting with Xe_LPDP, support for Type-C connections is provided by
PICA and programming PORT_TX_DFLEXDPMLE1(*) registers is not applicable
anymore. Those registers don't even exist in recent display IPs. As
such, skip programming them.

Bspec: 65750, 65448
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_tc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 9887967b2ca5..6f2ee7dbc43b 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -393,6 +393,9 @@ void intel_tc_port_set_fia_lane_count(struct intel_digital_port *dig_port,
 	bool lane_reversal = dig_port->saved_port_bits & DDI_BUF_PORT_REVERSAL;
 	u32 val;
 
+	if (DISPLAY_VER(i915) >= 14)
+		return;
+
 	drm_WARN_ON(&i915->drm,
 		    lane_reversal && tc->mode != TC_PORT_LEGACY);
 
-- 
2.45.2

