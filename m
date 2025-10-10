Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07F6CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 12:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C2F10EBC3;
	Fri, 10 Oct 2025 12:07:07 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9842A10EBC3
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 12:07:05 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5 0/6] drm/xe: Make struct xe_ggtt private.
Date: Fri, 10 Oct 2025 14:06:56 +0200
Message-ID: <20251010120655.1046007-8-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
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

SRIOV-VF node shifting code uses a complicated system with balloons
to limit allocation and size. Since size never changes after init,
shifting can simply be done by taking the the GGTT lock and then
moving each offset.

First introduce a function to shift an entire GGTT, this removes the
need for the balloons, then also perform the display code pinning
through a callback, and finally privatize the struct.

No other users outside of xe_ggtt remain, and we can make xe_ggtt private.

Rebased on top of recent SRIOV-VF changes, with Matthew Brosts help.

Maarten Lankhorst (5):
  drm/xe: Only have a single drmm release action.
  drm/xe: Start using ggtt->start in preparation of balloon removal
  drm/xe: Rewrite GGTT VF initialisation
  drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
  drm/xe: Move struct xe_ggtt to xe_ggtt.c

Tomasz Lis (1):
  drm/mm: Introduce address space shifting

 drivers/gpu/drm/drm_mm.c                    |  24 ++
 drivers/gpu/drm/xe/display/xe_fb_pin.c      | 111 +++---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h        |   2 -
 drivers/gpu/drm/xe/xe_ggtt.c                | 357 ++++++++++----------
 drivers/gpu/drm/xe/xe_ggtt.h                |  16 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h          |  57 +---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |   4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   5 +-
 drivers/gpu/drm/xe/xe_tile.c                |  18 +
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 197 +----------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   4 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |   4 +
 include/drm/drm_mm.h                        |   1 +
 14 files changed, 315 insertions(+), 487 deletions(-)

-- 
2.51.0

