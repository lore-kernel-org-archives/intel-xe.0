Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A22D358E5
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EB410E816;
	Thu, 29 Jan 2026 08:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVOmxmDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025A010E811;
 Thu, 29 Jan 2026 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769676906; x=1801212906;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=/s7imSoalslb2/7ezrrlbkrJQeH1Hzw1JTtaPTfJsOE=;
 b=TVOmxmDVf/j0bLcucqvdfIn/oqpci4PCqToleNqY8sdeG4iGgZFWhylu
 M5Duj7aUelWMv0SxtLw/282LO/cpYfQ+t9isLjkzypu7TbP3tj6ccalZI
 /A+6W6l7EJOug9JrfXW65DG7+Ms9PWmsAlGZLFqeZ7sUHSCO7TAM1JtKX
 TDqJqwSRgyoEToF5Ho64Wi3JWQqTfVN4emu4GQZtJBC04VC6xLGHmGwJ9
 YZpJVUMH83g1PvHpx/ZA+7n3whoMllWkMAi2OSRsK6/PVNj7wosDMu2TE
 pvB+JiHPygF1ZDV5zXkNVfVHfEcGembf9+k50Slgr524DKZ6iwlXoCbSU Q==;
X-CSE-ConnectionGUID: Mx58L01DTFGACUkrCdwk7w==
X-CSE-MsgGUID: mdC7HxUnRCukyaq+h+ePFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69919964"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="69919964"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:55:06 -0800
X-CSE-ConnectionGUID: wdibDeKXQBSsn786UJS3bg==
X-CSE-MsgGUID: 1jBKR+fFReGf7/8rKnHaJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213019558"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 00:55:00 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 29 Jan 2026 14:23:01 +0530
Subject: [PATCH v8 4/7] drm/atomic: Call complete_signaling only if
 prepare_signaling is done
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-atomic-v8-4-4cb7b0faa051@intel.com>
References: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
In-Reply-To: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 naveen1.kumar@intel.com, ramya.krishna.yella@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Upon returning valid error code on atomic_ioctl failure, changes have
been done to goto error/out in cases of error instead of returining to
accommodate returning the failure codes. As part of this change
complete_signaling() will be called as part of cleanup. Check if the
fences are initialied/prepared before completing.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 3042e6c2616fb09403c13a8630c8819a39cf55d4..dacdfc2f706a88e93cab924fb988c762906047da 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1569,7 +1569,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_out_fence_state *fence_state;
 	int ret = 0;
-	unsigned int i, j, num_fences;
+	unsigned int i, j, num_fences = 0;
 	bool async_flip = false;
 
 	/* disallow for drivers not supporting atomic: */
@@ -1727,7 +1727,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 			return -EFAULT;
 	}
 
-	complete_signaling(dev, state, fence_state, num_fences, !ret);
+	if (num_fences)
+		complete_signaling(dev, state, fence_state, num_fences, !ret);
 
 	if (ret == -EDEADLK) {
 		drm_atomic_state_clear(state);

-- 
2.25.1

