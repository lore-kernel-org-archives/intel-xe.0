Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583C7E94619
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 10:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D21310E552;
	Tue, 10 Feb 2026 10:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejPsHuh3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F93A10E558
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 10:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770721188; x=1802257188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+91vHqObvTzLW/WlwOKIEPB31O0VRqov/yW3Bhh/dcs=;
 b=ejPsHuh3VpTW6+IUgeB6bdnKK2xvTtm2Ta1hrvwCeE3Im1QthPhFvZst
 NCAHI0a225zglzANFQOkTC8ojf7TbzMo8d0rYosfqbmO5Tgrj1m4ZQ25v
 MjCyQ2GbIS5UVe54kKsvYhwQz2kO5iTN7HlsJGPVkXyZbWSYorggcXlTV
 /JhpEPu65dN0EqofQQ1jne8j9q1fzZYa4BtlLjNi6tIaXd4tgiaIq+kb+
 iMEfeXCKt/xRvxywxEvJ2GWw0rNn24eFSDpAPDaDoZtvwC5HvH2vKJ7Yr
 D/FDrrSYPPgr4O8ylINfe27tIwUBDI7kIhjM5oEBTNS9IbiaKtFJUs2fT w==;
X-CSE-ConnectionGUID: +wzDasLwTS6VY8ybEosVug==
X-CSE-MsgGUID: dOEC+twfQWGMWOzejxB/Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71056522"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71056522"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 02:59:48 -0800
X-CSE-ConnectionGUID: cBT1Ius6RC6Xd/4eOrS0vw==
X-CSE-MsgGUID: q9MhAAfMQ/WrwoALWnCW1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242510389"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa002.jf.intel.com with ESMTP; 10 Feb 2026 02:59:45 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 3/3] drm/xe/sa: Add lockdep annotations for SA manager
 swap_guard
Date: Tue, 10 Feb 2026 10:59:33 +0000
Message-ID: <20260210105929.4089794-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
References: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
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
V2 -> V3:
- Updated commit message (Matt).
V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_sa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index 59d0187b3e82..794f46272ab5 100644
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

