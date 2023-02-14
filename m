Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1BBC6379F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 11:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEC910E88E;
	Tue, 14 Feb 2023 11:24:07 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF6610E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 11:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676373843; x=1707909843;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fabTg7f+/eZ6rP3ZnTBVHnFV3RyUKpJvVODbWFGe8Ng=;
 b=G3czjSWVOqFT3SbqJ0yYKaOiI4YxtH6mHWWUCRUdsEet+vQjfUsinZo8
 O0w4sSoigewBX4tsdHNERqnefLahOL3kAVz+STjvZMueNiUxbyKFEbbuX
 x9+hviB6gOyFot2wqKxPvn1n691wE1y/MGL9HG/M1BWimso/YujHvxS9E
 egPRwK70wwf+9POjLrCW4rZ0msqWDsER1ViakmFErNibSK++QHEZmMitB
 Zil9dteK4Cv0r7bfOisp0UMggng76yy2AgG0xZyByIVYVrh2p1lqloHiK
 9I9ykl3u3yiiKnqKA9VR90k13c43q4zK200yEjm3xOwrGgtFrnvoQD9gj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332450085"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="332450085"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732863240"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732863240"
Received: from achurkin-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:58 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:21:34 +0000
Message-Id: <20230214112136.162380-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214112136.162380-1-matthew.auld@intel.com>
References: <20230214112136.162380-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 13/15] drm/xe/display: annotate CC buffers with
 NEEDS_CPU_ACCESS
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

The display code wants to read the clear color value from the buffer.
However if the buffer is the non-mappable part of lmem then we fail the
kmap. The simplest solution is to just mark the buffer with
XE_BO_NEEDS_CPU_ACCESS, which will either allocate the buffer in the
mappable part of lmem, or migrate it there.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 65c0bc28a3d1..66e1309e21d8 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -203,6 +203,14 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 	if (ret)
 		goto err;
 
+	/*
+	 * For this type of buffer we need to able to read from the CPU the
+	 * clear color value found in the buffer. This doesn't do anything on
+	 * non small-bar devices.
+	 */
+	if (intel_fb_rc_ccs_cc_plane(&fb->base) >= 0)
+		bo->flags |= XE_BO_NEEDS_CPU_ACCESS;
+
 	ret = xe_bo_validate(bo, NULL, true);
 	if (!ret)
 		ttm_bo_pin(&bo->ttm);
-- 
2.39.1

