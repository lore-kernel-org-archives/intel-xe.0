Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D18E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 08:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7C610E81F;
	Tue, 10 Dec 2024 08:30:41 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5F510E80A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 08:30:40 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 00/11] GuC changes for flicker-free boot.
Date: Tue, 10 Dec 2024 09:31:00 +0100
Message-ID: <20241210083111.230484-1-dev@lankhorst.se>
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

Ignore the first 5 patches in this series, it's sent as a separate series.
https://patchwork.freedesktop.org/series/142241/
I would like review on patch 6-10 instead, those are the changes related
to the GuC init sequence.

Instead of all the separate steps, the init sequence is simplified and made
more uniform. We create a xe_guc_init_noalloc that performs all early
initialisation required to make VF work. We also initialise the MCR instance 0
registers for VRAM readout, later on we enable the other MCR registers.

Maarten Lankhorst (11):
  drm/xe/display: Add intel_plane_initial_vblank_wait
  drm/xe: Remove double pageflip
  drm/xe: Move suballocator init to after display init
  drm/xe: Defer irq init until after xe_display_init_noaccel
  drm/xe/display: Use a single early init call for display
  drm/xe: Defer memirq init until needed
  drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
  drm/xe: Simplify GuC early initialisation
  drm/xe: Make it possible to read instance0 MCR registers after
    xe_gt_mcr_init_early
  drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
  drm/xe: Do not attempt to bootstrap VF in execlists mode

 drivers/gpu/drm/i915/display/intel_display.c  |  6 +-
 .../drm/i915/display/intel_plane_initial.c    |  7 +-
 .../drm/i915/display/intel_plane_initial.h    |  2 +
 drivers/gpu/drm/xe/display/xe_display.c       | 73 +++++--------------
 drivers/gpu/drm/xe/display/xe_display.h       |  8 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 29 +++++---
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  |  2 +-
 drivers/gpu/drm/xe/xe_device.c                | 50 +++----------
 drivers/gpu/drm/xe/xe_gt.c                    | 73 ++++++++++---------
 drivers/gpu/drm/xe/xe_gt.h                    |  1 -
 drivers/gpu/drm/xe/xe_gt_mcr.c                | 47 +++++++-----
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  4 +-
 drivers/gpu/drm/xe/xe_gt_types.h              |  2 +
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
 24 files changed, 231 insertions(+), 210 deletions(-)

-- 
2.45.2

