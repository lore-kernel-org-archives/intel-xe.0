Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D602CA5FA1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 16:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A6A10EB31;
	Mon, 28 Sep 2026 16:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSYB16A5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEF210E941
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790614141; x=1822150141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3O9snaNpj61NGwVpqAErbcwvbhUst7HrWJg9lEhq4og=;
 b=JSYB16A5A2VyarACDRPnjBd906bs0kuJlFRN6LuJrpGygZOy64mKdDTK
 DU/CXX/dAkmA4mLXB2tREF1bDsLq0mlXzvWC3Az2BGoRSPSfuOGvW5ZvD
 DoGgWUUp4r3TvUuGBNdFV053QQUtYK/LojLW1kE4GcThc61fxBO08N1wL
 Y/BiFb0N/N9MK3RSkjsmJmUhuitHpYMoF3RpDNcKx1ww6uRwPEeYjCQlG
 u5VYmX4BYUL3BscZrp7AMM3KKtr8WRnCNyXtI2xKSzVX5TIgypSIAkOWu
 4LVZUsgaBv+48e5Wa9jXCYQ0nqsqDfE0LYiPixcM/mWb/Hum8jwXBonPg w==;
X-CSE-ConnectionGUID: HliwTD8US9W3KTnJIB36RA==
X-CSE-MsgGUID: qeiOgbT+QcuEe/wp+pUSwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="116845572"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="116845572"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:49:01 -0700
X-CSE-ConnectionGUID: ufmkoWpKQeizC3j95ZccbQ==
X-CSE-MsgGUID: W81AKXMNRQ2F3mzQOlT8Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="301404251"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.80])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:49:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH 2/2] drm/xe/vm: make PREFETCH to TT sticky
Date: Mon, 28 Sep 2026 17:48:23 +0100
Message-ID: <20260928164820.1237049-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928164820.1237049-4-matthew.auld@intel.com>
References: <20260928164820.1237049-4-matthew.auld@intel.com>
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

When userspace explicitly requests DRM_XE_VM_BIND_OP_PREFETCH to system
memory (XE_PL_TT), xe_bo_migrate() moves the buffer object to TT.
However, because XE_PL_TT is marked with TTM_PL_FLAG_FALLBACK in the
buffer's default placement (introduced in commit 5c87fee3c96c ("drm/xe:
Attempt to bring bos back to VRAM after eviction")), any subsequent
validation during exec immediately migrates the buffer back to VRAM,
completely undoing the userspace prefetch request.

Use xe_bo_migrate_tt_sticky() when prefetching to XE_PL_TT so that the
buffer remains resident in system memory across subsequent validations.

Assisted-by: LLM
Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 5c87fee3c96c ("drm/xe: Attempt to bring bos back to VRAM after eviction")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
---
 drivers/gpu/drm/xe/xe_vm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 425c678f4480..2068e0cf50ff 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3406,7 +3406,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 				mem_type = region_to_mem_type[region];
 			}
 
-			err = xe_bo_migrate(bo, mem_type, NULL, exec);
+			if (mem_type == XE_PL_TT)
+				err = xe_bo_migrate_tt_sticky(bo, NULL, exec);
+			else
+				err = xe_bo_migrate(bo, mem_type, NULL, exec);
 		}
 		break;
 	}
-- 
2.55.0

