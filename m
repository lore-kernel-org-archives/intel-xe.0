Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886CCC44539
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 14:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3509E10EE1E;
	Wed, 22 Jul 2026 14:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6gfus7Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6144D10EE15
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 14:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784731075; x=1816267075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sCOGyebiUOaiEXZgYY/SSXa8H4S39D8IMdMqEexZNdY=;
 b=V6gfus7YJTFNPW3W1XPRokoSwS7WO95DFx+j3a5Z1r7fO26nSxYnWxbg
 L24T+DWnG0m328DIaAcZIo+1kNEle1HW2JKT85IMRIXmX4855/Zkr5s4e
 YYx2juueKoQu2LYVbb1d0SBN04fWRJz0g0EDf05ttNZE1HfNKVA9tOwtT
 So7GWIx5gy9o30xDjiXwmxFtugyAnXLSpGkWqG7gWMdUZt3Yj2NfCrebo
 VII6WRocMRr6aT1ECPa0b6tX8fl+N/aJvWD9nYiYNtUTE+zmq1ayug39O
 Un+zFIGyPwrhjL/oE2UbYTSuxFW2hq9l+X/eN1TEG7Sgb4sj2hSxsYx8U Q==;
X-CSE-ConnectionGUID: wpbkDmp0RJ+LVppJsyiv4w==
X-CSE-MsgGUID: /SgTWj9yRliFOSlnH6146A==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102777853"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="102777853"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:37:55 -0700
X-CSE-ConnectionGUID: gSJH6KBSSAKIMIvHTfXTdw==
X-CSE-MsgGUID: jf2NPQOrSo+AfGXXKcoyCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="261653204"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa003.jf.intel.com with ESMTP; 22 Jul 2026 07:37:54 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v8 3/6] drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum page-size
 sizing
Date: Wed, 22 Jul 2026 20:07:56 +0530
Message-ID: <20260722143759.1718600-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
References: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
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
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++--
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c266fa6bade1..cf0b7b35c331 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2340,8 +2340,16 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
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
index 7ae1d9ac0574..c6d80e1bd6e7 100644
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

