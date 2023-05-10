Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82775C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F46510E487;
	Wed, 10 May 2023 12:13:05 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EE410E489
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720782; x=1715256782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4+ss6jofQOF5vufgf7b4Hj6d4Z8+ICZUMSySdo1b1r8=;
 b=K6hZfxsRn/4xf/H5/4NG6dw637a4M7v1tmcAj1b0zgGBnlFEJC0hZgvF
 yos3GvQtFeBTV0FtzR8jz9t2wOkC31CqcSDf0ef/RMDfp6QTAF3cml9EE
 baA5xOCY0shILtNh0yFvg5lA3enP1pFQ2Wsn1kKv7bKUnfn1jgnE79eTC
 tTpMrzbWidUnuDONOjQrEwY8jM9nuvjHjkL4P3fFGl11/bZ2fiICQVM8T
 9FGKhDCF99rjxlh059eoOkvVbBQEKigw5+oiYdkghT60Pszf9o1W/ORVw
 DAJFe0ddMdn+iOcc9oHU+QP/Bnvx5ybnzjNWqpJRsk7+OjTcYUIjSezJQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268238"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268238"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906374"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906374"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:59 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:47 +0300
Message-Id: <20230510121152.736148-19-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 18/23] drm/i915/display: Use
 i915_ggtt_clear_scanout
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use i915_ggtt_clear_scanout instead of directly clearing scanout
flag.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 271d51609db9..51fb0ca0267e 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -227,16 +227,10 @@ static void frontbuffer_release(struct kref *ref)
 	struct intel_frontbuffer *front =
 		container_of(ref, typeof(*front), ref);
 	struct drm_i915_gem_object *obj = front->obj;
-	struct i915_vma *vma;
 
 	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, atomic_read(&front->bits));
 
-	spin_lock(&obj->vma.lock);
-	for_each_ggtt_vma(vma, obj) {
-		i915_vma_clear_scanout(vma);
-		vma->display_alignment = I915_GTT_MIN_ALIGNMENT;
-	}
-	spin_unlock(&obj->vma.lock);
+	i915_ggtt_clear_scanout(obj);
 
 	i915_gem_object_set_frontbuffer(obj, NULL);
 	spin_unlock(&intel_bo_to_i915(front->obj)->display.fb_tracking.lock);
-- 
2.34.1

