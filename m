Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16D2D1D86A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 06:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8376710E84C;
	Thu,  4 Dec 2025 06:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoYyxgfB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7494910E85D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 06:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764830096; x=1796366096;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ro1SHcwbs1iclRHCxDGEYcShBPLc0MB+xmN4rHWpXxc=;
 b=XoYyxgfBmHCxDFpAXTqa13bnRN1RRoyDJbzH0zybwnqWUIeZHG0uWQIr
 RdbIAy1MJuozD+T4Ay6n4tD6qdMr6A2CCjesYZaOzyelMan0vX0bevIXD
 BX7lhsqDbI0+fBaJsymGD6pSUmBHNuomzUQhAXH7phpp1DX6MycwW0KNw
 wytanfO2r6bu22q1n+6nUmNp46/36xebUhCjZ/d8TgCPS1g3WdVOqOrTl
 uJ9epUu6nV06JVh66OTnRELQaxD0mIb/QIQ+PtEqSQiv5D24om/ofhy47
 dm0vCdqFdc+jakBjmKk4jkT9//LhD4tbGGe0iKXk16Ubg0bnqYqsmHAxi g==;
X-CSE-ConnectionGUID: gw6X5ISjQQOnelSbXWl+ew==
X-CSE-MsgGUID: NnGgwnfPT8aYIGPMa20PkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92320348"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="92320348"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 22:34:56 -0800
X-CSE-ConnectionGUID: nP3PPS0STliwKBygGu1Q6g==
X-CSE-MsgGUID: tMkxWewmTQCOkhdyXoWjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="194797862"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 22:34:56 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc
Date: Wed,  3 Dec 2025 22:34:52 -0800
Message-ID: <20251204063451.1180387-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

The xe3p_xpc platform supports Indirect Ring State and
it is required for the upcoming multi-queue feature.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8dd0ea9d1d56..c8188a5b0f76 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -108,6 +108,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
 
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	XE2_GFX_FEATURES,
+	.has_indirect_ring_state = 1,
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
-- 
2.43.0

