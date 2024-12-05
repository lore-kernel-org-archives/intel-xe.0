Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C36EE7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 11:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F0810E12F;
	Thu,  5 Dec 2024 11:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPSgPwLp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A782010E12F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 11:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733398088; x=1764934088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5GjPT/fa/z42JjICxm64vH7ScCy263Q8tIKpGbBH0jA=;
 b=OPSgPwLpjqyYMTV0aRabIjMVz6nx6vwIsywYFQYbkjdFs+gcaJ+E/sCB
 b+ofqPtxmo2xnUUfbfJtBJeTipPeD5l1AtChIfUZXCqkCf/h5VCM9m9uq
 FVJxUrhSwiOamkOOjaoKc4wtiXUwzOBB7THSociIzyNpwI6aMXYxlLdd/
 hAkBFn/ZOaEJFiL7aAc5Bgvepgvk6DTRhKIm5Ig03BLTP4HRbqalnBvux
 HxZYIZw2h6hZHdnhh/7A2mlgJTR49J6fZw3kMNslagnwd/vEM2zFiDfYl
 tpOcUrQWOhdzYAS5EinbZYtNtPTrU5wl832MXbj+cUwDXBf20bdm95WF0 g==;
X-CSE-ConnectionGUID: TRmim+IURI24UyewLDGhFQ==
X-CSE-MsgGUID: 8gUlO1vfSxiEnQRv0E1vMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33765222"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33765222"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:28:07 -0800
X-CSE-ConnectionGUID: zUnIeqEbQk69sTDY1l7cyg==
X-CSE-MsgGUID: QV4d2Oq8RYaFwjhYpKXJQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="98516658"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:28:06 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe/tests: Wait for clear fence operation to complete
Date: Thu,  5 Dec 2024 12:47:02 +0100
Message-ID: <20241205114702.1963303-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Ensure the clear operation completes before proceeding, as the clear
fence is not attached to the BO's dma-resv object.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 3e0ae40ebbd2..c9ec7a313c6b 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -49,6 +49,13 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
 			return PTR_ERR(fence);
 		}
+
+		if (dma_fence_wait_timeout(fence, false, 5 * HZ) <= 0) {
+			dma_fence_put(fence);
+			KUNIT_FAIL(test, "Timeout while clearing bo.\n");
+			return  -ETIME;
+		}
+
 		dma_fence_put(fence);
 	}
 
-- 
2.46.0

