Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363BCD1D493
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 20:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6A510E7C3;
	Thu,  8 Jan 2026 20:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="VlGCQ941";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8232410E7C3
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 20:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767903932;
 bh=4zXkes0lCyUrY1zS1eF58FTSGO7nOLs2ck6g/rL4DWs=;
 h=From:To:Subject:Date:From;
 b=VlGCQ941BM85JUYXkAaRMI5RBFfGCNJW0LoJ9EHSThC1N+jYEw1iMXNPTvIm0Oc4U
 EOHWYDTcFp85ORdEBi7GG1eJjO1d74SHRipwNhgEvq4/tku+vM+PJsHPXQtSDTegv/
 /Thij2+wt2tg6Qw+djweKZSd+Xc79EiiFGJphwgOlzmdp1Ef5/XoGG62/vZiunBiU1
 zadeW8uLHSQay9bejPertLMfOqJYlx0BcPfu+ATbDN78EkF/tiEEgCTGo7/lGCDuUC
 M3MIPz7tAODetbG7GQ4eLpvKCftzKlrw3oTcI2eqwXU18+vi+UyRXTaYyBKfqbA3Pu
 zctcChVegGWZg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW 00/12] Testing entire GGTT privatization
 preparation series.
Date: Thu,  8 Jan 2026 21:25:18 +0100
Message-ID: <20260108202531.671690-1-dev@lankhorst.se>
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
 drivers/gpu/drm/xe/xe_ggtt.c                  | 490 ++++++++++--------
 drivers/gpu/drm/xe/xe_ggtt.h                  |  28 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  80 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  53 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   5 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   7 +
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c         | 197 +------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h         |   4 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h   |   4 +
 16 files changed, 399 insertions(+), 604 deletions(-)

-- 
2.51.0

