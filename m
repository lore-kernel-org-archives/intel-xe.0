Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2513C44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 14:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BC310EA2E;
	Tue, 21 Jul 2026 14:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="O4PY9zYj";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D47610EA2E;
 Tue, 21 Jul 2026 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784643916;
 bh=MmaWzT+4FKZKngmyrrx8vgymN6f+HlVCN+qIc9Vq1g0=;
 h=From:To:Cc:Subject:Date:From;
 b=O4PY9zYjzChDg27dglDmzWNi9c3CKQ2L8Napg11XZvlBNswH0qfg8E8fNdQjrl+sc
 BbRl6FlLY2yA67oM+GBClrk8AfjoqYZRw6YQ8VLGCNkuVMxsaMOi3XNCZ6AOJOP3zu
 gcvNKNTulHl0vQa+a4Hm8KrfFfM6vnTMO548sxaOxMW/uEa/MHVAj2p0n10FOx+HHf
 sPcRag9BvWZAacBBgTuYhmJw2xFE/vse7DN9Hq8hEpEnbfdvjTjI4UyFVnFHuVex05
 /UwPxcSXey1ejdnm2AF7/v0yYXsIFgJyTNHQ+cXm5/WXZZoazs84X28nKAeWM3MRfD
 b9f+3kKcfuUrA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 0/5] drm/xe/display: Transparant fallback from stolen to
 sysmem.
Date: Tue, 21 Jul 2026 16:26:11 +0200
Message-ID: <20260721142610.93804-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
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

Changes since previous version:
- Simplify the patch for copying between sysmem and stolen.
- Take ownership of intel_bo_fbdev_bios_fb_takeover()
- Keep series standalone.

Copy the initial framebuffer from the stolen region to system memory
when deciding to keep the device's framebuffer, instead of re-using the
stolen memory.

This allows for completely flicker-free boot even on platforms where
we wouldn't allow use of stolen memory for the system framebuffer.

Works best with https://patchwork.freedesktop.org/series/170430/	

Maarten Lankhorst (5):
  drm/xe/display: Avoid using stolen memory for framebuffer when media
    gt exists.
  drm/xe/migrate: Support copying between sysmem and stolen
  drm/xe: Raise gt frequency slightly earlier.
  HACK: Always fallback
  drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()

 drivers/gpu/drm/i915/display/intel_bo.c       |  7 ++
 drivers/gpu/drm/i915/display/intel_bo.h       |  1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 68 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_bo.c                | 14 +++-
 drivers/gpu/drm/i915/i915_bo.h                |  6 --
 drivers/gpu/drm/i915/i915_initial_plane.c     | 14 ----
 drivers/gpu/drm/xe/display/xe_display_bo.c    | 66 +++++++++++++++++-
 drivers/gpu/drm/xe/display/xe_display_bo.h    |  6 --
 drivers/gpu/drm/xe/display/xe_initial_plane.c |  8 ---
 drivers/gpu/drm/xe/xe_device.c                |  6 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 25 +++++--
 include/drm/intel/display_parent_interface.h  |  1 +
 12 files changed, 165 insertions(+), 57 deletions(-)

-- 
2.53.0

