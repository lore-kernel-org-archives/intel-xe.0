Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1F2606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BK8m4306
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6D9112AA9;
	Fri, 23 Oct 2026 10:01:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CA5112A8B;
 Fri, 23 Oct 2026 10:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792749662; x=1824285662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SqlJpMjQFMq6ONf1GWeRS2/7ILy2Wm2Bn1buyf8uWxU=;
 b=BK8m4306r/wmhqMtx85pjXom3/4tLmU4678AJjgVBoAwiJ/rUNvZhNU4
 Buq92B/4OakmEUrxImgwYKZ+3FWp0ffrjWfo2P08D5jQW5OZYuceaAYDi
 PqtYGWfg8+jsy95e0wLVT7tLeK9uEBSKIflBq/EGr0gfhmrk1rtMc8zla
 VSMYnv6R1F1i4FIeqvkF3VPBQDs4X0Dl7kR8jm4OhWqvtki3/TIyW42vQ
 GDT8BKUrCgoyatxMXKdudRa413rZW6gs2pfs1hC5VBhiJwqYGIfkujqwh
 iG+LCz0znG4KylMz3tEDU7g+Sjy39SJvUx7TRUzvCYcFBAkb6exgZmZAC Q==;
X-CSE-ConnectionGUID: lLxY/3xWRUOa+W8NAZkXJQ==
X-CSE-MsgGUID: WKFWB1BoRrqU5rtjOE03jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1384256"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1384256"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:01:00 -0700
X-CSE-ConnectionGUID: pNAWUFTfTOGTUQ2E+3c/sw==
X-CSE-MsgGUID: wRb14Z5yQfut6YR6uXLF3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3932699"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 03:00:58 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 3/9] drm/i915/psr: Take the selective fetch area from
 pipe_src
Date: Fri, 23 Oct 2026 10:00:46 +0000
Message-ID: <20261023100052.683192-4-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023100052.683192-1-mika.kahola@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The adjusted mode spans all the joined pipes, so it is the wrong
reference for a per-pipe area. pipe_src is this pipe's own share, and
it is the space plane destination rectangles are clipped into.

No functional change, the two are the same without a joiner.

v2: Use pipe_mode instead of pipe_src (Jouni)
v3: Back to pipe_src (Jouni)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index fb9b5013a9649..2a4d6681d50e3 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2917,8 +2917,8 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 	struct drm_rect display_area = {
 		.x1 = 0,
 		.y1 = 0,
-		.x2 = crtc_state->hw.adjusted_mode.crtc_hdisplay,
-		.y2 = crtc_state->hw.adjusted_mode.crtc_vdisplay,
+		.x2 = drm_rect_width(&crtc_state->pipe_src),
+		.y2 = drm_rect_height(&crtc_state->pipe_src),
 	};
 	bool full_update = false, su_area_changed;
 	int i;
-- 
2.43.0

