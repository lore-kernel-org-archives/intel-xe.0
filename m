Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985C8CDB471
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 06:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4F110E4CA;
	Mon, 22 Jun 2026 06:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGkvYh3h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C6C10E285
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782111580; x=1813647580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oqng2x26xqx7fg6gY4E/IrFbqpa+bHmAHudTmqZfo38=;
 b=gGkvYh3hzh9OhDN6JMR3QSpbr5RbSrWPuiL+/RNsDPp+BtPjkTWq+Rrh
 c4UuSiBOISwEsg6UNrtxP21Sit9POAC+RS5sxyGBq3AtQMe2jrMvo3I/K
 1vUqUkQ/u/q2H3G/nWR+igqFydb615NR9tT+VQV9DVFhq1aiDhoz0i1CM
 Q+aaWfR5c2EMMhvqogIUFVwvEsqkZogLnIvV4kFvDSK25PnfVYMcUeDmr
 GNRCPsohJDA/Zyd/d7N+DK2kFjmH91pxjjU0tfzFWHx2zESmZscoBwEoe
 vj/cClJLkfyrHhU2GSg9e6kGTQqpG2IPDG6sjof7saVEUtDWX1fmTeCWS Q==;
X-CSE-ConnectionGUID: InnxgfF4Ss6gTG/n+peyZQ==
X-CSE-MsgGUID: tcw458gHRKG3YkWl8D+Otw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82928735"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82928735"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 23:59:40 -0700
X-CSE-ConnectionGUID: KohG0hPgQ4iXTWktYpi/Ww==
X-CSE-MsgGUID: RckjbASlR3WVzFt1K562sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="251068106"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2026 23:59:38 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 4/9] drm/xe: add 1G BO page-size alignment flag
Date: Mon, 22 Jun 2026 12:30:26 +0530
Message-ID: <20260622070031.2445502-5-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
References: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
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

Add XE_BO_FLAG_NEEDS_1G and use it to request 1G alignment for BOs that
require a 1G minimum page size.

Update xe_bo_init_locked() so VRAM and stolen-memory BO sizing honors
the new flag alongside the existing 64K and 2M page-size requirements.
When XE_BO_FLAG_NEEDS_1G is set, the BO size is rounded up to 1G;
otherwise the existing 2M and 64K alignment behavior is preserved.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++--
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4c80bac67622..45ff01df68e1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2323,8 +2323,16 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
 	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
-	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M)))) {
-		size_t align = flags & XE_BO_FLAG_NEEDS_2M ? SZ_2M : SZ_64K;
+	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M
+		       | XE_BO_FLAG_NEEDS_1G)))) {
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

