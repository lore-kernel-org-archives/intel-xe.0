Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D9D606A324
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ye9Udwrl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B0210FB37;
	Wed, 11 Nov 2026 11:20:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B88F10FB2E;
 Wed, 11 Nov 2026 11:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396038; x=1825932038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qpaJGXIvmR3/Zn/thV5br2kbyhwUyxK5kpvtnNMLE1M=;
 b=Ye9UdwrlTnDCAqaL7Y2e6ipi1848dtE0I2lryx2jcjxk1dKQg0WlIDfw
 LmENVPGQm+DI4TJVJw4uLG8u7AbrkRwODU2nDKbX6x3BLyReHBTGVaJGO
 7djsxf2jlBl0RqWDRvYUBPcwLuFXJDv9Biu7xm8XBIl7r6UWqKLC/wKed
 4fuxdq/DKRLHa9r3O13IH1WN9QQIKwKU5V0/5Ri6aojbFHmYZUrCvsFl/
 0NxWAtco3AH4Zm25UH6xqdKCxyFbJVrEqWPd14H8MVuzB7R9TYZ4zqwqk
 MxkTaJkGLTN7357vjKvf5QXDjF10jO9ewXm4dagBMVDFoYXXpcgcySfds g==;
X-CSE-ConnectionGUID: D7HiJn+qRwmY69Q1qarKYw==
X-CSE-MsgGUID: 1bCscOlURLKugY5hER8VgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3186438"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3186438"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:38 -0800
X-CSE-ConnectionGUID: sKUgZjHGTs6qllwCiwtNWQ==
X-CSE-MsgGUID: ok7sPyQQQ7mXymWEVyuV7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8828997"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:36 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 07/13] drm/i915/vma: Extract intel_gtt_view_compare()
Date: Wed, 11 Nov 2026 13:20:01 +0200
Message-ID: <20261111112007.16790-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Split intel_gtt_view_compare() out from i915_vma_compare().
We'll soon need to compare gtt views in the DPT code without
vmas being present.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma.h | 44 ++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index b0aca10bf8e7..85c2408f1823 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -204,25 +204,19 @@ static inline void i915_vma_put(struct i915_vma *vma)
 	i915_gem_object_put(vma->obj);
 }
 
+/* a is never NULL, b may be NULL (assumed normal view) or not */
 static inline long
-i915_vma_compare(struct i915_vma *vma,
-		 struct i915_address_space *vm,
-		 const struct intel_gtt_view *view)
+intel_gtt_view_compare(const struct intel_gtt_view *a,
+		       const struct intel_gtt_view *b)
 {
 	ptrdiff_t cmp;
 
-	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
-
-	cmp = ptrdiff(vma->vm, vm);
-	if (cmp)
-		return cmp;
-
 	BUILD_BUG_ON(INTEL_GTT_VIEW_NORMAL != 0);
-	cmp = vma->gtt_view.type;
-	if (!view)
+	cmp = a->type;
+	if (!b)
 		return cmp;
 
-	cmp -= view->type;
+	cmp -= b->type;
 	if (cmp)
 		return cmp;
 
@@ -241,11 +235,27 @@ i915_vma_compare(struct i915_vma *vma,
 	BUILD_BUG_ON(INTEL_GTT_VIEW_NORMAL >= INTEL_GTT_VIEW_PARTIAL);
 	BUILD_BUG_ON(INTEL_GTT_VIEW_PARTIAL >= INTEL_GTT_VIEW_ROTATED);
 	BUILD_BUG_ON(INTEL_GTT_VIEW_ROTATED >= INTEL_GTT_VIEW_REMAPPED);
-	BUILD_BUG_ON(offsetof(typeof(*view), rotated) !=
-		     offsetof(typeof(*view), partial));
-	BUILD_BUG_ON(offsetof(typeof(*view), rotated) !=
-		     offsetof(typeof(*view), remapped));
-	return memcmp(&vma->gtt_view.partial, &view->partial, view->type);
+	BUILD_BUG_ON(offsetof(typeof(*b), rotated) !=
+		     offsetof(typeof(*b), partial));
+	BUILD_BUG_ON(offsetof(typeof(*b), rotated) !=
+		     offsetof(typeof(*b), remapped));
+	return memcmp(&a->partial, &b->partial, b->type);
+}
+
+static inline long
+i915_vma_compare(struct i915_vma *vma,
+		 struct i915_address_space *vm,
+		 const struct intel_gtt_view *view)
+{
+	ptrdiff_t cmp;
+
+	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));
+
+	cmp = ptrdiff(vma->vm, vm);
+	if (cmp)
+		return cmp;
+
+	return intel_gtt_view_compare(&vma->gtt_view, view);
 }
 
 struct i915_vma_work *i915_vma_work(void);
-- 
2.56.0

