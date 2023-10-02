Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6912E784B0
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 10:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA1D10E27A;
	Mon,  2 Oct 2023 10:11:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C2610E278
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 10:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696241494; x=1727777494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rc3sIOi8yR0C+1qPr3odzs6aa/kvRWI9NBE5abLL68w=;
 b=Au1RRMe4vAE3Bel9mQiz1UBOUS5JNYAmahCU82qbXNicjVOu7SWIE8NS
 4XowBurIRe0iVLSDtfRJxbFX+66zTCdxM0mL2JKWlMRMo8/kJybTvrtKO
 APhKF2UPoPsmHeZWE3oDUhMwTfu3gQEwr4b3liclhAqMw3efG96WggXdN
 Mg4V5rJdn2t7qdzb6n6hTqLz5CZEYk1KHkwXuREIcUK9TCz39WLuLbJ9G
 Et79MCXAxwiRl3KUN3DJikrwLjTyfd6cedKXxSnhYatDCaCKu2XsU+Bgi
 k39ZWVOWcVYOYo3dyFM6HiFC9irr9EkZVdrbg4fzWId+cvc2RNqYwdWx3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="413526569"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="413526569"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="840940216"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="840940216"
Received: from apascali-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.221.122])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:11:32 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 13:10:54 +0300
Message-Id: <20231002101055.3731291-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002101055.3731291-1-jouni.hogander@intel.com>
References: <20231002101055.3731291-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/3] drm/i915/display: Use intel_bo_to_drm_bo
 instead of obj->base
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe and i915 objects have differing implementation. Use intel_bo_to_drm_bo
instead of obj->base as xe_bo doesn't have base pointer.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index abca5a3652d4..6aa1a6ac0728 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1965,10 +1965,10 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 	if (!atomic_read(&front->bits))
 		return 0;
 
-	if (dma_resv_test_signaled(obj->base.resv, dma_resv_usage_rw(false)))
+	if (dma_resv_test_signaled(intel_bo_to_drm_bo(obj)->resv, dma_resv_usage_rw(false)))
 		goto flush;
 
-	ret = dma_resv_get_singleton(obj->base.resv, dma_resv_usage_rw(false),
+	ret = dma_resv_get_singleton(intel_bo_to_drm_bo(obj)->resv, dma_resv_usage_rw(false),
 				     &fence);
 	if (ret || !fence)
 		goto flush;
-- 
2.34.1

