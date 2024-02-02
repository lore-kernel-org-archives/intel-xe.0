Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE008C4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91B110F131;
	Fri,  2 Feb 2024 22:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPrpSNO/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B831E10F145
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706914311; x=1738450311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YUd6BO6uHR3qzrWrIQ8DoasqDo5uaCrsHneuzDl9lx0=;
 b=fPrpSNO/5cfvwwHhzJK/o3vhnRwEKX9jDZg/z02F81Sd3pF9cieiXppv
 UBDR06z3ZrZbDhPhHjiW9+/N6S3uQPcrVZ0pr8xxG0d5NuZMVliEbY6PQ
 5gqI8pssKAXIIwQxz/qG8xUiKDQurcOXa7njFtNoQn0d8raE3qd4B2DHw
 rl9pcyWbDFbWCW2h8XuZGFsp2SMxnpA0Qeg4f7oyORBSGlEFsbIafRcwj
 2gX9GiVysiufrWv1h45KTC7ix0TsSHCkQ2E0K8q1qidoXzqRuycZHcS7K
 8YFYhWmOYK9Qntj5cRBqMWHeP1eAoo9sFt/ZtKcGjLyYZ/E7ERWpcTDHb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="153833"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="153833"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:44:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823332078"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823332078"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 14:44:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 03 Feb 2024 00:44:41 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Paz Zcharya <pazz@chromium.org>
Subject: [PATCH v4 16/16] drm/i915: Annotate more of the BIOS fb takeover
 failure paths
Date: Sat,  3 Feb 2024 00:43:40 +0200
Message-ID: <20240202224340.30647-17-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
References: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Annotate a few more of the failure paths on the initial
BIOS fb takeover to avoid having to guess why things
aren't working the way we expect.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Tested-by: Paz Zcharya <pazz@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index b43b8cf4680c..ada1792df5b3 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -167,14 +167,19 @@ initial_plane_vma(struct drm_i915_private *i915,
 	 */
 	if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
 	    mem == i915->mm.stolen_region &&
-	    size * 2 > i915->dsm.usable_size)
+	    size * 2 > i915->dsm.usable_size) {
+		drm_dbg_kms(&i915->drm, "Initial FB size exceeds half of stolen, discarding\n");
 		return NULL;
+	}
 
 	obj = i915_gem_object_create_region_at(mem, phys_base, size,
 					       I915_BO_ALLOC_USER |
 					       I915_BO_PREALLOC);
-	if (IS_ERR(obj))
+	if (IS_ERR(obj)) {
+		drm_dbg_kms(&i915->drm, "Failed to preallocate initial FB in %s\n",
+			    mem->region.name);
 		return NULL;
+	}
 
 	/*
 	 * Mark it WT ahead of time to avoid changing the
-- 
2.43.0

