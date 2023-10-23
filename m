Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3030CC001E0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 06:34:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7DC10E05B;
	Mon, 23 Oct 2023 06:34:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C153891E1
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 06:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698042885; x=1729578885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kKD8m0sPM7c3C9oHAZSWvcCgH1YaHYqiB6vmEPNnZAU=;
 b=arRLBaCkEYE+VEm9+v+Q8m0KGV5eYX6erUyanF5CgN6P+UDHkkHlwOYW
 7fOlGhMu+mwgJ1MkKEcXvNp9mx+lxm5dcVsU7iBzcJzca/HfYpXMOaYY8
 ZCpBsh/R+CyEKzcWdmaz6gBQ2yexy/t6hyUOuiGvE/RwlbGXE5L8v1Prc
 3XcWq95+M/ErSnel01z7n36N4RO1Ufow1KuxTvDsSYu7A/n1fFa+jX/4+
 APxM54dnBX9+1WcKZSf/BwOFUxXp4d0gJfdmQPv2Fx9WrBLlqe9aO6bFb
 QbYF31brr689u5jaZ+j/DKy59K6JSXcJsKyXqM+hpDbIVle2M2ohIHtRX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="472990959"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="472990959"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 23:34:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="901704634"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="901704634"
Received: from spalanis-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.62.239])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 23:32:27 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 23 Oct 2023 09:34:17 +0300
Message-Id: <20231023063420.3298731-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023063420.3298731-1-jouni.hogander@intel.com>
References: <20231023063420.3298731-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] Revert "drm/i915/display: Use
 intel_bo_to_drm_bo instead of obj->base"
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

This reverts commit c6592b46a51db52f808b5a19e1ae8f797f8be38a.

We are about to backport same patch from upstream.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index fd0b978dbef9..35ea058bb797 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1964,10 +1964,10 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 	if (!atomic_read(&front->bits))
 		return 0;
 
-	if (dma_resv_test_signaled(intel_bo_to_drm_bo(obj)->resv, dma_resv_usage_rw(false)))
+	if (dma_resv_test_signaled(obj->base.resv, dma_resv_usage_rw(false)))
 		goto flush;
 
-	ret = dma_resv_get_singleton(intel_bo_to_drm_bo(obj)->resv, dma_resv_usage_rw(false),
+	ret = dma_resv_get_singleton(obj->base.resv, dma_resv_usage_rw(false),
 				     &fence);
 	if (ret || !fence)
 		goto flush;
-- 
2.34.1

