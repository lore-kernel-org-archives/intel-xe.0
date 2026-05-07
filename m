Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB76CD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 21:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6885A10E2C8;
	Thu,  7 May 2026 21:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7aCknlG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789A910E2C8
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 21:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778187708; x=1809723708;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=NjD4MJXLJON4p8eWb8ctCI1jSZ73ItkvEwQKh1821Rg=;
 b=Y7aCknlGhbDZ96UBz6pxZ0eqXGjlez+cTLnL0txM8wVYkQavMEBip2If
 0yXWKY4qhLLVE3JLOL8UsELL5xw/c2fBZCBZ04vxc+9Wh80xnSb49Uez1
 veufB/vD3oSzSst5cSkFL/uWlkDOq4KkZGyPXsr5x9YMq40Wpmt4ICY4A
 ro11vu8bfxQiTMHd++1vx8UHdN0YCzqj6ZaMcvnRFuAuCln9CDLLheqkw
 MtgnKc7RjvEsUUeXkvKaJ9bhhz/XUoOqohxMt/uSXHUvLNIS1gss41QH0
 SljXyacjCIRIFlVry11Obw+q3G+WcSdsTTD1Ot6+TYZ8duHVZyMMOp339 A==;
X-CSE-ConnectionGUID: XixOP/FPSIa1LsHxGe+JYQ==
X-CSE-MsgGUID: iQtqhLd1TqGY6k8E6dTFcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79053262"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="79053262"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 14:01:48 -0700
X-CSE-ConnectionGUID: SAg8/+gKQza/G6KQgK2FvA==
X-CSE-MsgGUID: PTwbfL79SGS2YgyKi07V+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="235587729"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 14:01:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 07 May 2026 14:00:15 -0700
Subject: [PATCH] drm/xe: Make decision to use Xe2-style blitter
 instructions a feature flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-xe2_copy-v1-1-26506381b821@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNz3YpUo/jk/IJKXUuDFANTy5TEpFRzUyWg8oKi1LTMCrBR0bG1tQC
 eXhwSWgAAAA==
X-Change-ID: 20260507-xe2_copy-90d059dabe75
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5740;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=NjD4MJXLJON4p8eWb8ctCI1jSZ73ItkvEwQKh1821Rg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp/P27DyiqdXAMNY5jTn9fatzBcOncb/OGjFm2Q
 JzPP5G6w7eJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCafz9uwAKCRBNeSQFyHKQ
 BJSHD/97LufML7mIMub1D9kEjh1WyDgQYywhY2zdXSvO/HW9QkG95Meib7XR1W1HT14HZ0LIUs7
 ctuuWeDYuV7Q3uTW6sKooq+haKRnpF8xWiUbHDIg0MxuCBWhI4luig5HLLdeyMxxIQrr5qRDI9y
 jqohLXSPtrgNK018lPF8u3vw5UWdVNzQKAIG0yHpfDCv/0o7I6OrR9zWvRqoiHpsXtfe3Y5j5Fh
 k9OaFlV2EsX9MahOFZYFQsVFlchFWZe9z9VyxR/0ZjtiMM3fwSUxW+M0XiJ410xEvJjKell87DP
 7voU+zgan/9MDvHzOcwjq3VaeFAd0j122VEDFWlsabsC3Y8ozZfBRpkS+TKYysKBSplOEc6A4jl
 6E9Vgcnq1UUcRQ9h/UMueCTzGN3Ye9ksRS23QH4njTb+9utZFqa+mjK3ciW+5SulM2ORhdOfHwA
 U7l/UEnC+iv52LAD6qaeLzDSU4ZDYcFW6pUaMFwzKLJ2bsi47wOvKg4E/z4j4cjZl3Z1xuLYNPY
 /FaK8Ry63DcPMmuxBceE+5m02Zb/NeaPegOvJtWGUnVRFt45+zTpfYhlALo/PkoTvAUlcQIjhC0
 l9iRaxKYvaOKi25MXRZhz87ksS5kR1UvJ03B8GW55o9tOfDbjT/NvxhkDTyYs+2VFWiff0o75FT
 vNulAvjXfEvTiEA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

