Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EC1CF65D6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 10:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247F810E3FF;
	Mon, 26 Jan 2026 10:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="T6b3CwJT";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80B910E3F8;
 Mon, 26 Jan 2026 10:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769424371;
 bh=qgqVOBZA8HfdSvBYLMZ5f7kx7MwL3z+rah31yefkeoU=;
 h=From:To:Cc:Subject:Date:From;
 b=T6b3CwJTi03b6J8FLqsnKgXLs48lbO7rP+S1jPBQFVOXhrMDc3BzzyQQWyGkhQb4G
 HOGMGhMJhCpOMuv6ebJQGangnLZJ8MqMCTI3nGYNouTJXoDDh4nX2P1jXiuWLCb19i
 +wQhjFYJUpqdhNoqwyDqsPTfUgW05gXCDXwurxpODB8va/aU89Bn2JWW850XPCdei1
 c8F5TTizj5BnSoqtVR2MhmlkoMtxjbdDimZHQFqCJnV+lCp07vMG+8sUAv9v5EryZe
 b25vMLFe8Wk0YDvb/19n3bTMxFea0+aB0WzBDaGM5Jtlo9isvOsFi53FmhPkfrpHxc
 ZybA6qL6ixWIg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6 0/5] drm/xe: Privatize struct xe_ggtt.
Date: Mon, 26 Jan 2026 11:45:59 +0100
Message-ID: <20260126104604.988024-1-dev@lankhorst.se>
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

Clean up SR-IOV VF handling and pop the balloons, move struct xe_ggtt to xe_ggtt.c,
and clean up the API's slightly by removing a separate xe_gtt_node_init() step.

This makes the xe_ggtt_node_allocated obsolete, as we only create allocated nodes now.

Updated based on review feedback.

Maarten Lankhorst (5):
  drm/xe: Make xe_ggtt_node offset relative to starting offset
  drm/xe: Rewrite GGTT VF initialization
  drm/xe: Move struct xe_ggtt to xe_ggtt.c
  drm/xe: Make xe_ggtt_node_insert return a node
  drm/xe: Remove xe_ggtt_node_allocated

 drivers/gpu/drm/xe/display/xe_fb_pin.c      |   5 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   6 +-
 drivers/gpu/drm/xe/xe_device_types.h        |   2 -
 drivers/gpu/drm/xe/xe_ggtt.c                | 358 ++++++++------------
 drivers/gpu/drm/xe/xe_ggtt.h                |  14 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h          |  60 +---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  36 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |  37 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 198 +----------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   3 -
 10 files changed, 194 insertions(+), 525 deletions(-)

-- 
2.51.0

