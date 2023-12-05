Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B77C07E97
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 11:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48AC10E50A;
	Tue,  5 Dec 2023 11:27:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7092C10E503
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701775656; x=1733311656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Ymrl5xPJhvf0gQ62ZU5KIkYboty78kSZh8dLbOxGJs=;
 b=XvVvqNakgUYmWwrsgXKo7TnxbKwDyejYpF334zV7fEBSq+jeGHa8gj4J
 TqFvZw9Yye4xAqVIHeED8UwqsDEIOXeETZ+pBXWMbMhw5c9WM501zLxB9
 qH3DBxA2OeFT0khuVaqhxqPRViWPGumhUjq32K3+iF4YRnDD9AMPbirhB
 MfjNXxbMFaQCQR7MFd9zs7JswQeFAWVV18/WfGyxFMQOenfrAk/U5NZwA
 fG2qH4gvYrnLUWAV4hgjXRkQWOIFRjghxnLT8XwEdX1SUpN2K0VC3PU5c
 KR/cA7U31xD3HdFk88h/sDGAbnHxoXhG9PJy2GWPqU55OoiZPBd0SGF34 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="396675988"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="396675988"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:27:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="774606555"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="774606555"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.33.227])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:27:34 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 13:27:13 +0200
Message-Id: <20231205112717.1349830-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205112717.1349830-1-jouni.hogander@intel.com>
References: <20231205112717.1349830-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 5/9] drm/i915/display: Handle invalid
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

