Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F4CC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 07:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB1010E60F;
	Tue,  5 Aug 2025 07:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuUaY7RO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1513A10E606
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754380151; x=1785916151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1xk6aLT08ICrU8/eFnZZFifBDZYD9pMX/wD7oKxxNfM=;
 b=fuUaY7RO4+fDRyQf5UnBaWfup12EfdwK9OegE2FwuXtE1SK6PY5BPn2t
 ZZTDDQH0FLg1O4Jo4Jbm6RAAStHRvHXWGLnjnszeRkEzAYA8ebpvjv6Fx
 s8eAxLjndEHKDkiT9lXHSgjliN50rOclIV345zY9gqxSxOkO2/SiApBta
 koacQ1lC61DbdNqbotegeGu+Io56fzSeMdMLW1ukCqactbd0oHtqjL7U8
 6o2A8sJhO3Qf3CR752QMwYK+fLI0izZUN7jIqFdSjsJevbKzdj6ZbBblP
 8pv3WBv3U95oiDXrxUd/F2a0750RT8heWe1n/lHgjd/REde+I62i/Y6wj A==;
X-CSE-ConnectionGUID: yo6oXExUQkKj8wCawCIFAw==
X-CSE-MsgGUID: AQC2PiFkQsWXaFKHzj3c5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56741785"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56741785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 00:49:10 -0700
X-CSE-ConnectionGUID: /PBRBPlQTMuf4BNk9E7UNA==
X-CSE-MsgGUID: XfE+Mv47Q2epk38YexRrCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="168572594"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.229])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 00:49:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 melvyn <melvyn2@dnsense.pub>, Summers Stuart <stuart.summers@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2] drm/xe: Defer buffer object shrinker write-backs and GPU
 waits
Date: Tue,  5 Aug 2025 09:48:42 +0200
Message-ID: <20250805074842.11359-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

When the xe buffer-object shrinker allows GPU waits and write-back,
(typically from kswapd), perform multiple passes, skipping
subsequent passes if the shrinker number of scanned objects target
is reached.

1) Without GPU waits and write-back
2) Without write-back
3) With both GPU-waits and write-back

This is to avoid stalls and costly write- and readbacks unless they
are really necessary.

v2:
- Don't test for scan completion twice. (Stuart Summers)
- Update tags.

Reported-by: melvyn <melvyn2@dnsense.pub>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5557
Cc: Summers Stuart <stuart.summers@intel.com>
Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
Cc: <stable@vger.kernel.org> # v6.15+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 51 +++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 1c3c04d52f55..90244fe59b59 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -54,10 +54,10 @@ xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgea
 	write_unlock(&shrinker->lock);
 }
 
-static s64 xe_shrinker_walk(struct xe_device *xe,
-			    struct ttm_operation_ctx *ctx,
-			    const struct xe_bo_shrink_flags flags,
-			    unsigned long to_scan, unsigned long *scanned)
+static s64 __xe_shrinker_walk(struct xe_device *xe,
+			      struct ttm_operation_ctx *ctx,
+			      const struct xe_bo_shrink_flags flags,
+			      unsigned long to_scan, unsigned long *scanned)
 {
 	unsigned int mem_type;
 	s64 freed = 0, lret;
@@ -93,6 +93,48 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
 	return freed;
 }
 
+/*
+ * Try shrinking idle objects without writeback first, then if not sufficient,
+ * try also non-idle objects and finally if that's not sufficient either,
+ * add writeback. This avoids stalls and explicit writebacks with light or
+ * moderate memory pressure.
+ */
+static s64 xe_shrinker_walk(struct xe_device *xe,
+			    struct ttm_operation_ctx *ctx,
+			    const struct xe_bo_shrink_flags flags,
+			    unsigned long to_scan, unsigned long *scanned)
+{
+	bool no_wait_gpu = true;
+	struct xe_bo_shrink_flags save_flags = flags;
+	s64 lret, freed;
+
+	swap(no_wait_gpu, ctx->no_wait_gpu);
+	save_flags.writeback = false;
+	lret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned);
+	swap(no_wait_gpu, ctx->no_wait_gpu);
+	if (lret < 0 || *scanned >= to_scan)
+		return lret;
+
+	freed = lret;
+	if (!ctx->no_wait_gpu) {
+		lret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned);
+		if (lret < 0)
+			return lret;
+		freed += lret;
+		if (*scanned >= to_scan)
+			return freed;
+	}
+
+	if (flags.writeback) {
+		lret = __xe_shrinker_walk(xe, ctx, flags, to_scan, scanned);
+		if (lret < 0)
+			return lret;
+		freed += lret;
+	}
+
+	return freed;
+}
+
 static unsigned long
 xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 {
@@ -199,6 +241,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 		runtime_pm = xe_shrinker_runtime_pm_get(shrinker, true, 0, can_backup);
 
 	shrink_flags.purge = false;
+
 	lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
 				nr_to_scan, &nr_scanned);
 	if (lret >= 0)
-- 
2.50.1

