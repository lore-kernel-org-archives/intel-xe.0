Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF383E9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 10:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7324F10E6A9;
	Thu, 19 Feb 2026 10:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxC8c3JR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB11410E695
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771498491; x=1803034491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=69fVA7touyMCWyOlenNNPdq1tljcBSfBoWRKicsGa/s=;
 b=LxC8c3JRNnrbwbMRW2EfGoR4mZUMcJfn4IH0EPXLGYweYsHdHcaQPBXk
 qnV7ZaLGpQTDOegx/klOFliCM8bE2dASnvhDzW8bJDpdIXXB7+FDguS0l
 HNWDBXhqd/63obD67huOJnoQE8ZfjHLcFvure4/smaIOodVn1dvrAH0C2
 /DldChYu97eKAa/Pj122cVsK5Kq4JwcoCHsp/zMhFFL+pfpRv0UtqYU78
 fMnbf0jUKQNkFxoXCn4QUTEZ/CUc73wfs5zWDnmMq/PoZRIUo3H9h0plU
 vDEtucGsmZiCFQFSptcWZMFGdKezXUH5cCaqEkl7BwR75DCEDR+Cs04qF g==;
X-CSE-ConnectionGUID: vJ3YXJbkSIuMSYGo9OptvQ==
X-CSE-MsgGUID: 2xJhca2ET3uGFxXBmaATkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71604977"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="71604977"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 02:54:51 -0800
X-CSE-ConnectionGUID: M9qZFohvS9GwsNGTlrPvXQ==
X-CSE-MsgGUID: req2f5ulSN2+7jpD62Fy8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213163348"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa010.fm.intel.com with ESMTP; 19 Feb 2026 02:54:49 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v7 3/3] drm/xe/sa: Add lockdep annotations for SA manager
 swap_guard
Date: Thu, 19 Feb 2026 10:54:37 +0000
Message-ID: <20260219105433.2234194-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219105433.2234194-5-satyanarayana.k.v.p@intel.com>
References: <20260219105433.2234194-5-satyanarayana.k.v.p@intel.com>
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
V5 -> V6:
- None.

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
index c7ee952e8914..f32045f40b7a 100644
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

