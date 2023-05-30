Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98301C7EE31
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7295110E385;
	Tue, 30 May 2023 10:47:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D7F10E382
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685443660; x=1716979660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wMdneRrKDR9DaGWyCIa9g2QYvoVrc4iaIM0anbWOzpE=;
 b=YCxGXR22t+k856Ocg5Tjw45/mCMfyh43jZX8j02ojDvNe6Dg3dlpWPdP
 4I+gw4PTKzCTQC0nbcnDHR2WLDULA59k1vYafUFF67Rs18LkiKos6R+a7
 L+E7ursd2sUPLR8hMBMG6990F8nsLq2srJ+swzjVMXU0cFB6vV9IXDLLF
 NUcIAsaLNaemra849rWiLSUxCToD5okwnKC63m7zSsGzvXG7JxOPC8UPA
 Osp01kuh8FmBQWW2YefSNlEJRsS+5+6Ccgm2ufzAlDhbPu3TRPMBvmgw7
 t6zqVb89QIn7tTM70jpRQ+kJdhxrvwiAbQzBiJ8xIzWYRXA6zQtZ2kr86 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420638374"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="420638374"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="656804784"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="656804784"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:47:39 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:47:11 +0300
Message-Id: <20230530104713.2570554-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530104713.2570554-1-jouni.hogander@intel.com>
References: <20230530104713.2570554-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/9] drm/i915/fbc: Stolen initialize can be
 checked in plane check for i915 as well
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There is no specific reason to differentiate i915 and Xe in stolen are
initialization status. We can check it in plane check for i915 as well.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index b6fc993e6caf..109f86bb19ef 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1064,12 +1064,10 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 	if (!fbc)
 		return 0;
 
-#ifndef I915
 	if (!i915_gem_stolen_initialized(i915)) {
 		plane_state->no_fbc_reason = "stolen memory not initialised";
 		return 0;
 	}
-#endif
 
 	if (intel_vgpu_active(i915)) {
 		plane_state->no_fbc_reason = "VGPU active";
@@ -1724,11 +1722,6 @@ void intel_fbc_init(struct drm_i915_private *i915)
 {
 	enum intel_fbc_id fbc_id;
 
-#ifdef I915
-	if (!i915_gem_stolen_initialized(i915))
-		RUNTIME_INFO(i915)->fbc_mask = 0;
-#endif
-
 	if (need_fbc_vtd_wa(i915))
 		RUNTIME_INFO(i915)->fbc_mask = 0;
 
-- 
2.34.1

