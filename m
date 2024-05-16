Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8059C25B7D
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 18:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB3E10ED99;
	Thu, 16 May 2024 18:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOFzYOLy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF4910E39A
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 18:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883850; x=1747419850;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aqcoCRU4N9DS91+gSoR8uJldzTDKB8mTwUeVmzq4VKc=;
 b=JOFzYOLyaQ5+G4T6l75Tfu0ZFOv/x8lbbv4Q4xkdjiSHb3z5PSkX80kl
 bcWr1+uAGYxNUv7YYnxBWmLD0G+S+cqjvg4dTeKWMXI0P0hBlOy9aXMG0
 WqFJnppMYbdh+ZHRXp6SLs7GUfbOs7rVLMWQrIoQgnnAXPcWNZmFyT3YT
 uE7viIcWuFBq9XmzWD091b8UGgtHJ8Bs9dR2hHaSZBf4iF0VfdmWtbxm7
 RvCdm4S7usCPRytW55nh6wP5/qL8mAnM8WutyVjxe12G9nm9XRVWGjJKa
 pTlarSkZpVA19hJGFsp2Qif6uTme8W0bT47CTW8dQXw05D0FH6aHV3YBc Q==;
X-CSE-ConnectionGUID: Gq2eeEy7SwSy+XrOr9Qttw==
X-CSE-MsgGUID: UyinukOPRB6SQKzCq7XUWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23159961"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="23159961"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:09 -0700
X-CSE-ConnectionGUID: dPhFxLI1TNqeyvv/3BqvMA==
X-CSE-MsgGUID: n694FdvGR1KNO0eSiG80IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="32065517"
Received: from unknown (HELO fedora..) ([10.245.246.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 20/21] drm/ttm: Use drm_exec_trylock for bo initialization
Date: Thu, 16 May 2024 20:23:38 +0200
Message-ID: <20240516182339.3482-21-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
References: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
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

Buffer object initialization may be part of a drm_exec transaction.
Rather than using dma_resv_trylock, use drm_exec_trylock_obj().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d4b35856f907..618c41d15fef 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -924,10 +924,17 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 	/* passed reservation objects should already be locked,
 	 * since otherwise lockdep will be angered in radeon.
 	 */
-	if (!resv)
-		WARN_ON(!dma_resv_trylock(bo->base.resv));
-	else
+	if (!resv) {
+		if (ctx->exec) {
+			ret = drm_exec_trylock_obj(ctx->exec, &bo->base);
+			if (ret)
+				goto err_put;
+		} else {
+			WARN_ON(!dma_resv_trylock(bo->base.resv));
+		}
+	} else {
 		dma_resv_assert_held(resv);
+	}
 
 	ret = ttm_bo_validate(bo, placement, ctx);
 	if (unlikely(ret))
@@ -936,8 +943,12 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 	return 0;
 
 err_unlock:
-	if (!resv)
-		dma_resv_unlock(bo->base.resv);
+	if (!resv) {
+		if (ctx->exec)
+			drm_exec_unlock_obj(ctx->exec, &bo->base);
+		else
+			dma_resv_unlock(bo->base.resv);
+	}
 
 err_put:
 	ttm_bo_put(bo);
-- 
2.44.0

