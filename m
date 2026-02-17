Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFA8E68172
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 12:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D721B10E4C7;
	Tue, 17 Feb 2026 12:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOSENld2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B10310E4C4
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771330084; x=1802866084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IaAi+ct/AWUSDx2fNOroyuzr5jPDkOvZH/L2dO5gAnI=;
 b=mOSENld2bsoKvZFTiZQgcejMQK+iAoZ+RKjoa0NquJp5Z579amt+gaJB
 e+x2iRlX0YtsY0jWzOGWqeKiAXvP0zpVJbx40sbZh+TT5pLGTZWrBOYnS
 jYfFeh5olPFw0QPAa/p4Nn/3HP5nGYwrNkkp7Acd1w4TPG0qr4hWwGUOp
 QJJERSSvydatdp790SH7lYgCRfi6UVqZxqbSydK81J/u4hyFG8Zf8AQR7
 qjOMeUorqhbpMR45uliERrZOG3rjaMKST9b3hkp2SCZMed5f7z6zC7LXL
 JgQmgdLGwLotDClS0hTOTaAuiLvIfuLcI3nknZv6JRrUp2hmQ1SQ2jfLO g==;
X-CSE-ConnectionGUID: 9uFWz/78Sj+v1ovA9aAglg==
X-CSE-MsgGUID: WPlS+LSHRUuuzGeFuDFT2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89980954"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="89980954"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 04:08:04 -0800
X-CSE-ConnectionGUID: 1F6vitf7QlyHnvEz4leovQ==
X-CSE-MsgGUID: hF1abQKPSWWwdAPHe5ChTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="244460127"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa002.jf.intel.com with ESMTP; 17 Feb 2026 04:08:02 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v5 3/3] drm/xe/sa: Add lockdep annotations for SA manager
 swap_guard
Date: Tue, 17 Feb 2026 12:07:49 +0000
Message-ID: <20260217120745.1074232-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217120745.1074232-5-satyanarayana.k.v.p@intel.com>
References: <20260217120745.1074232-5-satyanarayana.k.v.p@intel.com>
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

Annotate the SA manager init path to model taking swap_guard while under
reclaim context. This helps lockdep catch potential circular dependencies
between fs_reclaim and swap_guard in debug builds. Without this annotation,
lockdep is unaware of this chain until the shrinker runs.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

---
V4 -> V5:
- Fixed typo in commit message (Michal).

V3 -> V4:
- None.

V2 -> V3:
- Updated commit message (Matt).

V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_sa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 4b3dcc7e5ae0..443e823acddf 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -89,6 +89,12 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
 		if (ret)
 			return ERR_PTR(ret);
 
+		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
+			fs_reclaim_acquire(GFP_KERNEL);
+			might_lock(&sa_manager->swap_guard);
+			fs_reclaim_release(GFP_KERNEL);
+		}
+
 		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
 						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 						      XE_BO_FLAG_GGTT |
-- 
2.43.0

