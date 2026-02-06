Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F623EE2084
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 11:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C741D10E047;
	Fri,  6 Feb 2026 11:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="f4W4ZU9k";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BBE10E047
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 11:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1770376887;
 bh=DXUvF8UyMiDZ2s6edU3TAdf7AecixcK+JuSngH4wmzE=;
 h=From:To:Cc:Subject:Date:From;
 b=f4W4ZU9kAvKDY+c8GlrBMUU9v72+w43OhzxSq+qjCIDPQelXAwe0prxw/lVZ7+mb4
 z+JL4q9KTQILUKFPlXviqpXWWegFu/O/qDm3HbX88RKqzy1K4E4VeglR1HQYVXH/GM
 k2NBLZhmFRtF6593AVKguHkL+ZqjpdTX5lcdv2d5tv1b6mFTm2Mxo/Kn7brxi7j8n9
 hJcdqOnelRElRJeW5F2TLk7jA0NjYJMzgVk8Ty/+IPFgR+YX6sLenx7WRU0+JbyDD7
 KuCCP2Z6vEdk4RuX/5FrhzmC4/TIfwuEW3245W3FvolSyPe5jMFeYRgeH68pwk/pIj
 GDVUYTS/vIzkQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v8 0/5] drm/xe: Privatize struct xe_ggtt.
Date: Fri,  6 Feb 2026 12:21:09 +0100
Message-ID: <20260206112108.1453809-7-dev@lankhorst.se>
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

Compared to last verison, fix the problem with display VRAM framebuffer readout.

Maarten Lankhorst (5):
  drm/xe: Make xe_ggtt_node offset relative to starting offset
  drm/xe: Rewrite GGTT VF initialization
  drm/xe: Move struct xe_ggtt to xe_ggtt.c
  drm/xe: Make xe_ggtt_node_insert return a node
  drm/xe: Remove xe_ggtt_node_allocated

 drivers/gpu/drm/xe/display/xe_fb_pin.c      |   5 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   6 +-
 drivers/gpu/drm/xe/xe_device_types.h        |   2 -
 drivers/gpu/drm/xe/xe_ggtt.c                | 371 +++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt.h                |  14 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h          |  60 +---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  36 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |  35 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 198 +----------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   3 -
 10 files changed, 201 insertions(+), 529 deletions(-)

-- 
2.51.0

