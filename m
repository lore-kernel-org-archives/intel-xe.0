Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DD8CCD185
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 13:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F95D10EA5F;
	Thu,  9 Oct 2025 13:52:32 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4209010EA5F
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 13:52:31 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 0/6] drm/xe: Make struct xe_ggtt private.
Date: Thu,  9 Oct 2025 15:52:19 +0200
Message-ID: <20251009135221.712384-8-dev@lankhorst.se>
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

Rebased, no functional changes since v3.

Maarten Lankhorst (5):
  drm/xe: Only have a single drmm release action.
  drm/xe: Start using ggtt->start in preparation of balloon removal
  drm/xe: Rewrite GGTT VF initialisation
  drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
  drm/xe: Move struct xe_ggtt to xe_ggtt.c

Tomasz Lis (1):
  drm/mm: Introduce address space shifting

 drivers/gpu/drm/drm_mm.c                    |  24 ++
 drivers/gpu/drm/xe/Makefile                 |   3 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c      | 111 +++---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                | 357 ++++++++++----------
 drivers/gpu/drm/xe/xe_ggtt.h                |  16 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h          |  53 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |   4 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c            |   4 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 254 --------------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |  18 -
 include/drm/drm_mm.h                        |   1 +
 12 files changed, 276 insertions(+), 571 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.c
 delete mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.h

-- 
2.51.0

