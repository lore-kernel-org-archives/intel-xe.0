Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D799C5DF7D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 09:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC39B10EA72;
	Tue, 18 Aug 2026 09:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aI4KvSnb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AE310EA72
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787046582; x=1818582582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XbvNe/mEmTOKBqxv1ZL33vxq0VVHAsio368ngDVWLf0=;
 b=aI4KvSnblfMytgAXdx2AQX7kJBTE99CTlCtHJxh+b5FAVk2l7pIBHLDj
 Uo9J6+tlbU4Y0CD9aCI1jMhJCJ4S3uu24/wdu2Zju5t0WUAwUK/RHfhTs
 6ZrfwQuOXT/Ldc+bcNjTXlOaurb6+oQZrpKKqXb2c9w41S+3T6TOw2K/Z
 +mqeNreuheQXCbznlw8709DtQaSWDyUuyRkbheXnLo6o9bmxed/764Io/
 im+HHcDy2KlkIBeyMF47hWgxa0fERTp3VkUI97SQnu4/ZoPDreArdR+RW
 ed6JmprZJ/3QmnZrgu24UbH87pzC3mJhAoY5yOSv9n06XmKO9qYUu4/fA A==;
X-CSE-ConnectionGUID: /Fr4dmuwRh2YjQAPHm7KYg==
X-CSE-MsgGUID: ymfKX9sQQOyn9qH0IM6mPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87553822"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87553822"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 02:49:41 -0700
X-CSE-ConnectionGUID: N+Wr5zPiTUm6/xRHGsFTfw==
X-CSE-MsgGUID: dBPalA1XQeW2gbH1rDRk/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262553740"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 02:49:39 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, sk.anirban@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/xe3p_hpm: Remove WA 14025883347
Date: Tue, 18 Aug 2026 15:27:49 +0530
Message-ID: <20260818095748.1512800-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

WA 14025883347 is not applicable for xe3p_hpm. It was added by mistake.

Fixes: c57db41b8d2cd ("drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f02ac9bf74243..a2d093ee6505a 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -63,7 +63,7 @@
 16026007364    MEDIA_VERSION(3000)
 14020316580    MEDIA_VERSION(1301)
 
-14025883347	MEDIA_VERSION_RANGE(1301, 3503)
+14025883347	MEDIA_VERSION_RANGE(1301, 3502)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
 16029380221	MEDIA_VERSION(3500)
 22022079272	MEDIA_VERSION(3503)
-- 
2.43.0

