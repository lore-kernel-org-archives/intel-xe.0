Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430CAFEFB6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 16:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41A610EBC5;
	Fri, 27 Feb 2026 16:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqVMpGTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688B010E1AD;
 Fri, 27 Feb 2026 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772208047; x=1803744047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UriJFFGMLx0rpjWjnYtZB8f+uPT+gzj8eriJCdWkSgc=;
 b=MqVMpGTvW0o2oAd+W8J2uDpkvG1qIxPXKtTRQek1CDyAIPrRlDtWNfRr
 QhrNti1dQ79HeovwtyUeRsRbK47vIIFPzHVwO/wCMYM0uQTAd2pKHOMdg
 F9pdBzdcw9qIt1sht3/E+8Eoh7bbOdWDsmDgKnWqSwEENYxwjX1FQWLBZ
 p6o1FpezJUids51fNt1Cp1dGa9I2N4a4phdLy0Nx/UNCHe428NnZHCptf
 7OXhyAZYvZpnxOcewCJmNMXOcNVlb3ykM5fVEwp1S4+Ml/lhrDO44d75c
 MyClefk1j00JbIG3pvv6xvwzvx5XTwsjpynmF7011T0GATXKnrShpVPfW A==;
X-CSE-ConnectionGUID: BwPNORoSTPKlrGH4rcsOGA==
X-CSE-MsgGUID: T/dmhX4BQFutppB4l7owPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="75895471"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="75895471"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:00:47 -0800
X-CSE-ConnectionGUID: sjAl303tSC+NmSapWV2N9w==
X-CSE-MsgGUID: 74EpW9JMTOWTM/FIUl/cGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="213791069"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.106])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:00:45 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: Don't spam the log on buffer object backing
 store allocation failure
Date: Fri, 27 Feb 2026 17:00:11 +0100
Message-ID: <20260227160012.82309-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
References: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
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

If the struct ttm_operation_ctx::gfp_retry_mayfail is true,
buffer object backing store allocation failures are expected to
silently fail with an error code to the caller. But currently an
elaborate warning is printed to the system log.

Don't spam the log in this way.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index c0d95559197c..8fa9e09f6ee5 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -726,7 +726,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 		gfp_flags |= __GFP_ZERO;
 
 	if (ctx->gfp_retry_mayfail)
-		gfp_flags |= __GFP_RETRY_MAYFAIL;
+		gfp_flags |= __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
 
 	if (ttm_pool_uses_dma32(pool))
 		gfp_flags |= GFP_DMA32;
-- 
2.53.0

