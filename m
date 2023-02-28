Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D5EC64EC7
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 10:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7E510E03C;
	Tue, 28 Feb 2023 10:42:12 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8C310E688
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677580931; x=1709116931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vlhgjMwuwJoDQ54uCFCIf50C2CJe6PaEMxKBLB4cCw0=;
 b=H+i+mRZbpEyR2dhgur6cKN9APBAySz22HbQSwCPejwpaFS2+sVY+DKIU
 Kce+oJ7jQLhXC7MTSS+wpfxadfsLmwgPTkjgglbuQas4kO1aSnSbrZp/E
 36IVRdT3ivTIEtCC60nCmfIp9pMpNXblYg7Yy0DpoP/LCMsM0p0sbQnHq
 FbGFgeWOyK8paspoXb0JPEyupCfegbSSbif/h0hb+ZReS/Fg09Bishd56
 dgl0qylLuhWzp27WgQ/6yqf1vjqFP4QRSuWWoWBm84EkxeUyWYUH1syF6
 hVJIIvmCRYI2qTdqUY6W/2cc9x1nZYT1aRhuuf+IB3zc3PeO7JnF4l2cY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398884731"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="398884731"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738108982"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="738108982"
Received: from mistoan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:10 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Feb 2023 10:41:35 +0000
Message-Id: <20230228104137.80965-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104137.80965-1-matthew.auld@intel.com>
References: <20230228104137.80965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 12/14] drm/xe/display: annotate CC buffers
 with NEEDS_CPU_ACCESS
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The display code wants to read the clear color value from the buffer.
However if the buffer is the non-mappable part of lmem then we fail the
kmap. The simplest solution is to just mark the buffer with
XE_BO_NEEDS_CPU_ACCESS, which will either allocate the buffer in the
mappable part of lmem, or migrate it there.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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
2.39.2

