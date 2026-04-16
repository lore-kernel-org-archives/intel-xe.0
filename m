Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E3DF8D761
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 17:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDD610E922;
	Thu, 16 Apr 2026 17:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvUXIljY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069E910E921;
 Thu, 16 Apr 2026 17:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776361498; x=1807897498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jrig7EVqtT2W89CpEU6gG4FSM86qHgZ100PJ1fc7psI=;
 b=gvUXIljY+5MuOZLrhZkYQv9uzzX9hgc4pK5WYfkz/MvBpbuZLzVYaxQu
 nOIwHZpVocGlbdWblGO9YuMEg8Q1pHAaPAMJmDihojPEWPVQwf9/XLHMe
 21UR+trtbHc9BC+TxtHDgsIyf89c/5hhQ7cybqvOyekO/i6bTJjHEI6vP
 dxAKZL8Uspnt4NvLa07X94b3Ek/ixnz2vomg8panV7cCBkQAXXLDa0Pey
 jyx8gueYQyTBRETCCS3vf7KCL3/iM6e+uKA933WVK9c+2kcvRv4clLULE
 kvsNp7HdVKv76esEYrLeRttg+YFprYimvbp/IkdFQFIVsx+O9Db761gW5 Q==;
X-CSE-ConnectionGUID: HSvWBM/ERLe4kHdd8Uswdg==
X-CSE-MsgGUID: tnRbS8cPQf+VEj/gq8aaew==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77445426"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77445426"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 10:44:58 -0700
X-CSE-ConnectionGUID: 8UVt/SWJSIOmXu+GbFwP/g==
X-CSE-MsgGUID: /KtgllzmSpSDBwKKzEav2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="230668836"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.241])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 10:44:56 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 01/11] drm/xe/fb: Use the correct gtt view for remapped FBs
Date: Thu, 16 Apr 2026 20:44:37 +0300
Message-ID: <20260416174448.28264-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260416174448.28264-1-ville.syrjala@linux.intel.com>
References: <20260416174448.28264-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Use the proper gtt view from the plane state rather than always
assuming that it came directly from the FB. This is in the DPT
codepath so the view should currently always come from the FB,
but in the future we may also want per-plane remapping with DPT.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 739d9c019094..91e5c1052589 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -154,7 +154,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 	if (view->type == I915_GTT_VIEW_NORMAL)
 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
 	else if (view->type == I915_GTT_VIEW_REMAPPED)
-		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
+		dpt_size = ALIGN(intel_remapped_info_size(&view->remapped) * 8,
 				 XE_PAGE_SIZE);
 	else
 		/* display uses 4K tiles instead of bytes here, convert to entries.. */
-- 
2.52.0

