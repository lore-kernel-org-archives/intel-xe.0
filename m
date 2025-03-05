Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC974C282D3
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 09:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C6410E720;
	Wed,  5 Mar 2025 09:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDXugFKS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CA010E720
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Mar 2025 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741166559; x=1772702559;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ThFNrYXVitCZGlEDNTVkigQQdsT3hD63kNWa8M7ESkc=;
 b=GDXugFKSYQIIqIsBMaDV/zuU+R+MBBZ+7I56bjlxwEL8QrwN3FCXMezu
 LqLUB76DI48DLO4DiXDHHjg36N+rwAB+jVrqNlyS1pJLQ0nWPsfE1ysca
 citwp5QcPp5t1NFWt/58xbAyUSNdUskeygHQB2aimBWrR+GKOzpqSYabY
 xpYPiuTtcXKy8kt7St446TetV7WrlCFmJc9Bpl8V+gp9IsbEiOL5uFMk6
 mr9ovg0R7FJ5AMBEzVB9BuTrZMhC7mX5DXpZ0W7M+myq30FFe/nkJdKj9
 G/KJQqvSlIpivrJRXE/YA1tH+DZM4cDPjUzk5LxfhAgp4GVndhCPPnorb g==;
X-CSE-ConnectionGUID: pTiSj9b9T22jsAHGuVitFw==
X-CSE-MsgGUID: Ja9DwrBHQdWz8tzSki5fVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64557185"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="64557185"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:22:39 -0800
X-CSE-ConnectionGUID: XGLVoVimRQSurjeNFsgtaA==
X-CSE-MsgGUID: rrBS/qLHRaW9LihfutIk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="123569529"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:22:38 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v17 7/7] drm/xe: Increase the XE_PL_TT watermark
Date: Wed,  5 Mar 2025 10:22:20 +0100
Message-ID: <20250305092220.123405-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305092220.123405-1-thomas.hellstrom@linux.intel.com>
References: <20250305092220.123405-1-thomas.hellstrom@linux.intel.com>
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

The XE_PL_TT watermark was set to 50% of system memory.
The idea behind that was unclear since the net effect is that
TT memory will be evicted to TTM_PL_SYSTEM memory if that
watermark is exceeded, requiring PPGTT rebinds and dma
remapping. But there is no similar watermark for TTM_PL_1SYSTEM
memory.

The TTM functionality that tries to swap out system memory to
shmem objects if a 50% limit of total system memory is reached
is orthogonal to this, and with the shrinker added, it's no
longer in effect.

Replace the 50% TTM_PL_TT limit with a 100% limit, in effect
allowing all graphics memory to be bound to the device unless it
has been swapped out by the shrinker.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 9844a8edbfe1..d38b91872da3 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -108,9 +108,8 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	u64 gtt_size;
 
 	si_meminfo(&si);
+	/* Potentially restrict amount of TT memory here. */
 	gtt_size = (u64)si.totalram * si.mem_unit;
-	/* TTM limits allocation of all TTM devices by 50% of system memory */
-	gtt_size /= 2;
 
 	man->use_tt = true;
 	man->func = &xe_ttm_sys_mgr_func;
-- 
2.48.1

