Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB29D1A627
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 13:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBF010E8D2;
	Fri,  9 Jan 2026 13:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Of4DhWsM";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA2E10E8CB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 13:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767965871;
 bh=cyXkPk3TmUZDEWwKN+waB09laCR8LWJEJ8+ic1oZXbA=;
 h=From:To:Subject:Date:From;
 b=Of4DhWsMB9Qa4BHoQ7d4hJ886545lMJi9BoNsT7uWJXG4lhk64UeIcqf3gXUR1kpg
 XpKMFeKFKAFgQ5k2eRT0vrXS1v22wTjR9ZG0/0j8zOlxieIsfux/V/5gXHRJXLvPFU
 RHIkHLwT34sbfMM5j2aEQ/wBu2Wh3f0Wyeurv0aG3EiPSBaMyzz5bTxzYO8I8bz6id
 wNnILxDHHtrbHI2ioPV1OZD0+wt+TKalXYLnFZ3Sz3XmQ9fA+B4+vUl9JuOgvhCT5X
 KKnRD5V/6Q25Trl/RLH+5xL3i/QGD8tPHlxNdfbpIhtFY/lhv7OtFcxJ10T3uBMayk
 8Mvaqasa077dg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW-v3 00/12] Testing entire GGTT privatization
 preparation series.
Date: Fri,  9 Jan 2026 14:37:33 +0100
Message-ID: <20260109133746.739923-1-dev@lankhorst.se>
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

Do not review, last version had some CI failures, but too old results so need a fresh run to debug.

Version 3 with bugfixes.

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
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 105 ++--
 drivers/gpu/drm/xe/display/xe_stolen.c        |   2 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |   8 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   6 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   8 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 -
 drivers/gpu/drm/xe/xe_ggtt.c                  | 493 ++++++++++--------
 drivers/gpu/drm/xe/xe_ggtt.h                  |  28 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  80 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  53 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   7 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c         | 198 +------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h         |   3 -
 14 files changed, 378 insertions(+), 619 deletions(-)

-- 
2.51.0

