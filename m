Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9908C88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 21:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9327C10E57A;
	Fri, 11 Sep 2026 21:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jB4Yr0RH";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074C510E345
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 20:02:14 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4843f205a5bso942224f8f.1
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789156932; x=1789761732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WpWwiGaL36YcweuGSaJBrN203pu/dlOicI/VWEKjlnY=;
 b=jB4Yr0RHvhnAQV/NgIpMAsjfti/wrso5mv1Pb2Aptx6lPPCxdtimMcI4K+MZvaUzUu
 Eh2jKQHdF/L3NIdXEGx1ZFBMVVxxzc+PwY04lvQgyUy48VKRtDzJ+4BsZGcveQqmZkdK
 D6wlKe07gcJIiRWOPKAWZDMYITCI7Z9I713avAEIEzAtzUasr1uIFRaPYLdTCbhWF9e1
 RPE6mtFcpMKl4QUjPi2k18YVpc3ZzRyQh1qXI8171OAEqZjvfWJNH1DBYwmfAmAs6P0v
 ZhfN3KSuG2mYG/Zst/HFvKpMukTgR4VHXYE433d0q/6K11BAwG8VKU+LGryfOPXsvbuN
 k8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789156932; x=1789761732;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WpWwiGaL36YcweuGSaJBrN203pu/dlOicI/VWEKjlnY=;
 b=p+gglDGgFzVO9euowomxDGcjTMJP97olvORv0EmxI/TfjssgXgDBXvyrYwpdBKU6Ph
 M4fOp3vZ7Y76jsDCcdAF7qfmKDOW6H25l400ZNM8Fte1cvwvcN3A7stWnP/zmTidP2XZ
 k+VG885oLjc0RRL36aoVtTIdPPo57t9AdYcLWpq7at5TMjx7e2S9GJ6e3ueRKJbJcxMa
 pbX3Eoty/Q25y/xDglQ2m/vNIswIElvv+XiVgfmBkoiLL+W9hViyPiQvCD/JqqBIg/jA
 zeWBz3GS7mPZR9Ak0D0YxE/IqYJWnB9+b/qXibLlI/+iP38qtNovEqlNWe3rTKK4DiZz
 m/5w==
X-Forwarded-Encrypted: i=1;
 AKwUvByPL4FyqVo1RsAeEUnMCOqnPwgAZMOxqm4GKOxG077VP3mABJGtVvIX6TlbCl3z1SrmwW+Pky0ixg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++k4FtYDHdBYUtLk3vqqgeGK7/rQolz+yZvwJtgtfVmV/PY0etrc
 U3O2O/1a8BUvpRmaefeidKyIU+uVNnO3mRHH2KzTSHNxTasu6Eh0oNHs
X-Gm-Gg: AYBFou1n3Ny92tdFEyocHO3mffJLoBk/I30dXumIEWpzMlow4yl5DAN/Jn8HVIvR6Lj
 A9H5r6srqLXmphuSstGMTWukYVFG8PcuDTLswEsKFTOR4+a4I1BpeeGJFbAkg54IwAS34pvYMNl
 rn/6+xRD5hvd0KDtIpfydiqnRp6zUE/1hrvns81W66jgbFElldYNmvWy5N+NaOS8LPqcdF9jWZZ
 ZpL52t3Oq87j2/D+y884G3Y4BVBuCm+jQVH9gJfH6wkU965extN53xIFYln3yOo2FrK555p3873
 iAw1L9wU2kXehaLsB/V3bgNYzOeFnchRsflsx+XybuDzTVKouNKiYG2ZwjFZRkGLyDTXjhRP4KT
 XOaHYhgdLjUuQ+oase6l6hsVWWjf9sDw+T5PxcVDxbccaZECRiDjEiQ7YsjmX0FeB17GHDJ0bqB
 TjMfrItW2gagoirMnlayZyeF87tEXS8rmAIBlBx7+6ghAQcHvGoWb/uz8A9uTf9hUQzl3v93oVu
 iFb1OPqVkGZC4okjJnMry79GmdgTEbYfqnJkKLd9k7jRXf8qHkazgFkWLi2IyIOVTt8N7QH7NIg
 x8r6A2GAuL0kYlCPKjm/e6gFeimhgsvu8Qfy
X-Received: by 2002:a05:600c:4691:b0:49c:fea1:f792 with SMTP id
 5b1f17b1804b1-49e6198f947mr76504605e9.12.1789156932186; 
 Fri, 11 Sep 2026 13:02:12 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e69f02c92sm28156515e9.2.2026.09.11.13.02.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Sep 2026 13:02:10 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/audio: Fix names that do not exist in kernel-doc
 comments
Date: Fri, 11 Sep 2026 22:00:53 +0200
Message-Id: <20260911200053.78731-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Sep 2026 21:45:10 +0000
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

The audio component overview still refers to the former
i915_audio_component_ops and i915_audio_component_audio_ops struct
names. The generic audio component split renamed these types to
drm_audio_component_ops and drm_audio_component_audio_ops.

Update both references to match the current types.

Fixes: ae891abe7c2c ("drm/i915: Split audio component to a generic type")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index eae76e9611055ea684dd98c34889be2413a89f80..c703da26914c1d957dff61a0220b70d3275255ce 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -63,9 +63,9 @@
  * covered here.)
  *
  * The struct &i915_audio_component is used to interact between the graphics
- * and audio drivers. The struct &i915_audio_component_ops @ops in it is
+ * and audio drivers. The struct &drm_audio_component_ops @ops in it is
  * defined in graphics driver and called in audio driver. The
- * struct &i915_audio_component_audio_ops @audio_ops is called from i915 driver.
+ * struct &drm_audio_component_audio_ops @audio_ops is called from i915 driver.
  */
 
 struct intel_audio_funcs {
