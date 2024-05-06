Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AE7C25B76
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 10:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47B1112F64;
	Mon,  6 May 2024 10:35:50 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8BC10EF2D;
 Mon,  6 May 2024 10:35:48 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 0/4] drm/xe: More fb pinning optimizations.
Date: Mon,  6 May 2024 12:36:00 +0200
Message-ID: <20240506103604.146146-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

This reduces the latency of pinning framebuffers by
re-using the previous mapping, if available.

Additionally, DPT is preallocated when creating the FB, instead
of performing a bo allocation on every pin.

No changes since v3, just a rebase from conflicts.

Maarten Lankhorst (4):
  drm/xe: Remove safety check from __xe_ttm_stolen_io_mem_reserve_stolen
  drm/xe/display: Preparations for preallocating dpt bo
  drm/xe: Use simple xchg to cache DPT
  drm/xe/display: Re-use display vmas when possible

 .../gpu/drm/i915/display/intel_atomic_plane.c |   2 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   3 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.h   |   3 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   5 +
 drivers/gpu/drm/i915/display/intel_fbdev.h    |   8 +
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   3 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 220 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   4 -
 9 files changed, 197 insertions(+), 53 deletions(-)

-- 
2.43.0

