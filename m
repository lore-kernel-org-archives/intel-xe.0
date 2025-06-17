Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443A5C71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 18:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0400310E0AC;
	Tue, 17 Jun 2025 18:01:58 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3747E10E0AC
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 18:01:57 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 0/9] drm/xe: Init changes for flicker-free boot.
Date: Tue, 17 Jun 2025 20:01:33 +0200
Message-ID: <20250617180132.7059-11-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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



Maarten Lankhorst (9):
  drm/xe: Defer memirq init until needed
  drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
  drm/xe: Simplify GuC early initialization
  drm/xe: Make it possible to read instance0 MCR registers after
    xe_gt_mcr_init_early
  drm/xe: Only dump PAT when xe_hw_engines_init_early fails
  drm/xe/gt: Inline gt_fw_domain_init
  drm/xe/gt: Inline all_fw_domain_init
  drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
  drm/xe: Move xe_ttm_sys_mgr_init() downwards.

 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c |   2 +-
 drivers/gpu/drm/xe/xe_device.c               |  39 +---
 drivers/gpu/drm/xe/xe_gt.c                   | 187 ++++++++-----------
 drivers/gpu/drm/xe/xe_gt.h                   |   1 -
 drivers/gpu/drm/xe/xe_gt_mcr.c               |  47 +++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |   1 -
 drivers/gpu/drm/xe/xe_gt_types.h             |   2 +
 drivers/gpu/drm/xe/xe_guc.c                  |  48 +++--
 drivers/gpu/drm/xe/xe_guc.h                  |   1 +
 drivers/gpu/drm/xe/xe_guc_ct.c               |  28 ++-
 drivers/gpu/drm/xe/xe_guc_ct.h               |   1 +
 drivers/gpu/drm/xe/xe_guc_relay.c            |   6 +-
 drivers/gpu/drm/xe/xe_guc_relay.h            |   2 +-
 drivers/gpu/drm/xe/xe_tile.c                 |   7 +
 drivers/gpu/drm/xe/xe_uc.c                   |  16 ++
 drivers/gpu/drm/xe/xe_uc.h                   |   1 +
 16 files changed, 201 insertions(+), 188 deletions(-)

-- 
2.45.2

