Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2745DEA3F2E
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 09:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A6910E50E;
	Tue, 10 Feb 2026 09:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TodUbh0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF8D10E508;
 Tue, 10 Feb 2026 09:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770714353; x=1802250353;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XRdQ2mwfjLpcXz7urf5X3M+mlADTIWwKu22HsKumSAs=;
 b=TodUbh0+5OyweVLRjgHdkV3uZ+VswgnNoOwKzbPHO7ebp5Lu5/7pwhfu
 5Cnp1gh6VW2z+yS3p5AhZQQrIWns+3K3AqmhtJU6IPoQ7MhcbhpsKNrkP
 sv07x9m35ArMNZvagFdMAdoIV37cB0mKugJMTxjnVv0qMT4O8TBkVJt8X
 coBvgNk/zC/P2U4QCddYPFluBxUHUs76fNrHD3HwhdNxu9guC8KWTu8ek
 8qMH5eNmhvAAayOkyzMC8Nh3igmFGzDrYMoac0LlGXyP/Wht13gNF2mKK
 gZXOpZwUcOUP9YvhUGfkeDOxBERmKDrWwZviq9U27QF3vCebAffgk34fd A==;
X-CSE-ConnectionGUID: uwuZOZn5ThOHYP/05juS0Q==
X-CSE-MsgGUID: N8GL3yCPSDWwD5X+f9vKmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="94479193"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="94479193"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 01:05:53 -0800
X-CSE-ConnectionGUID: xEJUHNZYTaKFKeQowK3TrA==
X-CSE-MsgGUID: bV8JWUaBQpSN+xvRQZaBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242478997"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa002.jf.intel.com with ESMTP; 10 Feb 2026 01:05:48 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 10 Feb 2026 14:33:58 +0530
Subject: [PATCH v9 4/7] drm/atomic: Call complete_signaling only if
 prepare_signaling is done
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-atomic-v9-4-525c88fd2402@intel.com>
References: <20260210-atomic-v9-0-525c88fd2402@intel.com>
In-Reply-To: <20260210-atomic-v9-0-525c88fd2402@intel.com>
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
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
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
fences are initialized/prepared before completing.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c228c9aed75acdb09a80df5dad54440a5c182254..bcd12b6eac4f497d2edb8581d9fb0fd54cbef827 100644
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
@@ -1725,7 +1725,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	}
 
 out:
-	complete_signaling(dev, state, fence_state, num_fences, !ret);
+	if (num_fences)
+		complete_signaling(dev, state, fence_state, num_fences, !ret);
 
 	if (ret == -EDEADLK) {
 		drm_atomic_state_clear(state);

-- 
2.25.1

