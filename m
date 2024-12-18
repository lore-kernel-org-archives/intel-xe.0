Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D56E77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 12:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E848F10EB9C;
	Wed, 18 Dec 2024 12:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExqPfgTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C3510EB96
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734524356; x=1766060356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pq48EvW4h97ouiMBLlFh0MFGNY8sYGFKClxr2HhYBL4=;
 b=ExqPfgTP8+dXPPBhmYwCM1Jz31Iww3KczIz4sjc6O/VnqdaK+7xQjnlV
 x3QrKyJhkYuAkWTyD5KrzblgtfrRiPL4rzt7WtNMW3ObNtDrBTL0luc6P
 s+fG4qq15ZreSMKj1RqpZsKDv3Td06xLCaGckgKMSEG3o9BSGe+0dvHHu
 7TBJxrBmNejEJBWKeJGjgxOUwEZXoTgrgazTdM6HYneTApyPvz7tJ2C1V
 tNL8kwza2FbWQNAQ7ZrXSZZEpuEnD7zaf5B0sXUPVUV6TFHHHNtQjvWxL
 Iq5RaBvKhhIecd0xFxrQS7bjRcuVskVWgtuqH9OGOZXsJIwAsFrrvLiDy g==;
X-CSE-ConnectionGUID: r3t0qvZvRJe4QeGPy2m8Tw==
X-CSE-MsgGUID: YtbEPkajQAmOlC+5xN1qcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35028095"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35028095"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:16 -0800
X-CSE-ConnectionGUID: db7A0DMESJuq4YF+Qmxpew==
X-CSE-MsgGUID: yqzSp5CBTvy9d02ZrBNgdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97633601"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:15 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 6/7] drm/xe: allow non-contig VRAM kernel BO
Date: Wed, 18 Dec 2024 12:18:44 +0000
Message-ID: <20241218121837.226393-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218121837.226393-9-matthew.auld@intel.com>
References: <20241218121837.226393-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

If the kernel bo doesn't care about vmap(), either directly or
indirectly with save/restore then we don't need to force contig for such
buffers.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 77918e30b904..9e5bb87a1b3c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -164,11 +164,17 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 
 static bool force_contiguous(u32 bo_flags)
 {
+	if (bo_flags & XE_BO_FLAG_STOLEN)
+		return true; /* users expect this */
+	else if (bo_flags & XE_BO_FLAG_PINNED_EARLY_RESTORE)
+		return true; /* needs vmap */
+
 	/*
 	 * For eviction / restore on suspend / resume objects pinned in VRAM
 	 * must be contiguous, also only contiguous BOs support xe_bo_vmap.
 	 */
-	return bo_flags & (XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
+	return bo_flags & XE_BO_FLAG_NEEDS_CPU_ACCESS &&
+	       bo_flags & XE_BO_FLAG_PINNED;
 }
 
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
-- 
2.47.1

