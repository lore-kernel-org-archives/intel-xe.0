Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81728C9EC93
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 14:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3948910E3E5;
	Mon, 12 Jan 2026 14:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="dcUJ8AW9";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F4510E3E4
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768227683;
 bh=JrvDidRbELg2rOoGJf5N9JLhvXd+JzhnGzNoHlaL2F0=;
 h=From:To:Subject:Date:From;
 b=dcUJ8AW9FKqUyVovoo+WD1KO+8YAnT3v5flM+T+xuTl2fNLQ6X2kdt/5S+H4SyEaH
 os3wSL5X0Wwk/2acsSPWzIi+OD+/FxcFQqCFA6ci6vc1rMBC9RwlSQNv43ki0+41Xh
 nvmWCaXgueM8QoxOGl7ptoG5oQz4cAc93JfMBKPcU1X2Fx0z99U7s3IwxqU3DoeO3X
 zF4p0PsxqehjsqCmaUwJhwEfbohpv/mAJMYVv5KAO/7nymbqU0otqcuHVcU8NfCJso
 EnrdJILJ8kdMOhXeIyKAwPUnfrFR/yqMTBiNN3vrmg853c6ndazR0/J9MUfzImHVl4
 GSRSOynHIFnuA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW-v4 00/12] Testing entire GGTT privatization
 preparation series.
Date: Mon, 12 Jan 2026 15:21:09 +0100
Message-ID: <20260112142121.1153027-1-dev@lankhorst.se>
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

CI check, do not review.

Testing if VF issues are resolved now.

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
 drivers/gpu/drm/xe/xe_ggtt.c                  | 527 ++++++++++--------
 drivers/gpu/drm/xe/xe_ggtt.h                  |  28 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  80 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  53 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |   7 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c         | 198 +------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h         |   3 -
 14 files changed, 395 insertions(+), 636 deletions(-)

-- 
2.51.0

