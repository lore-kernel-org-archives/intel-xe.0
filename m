Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429D5D29DE8
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 08:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFA210E471;
	Tue, 13 Jan 2026 08:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="TzJ3GfW0";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F309110E471
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 08:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768293427;
 bh=GaW/1hyqd9977uFuPgvuXm3k++fIah/kRhHKF6JkPdo=;
 h=From:To:Cc:Subject:Date:From;
 b=TzJ3GfW0vbdAnxDSr79wP4XUr2WmN3YgPP1uJO1iiUwfuL7TzhhEG1Wz6q5122qpy
 Aw924cTgMIi2ER3rYF0reJEVTIwzV/lMZti/VD7nTwynYy8UYp0PrhRxk9wPWR7hmO
 fLdCwrIDW0jLMwe3URbF9ORthylg/T8GingR7JEzHL+jJsuT9MMNLJGUFvKHj2DrrD
 JdGCCtR7yTmjokKz+X/ZLNSu2YU1tb7gAbdEHro+lLz8JQZBaEAbSsZqpcH3M0qa6T
 raGY7q98gznZRXg0ur0A9wJm1EZirtYUUkuVUGzp8J8lkfyZPWYos5Q1J05T2A201g
 cAE7QixDF+bLg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 0/5] drm/xe: Privatize struct xe_ggtt.
Date: Tue, 13 Jan 2026 09:36:56 +0100
Message-ID: <20260113083702.1276449-1-dev@lankhorst.se>
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

Maarten Lankhorst (5):
  drm/xe: Make xe_ggtt_node offset relative to starting offset
  drm/xe: Rewrite GGTT VF initialisation
  drm/xe: Move struct xe_ggtt to xe_ggtt.c
  drm/xe: Make xe_ggtt_node_insert return a node
  drm/xe: Remove xe_ggtt_node_allocated

 drivers/gpu/drm/xe/display/xe_fb_pin.c      |   3 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   6 +-
 drivers/gpu/drm/xe/xe_device_types.h        |   2 -
 drivers/gpu/drm/xe/xe_ggtt.c                | 345 ++++++++------------
 drivers/gpu/drm/xe/xe_ggtt.h                |  12 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h          |  60 +---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  36 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   7 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 198 +----------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   3 -
 10 files changed, 163 insertions(+), 509 deletions(-)

-- 
2.51.0

