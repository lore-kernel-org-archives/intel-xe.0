Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E67AE81E1A
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 16:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF3610E53D;
	Fri,  6 Oct 2023 16:51:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3A710E53D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696611062; x=1728147062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZU71+fM6dQWL02ZV2jSY1dEzEI5uhfrXF7DHxgnKzd4=;
 b=P1ecW/HfGqYnxVocLyjdpF0h7BuNW2bBQE3UmWk/f6u5e0ZJbvYKJx0S
 OiJ3xvE8cI58hDUI8XXu45iZSiltSezKmMvBStJN008954wuUYtG7YSOe
 0PztVfNZOn36TT+BHgoHVkHa4ylpt78N9aoGjwdI1eagHpuxxNpd0yG0L
 ZGqVX8jOsI5b5uI/8ai/2qU/3UWljoQw3/1w6Lxizj2dWye3Qpi5kkLUM
 IhlZ14WyC+oT9dnmQBQSk6Q+nWGbeU+Yko7HIQ9+HH/VbMkqV5CBf2TVH
 3De8RqGIvM7BHki1/ODlN20gVa2+1uhlFPFXQWR+xPCj831lrj0U9KCs7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="2388364"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="2388364"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 09:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="702104992"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="702104992"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 09:51:00 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:50:53 -0700
Message-ID: <20231006165053.55479-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Remove PIPE_CONTROL_TILE_CACHE_FLUSH
 from PIPE_CONTROL in gfx20+
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

PIPE_CONTROL_TILE_CACHE_FLUSH/bit 28 is now reserved bit in PIPE_CONTROL
instruction for gfx20+, so here only setting it for older graphics
versions.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 6eec7c7e4bc56..c2aec32fc46ad 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -157,16 +157,19 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
 static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
 {
 	struct xe_gt *gt = job->q->gt;
+	struct xe_device *xe = gt->tile->xe;
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
 	u32 flags;
 
 	flags = (PIPE_CONTROL_CS_STALL |
-		 PIPE_CONTROL_TILE_CACHE_FLUSH |
 		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
 		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
 		 PIPE_CONTROL_DC_FLUSH_ENABLE |
 		 PIPE_CONTROL_FLUSH_ENABLE);
 
+	if (GRAPHICS_VERx100(xe) < 2000)
+		flags |= PIPE_CONTROL_TILE_CACHE_FLUSH;
+
 	if (XE_WA(gt, 1409600907))
 		flags |= PIPE_CONTROL_DEPTH_STALL;
 
-- 
2.42.0

