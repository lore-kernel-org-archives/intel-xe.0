Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED74C982D3
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 12:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437CA10EE70;
	Thu, 17 Sep 2026 12:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="XrnN/ayq";
	dkim-atps=neutral
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABC410E110
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 21:18:33 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912df756so1328125e9.3
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 14:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1789593512;
 x=1790198312; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8c7Lrwf6LLYMTB0zxM6IKxndmvRTeS9nJzIt6c8lINU=;
 b=XrnN/ayq1WTDX10IsxxPHPFBuqBGLVubeyJDRItcR29CKupXRZnu4Vx3FAKnhYQFek
 +i+zCQs+5/WT8gAp6zo7pw2Kujz7apN0cvXSF5GJDLKzC+0Nkbtpe/rehGhkJnAjBvI7
 PznlHj3Q07qwL7YGvja3SZLtdn1k3JbI86MbGZy1Ssc7kRMXB8uh+gFGJTsTw5/u+/HD
 NVNteJAICcoQBTtjAHWYQFLhmg0RCvELiYKQlRfMkkOBmRPIIO1GRAV7svkL56g4UyQB
 upaJg1PNquMludcjRv9EZfZfzKt6H1rC4F44rprQ9PzlO4/+sSE+w0xKE7pyu1M9YAr4
 CnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789593512; x=1790198312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8c7Lrwf6LLYMTB0zxM6IKxndmvRTeS9nJzIt6c8lINU=;
 b=iAP//QYTyXwEUqE1tG5+kkLk3nRX7wtP1s58hg1LvfxK0qNWtVF3Gtoq0WUArJQtge
 vVYBJZjt08iSB0xLl3C3BHAngNYXhOvQkTV7XsiUL4r3fnYXp93e5vFK4LupbErAQvdb
 sUW2RvkeYSpahLC+9VP01kB2tTYyk/H1rT/yRjLUEr5oeGjIqJVa3e6dMsRVe8WhQ0Rf
 8B5tnKKDjNBFZRB+bC43UPJ98C4jGBbSzeF9CPtIuR1iiddzPlHDi4MRZ3GxvZUPLzQJ
 bIQyBgMMRn4xU6AdJwxZKfmrAaMnoA6PVsLNZDdBz5t7NVLPXpXgd+DKo+sr/8rj9S8F
 O+Aw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzeqcAcG9bRuDgEyYYKUTodfxcVUsIwV9hs6jgcwf/gst0QbuO9Ip0to3ZYAe4s+MmwoDHITtI64w==@lists.freedesktop.org
X-Gm-Message-State: AFuF++ncxI3U+JEvk3elBvLrJc0XcNslBn4pLNS7cKNLHVS+fpgrx6WF
 LwD+rBc0jNOeBqRYMzo+5hJpMlvF3CLpvmQSAd96X3y2IRL6g48M9qSCVvLJhH88nw==
X-Gm-Gg: AYBFou106ZY11BIrHDVer2xweOKVbJU3eW/jrKam0QA2iCDS8kpyJ/Ne4HfJhgkzyxf
 KHAMryPpBRxKP4N01ETgZEzCYYr5aGb5JI57yjayVmmHIP/yQk0LGHTZziVuWFZNEzoXXLNXg+R
 kEecKw4iQ+YJwFaLVKb06wSAmIpX2g3/I1ZkGMXsyrOZ9sYv8OMiapLtWihzex9eWqZ3vNn40Xu
 XNJHMwXeYvv29ReMnW7kDG8iqKSzRQ1LarYL3D/r/hgnfCmzc8aF1wk/t7d1jl4O5QwPN4UUMOn
 kcNm4AG+cqAL8Myy75Zb6ZEigzqfbSOzA/LE7kFvgc3DOXQB6b8cjgZkaFe2AThO/ZfcW+oM7kn
 OFJurDrkXnqpSprXPDHZxrzn7N9vp9cpCP4bjN2F3BSASEcpgoM84ajNEeMgipaNZj5Zk1rtiPD
 8B/vyWiXNPdxRxdZCDQx/Tp9+mWyqPhp5sSy5mK0eoQi+mAMJzBJXi2cJ8hfz+3ch+TxTZtfd8R
 TmJmWI1RmSIRhluyzkcawPi1g==
X-Received: by 2002:a05:600c:8b78:b0:49c:fc6e:8cb4 with SMTP id
 5b1f17b1804b1-49ebb4297c4mr52763795e9.24.1789593511641; 
 Wed, 16 Sep 2026 14:18:31 -0700 (PDT)
Received: from horizon ([217.155.46.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbbd83e39sm46567695e9.4.2026.09.16.14.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 14:18:31 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/drrs: Ignore sync polarity when matching modes
Date: Wed, 16 Sep 2026 22:18:30 +0100
Message-ID: <6436114aa461b08bf0abddadf2c091c45dc81075.1789593508.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Sep 2026 12:15:25 +0000
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

Some panels advertise DRRS modes with matching timings but different sync
polarities. is_alt_drrs_mode() currently includes DRM_MODE_MATCH_FLAGS and
rejects such pairs.

Commit 2bd0db4b3f0b ("drm/i915: Allow panel fixed modes to have differing
sync polarities") already made is_alt_fixed_mode() ignore H/V sync polarity
because panels can declare alternate modes with different values and
Windows/GOP accepts them. Apply the same rule when matching DRRS modes.
Continue to require matching timings, 3D flags, and all other mode flags.

Tested: BOE NE160QAM-NZ1 (3840x2400); DRRS reached low refresh.
Tested: Huawei 23040676 (2520x1680); DRRS reached low refresh.
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 81e638d0c7b3..e79c51a1c33c 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -144,10 +144,13 @@ intel_panel_fixed_mode(struct intel_connector *connector,
 static bool is_alt_drrs_mode(const struct drm_display_mode *mode,
 			     const struct drm_display_mode *preferred_mode)
 {
+	u32 sync_flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC |
+		DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC;
+
 	return drm_mode_match(mode, preferred_mode,
 			      DRM_MODE_MATCH_TIMINGS |
-			      DRM_MODE_MATCH_FLAGS |
 			      DRM_MODE_MATCH_3D_FLAGS) &&
+		(mode->flags & ~sync_flags) == (preferred_mode->flags & ~sync_flags) &&
 		mode->clock != preferred_mode->clock;
 }
 
