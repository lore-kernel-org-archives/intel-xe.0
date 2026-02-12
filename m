Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451CFECD6FA
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 13:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0822D10E74D;
	Thu, 12 Feb 2026 13:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwIvEOg4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026D010E74B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 13:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770901381; x=1802437381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yC3hNUp07iWJbMyTkVPpP9MEWwRagL69cv9gexKhzsM=;
 b=jwIvEOg4/9xQdVvF3K+l8+KeZ/zL6obNouAFHGaNQKCvV5CnEOt/8CzX
 UehtXqACltnIs4+As96GjePiZPfzCfRfuHTk1RG/PjOINQAN6NOWLhvDC
 wJb4MAZ90cykjl2fwORghQmeV2L6Z2T0Y2yibI2l1XAIY+lRkSWXkPzi1
 0/ENZ+VI1Eblyd456ZoDd4wP7qa6iUxzGsc7dy3LK4E5Ue5MHu7cAAAC2
 ZNj3Mnl1MPj/Im2Is1aCA4xLB4Cc2Gtmqq27bMX4LziCMCV1tUGJLuCjk
 VQpoMaMj9+M5FdOQ0dO/ka0b68Wjhkn2b1Owag4Qx8CE94NdZ0nMerf0M A==;
X-CSE-ConnectionGUID: eC+L0s0yTdedpUdckdV0qw==
X-CSE-MsgGUID: JKmmdYk5SVq4scjtb8Hg2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89479444"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="89479444"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 05:03:01 -0800
X-CSE-ConnectionGUID: VNWoPbl3Sw+DQPVoOfizKQ==
X-CSE-MsgGUID: roh3Jp3ZRcmcSu9MMXkTgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212423952"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa009.jf.intel.com with ESMTP; 12 Feb 2026 05:02:59 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v4 3/3] drm/xe/sa: Add lockdep annotations for SA manager
 swap_guard
Date: Thu, 12 Feb 2026 13:02:47 +0000
Message-ID: <20260212130243.399353-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212130243.399353-5-satyanarayana.k.v.p@intel.com>
References: <20260212130243.399353-5-satyanarayana.k.v.p@intel.com>
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
lockdep is unware of this chain until the shrinker runs.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

---
Cc: Christian König <christian.koenig@amd.com>

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

