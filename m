Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D0BFB44A6
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 06:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D5510F2E0;
	Fri, 24 Apr 2026 06:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLJ6jrt5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A2B10F285;
 Fri, 24 Apr 2026 06:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777010862; x=1808546862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JSPx+6IfXN+/99zgJPnD5tKlVWiTGBXQ+oLisOcAL2s=;
 b=LLJ6jrt5nSUjjsFJFQ6MwJNIUySD2m9giZmtl5L+eSd6bLeRwfa3M/WA
 ykaxEEQwImKJVRmlGSqmz6iFz3u48r/X/NAiWCRUCh1sCryoCizLRjnRR
 wIs40Xxaqx58FJi4l9BCtMoEsh2q9WmLP9cephEXoWRolgflydwKXVHub
 UWnel3Fwu+QazKbv7nPsPMgYUg4lXb8RzlefrPebW4+cov3ScbacIb+vm
 ESmfC6SEqQfzJyZQOdrIH5KQLSPyx1q+xR9md7h9wt3e6fIFJAyujVwH2
 Rb0YjukQrwaae2uC8M4tFrU60NDA8UYj/cp/YxBGF/dzu0yWfKA+rbVbK Q==;
X-CSE-ConnectionGUID: 4dlg0uL/S0OjH7kHat9qLw==
X-CSE-MsgGUID: CK4WuZQ+QGS5i6jnhWeklA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77690818"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77690818"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 23:07:42 -0700
X-CSE-ConnectionGUID: dRf7tJ2hQa+v7Midt8McKg==
X-CSE-MsgGUID: aWo7DJ/zTnGX/0TjQON4Jg==
X-ExtLoop1: 1
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa003.fm.intel.com with ESMTP; 23 Apr 2026 23:07:40 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, pranay.samala@intel.com,
 stable@vger.kernel.org
Subject: [PATCH v2 2/4] drm/i915/display: Copy color pipeline from plane in
 the primary joiner pipe
Date: Fri, 24 Apr 2026 11:11:27 +0530
Message-Id: <20260424054129.2148049-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260424054129.2148049-1-chaitanya.kumar.borah@intel.com>
References: <20260424054129.2148049-1-chaitanya.kumar.borah@intel.com>
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

When copying plane color state in a joiner configuration, use the plane in
the primary joiner pipe since it carries the pipeline number selected by
the user-space.

This assumes that all pipes in the joiner are symmetric in their plane
color capabilities.

Cc: stable@vger.kernel.org # v6.19+
Fixes: a78f1b6baf4d ("drm/i915/color: Add framework to program CSC")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index d08e9166824b..a8efe0011b23 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -398,7 +398,7 @@ intel_plane_color_copy_uapi_to_hw_state(struct intel_atomic_state *state,
 	if (!state)
 		return;
 
-	iter_colorop = plane_state->uapi.color_pipeline;
+	iter_colorop = from_plane_state->uapi.color_pipeline;
 
 	while (iter_colorop) {
 		for_each_new_colorop_in_state(&state->base, colorop, new_colorop_state, i) {
-- 
2.25.1

