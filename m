Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406AACCF2FA
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 12:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0481810E44F;
	Mon, 19 Jan 2026 12:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="VI8GEY3C";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE0A10E444
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768827066;
 bh=WxsJcD/YlZCMwzGHNGf9cHKIM8dFVNdNuhsbqBsvbeQ=;
 h=From:To:Cc:Subject:Date:From;
 b=VI8GEY3CSq64sM5bYGF1wZI5qaTFDheY4LqehSNV1mzj+O/by4C3VblxZnsvrpVzU
 4Z613KnzSbEqkNsOKIg6+HAHMQiiL29dIVlE/FcGOMZHapHMldU8Cmuj9z+sItZDrZ
 Xt8PMOPLzUhPIIYpqH6Q7SpVyLnp1JcSANkkOFIwmDbTbCAHdyvHzyqcvnlqa+tg7K
 gl+cqgxZuIA1e3mU/GaHX5XR5qZHM3aW0AuxuosxoQkc+IQ4B0Wd1dtQVTQ8bHJYI5
 lNCMTYtGz3qOfX8hDnRONqofCzzE+3D7ZPg999XjHKG0uABWcTb1vEgQKvCq2ux6Zt
 xjBe4h8mhk0+Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5 0/5] drm/xe: Privatize struct xe_ggtt.
Date: Mon, 19 Jan 2026 13:50:56 +0100
Message-ID: <20260119125101.277182-1-dev@lankhorst.se>
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

Clean up SRIOV-VF handling and pop the balloons, move struct xe_ggtt to xe_ggtt.c,
and clean up the API's slightly by removing a separate xe_gtt_node_init() step.

This makes the xe_ggtt_node_allocated obsolete, as we only create allocated nodes now.

Changes since last version:
- Some small fixes and cleanups.
- Didn't rename xe_ggtt_node_insert, as I feel the correct name would
  then be xe_ggtt_insert_ggtt_node().

Maarten Lankhorst (5):
  drm/xe: Make xe_ggtt_node offset relative to starting offset
  drm/xe: Rewrite GGTT VF initialization
  drm/xe: Move struct xe_ggtt to xe_ggtt.c
  drm/xe: Make xe_ggtt_node_insert return a node
  drm/xe: Remove xe_ggtt_node_allocated

 drivers/gpu/drm/xe/display/xe_fb_pin.c      |   3 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   6 +-
 drivers/gpu/drm/xe/xe_device_types.h        |   2 -
 drivers/gpu/drm/xe/xe_ggtt.c                | 339 ++++++++------------
 drivers/gpu/drm/xe/xe_ggtt.h                |  12 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h          |  60 +---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  36 +--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |  27 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 198 +-----------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   3 -
 10 files changed, 175 insertions(+), 511 deletions(-)

-- 
2.51.0

