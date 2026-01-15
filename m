Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20D2C79FBC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 14:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A7710E8AF;
	Fri, 16 Jan 2026 14:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hTmWoAYo";
	dkim-atps=neutral
Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com
 [74.125.82.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C8210E7B2
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 16:55:47 +0000 (UTC)
Received: by mail-dy1-f202.google.com with SMTP id
 5a478bee46e88-2b0530846d3so1602757eec.0
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 08:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768496147; x=1769100947;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=PLXGn1QR8al8y7EJzJwHSSj36APCQlbUzzX4fIWvPiM=;
 b=hTmWoAYoVfc+usm/fhW7ufyJ+W9ndlyfGTgXK+q6RmEAAV8HMGVGC+UFtRtPoJ/huI
 5NZNBeR2Bn692w2hq5OEkHfUP1pOOmyec5Ba+inqvzbE3DvhOpdXygTbD9ncRHSe6O1V
 JYHyCSLvTgVHfHXmDpufuO4pGTVaeT0kcUptNYMJYbdEVeIyZlw5hKsSmcfI5Ix9ZLDE
 r8Ix+3VrZqtiX/8XKtcu+QkQt3QS6z7Y0YbPcZn9AB7K2yf6sfqV87clfDOahG6rN+gy
 loYIio+U6f2QM/j97NFQIwK93YrejBqXrRY2SYFm2wqLWnJlJfFGNgZcxzITVdUVuQ7k
 W/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768496147; x=1769100947;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PLXGn1QR8al8y7EJzJwHSSj36APCQlbUzzX4fIWvPiM=;
 b=vehnhlfDIwsnzcW5uXbUCoRIkFmJaryXTDISPCwGOhozg6tmZqiKuDFHNWXnSD3VmE
 uSgn+CPcWCEbXiQ/KH6MpFjLpxfgUlErJ8o5N1YmyZ+XD1PDcGZsExfLCzDK13gCt77G
 HRdXcFACz3fGzmiucWnTBy+2328JqKFSXwlCtZ2kzHO9oTbgurSfz8s3PlEhXURgtm93
 UfrBraVcHp+k6e/idUVE/xToAE31BXmt2B4BNb0lUNREoR2YABLQbenfN92impPKMIQI
 o3afYEvbysLFgsR+MCHD1DUVc9NVtxzRRUL0Y9cNEIAxMdcPsbnkoNvgQAXfJElEwZ1O
 iIqg==
X-Gm-Message-State: AOJu0YzbiHKdFaC9BldycwrQSAQ2gW2ouc2BM53l7ILezh68Y5vvf4Sz
 20d22UD43OmUApwPQowOVnYg87AAVBI7cWSDz/+y4f1XoqVM8y18Id40wgGIToJV+UOOSo4E0iE
 cqufwES5fguymnCFL/4jqDz4wY098N7wI4ADRTq8rWyU0vH2H1yM84B1i8N6UQEYXkaXB7GHmXx
 XKOl73CtYoUlTkLsCt9TbJQeW8qjtDtONYcav2xu7rLDLCBmefcoKIpJ1bGQ==
X-Received: from dycjx24.prod.google.com
 ([2002:a05:7300:fd18:b0:2b0:4a35:713f])
 (user=jdsultan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:3749:b0:2b0:6a03:e620 with SMTP id
 5a478bee46e88-2b6b40ca5c2mr45511eec.24.1768496146793; 
 Thu, 15 Jan 2026 08:55:46 -0800 (PST)
Date: Thu, 15 Jan 2026 08:54:50 -0800
In-Reply-To: <20260115-upstream-prep-v1-0-001d5b38fc11@google.com>
Mime-Version: 1.0
References: <20260115-upstream-prep-v1-0-001d5b38fc11@google.com>
X-Developer-Key: i=jdsultan@google.com; a=ed25519;
 pk=RhTSABMOTIhvVE7NYiZwn1iDGYYNbaN092nvaEF2dxo=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768496136; l=7041;
 i=jdsultan@google.com; s=20260115; h=from:subject:message-id;
 bh=aVMMfovxhYIny/shD10fV7cLIhOKyQLxP17KivWe5OA=;
 b=eMH/Epgat0mhRIP7h8F/awizYRNgVh4mUjwyd1YMPNPOQPcMJBCEqQrFf0gRHHgToyJWxo1ma
 m6anvXVNcKGAnS2rPTCurvguhSEiMRxM6RNJKlA1nhk4HhnZjybQMnJ
X-Mailer: b4 0.14.2
Message-ID: <20260115-upstream-prep-v1-4-001d5b38fc11@google.com>
Subject: [PATCH RFC 04/10] drm/xe/display: Fix initial plane reconstruction
 and stolen memory handling
From: Juasheem Sultan <jdsultan@google.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Sean Paul <seanpaul@google.com>, Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, Juasheem Sultan <jdsultan@google.com>
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Fri, 16 Jan 2026 14:02:59 +0000
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

To successfully hand off the display from BIOS to the Xe driver (fastboot),
we must accurately reconstruct the initial plane state and wrap the
firmware-allocated framebuffer.

This patch addresses several issues preventing this:

1.  **Physical Address Resolution**: Instead of assuming a linear offset,
    read the GGTT PTEs directly in `initial_plane_phys_smem` to resolve
    the actual physical address of the BIOS framebuffer.

2.  **Stolen Memory Management**: Register the TTM driver manager for
    `XE_PL_STOLEN` in `xe_ttm_stolen_mgr_init`. This is required to
    allocate/wrap buffer objects in stolen memory for the initial plane.

3.  **Active State enforcement**: Force `uapi.active` to true for all CRTCs
    during `intel_initial_plane_config`. The software state might not
    yet reflect the hardware state (left active by BIOS), and this ensures
    the driver attempts to read out the configuration.

4.  **Visual Verification**: Write a test gradient pattern to the
    initial framebuffer upon successful mapping to verify write access
    and correct mapping.

Signed-off-by: Juasheem Sultan <jdsultan@google.com>
---
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 53 ++++++++++++++++++++++
 drivers/gpu/drm/xe/display/xe_plane_initial.c      | 28 +++++++++++-
 drivers/gpu/drm/xe/xe_ggtt.h                       |  3 ++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c             |  2 +
 4 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index a9f36b1b50c1da90bfd0a69538009e8c330d9b2b..2ffdb274bc36b4ee344ce6b61e226ce32d20f1e9 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -121,6 +121,51 @@ initial_plane_phys(struct intel_display *display,
 	return true;
 }
 
+static bool
+initial_plane_phys_smem(struct intel_display *display,
+			struct intel_initial_plane_config *plane_config)
+{
+	struct drm_i915_private *i915 = to_i915(display->drm);
+	gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
+	struct intel_memory_region *mem;
+	dma_addr_t dma_addr;
+	gen8_pte_t pte;
+	u32 base;
+
+	base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
+
+	gte += base / I915_GTT_PAGE_SIZE;
+
+	pte = ioread64(gte);
+
+	dma_addr = pte & GEN12_GGTT_PTE_ADDR_MASK;
+
+	mem = i915->mm.stolen_region;
+	if (!mem) {
+		drm_dbg_kms(display->drm,
+			    "Initial plane memory region not initialized\n");
+		return false;
+	}
+
+	/* FIXME get and validate the dma_addr from the PTE */
+	plane_config->phys_base = dma_addr;
+	plane_config->mem = mem;
+
+	return true;
+}
+
+static bool
+initial_plane_phys(struct intel_display *display,
+		   struct intel_initial_plane_config *plane_config)
+{
+	struct drm_i915_private *i915 = to_i915(display->drm);
+
+	if (IS_DGFX(i915) || HAS_LMEMBAR_SMEM_STOLEN(i915))
+		return initial_plane_phys_lmem(display, plane_config);
+	else
+		return initial_plane_phys_smem(display, plane_config);
+}
+
 static struct i915_vma *
 initial_plane_vma(struct intel_display *display,
 		  struct intel_initial_plane_config *plane_config)
@@ -405,6 +450,14 @@ void intel_initial_plane_config(struct intel_display *display)
 	struct intel_initial_plane_config plane_configs[I915_MAX_PIPES] = {};
 	struct intel_crtc *crtc;
 
+	/*
+	 * BIOS is messy and may leave the CRTCs active, but the driver's software
+	 * state may not reflect that.  We need to poke the driver to ensure that
+	 * it thinks the CRTCs are active, otherwise the plane scan won't happen.
+	 */
+	for_each_intel_crtc(display->drm, crtc)
+		to_intel_crtc_state(crtc->base.state)->uapi.active = true;
+
 	for_each_intel_crtc(display->drm, crtc) {
 		struct intel_initial_plane_config *plane_config =
 			&plane_configs[crtc->pipe];
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 94f00def811bc138767540065c538b19c7816ed5..6a987224e90dc5620194a277ec5f52820da5efce 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -192,6 +192,24 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 	}
 	/* Reference handed over to fb */
 	xe_bo_put(bo);
+	if (bo->vmap.vaddr && plane_config->fb) {
+		int x, y;
+		void *vaddr = bo->vmap.vaddr;
+		u32 height = plane_config->fb->base.height;
+		u32 width = plane_config->fb->base.width;
+		u32 pitch = plane_config->fb->base.pitches[0];
+
+		for (y = 0; y < height; y++) {
+			u8 red = 255 * (height - y) / height;
+			u8 blue = 255 * y / height;
+			u32 color = (0xFF << 24) | (red << 16) | blue;
+			u32 *row = (u32 *)((u8 *)vaddr + y * pitch);
+
+			for (x = 0; x < width; x++) {
+				row[x] = color;
+			}
+		}
+	}
 
 	return true;
 
@@ -268,6 +286,8 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	 * simplest solution is to just disable the primary plane now and
 	 * pretend the BIOS never had it enabled.
 	 */
+	to_intel_crtc_state(crtc->base.state)->hw.active = false;
+	to_intel_crtc_state(crtc->base.state)->uapi.active = false;
 	intel_plane_disable_noatomic(crtc, plane);
 }
 
@@ -288,7 +308,13 @@ void intel_initial_plane_config(struct intel_display *display)
 {
 	struct intel_initial_plane_config plane_configs[I915_MAX_PIPES] = {};
 	struct intel_crtc *crtc;
-
+	/*
+		* BIOS is messy and may leave the CRTCs active, but the drive's software
+		* state may not reflect that. We need to poke the driver to ensure that
+		* it thinks the CRTCs are active, otherwise the plane scan wo't happen.
+	*/
+	for_each_intel_crtc(display->drm, crtc)
+		to_intel_crtc_state(crtc->base.state)->uapi.active = true;
 	for_each_intel_crtc(display->drm, crtc) {
 		struct intel_initial_plane_config *plane_config =
 			&plane_configs[crtc->pipe];
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 75fc7a1efea7634d2dae0925cc6953fbc096041a..f34e2bc3b15c037dd862a6e68dd5481fbd3e8a9a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -6,8 +6,11 @@
 #ifndef _XE_GGTT_H_
 #define _XE_GGTT_H_
 
+#include <linux/bits.h>
 #include "xe_ggtt_types.h"
 
+#define GEN12_GGTT_PTE_ADDR_MASK	GENMASK_ULL(45, 12)
+
 struct drm_printer;
 struct xe_tile;
 struct drm_exec;
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index dc588255674d0e5e564d3cb260fe4e4fbe70c4eb..310ae85147d56d3fdfc46db2d2fd7e2553fbb1a7 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -256,6 +256,8 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	if (io_size)
 		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
 
+	ttm_set_driver_manager(&xe->ttm, XE_PL_STOLEN, &mgr->base.manager);
+
 	return 0;
 }
 

-- 
2.52.0.457.g6b5491de43-goog

