Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A81C7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 10:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8243B10E68A;
	Tue, 28 Feb 2023 10:42:02 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D4D10E052
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 10:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677580920; x=1709116920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eswR58xXfxexLA/LhrbQGTm3A09zQaO9zdInYMU9diY=;
 b=ElswTDjVOn7fRp+D/+C/M80q+irnyG2iEgJziQvf5H6bIw5UcB04x1RL
 xS3CN1+rr4Oy3TFjQBWrj2goM1X737DGtvrEF7VBNCDDQ7q6C7G+ZygVu
 8LBm3p+poJgRLPLk9mE23lPL/wh4fXFQplbF3ht0tNs8GShEOmY+EjFJO
 UG9AzqfdaV5gos6L6esRpLSq3iEfdyVTm59Un+fXN2MsUijnl14DuQvXN
 nSIhoyDv8gEoXzwBxrWYueqnb6qgveca8OTz6kh5cYN6H0yybhuzbA3GE
 qTOzjXOUIvz6lZGisrf6TP1dzHLkNYIkty8iDiWR0KWZqnhH5AkJpLgHI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398884681"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="398884681"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738108950"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="738108950"
Received: from mistoan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:41:59 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Feb 2023 10:41:25 +0000
Message-Id: <20230228104137.80965-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104137.80965-1-matthew.auld@intel.com>
References: <20230228104137.80965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 02/14] drm/xe/display: fix bo leak when
 unloading module
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

One of the remaining issues affecting module unload (DG2 + display)
appears to be some kind of BO leak:

WARNING: CPU: 1 PID: 1198 at drivers/gpu/drm/drm_mm.c:999 drm_mm_takedown+0x2e/0xc0
WARNING: CPU: 1 PID: 1198 at drivers/gpu/drm/drm_buddy.c:174 drm_buddy_fini+0x5e/0x70 [drm_buddy]

Turning on more debugging points at:

[drm:drm_mm_takedown] *ERROR* node [00e10000 + 00e11000]: inserted at
  drm_mm_insert_node_in_range+0x2c8/0x500
  __xe_ggtt_insert_bo_at+0xb0/0x120 [xe]
  xe_bo_create_locked_range+0x255/0x2d0 [xe]
  xe_bo_create_pin_map_at+0x4d/0x170 [xe]
  intel_alloc_initial_plane_obj.isra.0+0x175/0x340 [xe]
  intel_crtc_initial_plane_config+0x7e/0x270 [xe]
  intel_modeset_init_nogem+0x341/0x8b0 [xe]
  xe_display_init_noaccel+0x1e/0x50 [xe]
  xe_device_probe+0x1fa/0x2a0 [xe]

So looks like we are leaking the object ref for the initial fb. Looking
at the i915 code we also drop the driver reference to the underlying BO,
which appears to just leave the drm framebuffer holding the last ref. Do
the same for Xe.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index bd5d588e8fbf..a2ef0823ed02 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -230,6 +230,8 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 
 	atomic_or(plane->frontbuffer_bit, &to_intel_framebuffer(fb)->bits);
 
+	plane_config->vma = vma;
+
 	/*
 	 * Flip to the newly created mapping ASAP, so we can re-use the
 	 * first part of GGTT for WOPCM, prevent flickering, and prevent
@@ -263,6 +265,9 @@ static void plane_config_fini(struct intel_initial_plane_config *plane_config)
 		else
 			kfree(fb);
 	}
+
+	if (plane_config->vma)
+		drm_gem_object_put(&plane_config->vma->bo->ttm.base);
 }
 
 void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
-- 
2.39.2

