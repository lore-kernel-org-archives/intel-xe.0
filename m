Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F24C44507
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jul 2026 11:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5571C10E435;
	Sun, 12 Jul 2026 11:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/YVStak";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A79F10E411
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Jul 2026 11:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783854895; x=1815390895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bfXAms5yq4WiPB1/cHki5r0Xw7l/5rabkHpcyXu+Uyo=;
 b=U/YVStakUsfeBfz8YJeREBMqtJ4FthOt+n6KC9MKraSWmvQMi/eR+hin
 Gz3sUjDFqeYwNf5e9xdvRZqcYXXxasY5lO+ZFLy7sYOKuEX/FItJv+dLY
 mXxwQKd6wWkX9/JObp4xekx11Mryl82fXfQwKe1TfJAbov9kvUwZtmHAw
 T9tzORYxMNLGgjbSqh2SLH/YJUf3Mj3UMJyEzr5/RhpSqSign8Kk29FO8
 my5oWYRlTXcKhk+Xoklo4VkObIJ1/lhg0lH/lMyQt+Ksgy4pr0gt57ZG6
 EZbmiIN/GlUy6oN4+BktlU1DFX8TgGl+NzLsEDX1HWhJhC/z9igeTINg7 Q==;
X-CSE-ConnectionGUID: I3r9mYhQTz6fjGxByxASpw==
X-CSE-MsgGUID: xISzCShtTgWP+Bix4BByfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84457634"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84457634"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 04:14:55 -0700
X-CSE-ConnectionGUID: 3og1JPZBQEez0VFNUNZrpg==
X-CSE-MsgGUID: dBFtNLMbRB2e09GjS05MRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255367719"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 12 Jul 2026 04:14:55 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v3 4/8] drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum page-size
 sizing
Date: Sun, 12 Jul 2026 16:45:13 +0530
Message-ID: <20260712111517.1956177-5-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
References: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
MIME-Version: 1.0
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

Add XE_BO_FLAG_NEEDS_1G to mark BOs that require 1G minimum page-size
sizing.

Update xe_bo_init_locked() to honor the new flag in the existing
VRAM/stolen-memory minimum page-size sizing path. When
XE_BO_FLAG_NEEDS_1G is set, the BO size is rounded up to 1G. Otherwise,
the existing 2M and 64K sizing behavior is preserved.

If multiple minimum page-size flags are set, the largest requirement
takes precedence: 1G over 2M over 64K.

v3
- commit message reworded

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++--
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4c80bac67622..9dbf59fad421 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2323,8 +2323,16 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
 	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
-	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M)))) {
-		size_t align = flags & XE_BO_FLAG_NEEDS_2M ? SZ_2M : SZ_64K;
+	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M |
+		       XE_BO_FLAG_NEEDS_1G)))) {
+		size_t align;
+
+		if (flags & XE_BO_FLAG_NEEDS_1G)
+			align = SZ_1G;
+		else if (flags & XE_BO_FLAG_NEEDS_2M)
+			align = SZ_2M;
+		else
+			align = SZ_64K;
 
 		aligned_size = ALIGN(size, align);
 		if (type != ttm_bo_type_device)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6340317f7d2e..d5d023cac367 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -52,6 +52,7 @@
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
 #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
+#define XE_BO_FLAG_NEEDS_1G		BIT(27)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.43.0

