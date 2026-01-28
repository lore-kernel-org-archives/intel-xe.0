Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0024ED3F098
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 16:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5D810E738;
	Wed, 28 Jan 2026 16:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Muy/JUKw";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3120C10E738
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769619450;
 bh=JVrOHmbndVH2h326AppXNkTVP6/8eqHcjwZeN6HiNG0=;
 h=From:To:Cc:Subject:Date:From;
 b=Muy/JUKwPAOLn0K7z6GZUgZNDhZLc50APNzSZRnBI1DkzZaNJ7rWGElXbWh2b/GqC
 jy5RPhKoepqtlQ7/nHE3hutxZed49mhb0mAla/duFEn4h3rV3E7f4hmEi5hgcRldjx
 67SRfWqL2q+k0oMNC3NcZ/bqUo5c1aW3mZSK5upmoeR/FufopcVxfOGw359aVKOng3
 Tb35eBRIe/qXZTeOIat248DjHTM90xBI0FrO9+++nbTcn+Sy/4ApVX55S8bDI7hJ6B
 gtdG4ySUPyokGVWlOqeQqF0yOvazeBneJ32m7DM0HwFvPaTkYEmgOoow+9W+dBOLV8
 WHkXzfh+EoBWg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v7 0/5] drm/xe: Privatize struct xe_ggtt.
Date: Wed, 28 Jan 2026 17:57:18 +0100
Message-ID: <20260128165724.12587-1-dev@lankhorst.se>
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

Updated based on review feedback. Hopefully all remaining issues addressed now. :)

Maarten Lankhorst (5):
  drm/xe: Make xe_ggtt_node offset relative to starting offset
  drm/xe: Rewrite GGTT VF initialization
  drm/xe: Move struct xe_ggtt to xe_ggtt.c
  drm/xe: Make xe_ggtt_node_insert return a node
  drm/xe: Remove xe_ggtt_node_allocated

 drivers/gpu/drm/xe/display/xe_fb_pin.c      |   5 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   6 +-
 drivers/gpu/drm/xe/xe_device_types.h        |   2 -
 drivers/gpu/drm/xe/xe_ggtt.c                | 359 ++++++++------------
 drivers/gpu/drm/xe/xe_ggtt.h                |  14 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h          |  60 +---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  36 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |  35 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 198 +----------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   3 -
 1files changed, 189 insertions(+), 529 deletions(-)

-- 
2.51.0

