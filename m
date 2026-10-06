Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A7ECA5FED
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 12:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCFF10E039;
	Tue,  6 Oct 2026 12:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuvI6+pm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEDD10F2A2
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791290502; x=1822826502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wTPMmideke+RJXGTp3zgIS1OozZc5d2/ZmEFSnq786Y=;
 b=fuvI6+pmpxB8GQuyY/gQEiRF0s942VfTNl+7/KtIH2Gg7SVYNI3zP2Kc
 yh9BUEAptg0EoVZdZW1RWb0MY9vpaI2zvU5dGk8Ozyf5Hu2yU8BBCyIF7
 r0DhAV94TzNDSXs6v734kAOwVV8ZeUpJzhfQNlu1C7BgHjGhD3+i7OO1C
 B1UKCSA0Io/iS5rLW9no8BTdbiqY8Sbj12vP5E9/Tf6K0sHbr7QqrSDhT
 0zvEML92xn8M87kpSJvSZedbOtA7204xnkeBzSepZjG8/QE42du+pccil
 D0lAXdtTcWDtwXGYjBbzKE26iGgnXu8g75j09FLTht8yilB5mxPYoWaDI w==;
X-CSE-ConnectionGUID: EfasmZ5BSbiomZbCM/OHWA==
X-CSE-MsgGUID: RpfNh5erQhuBotvFE2nhBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="113765005"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="113765005"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 05:41:42 -0700
X-CSE-ConnectionGUID: 5hm/IXwFS5Ob7QZK1apF2A==
X-CSE-MsgGUID: YR1E1JiERrqkGPVhWJSKPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="276670022"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 05:41:41 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 4/4] drm/xe: Keep VRAM fault injection within the usable
 range
Date: Tue,  6 Oct 2026 18:11:30 +0530
Message-ID: <20261006124125.1560295-10-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261006124125.1560295-6-tejas.upadhyay@intel.com>
References: <20261006124125.1560295-6-tejas.upadhyay@intel.com>
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

xe_ttm_vram_inject_fault() picked its starting address from
vr->actual_physical_size, which includes the CCS/GSM/DSM infrastructure
zone beyond vr->usable_size. The buddy allocator (vram_mgr->mm) only
manages usable_size, so the first probed address can land in that
infra zone; xe_ttm_vram_addr_to_region() then returns NULL for it and
xe_ttm_vram_handle_addr_fault() requests an SBR instead of exercising
page offlining.

Start the probe at usable_size - PAGE_SIZE and stay within
usable_size so the injected fault always lands on real, buddy-managed
VRAM.

Fixes: 6ef3eb10aea4 ("drm/xe: Add fault-inject based VRAM page offline injection")
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 7211ab5f66e9..8bf6bbc2f0ae 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -988,11 +988,12 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
 	struct gpu_buddy *mm = &vram_mgr->mm;
 	u64 addr;
 
-	if (vr->actual_physical_size < PAGE_SIZE)
+	/* Stay within the buddy-managed range; CCS/GSM/DSM sit beyond usable_size */
+	if (vr->usable_size < PAGE_SIZE)
 		return -ENOSPC;
 
-	addr = vr->actual_physical_size - PAGE_SIZE;
-	while (addr < vr->actual_physical_size) {
+	addr = ALIGN_DOWN(vr->usable_size - PAGE_SIZE, PAGE_SIZE);
+	while (addr < vr->usable_size) {
 		struct gpu_buddy_block *block;
 		bool found = false;
 
-- 
2.52.0

