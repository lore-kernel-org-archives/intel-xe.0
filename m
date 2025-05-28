Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70637C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531F110E5AA;
	Wed, 28 May 2025 09:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TnV3r4Xh";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B9E10E1EA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:13:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso33915895e9.3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423598; x=1749028398; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KxvUhkzyK09LCXKLx7FGoJ45MvcFpxmn56wr8qda5vk=;
 b=TnV3r4XhKWguZGRvfEMZmN7NnvxuxGBj9XA8IoCY+gM3HY7m8+LGQx05kk2/gV7Fhz
 7M1gM6s5XH598ukSU8siohQLzmf3YyAAvprPOSdTNiDRWXzk0bCoNKpWP3h6isVAaavl
 zt5VcyyONzAb4BIA4UhUcogKcAfYqjwGOEVVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423598; x=1749028398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KxvUhkzyK09LCXKLx7FGoJ45MvcFpxmn56wr8qda5vk=;
 b=O2JHYEg2r/v7d6Vsc6LEjZuqjzFKxMaC3CshCfVySFR7xHDqZxjw2MApk0E0apCPpT
 wQ2rGxm6L5zNJk58/E0xbtzbFynMQsRjinlMo25HmFuWlaxTVV5JStk+Cilzu/KAYGOR
 VuefqhgV1q4wammUv9sV3d9UGZU9XGNsktTSx2+hayKFoEwdIP8Od1Z2Ef6Snt1QriH0
 rqhfjnhUhPSdKxgpSLwRyBTbvHhas2nJVnWdVVqM81Ukys/K4RdU+ScAGCz5M7iY5+t/
 K/AJGQKDEMF0pauq6g4q/hBdrh2bZkw87TPqtkN0DsLc8akpXasjR+zG/DoeYVaiHEsh
 i2gA==
X-Gm-Message-State: AOJu0Yz1zsEys2S2HBDwB5bpKUCKQbLg8lGF2dKRreer4/RIn8yA9qyC
 PAZR2rUWxSPXL4O122CHQvYso4wKXcRMOf4I9sLJ9rAjBLp5Xeg3vdRpBb+MMKzBNgBm1/oYn3m
 EXr0U
X-Gm-Gg: ASbGncvANnAwX+7kD1YwJCdht77FajcA0sMp9mJEpatl9g+XeWVDk/fZchXX2SXDEqe
 bsEDltTWwZ3nEPFrzsrZngYpsyCNaaCLePZzaslpBHRvqhEoKRY2ixSPBGyt3B6UfE3wswuz6qJ
 asDsZnab98Bc3rkalh1LGPMLzvvqFcIZZMVIRsFFmGF3aa9fg7bKq1LzXJf+5UidfL8S1CtqEEn
 7XHnCVS6uoAuyy0XpixIHY0qt2WNFu5knhPnSSl6LyE85ZJJed/WoNVdqwneg8ABY8+0Cctr9oh
 zp9k5d20ecM0G1qHzjXgrgkiTvKvfblWwblBZuuNlH4quH0ygu+AlxAo51C/7J4=
X-Google-Smtp-Source: AGHT+IEbmCZiVG865mZLo5+7RJm8r2o9XPjBFzxv8/gHi5WhloGsJ0uCG0WUaVPE45IR7XZbXx45YA==
X-Received: by 2002:a05:600c:4e52:b0:43c:e7ae:4bcf with SMTP id
 5b1f17b1804b1-44c8ee84a83mr159101545e9.0.1748423598210; 
 Wed, 28 May 2025 02:13:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:16 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH 0/8] drm/gem: Audit around handle_create races
Date: Wed, 28 May 2025 11:12:58 +0200
Message-ID: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi all,

Thanks to a report by Jacek Lawrynowicz I've crawled around in core and
driver code around drm_gem_handle_create() and found a bunch of issues.

Attached series is either fixes where I could do them, or RFC-style
patches that just add a comment about what looks wrong. The conversion
from idr_for_each_entry to idr_for_each only fixes temporary premature idr
iteration termination, and so fairly benign impact.

Testing and review very much welcome.

Cheers, Sima

Simona Vetter (8):
  drm/gem: Fix race in drm_gem_handle_create_tail()
  drm/fdinfo: Switch to idr_for_each() in drm_show_memory_stats()
  drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code
  accel/qaic: delete qaic_bo.handle
  drm/amd/kfd: Add comment about possible drm_gem_handle_create() race
  drm/amdgpu: Add comments about drm_file.object_idr issues
  drm/vmwgfx: Add comments about drm_file.object_idr issues
  drm/xe: Add comments about drm_file.object_idr issues

 drivers/accel/qaic/qaic.h                     |  2 -
 drivers/accel/qaic/qaic_data.c                |  1 -
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +
 drivers/gpu/drm/drm_file.c                    | 95 +++++++++++--------
 drivers/gpu/drm/drm_gem.c                     | 10 +-
 drivers/gpu/drm/panthor/panthor_gem.c         | 31 +++---
 drivers/gpu/drm/panthor/panthor_gem.h         |  3 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |  1 +
 drivers/gpu/drm/xe/xe_drm_client.c            |  3 +
 include/drm/drm_file.h                        |  3 +
 11 files changed, 90 insertions(+), 63 deletions(-)

-- 
2.49.0

