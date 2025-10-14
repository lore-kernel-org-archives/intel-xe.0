Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7729DCCD18E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 21:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB70F10E69F;
	Tue, 14 Oct 2025 21:20:11 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A5F10E69F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 21:20:10 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6 00/12] drm/xe: Make all xe_ggtt structs private.
Date: Tue, 14 Oct 2025 23:19:57 +0200
Message-ID: <20251014211956.1607561-14-dev@lankhorst.se>
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

The previous approach iterated over the entire GGTT, but it's easier to hide
even the xe_ggtt_node struct and only provide a xe_ggtt_node_addr() function.

While cleaning up, also remove xe_ggtt_node_alloc()/fini(), this can be
handled in xe_ggtt_insert() instead as all the other users are already
internal.

This makes the final cleanup the removal of xe_ggtt_node_allocated(),
as it can be changed to a simple null check instead.

Maarten Lankhorst (12):
  drm/xe: Start using ggtt->start in preparation of balloon removal
  drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
  drm/xe: Add xe_ggtt_node_addr() to avoid dereferencing xe_ggtt_node
  drm/xe/display: Avoid dereferencing xe_ggtt_node
  drm/xe: Do not dereference ggtt_node in xe_bo.c
  drm/xe: Improve xe_gt_sriov_pf_config GGTT handling
  drm/xe: Privatize xe_ggtt_node
  drm/xe: Make xe_ggtt_node offset relative to starting offset
  drm/xe: Rewrite GGTT VF initialisation
  drm/xe: Move struct xe_ggtt to xe_ggtt.c
  drm/xe: Make xe_ggtt_node_insert return a node
  drm/xe: Remove xe_ggtt_node_allocated

 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 114 ++---
 drivers/gpu/drm/xe/display/xe_stolen.c        |   2 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |   8 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   6 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   8 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 -
 drivers/gpu/drm/xe/xe_ggtt.c                  | 476 +++++++++---------
 drivers/gpu/drm/xe/xe_ggtt.h                  |  27 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  78 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  53 +-
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   8 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   5 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  18 +
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c         | 197 +-------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h         |   4 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h   |   4 +
 17 files changed, 402 insertions(+), 612 deletions(-)

-- 
2.51.0

