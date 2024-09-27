Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8851FCDD1B2
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 14:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D48510E1B0;
	Fri, 27 Sep 2024 14:14:01 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B21A10EC5F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 14:13:59 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 00/14] drm/xe: Fix flickering when inheriting BIOS fb.
Date: Fri, 27 Sep 2024 16:13:50 +0200
Message-ID: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

We accidentally overwrite the GGTT very early on, because we have put in many allocations
between the first xe display prototype and the current version.

First some generic fixes where we were handling things slightly different,
then a major GGTT rework with 3 goals:
1. Reorder init to move all allocations after xe_display_init_noaccel.
2. Hide all details of GGTT, so we can ensure that nobody is looking
   at it before it's initialised.
3. Prevent this from happening again by moving early GGTT init until right before
   xe_display_init_noaccel now that we know nobody requires GGTT.

Hopefully I didn't miss allocations, but it boots on my ADL without flickering again. :-)
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2775

Maarten Lankhorst (14):
  drm/xe/display: Handle stolen bar readout in the same way as lmem
  drm/xe: Remove double pageflip
  drm/xe: Move suballocator init to after display init
  drm/xe: Initialize UC after xe_display_init_noaccel.
  drm/xe: Use xe_ggtt_map_bo_unlocked for resume
  drm/xe: Add xe_ggtt_might_lock
  drm/xe: Add xe_ggtt_alloc
  drm/xe/display: Abstract read/write functions for GGTT PTEs
  drm/xe: Make xe_ggtt_pt_ops private
  drm/xe/display: Stop dereferencing ggtt in xe_fb_pin
  drm/xe: Move struct xe_ggtt to xe_ggtt.c
  drm/xe/display: Use async flip for flipping initial fb.
  drm/xe: Move interrupt initialisation until after
    xe_display_init_noaccel
  drm/xe: Initialise GGTT later

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  36 ++---
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  34 ++---
 drivers/gpu/drm/xe/xe_bo.c                    |   2 +-
 drivers/gpu/drm/xe/xe_bo_evict.c              |   9 +-
 drivers/gpu/drm/xe/xe_device.c                |  34 +++--
 drivers/gpu/drm/xe/xe_ggtt.c                  | 140 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ggtt.h                  |  22 ++-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  50 +------
 drivers/gpu/drm/xe/xe_gt.c                    |  27 ++--
 drivers/gpu/drm/xe/xe_gt.h                    |   2 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  16 +-
 drivers/gpu/drm/xe/xe_tile.h                  |   1 +
 12 files changed, 243 insertions(+), 130 deletions(-)

-- 
2.45.2

