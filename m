Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35881C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 16:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54FE10E302;
	Mon,  4 Dec 2023 16:41:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9DA10E365
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701708079; x=1733244079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Ymrl5xPJhvf0gQ62ZU5KIkYboty78kSZh8dLbOxGJs=;
 b=X1Q8mqf6jbQ2aJ1Y+YpbKo/2UcO8hymR7KDoTsR6JxMjJg6EMY9XLqE+
 DcoulPWCOwa7JbWZcSz0fB1bYiiI9PKkOXjQoNUO0tQ/3/dIyS5mrj/rf
 yFp7ri5pSbcsfpuHr5W8TCDcm4SdJumSnXGMoXOsDfNGqiHwnUuTUqUTh
 fGo13xj45DqtVS6QPPVk4UtgWvm/U/EVfLOsTNrcWU/h9IJ3n88V1WoV3
 mFsRq0MgB3ZzOILtgyl1hOUNGvLezpqpu/Eltinqsp7rwRqb9Ruuvbby6
 OVYS8wg7eHDDvNEY9CJHAgxuHzjQHVaO/hiAyJop/0QNC2ujIMcFGZIXr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="829423"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="829423"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 08:41:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="746895054"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; d="scan'208";a="746895054"
Received: from jstelter-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.61.71])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 08:41:16 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 18:40:43 +0200
Message-Id: <20231204164047.1166360-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204164047.1166360-1-jouni.hogander@intel.com>
References: <20231204164047.1166360-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 5/9] drm/i915/display: Handle invalid
 fb_modifier in intel_fb_modifier_to_tiling
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

Lookup_modifier is returning INTEL_PLANE_CAP_TILING_4 on invalid
fb_modifier value. Use lookup_modifier_or_null in
intel_fb_modifier_to_tiling and return I915_TILING_NONE in case
lookup_modifier_or_null returns null.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231203114840.841311-4-jouni.hogander@intel.com
(cherry picked from commit c61d8f7baabad322d53db301f7afaa2ce41493e6)
---
 drivers/gpu/drm/i915/display/intel_fb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index f42a693f96c1..20d58a021a42 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -303,7 +303,14 @@ lookup_format_info(const struct drm_format_info formats[],
 
 unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
 {
-	u8 tiling_caps = lookup_modifier(fb_modifier)->plane_caps &
+	const struct intel_modifier_desc *md;
+	u8 tiling_caps;
+
+	md = lookup_modifier_or_null(fb_modifier);
+	if (!md)
+		return I915_TILING_NONE;
+
+	tiling_caps = lookup_modifier_or_null(fb_modifier)->plane_caps &
 			 INTEL_PLANE_CAP_TILING_MASK;
 
 	switch (tiling_caps) {
-- 
2.34.1

