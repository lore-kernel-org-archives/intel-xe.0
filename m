Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9312ECD4851
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 11:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B5A10EC72;
	Tue, 19 May 2026 11:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+gDn2Zb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B365310EC6C;
 Tue, 19 May 2026 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779189784; x=1810725784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3GmO9xt/RY4f28hUdvLLrD45bl+dJTBiQF/Nu1qTpnw=;
 b=m+gDn2ZbW0chCoPnR94GD1pnUoEvnOEcnSX14bjGSfl6KOGQnQFXXNRt
 H9aQE9YfC7rOK+5z0uGS281nvP2M7nGDQDiQvKA9zcVimQwynruWL9Cgi
 g4TfGS1m0Upqsq5t59VKIajB5muqIYV6zvLXPSW/c+BMWqwdYbPwbeN+D
 nOY0UKHRj2Z7Zfar++Ot5QII+DUizod/UsctzM2N5pOPyeSA3XRMvgBtk
 LMcPohI081Isnk8AmLgQxizta0k7s8obVsvXok0zT6musm6GdylX80XR9
 fId8r7k2okvr7zdG1lCVPddnNzSdJAsGl/Ai/BDTgcfZ0VvVunLHm87Os A==;
X-CSE-ConnectionGUID: /vByM0OEQ5aybII7No2n8Q==
X-CSE-MsgGUID: 0QNVY4wISXOBFbnal1bz1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97498519"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="97498519"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:23:03 -0700
X-CSE-ConnectionGUID: wazGstbwSWCSo0IBNPWebQ==
X-CSE-MsgGUID: 3CIcZx2mTXKLHw/wQQdxuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239606458"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.12])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:23:02 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/display: harden shift in
 intel_pmdemand_update_phys_mask()
Date: Tue, 19 May 2026 14:11:16 +0300
Message-ID: <20260519112243.1454375-5-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519112243.1454375-1-luciano.coelho@intel.com>
References: <20260519112243.1454375-1-luciano.coelho@intel.com>
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

BIT() takes a non-negative shift amount, but phy is of type enum phy,
which can in theory be PHY_NONE (-1).

This is not a problem with the current implementation, because phy is
always valid when this code is reached (Type-C encoders are rejected
earlier), but it's more robust to store it as unsigned int so the
shifts are always well-defined.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pmdemand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pmdemand.c b/drivers/gpu/drm/i915/display/intel_pmdemand.c
index 7819b724795b..d02ac2408e29 100644
--- a/drivers/gpu/drm/i915/display/intel_pmdemand.c
+++ b/drivers/gpu/drm/i915/display/intel_pmdemand.c
@@ -150,7 +150,7 @@ intel_pmdemand_update_phys_mask(struct intel_display *display,
 				struct intel_pmdemand_state *pmdemand_state,
 				bool set_bit)
 {
-	enum phy phy;
+	unsigned int phy;
 
 	if (DISPLAY_VER(display) < 14)
 		return;
-- 
2.53.0

