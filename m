Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB1BCF9C6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 21:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E5110E15C;
	Tue, 24 Sep 2024 21:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2gLnmMD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950A810E15C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727213845; x=1758749845;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h8TfSFydo2Xbta0iBUAEX0TNRzhjcMTUkqR0gePtBGA=;
 b=S2gLnmMD9XPKFB0ZNDKw08bn/J0PE7vHOBvA2wInarqVrL7RAFyCxRo2
 VxhcPHmF6Z014oFUnVet3LSSHOO1Ewd9GveteUAYMUHP5in1Cjx/s+t5P
 IpuLFxBnTjVhuJ1MkMkqkjxCscvrlcH1PIUW1VRFjnZ9QVzms4jptVVqZ
 cMtvR4axK5hvX6QDphjX3Fthqkgx8IAo6wCQfHVGOfk2B0yoHs4szAShh
 DIVsXhw1dDnfK9Sk8/oBP6G4h/kvkvUo/v2swZCWzvNjowangHdnuV9uv
 4/cXZLaWv6v4wS+BP5dv1MROvfvV16yGSW0he5IHNPcu9CwWR0ncJmI6O Q==;
X-CSE-ConnectionGUID: 8ro5cAN+TCul3EqgSilS8w==
X-CSE-MsgGUID: F3irzv1YQZarYJBzVPeX/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="48768718"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="48768718"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 14:37:25 -0700
X-CSE-ConnectionGUID: +VWicgsWSx2/UQ9EGEvy9g==
X-CSE-MsgGUID: XsRr/FSAT26qriNFcXmfpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="76311215"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 14:37:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close
Date: Tue, 24 Sep 2024 14:37:13 -0700
Message-ID: <20240924213713.3497992-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: José Roberto de Souza <jose.souza@intel.com>

Mesa testing on Xe2+ revealed that when OA metrics are collected for an
exec_queue, after the OA stream is closed, future batch buffers submitted
on that exec_queue do not complete. Not resetting OAC_CONTEXT_ENABLE on OA
stream close resolves these hangs and should not have any adverse effects.

v2: Make the change that we don't reset the bit clearer (Ashutosh)
    Also make the same fix for OAC as OAR (Ashutosh)

Bspec: 60314
Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
Fixes: 14e077f8006d ("drm/xe/oa: Add OAC support")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2821
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/xe/xe_oa.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 6d17f89a132d2..30bfba6c744ca 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -765,8 +765,7 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 		{
 			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
 			regs_offset + CTX_CONTEXT_CONTROL,
-			_MASKED_FIELD(CTX_CTRL_OAC_CONTEXT_ENABLE,
-				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0)
+			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE),
 		},
 	};
 	struct xe_oa_reg reg_lri = { OAR_OACONTROL, oacontrol };
@@ -798,10 +797,8 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
 		{
 			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
 			regs_offset + CTX_CONTEXT_CONTROL,
-			_MASKED_FIELD(CTX_CTRL_OAC_CONTEXT_ENABLE,
-				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0) |
-			_MASKED_FIELD(CTX_CTRL_RUN_ALONE,
-				      enable ? CTX_CTRL_RUN_ALONE : 0),
+			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE) |
+			_MASKED_FIELD(CTX_CTRL_RUN_ALONE, enable ? CTX_CTRL_RUN_ALONE : 0),
 		},
 	};
 	struct xe_oa_reg reg_lri = { OAC_OACONTROL, oacontrol };
-- 
2.41.0

