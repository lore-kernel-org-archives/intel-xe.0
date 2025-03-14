Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6937AC282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 14:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF2E10EA04;
	Fri, 14 Mar 2025 14:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gl+zldFa";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A0D10EA04
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jRUZ6nmPOZNgAYLY01EqMlUsnCH6ammghdNjG8gnLmk=; b=gl+zldFa7okTch0OnYzdJMOZdI
 e/Ba2865innZCToWZaP2PeuooI3zHV1W1/MyRQ30jtTI8pm7ZdNxC3yVafIQR5PWHgsCsYXioh/TZ
 xwGkIBJwj3lNWIaebdJCXn2m48fsiuQEPuIcnX7cBOsK2rNWaUOxIaxCF7eHbaLWJrAL0nevDstSf
 fBy5Jt5lAcYnQKWdd06CS/O0UGdql4wPtkRcJMZzHxEAhxVkmHUEceCPWyUUfu/YTUAtqPjf8yEQ8
 z3M17BkiKqQQsDao10xdvIIz7hLPIrF8aIPNzGtWROd8JN4JWlBr7y3IqnvCjEVXYTSaRrRgvhfjB
 tXv4409g==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tt6U0-0006i7-Lb; Fri, 14 Mar 2025 15:57:56 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe: Flush delayed frees and retry on user object
 allocation failure
Date: Fri, 14 Mar 2025 14:57:50 +0000
Message-ID: <20250314145750.34362-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

If userspace workload is operating near the limit of available memory and
it moves from one large working set to another, in other words free some
large buffers and immediately allocate some new ones, the TTM eviction
attempt during new resource allocation may not be effective due the
combination of relying on trylock and the fact released buffer might have
ended on the delayed release path.

From userspace point of view this reflects as sporadic
VK_ERROR_OUT_OF_DEVICE_MEMORY ie. sometimes the application will work,
sometimes will fail, even if it does exactly the same thing on an
otherwise idle system.

Good examples are two tests from the VK CTS suite:

 - dEQP-VK.pipeline.monolithic.render_to_image.core.*
 - dEQP-VK.memory.allocation.random*

To improve this we can flush the TTM delayed object free workqueue and
retry when encountering ENOMEM, which so far looks like a significant
improvement in mean-time-to-failure.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 64f9c936eea0..53f45c766e59 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1900,9 +1900,25 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
 				u16 cpu_caching,
 				u32 flags)
 {
-	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
-						 cpu_caching, ttm_bo_type_device,
-						 flags | XE_BO_FLAG_USER, 0);
+	unsigned int retry = 3;
+	struct xe_bo *bo;
+
+	while (retry--) {
+		bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
+					   cpu_caching, ttm_bo_type_device,
+					   flags | XE_BO_FLAG_USER, 0);
+		if (!IS_ERR(bo) || PTR_ERR(bo) != -ENOMEM)
+			break;
+
+		/*
+		 * TTM eviction may sporadically fail due reliance on trylock
+		 * and delayed ttm_bo deletion causing trylock to fail. Work
+		 * around it by retrying after currently pending delayed
+		 * releases have been processed.
+		 */
+		flush_workqueue(xe->ttm.wq);
+	}
+
 	if (!IS_ERR(bo))
 		xe_bo_unlock_vm_held(bo);
 
-- 
2.48.0

