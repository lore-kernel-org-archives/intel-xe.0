Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86C8C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 15:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C3010E8CA;
	Fri,  1 Dec 2023 15:39:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3AB10E8CA
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 15:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701445194; x=1732981194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zh1qzELnBt8rO8Ngd28Iia6bMhXEDuY/FdWhwEpqNmw=;
 b=Rf9ssWlnropnhroa5/azMqNaPFFX0mjMJwmow9cyga9FU+xXhKZu+tQY
 7uB5vfxz13+QXZxcbVUpgUSVbHwxs/lBKnPU/mp+CMOkNLOAEZyQrBccH
 8JFwhbA9XxWsh/WFbg/HIP2mRUuyh9EuCgGF6kzdoXVgczJQJCzF/zYow
 DwoK5s2RYXF4+dx1LYWWfaY6eJj63KzyIIO6BQ2hEoSwHPHd0U2ZUp4RF
 Pxh1FgkOlZTnqnEwGkPVR0PRF34FcHNzMkLUSpZcitAfY6kBWQwmbi+/Y
 NKoUJQtt7XZF4FzXifE+RLtyFhF/xOTPSdQuksJwhheA81vySFUnFGmPE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="533593"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="533593"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:39:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="840224140"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="840224140"
Received: from wpastern-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.45.65])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:39:52 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Dec 2023 17:39:23 +0200
Message-Id: <20231201153923.3433110-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201153923.3433110-1-jouni.hogander@intel.com>
References: <20231201153923.3433110-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/i915/display: use intel_bo_to_drm_bo in
 intel_fbdev
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

We are preparing for Xe driver. I915 and Xe object implementation are
differing. Do not use  i915_gem_object->base directly. Instead use
intel_bo_to_drm_bo.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231115090719.3210079-3-jouni.hogander@intel.com
(cherry picked from commit c952bf11ace50b03fce14dbc15a092fdc9a6d2c8)
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index b7e4b7830e45..99894a855ef0 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -332,12 +332,12 @@ static bool intel_fbdev_init_bios(struct drm_device *dev,
 			continue;
 		}
 
-		if (obj->base.size > max_size) {
+		if (intel_bo_to_drm_bo(obj)->size > max_size) {
 			drm_dbg_kms(&i915->drm,
 				    "found possible fb from [PLANE:%d:%s]\n",
 				    plane->base.base.id, plane->base.name);
 			fb = to_intel_framebuffer(plane_state->uapi.fb);
-			max_size = obj->base.size;
+			max_size = intel_bo_to_drm_bo(obj)->size;
 		}
 	}
 
-- 
2.34.1

