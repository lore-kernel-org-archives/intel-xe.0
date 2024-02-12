Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3495CC4829B
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 10:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DCB10EC2F;
	Mon, 12 Feb 2024 10:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2SKWBVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327B310EC2D;
 Mon, 12 Feb 2024 10:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707734328; x=1739270328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ktadS9wU33Aj3rJZMGQxhxqOTlhUaxhZdvosSAd0fKg=;
 b=X2SKWBVtADEk+08bm3WK9AHchLg4VMo+Ro6sS+k774F2qvXpfmRkzXDc
 omP4pPBpPu0XLksBLNWmgZvvOFmjQtyddIw44/Ddpkq6Wit8WMtn9z8vk
 gcxzW6k0DwsoIJzdp0YjGjmE2rWJEQ8qkA2o+CzUC08eQYAKwpjzjuptG
 J4ZSXtbScBmajX5G9XxWMHi6AW2Ia5qKv9Y52m55jreTbDCR/X4xsSbkU
 v7Ql+yDT+/uGUrP4Su+8IXy20Lnz1mMJAq4vLe5qlA/aXdNhx/VfYpBhy
 kxYf1NFmZT10qBUxoiw1Gp9TS+EZSoPrfz6fzFK+DBOzWEocKiN+BGu4u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="5543477"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="5543477"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 02:38:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; d="scan'208";a="25759246"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.80])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 02:38:45 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH drm-misc-next] drm/xe: Fix a missing argument to
 drm_err_printer
Date: Mon, 12 Feb 2024 11:38:33 +0100
Message-ID: <20240212103833.138263-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

The indicated commit below added a device argument to the
function, but there was a call in the xe driver that was
not properly changed.

Fixes: 5e0c04c8c40b ("drm/print: make drm_err_printer() device specific by using drm_err()")
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Luca Coelho <luciano.coelho@intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 7eef23a00d77..d42645fdfc02 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -314,7 +314,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc *guc = &gt->uc.guc;
-	struct drm_printer p = drm_err_printer(__func__);
+	struct drm_printer p = drm_err_printer(&xe->drm, __func__);
 	int ret;
 
 	/*
-- 
2.43.0

