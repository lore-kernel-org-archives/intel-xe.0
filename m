Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1673FC2BA1B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 20:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45FA10E4DE;
	Mon, 10 Mar 2025 20:07:23 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51C510E4E0
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 20:07:21 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 0/8] drm/xe: GT initialization rework.
Date: Mon, 10 Mar 2025 21:06:45 +0100
Message-ID: <20250310200653.89731-1-dev@lankhorst.se>
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

Rework initialization sequence to prevent flickering display during boot.

Maarten Lankhorst (8):
  drm/xe: Defer memirq init until needed
  drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
  drm/xe: Simplify GuC early initialization
  drm/xe: Make it possible to read instance0 MCR registers after
    xe_gt_mcr_init_early
  drm/xe: Only dump PAT when xe_hw_engines_init_early fails
  drm/xe/gt: Inline gt_fw_domain_init
  drm/xe/gt: Inline all_fw_domain_init
  drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early

 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c |   2 +-
 drivers/gpu/drm/xe/xe_device.c               |  26 ---
 drivers/gpu/drm/xe/xe_gt.c                   | 191 ++++++++-----------
 drivers/gpu/drm/xe/xe_gt.h                   |   1 -
 drivers/gpu/drm/xe/xe_gt_mcr.c               |  47 +++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |   1 -
 drivers/gpu/drm/xe/xe_gt_types.h             |   2 +
 drivers/gpu/drm/xe/xe_guc.c                  |  56 ++++--
 drivers/gpu/drm/xe/xe_guc.h                  |   1 +
 drivers/gpu/drm/xe/xe_guc_ct.c               |  28 ++-
 drivers/gpu/drm/xe/xe_guc_ct.h               |   1 +
 drivers/gpu/drm/xe/xe_guc_relay.c            |   6 +-
 drivers/gpu/drm/xe/xe_guc_relay.h            |   2 +-
 drivers/gpu/drm/xe/xe_tile.c                 |   7 +
 drivers/gpu/drm/xe/xe_uc.c                   |  16 ++
 drivers/gpu/drm/xe/xe_uc.h                   |   1 +
 16 files changed, 195 insertions(+), 193 deletions(-)

-- 
2.45.2

