Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B86C44520
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1891B10E9D6;
	Mon, 20 Jul 2026 16:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="kdaFSXdN";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FB110E9D3;
 Mon, 20 Jul 2026 16:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784564039;
 bh=na2MBXDhivjrPNMqdY1zxNvHRn1HAnJpbTmZOARnBRE=;
 h=From:To:Cc:Subject:Date:From;
 b=kdaFSXdNFNHwfjuClV8ibKn5SRR6nN5FcyBqgDNCMI1JUMisDf1VZBiEkGw6apQig
 AqLaSWsfomjJhAOHVkbeeVefpq2opgMUU+dMzg6dPLPPpEU9kvMa5TQsdie7UXChxr
 xeOYLTKO2vVilZE2MYr5UQeKh+2rwnwEX5D/P2R0ybhhjWpJ0QK3gzQNUtAJUARPwj
 eiz8FDLozR3WKt9K2+7g+AAhiXg7q9SlMWhcGsTkcAoq1Os1c4leaQWPZDCnT1yV8p
 K75dBGUFGn7lo6kUuaw+/EoPyH6WPrLkfbVX4ejfIwKLDnIu3P3QFpZmq9VMkTvVT9
 K4FTbCNm7HR3w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 00/11] drm/xe/display: Transparant fallback from stolen to
 sysmem.
Date: Mon, 20 Jul 2026 18:14:52 +0200
Message-ID: <20260720161451.384968-13-dev@lankhorst.se>
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

Copy the initial framebuffer from the stolen region to system memory
when deciding to keep the device's framebuffer, instead of re-using the
stolen memory.

Patch 1-6 are part of a different series and should be reviewed there.
The HACK is a test to always force the copying to system memory path.

Maarten Lankhorst (10):
  drm/xe/ggtt: Add xe_ggtt_reserve_area
  drm/xe/ggtt: Add xe_ggtt_node_remove_noclear
  drm/xe/display: Reserve the original GGTT space before creating a bo
  drm/xe/display: Use the correct calculation for phys_base on
    integrated
  drm/xe/display: Remove duplicated code
  drm/xe/ggtt: Remove xe_ggtt_insert_bo_at
  drm/xe/display: Avoid using stolen memory for framebuffer when media
    gt exists.
  drm/xe/migrate: Support copying between sysmem and stolen
  drm/xe: Raise gt frequency slightly earlier.
  HACK: Always fallback

Ville Syrjälä (1):
  drm/i915: Introduce intel_bo_fbdev_bios_fb_takeover()

 drivers/gpu/drm/i915/display/intel_bo.c       |   7 ++
 drivers/gpu/drm/i915/display/intel_bo.h       |   1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  68 +++++++++--
 drivers/gpu/drm/i915/i915_bo.c                |  14 ++-
 drivers/gpu/drm/i915/i915_bo.h                |   6 -
 drivers/gpu/drm/i915/i915_initial_plane.c     |  14 ---
 drivers/gpu/drm/xe/display/xe_display_bo.c    |  66 +++++++++-
 drivers/gpu/drm/xe/display/xe_display_bo.h    |   6 -
 drivers/gpu/drm/xe/display/xe_initial_plane.c |  49 +++-----
 drivers/gpu/drm/xe/xe_bo.c                    |   8 +-
 drivers/gpu/drm/xe/xe_device.c                |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 115 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h                  |   5 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  29 +++--
 include/drm/intel/display_parent_interface.h  |   1 +
 15 files changed, 278 insertions(+), 117 deletions(-)

-- 
2.53.0

