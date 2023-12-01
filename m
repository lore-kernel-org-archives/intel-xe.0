Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757B6C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 09:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A2710E82A;
	Fri,  1 Dec 2023 09:27:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A943910E82A
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701422817; x=1732958817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ec9LKdxL2xDNyfboKYeZIe6iI2l2xPpp37kkwmaqg8g=;
 b=FL+H77As4YU4tl1PcQMw8zJS/IyDZheKwt/YU1HDBxyXG3Ka9Uj0EOgI
 F/IIU8t2xycemZ6FK8vn24k0rV03Lx5Qq2ZSzeJA3gc1UI/X6ur65nYRS
 zH/ppjvBCf3bZ6wMM3/KRrH7IoZfdpFfIOys4u7EkYteMP6LpVXxdpdcY
 MWRjUEQ6062lhHOZmjF8oHPqvsKuCMcwD9qvdtqfkNKHf/bhrqsSKHjmb
 UUxgf9KujsxujbfgxoNqJoOA/7BLj0YZGJgAF/muBRxN/wYw4wQYkpD0+
 i3He4QLlH3jfkbQDU+2sDYI6cj4K8hbDpjWPlyyg8j7b/xTzRENPHDb1+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="378499052"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="378499052"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 01:26:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="798655783"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="798655783"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orsmga008.jf.intel.com with ESMTP; 01 Dec 2023 01:26:56 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Dec 2023 14:44:03 +0530
Message-Id: <20231201091405.658548-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231201091405.658548-1-animesh.manna@intel.com>
References: <20231201091405.658548-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/6] drm/i915/dsb: Re-instate DSB for LUT
 updates
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

With all the known issues sorted out we can start to use
DSB to load the LUTs.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231009132204.15098-3-ville.syrjala@linux.intel.com
(cherry picked from commit 34d8311f4a1c464ae0ce4470f2e3932c1a40d83e)
---
 drivers/gpu/drm/i915/display/intel_color.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 4f92fc31059f..40b04aa7d98c 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1895,9 +1895,6 @@ void intel_color_prepare_commit(struct intel_crtc_state *crtc_state)
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
 
-	/* FIXME DSB has issues loading LUTs, disable it for now */
-	return;
-
 	if (!crtc_state->hw.active ||
 	    intel_crtc_needs_modeset(crtc_state))
 		return;
-- 
2.29.0