The blitter engines' MEM_COPY and MEM_SET instructions were added as
part of the same hardware change that introduced service copy engines
(i.e., BCS1-BCS8) which is why the driver checks for service copy engine
presence when deciding whether to use these instructions or the older
XY_* instructions.  However when making this decision the driver should
consider which engines are part of the hardware architecture, not which
engines are present/usable on the current device.  For graphics IP
versions that architecturally include service copy engines (i.e.,
everything Xe2 and later, plus PVC's Xe_HPC) we should use MEM_SET and
MEM_COPY even in if all of the service copy engines wind up getting
fused off.  I.e., we need to decide based on whether the platform's
graphics descriptor contains these engines, rather than whether the
usable engine mask contains them.  This logic got broken when
gt->info.__engine_mask was removed, although in practice that mistake
has been harmless so far because there haven't been any hardware
SKUs that fuse off all of the service copy engines yet.

Replace the incorrect has_service_copy_support() function with a GT
feature flag that tracks more accurately whether the new blitter
instructions are usable.  In addition to fixing incorrect logic if all
service copies are fused off, the flag also makes it more obvious what
the calling code is trying to do; previously it wasn't terribly obvious
why "has service copy engines" was being used as the condition for using
different instructions on all copy engine types.

The new feature flag is named 'has_xe2_blt_instructions' because we
expect this flag to be set for all Xe2 and later platforms (i.e.,
everything officially supported by the Xe driver).  Technically there's
also one Xe1-era platform (PVC) that supports these engines/instructions
and will set this flag, but this still seems to be the most clear and
understandable name for the flag.

Fixes: 61549a2ee594 ("drm/xe: Drop __engine_mask")
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h |  6 ++++++
 drivers/gpu/drm/xe/xe_migrate.c  | 18 ++----------------
 drivers/gpu/drm/xe/xe_pci.c      |  9 +++++++++
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7351aadd238e..231555092435 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -144,6 +144,12 @@ struct xe_gt {
 		u8 id;
 		/** @info.has_indirect_ring_state: GT has indirect ring state support */
 		u8 has_indirect_ring_state:1;
+		/**
+		 * @info.has_xe2_blt: GT supports Xe2-style MEM_SET and MEM_COPY
+		 * blitter functionality.  Note that despite the name, some Xe1
+		 * platforms may also support this "Xe2-style" feature.
+		 */
+		u8 has_xe2_blt_instructions:1;
 		/**
 		 * @info.num_geometry_xecore_fuse_regs: Number of 32b-bit fuse
 		 * registers the geometry XeCore mask spans.
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index a87fbc1e9fb1..f3c2ef269ba8 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1525,23 +1525,9 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
 	bb->len += len;
 }
 
-static bool has_service_copy_support(struct xe_gt *gt)
-{
-	/*
-	 * What we care about is whether the architecture was designed with
-	 * service copy functionality (specifically the new MEM_SET / MEM_COPY
-	 * instructions) so check the architectural engine list rather than the
-	 * actual list since these instructions are usable on BCS0 even if
-	 * all of the actual service copy engines (BCS1-BCS8) have been fused
-	 * off.
-	 */
-	return gt->info.engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
-					      XE_HW_ENGINE_BCS1);
-}
-
 static u32 emit_clear_cmd_len(struct xe_gt *gt)
 {
-	if (has_service_copy_support(gt))
+	if (gt->info.has_xe2_blt_instructions)
 		return PVC_MEM_SET_CMD_LEN_DW;
 	else
 		return XY_FAST_COLOR_BLT_DW;
@@ -1550,7 +1536,7 @@ static u32 emit_clear_cmd_len(struct xe_gt *gt)
 static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 		       u32 size, u32 pitch, bool is_vram)
 {
-	if (has_service_copy_support(gt))
+	if (gt->info.has_xe2_blt_instructions)
 		emit_clear_link_copy(gt, bb, src_ofs, size, pitch);
 	else
 		emit_clear_main_copy(gt, bb, src_ofs, size, pitch,
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d55e5af4f4b7..2ab6d2f483fb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -850,6 +850,15 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	gt->info.num_geometry_xecore_fuse_regs = graphics_desc->num_geometry_xecore_fuse_regs;
 	gt->info.num_compute_xecore_fuse_regs = graphics_desc->num_compute_xecore_fuse_regs;
 
+	/*
+	 * Even if the service copy engines wind up being fused off, their
+	 * presence in the IP descriptor indicates that the platform supports
+	 * Xe2-style MEM_SET and MEM_COPY functionality.
+	 */
+	if (graphics_desc->hw_engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
+						    XE_HW_ENGINE_BCS1))
+		gt->info.has_xe2_blt_instructions = true;
+
 	/*
 	 * Before media version 13, the media IP was part of the primary GT
 	 * so we need to add the media engines to the primary GT's engine list.

---
base-commit: 36eddf6e5c9411ad95c4939b092ed1ea77f13d61
change-id: 20260507-xe2_copy-90d059dabe75

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

