Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12177FEFB6A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D1D10EBD8;
	Fri, 27 Feb 2026 17:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntIuvmdL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7639410EBE1;
 Fri, 27 Feb 2026 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772212659; x=1803748659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZOw0xbzSA+WANOCJq1rHIdnJaXzWNqTyXkt1Dl80wg=;
 b=ntIuvmdLLC5ApvdiAgNe+rwXkzKUHdcBD7dAnjYOXqEnEZLc9aOM8us5
 qHBzfh9htGa41NRaMOFJq2+e8Of1W0ujH6hYP4uLh1Ls0UFVm3vTlEI9D
 Ayl0sl7qmFt4UiU8lgDLYZwDC46DOAFsLI+lRSB4TJhgSA41F/ElZP+Xt
 z9POKUfEk2rBaI6eVZkz60h5VBObmoQsRAXjP1esLAaZt+rzYL3vEZKxn
 z5/bee9LT+ID7SJvU3wVm9FcB1U7UPOZ0geUTmk5gZy7TsL7muGW6hFbx
 nL9DNZs+V2a54PqAlKcsxYsEQ/+MolZLbVMe77XTEfcdfAm/isGsZTyhb g==;
X-CSE-ConnectionGUID: C3SNEVsWTGC0jWE3NwVhRQ==
X-CSE-MsgGUID: rLrGa6DQTwCYGCXOuiq41A==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83932702"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="83932702"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:17:38 -0800
X-CSE-ConnectionGUID: mfeEypzJTMyOIuGsb01wug==
X-CSE-MsgGUID: W9KSyLkzRjGpOFs/BlLJug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216849520"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:17:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 4/4] drm/xe/display: clean up xe_initial_plane.c includes
Date: Fri, 27 Feb 2026 19:17:14 +0200
Message-ID: <637eab7df00a540df6b7ca1ca345302864b6342f.1772212579.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772212579.git.jani.nikula@intel.com>
References: <cover.1772212579.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Remove excess includes, group and sort include directives.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 4be0cfb6d0c1..65cc0b0c934b 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -3,27 +3,21 @@
  * Copyright © 2021 Intel Corporation
  */
 
-/* for ioread64 */
-#include <linux/io-64-nonatomic-lo-hi.h>
-
 #include <drm/intel/display_parent_interface.h>
 
 #include "regs/xe_gtt_defs.h"
-#include "xe_ggtt.h"
-#include "xe_mmio.h"
 
 #include "intel_crtc.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
-#include "intel_fbdev_fb.h"
 #include "intel_fb_pin.h"
+#include "intel_fbdev_fb.h"
 #include "xe_bo.h"
 #include "xe_display_vma.h"
+#include "xe_ggtt.h"
+#include "xe_mmio.h"
 #include "xe_vram_types.h"
-#include "xe_wa.h"
-
-#include <generated/xe_device_wa_oob.h>
 
 /* Early xe has no irq */
 static void xe_initial_plane_vblank_wait(struct drm_crtc *_crtc)
-- 
2.47.3

