Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC01CA0ED3
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621C610E36D;
	Tue, 12 Sep 2023 06:47:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF86D10E350
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 06:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694501257; x=1726037257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wGbUP7YIlqiQ2L5phhUodMtWOOaJDd2XZOMtDIMysVg=;
 b=YiqmlWXzoaHxurf86nvvNHXe+ZespcR8gqtwSY0HndTqYNiHvmQfwkOZ
 URY4gfsm6AD2Gf0He3u8h07e2tYI5gFY+FoFHyt8iKZ5wYcKX5GImghlr
 ml9rRGxNpULh+8EJ9ymohjJ4yJfub7XNmiajcEecAkFV7HR+ze2swNrjR
 psPn9TM0p09dHUdhiQcxoHEnkgL0KQwwFGP7Ou8z7cSYBBjdbD7HQNgCc
 UbFaks+Jw54003cAGqI+n8sJoLio9OQG2Trlgj2O3mcLcX/kNWZiZcNdW
 o8XYyVnU21APMy1bprys48uQBLot6UPF267oWieC1QIwSJS+sTpUdvNst g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444730359"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="444730359"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="813699077"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="813699077"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 23:47:36 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 09:47:08 +0300
Message-Id: <20230912064709.2802305-12-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 11/12] fixup! drm/i915/display: Remaining
 changes to make xe compile
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

Fixups related to "drm/xe: Add empty define for i915_ggtt_clear_scanout".

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index d70c941dcb67..15302ea9cc4e 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -230,9 +230,7 @@ static void frontbuffer_release(struct kref *ref)
 
 	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, atomic_read(&front->bits));
 
-#ifdef I915
 	i915_ggtt_clear_scanout(obj);
-#endif
 	(void) i915_gem_object_set_frontbuffer(obj, NULL);
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
-- 
2.34.1

