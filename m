Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1EDD2D0E2
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 12:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC61A10E4B7;
	Tue, 13 Jan 2026 12:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="DRpQMyMd";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D1510E33C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768306692;
 bh=8t9ZPmZKfszaQKoyT6k2FdQJbMb/46mj0JCOVYdEa60=;
 h=From:To:Cc:Subject:Date:From;
 b=DRpQMyMd+RaT+vA5SFHBMCzXdJWvXgyp41MueMLwIIgOFZKF/Rgko9cZKrA0Yfsyf
 q3wYGG5VVndgmaoxJvVrb9xF5ZCts4+zpnQDVwehjHCYvp1qfix/osy5na5CV1BLGE
 Oum7GL91FnALnHZt6c2DJeYEgK2UDvga4+bwSK153G5OL/QVDnNoMn7LMOV5AN84Ne
 hCLfwCM/kUEUjdZSxmywSiMBELlkM/N34Q+VrCc6unmyIplEfWQODGC9BE0ByyFgMf
 jB5eOXz9HroXfuf0FfVABEgiqOaqGawEI9oOo02/cyKptx1z8yFJOTT/Yk5I/NW5uI
 sfg03fwKgcAIg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 0/5] drm/xe: Privatize struct xe_ggtt.
Date: Tue, 13 Jan 2026 13:18:02 +0100
Message-ID: <20260113121807.1303124-1-dev@lankhorst.se>
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

Changes since previous version:
- Move the changes to fix SRIOV-VF to first commit, otherwise it's
  broken between first and second commit on bisection.

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

