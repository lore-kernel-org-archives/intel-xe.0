Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5994C71133
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 09:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD7510E64C;
	Fri, 25 Aug 2023 09:39:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EEB10E64A
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 09:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692956378; x=1724492378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f9IbYEreKCqrVBk/zr4Qvjs2eS4TE5DfgEjQ2WmP0Nk=;
 b=fkxObG1D3yk5jLoNDZeH2flo26U12gMMymY2wXWkSPsJmUgz7yEOFgFI
 whrIzEvs7WVfnP+vvOk7xbEghlNSDcWHoZXJaUzpzKsCpynRSqUXcwl5V
 pLrRo1puWGJIkwwfPkFpsWYh3CwNrLHluXVe2WlidGFQsNxRj0RwLeVtK
 hyNuSvobty2wIJdVMoTbrC/W2zTGU6qhP/7bIZfq9j/sBLlRbiUU9mx70
 IycPOsWBja0PB8HA+hPykbzcVPP8ztn4flUZPuMctVHlUKTCHwIx03Xhs
 2RMzk8Iv3HVKCx9smsApVHl5VA9UcRa0gg/IvhxFeKXSezCfTRCqIRXKu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="461037143"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="461037143"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="687246869"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="687246869"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 02:39:36 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 12:39:04 +0300
Message-Id: <20230825093904.1230143-13-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/12] drm/i915/display: Use
 drm_gem_object_get/put
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

Use drm_gem_object_ge/put directly instead of i915_gem_object_get/put.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 67d05db7c8b0..04f2694c2e17 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -236,7 +236,7 @@ static void frontbuffer_release(struct kref *ref)
 
 	i915_active_fini(&front->write);
 
-	i915_gem_object_put(obj);
+	drm_gem_object_put(intel_bo_to_drm_bo(obj));
 
 	kfree_rcu(front, rcu);
 }
-- 
2.34.1

