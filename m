Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F039C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC4F10E5AB;
	Fri,  5 May 2023 08:31:20 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB32610E5AD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275478; x=1714811478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O5iKJDc8iH0sNPrKeNBbSWv/JXmiZbRqJqV1k52jt+k=;
 b=SyB71jS16jcyoOs3TcmSSQfAbo6aSMmCp3662tZaBGUqbeRQR+YCcmFX
 VURRZP9Q1ebKZ3AZwcO1g+YndkeR01CPIPNsPl+ciF8igRZ8Q5mKNV+Wl
 LfpOQyNOzutrf9I08hFvKuKtvWrPm1lm6t+ygUvNGZ2xwh7/Se3ixRu+4
 DWnTWU8SibT9wAcXS6UJibM8Uo0nnTTvte6jm6PSDi49iMFWeQhXXdwqe
 SSVgMXI0QSzOVapBZqSduzFUqfL2eIHNA1fSUKTyX7QhhvUuSSarrGLyP
 EqyT/n8WzDBXQVJaqSnSo0IMVyOVjRtnGYBlFE9e8PetOFJZztqt+xqOP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783319"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783319"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749649"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749649"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:31:16 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:51 +0300
Message-Id: <20230505082956.2247875-16-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505082956.2247875-1-jouni.hogander@intel.com>
References: <20230505082956.2247875-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 15/20] drm/i915/display: Use
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
Cc: jani.nikula@intel.com,
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
index d4788be078dd..f44a36b3af3b 100644
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
 
 	RCU_INIT_POINTER(obj->frontbuffer, NULL);
 	spin_unlock(&intel_bo_to_i915(front->obj)->display.fb_tracking.lock);
-- 
2.34.1

