Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A50D3A661
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 14:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51DA10E67A;
	Tue, 29 Oct 2024 14:39:23 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27EA10E28A
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 14:39:22 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 0/8] (CI) drm/xe: Fix initial framebuffer handover.
Date: Tue, 29 Oct 2024 15:39:26 +0100
Message-ID: <20241029143934.65412-1-maarten.lankhorst@linux.intel.com>
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

Another CI run, hopefully works now.
May also be called: rework and cleanup init sequence.

Maarten Lankhorst (8):
  drm/xe: Remove double pageflip
  drm/i915/display: Use async flip when available for initial plane
    config
  drm/xe: Move suballocator init to after display init
  drm/xe: Defer irq init until after xe_display_init_noaccel
  drm/xe/display: Use a single early init call for display
  drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
  drm/xe: Simplify GuC early initialisation
  drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early

 .../drm/i915/display/skl_universal_plane.c    | 13 +++-
 drivers/gpu/drm/xe/display/xe_display.c       | 72 +++++-------------
 drivers/gpu/drm/xe/display/xe_display.h       |  4 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 10 ---
 drivers/gpu/drm/xe/xe_device.c                | 50 +++----------
 drivers/gpu/drm/xe/xe_gt.c                    | 73 ++++++++++---------
 drivers/gpu/drm/xe/xe_gt.h                    |  1 -
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  1 -
 drivers/gpu/drm/xe/xe_guc.c                   | 56 ++++++++------
 drivers/gpu/drm/xe/xe_guc.h                   |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c                | 28 ++++---
 drivers/gpu/drm/xe/xe_guc_ct.h                |  1 +
 drivers/gpu/drm/xe/xe_guc_relay.c             |  6 +-
 drivers/gpu/drm/xe/xe_guc_relay.h             |  2 +-
 drivers/gpu/drm/xe/xe_huc.h                   |  1 +
 drivers/gpu/drm/xe/xe_tile.c                  | 19 ++++-
 drivers/gpu/drm/xe/xe_tile.h                  |  1 +
 drivers/gpu/drm/xe/xe_uc.c                    | 21 ++++++
 drivers/gpu/drm/xe/xe_uc.h                    |  1 +
 19 files changed, 180 insertions(+), 181 deletions(-)

-- 
2.45.2

