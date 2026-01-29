Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D479ED358D2
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 07:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8332E10E7DA;
	Thu, 29 Jan 2026 07:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMaaGqSY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FF010E7D9
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 07:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769671641; x=1801207641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IuC7XURrzYB3d5znHzzBCNJSkegynUsozaC9QbLVTmM=;
 b=BMaaGqSYjnH6hAfDTjM0PUXfr0O5XfBHxBiWbD/rasceXGakeGXRhhqI
 DTgQmjSdb+tAuDiNuyxZeaEyvmVRMNrAEletAbjSgF0qMTw9sBVQNwpxi
 Z3XESaCJve5ptc4eYBISQYa3SPYx9spnTvKYd6jngVPbUw90LlrBwr22v
 CP93gT6WxShkkNWexuWaMF6kOOqwV4QOoouA6/WtMfz/6ipQ6wk0cB1A1
 nNT/ns8anelYPPRlSTJa16DWFSt9T4DezQwJDOlOrbRP1SeLDOEzQzSu3
 SXcLmbO9DjmDd11aA5soxwjpF5gL8RQBPy8Icj1h0y3catkyes0dY2y3c g==;
X-CSE-ConnectionGUID: B2IGk9pjRIiLA+SOy0+7+A==
X-CSE-MsgGUID: fukITtOIQfC4AUIct4d+XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="93561871"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="93561871"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:27:21 -0800
X-CSE-ConnectionGUID: U6jN3+jDTca0ADJkDUPFmw==
X-CSE-MsgGUID: XnBZNLy8TICC2+OyogetXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="212579499"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:27:21 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 2/3] Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State for
 xe3p_xpc"
Date: Wed, 28 Jan 2026 23:27:00 -0800
Message-ID: <20260129072706.2587551-7-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260129072706.2587551-5-julia.filipchuk@intel.com>
References: <20260129072706.2587551-5-julia.filipchuk@intel.com>
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

This reverts commit 81e77c028848b7131d7653dd443a4049334a920b.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b5e8935fff1d..779546ec8836 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -108,7 +108,6 @@ static const struct xe_graphics_desc graphics_xe2 = {
 
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	XE2_GFX_FEATURES,
-	.has_indirect_ring_state = 1,
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
-- 
2.51.0

