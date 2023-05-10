Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCF4C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABEB10E48A;
	Wed, 10 May 2023 12:12:57 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEE110E48A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720775; x=1715256775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c6FdPcXnQ/hSeS2/vfakNZtLuqnoFtD0hgs/L7ivVOQ=;
 b=Q5iY/xaYQYaXSHZQEIwmKsX7tDcHCCLjjDRoy74KK6CLQOFdo0ofOm9M
 b1zXkxsXKgDCHjMmcXaWZ40Rr8hn1EX4bAm7kzsWjL6bI86F1hMHFwMrZ
 nyaiopFk8oZR6nFVgv+DijB9F26MI2ab2jQzBxM6MC4W57rLdA3pHU2+A
 4IGnGJ1aga/f1nz6yIimOndiojnendgfqwhdpFaV3ef98ZWcdde8JribN
 //IFfxdHMsVMPXSp72fAb64RlJoOzDqWshCKQIIf+rkL6xENnh0tgnByL
 n45Zodu0NaIKNS9UKVWXEv/vlYuFog63ceAg47EU4w2mk2TkN2G3bbBYX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268205"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268205"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906314"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906314"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:52 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:45 +0300
Message-Id: <20230510121152.736148-17-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 16/23] drm/i915: Add function to clear
 scanout flag for vmas
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

Currently frontbuffer tracking code is directly clearing scanout
flag. This is not possible if we want to use frontbuffer tracking for
Xe. Add function to clear scanout flag for vmas which can be called by
frontbuffer tracking code and allows differing implementation for Xe.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 7baaf999f1d6..2b32991d04ad 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1629,6 +1629,26 @@ int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	return err;
 }
 
+/**
+ * i915_ggtt_clear_scanout - Clear scanout flag for all objects ggtt vmas
+ *
+ * This function clears scanout flags for objects ggtt vmas. These flags are set
+ * when object is pinned for display use and this function to clear them all is
+ * targeted to be called by frontbuffer tracking code when the frontbuffer is
+ * about to be released.
+ */
+void i915_ggtt_clear_scanout(struct drm_i915_gem_object *obj)
+{
+	struct i915_vma *vma;
+
+	spin_lock(&obj->vma.lock);
+	for_each_ggtt_vma(vma, obj) {
+		i915_vma_clear_scanout(vma);
+		vma->display_alignment = I915_GTT_MIN_ALIGNMENT;
+	}
+	spin_unlock(&obj->vma.lock);
+}
+
 static void __vma_close(struct i915_vma *vma, struct intel_gt *gt)
 {
 	/*
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index ed5c9d682a1b..e8fa9e0c57ee 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -435,6 +435,8 @@ static inline void i915_vma_clear_scanout(struct i915_vma *vma)
 	clear_bit(I915_VMA_SCANOUT_BIT, __i915_vma_flags(vma));
 }
 
+void i915_ggtt_clear_scanout(struct drm_i915_gem_object *obj);
+
 #define for_each_until(cond) if (cond) break; else
 
 /**
-- 
2.34.1

