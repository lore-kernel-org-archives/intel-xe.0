Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B5DE7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 16:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7044D10E70B;
	Mon, 16 Dec 2024 16:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fx1sTuwo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB2C10E703
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 16:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734366673; x=1765902673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FYSd9W8CiHhRsKA7oZaNPmyQObiU9w/k9hkjMD9cAvA=;
 b=fx1sTuwo2V89J/GFdYPcPI7ogdKP/pmvWRfmiQpG3hPj15Hf0bFJiYB7
 bQtnXortQbRQGbFk05EzmgH3Oru8fznt+/wpgGXZDWyDxFD8nAky1LVY3
 h+1TSWttvoNkn1Jex9W4aQkjtHk4pEZzkhvxkxRI+zMTVV3okDP7qfzNF
 L2JEp9Q8PjXsCdw1ZMMgo6XCDs6jKK2FFVaxEtKtiwEODZRBaY00M1hms
 Z3d9Ayt+SeJHa/A+8fvXmP1ItMo+iLuoAwuwjwBApkO+8TvvlW2wVfPql
 Ik2CzaNTN+sZq6C47JXm35uKL2iBSjpw3Nnug2nPyVOnorEs1iDrTZdUD A==;
X-CSE-ConnectionGUID: kjHAntfrS/2be+R+OPf65A==
X-CSE-MsgGUID: +H9lzm7mTYmoYj4f5dinTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34636170"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="34636170"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 08:31:13 -0800
X-CSE-ConnectionGUID: n2AO7FiMQdSvj8u7I6SqXg==
X-CSE-MsgGUID: jc+eKlx4T9ylvmVY2kZtjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="97125823"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 mwauld-desk.intel.com) ([10.245.244.246])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 08:31:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 6/7] drm/xe: allow non-contig VRAM kernel BO
Date: Mon, 16 Dec 2024 16:29:47 +0000
Message-ID: <20241216162941.86070-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216162941.86070-8-matthew.auld@intel.com>
References: <20241216162941.86070-8-matthew.auld@intel.com>
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
index 3b98ddd2fbda..4990da7870eb 100644
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

