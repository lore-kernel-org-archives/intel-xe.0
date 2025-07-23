Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF781C83F34
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 10:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B1210E7A2;
	Wed, 23 Jul 2025 10:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kygZcmI0";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A11610E7A2
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 10:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1TzY8bo+4vUtKPLcUP8rp9D/+vpqaHuooxZjYRXdXqQ=; b=kygZcmI0Rk/M6f7qlJiId1vIg4
 07yNpRGG4bMzVnURBKQrVQ2KVdf16DiIla/ChG/q/QFtzO4IvCQWzrk0yvHhoAdrTsJggb7F4iuo5
 c2uQtS8xayRRRiZ+ZI03Io3GKt6RukTLc18H2DcdyNEK9cyKDn+V7rt3IwRWqKXnXj9CFucQIYbGc
 pZMPDJxWJ92cSiz/oJnLeJ7zxGzhykQ+gBZVMhmwSFUJOCTcJhYjHRMFYz//2vFED+v+049ux15RH
 nZ0YZB4nbPfPXIgcKxThSvsuVZQJ9prmnd4Ez3K3xuIOmmQ3ZyF5xn/R+de3PxjSwvgTAeHeAZ4hs
 zDRjsffg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ueWhJ-002XyI-2Z
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 12:27:41 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 01/14] drm/i915/display: Fix dma_fence_wait_timeout() return
 value handling
Date: Wed, 23 Jul 2025 11:27:23 +0100
Message-ID: <20250723102739.50425-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250723102739.50425-1-tvrtko.ursulin@igalia.com>
References: <20250723102739.50425-1-tvrtko.ursulin@igalia.com>
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

From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>

dma_fence_wait_timeout returns a long type but the driver is
only using the lower 32 bits of the retval and discarding the
upper 32 bits.

This is particularly problematic if there are already signalled
or stub fences on some of the hw planes. In this case the
dma_fence_wait_timeout function will immediately return with
timeout value MAX_SCHEDULE_TIMEOUT (0x7fffffffffffffff) since
the fence is already signalled. If the driver only uses the lower
32 bits of this return value then it'll interpret it as an error
code (0xFFFFFFFF or (-1)) and skip the wait on the remaining fences.

This issue was first observed in the xe driver with the Android
compositor where the GPU composited layer was not properly waited
on when there were stub fences in other overlay planes resulting in
visual artifacts.

Fixes: d59cf7bb73f3c ("drm/i915/display: Use dma_fence interfaces instead of i915_sw_fence")
Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 456fc4b04cda..7035c1fc9033 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7092,7 +7092,8 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_stat
 	struct drm_i915_private *i915 = to_i915(intel_state->base.dev);
 	struct drm_plane *plane;
 	struct drm_plane_state *new_plane_state;
-	int ret, i;
+	long ret;
+	int i;
 
 	for_each_new_plane_in_state(&intel_state->base, plane, new_plane_state, i) {
 		if (new_plane_state->fence) {
-- 
2.48.0

