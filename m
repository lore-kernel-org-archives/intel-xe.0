Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1633AC54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 13:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA8A112ABF;
	Tue,  5 Mar 2024 13:12:52 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49019112ABD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 13:12:50 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 0/4] drm/xe: Reduce GGTT display pinning latency.
Date: Tue,  5 Mar 2024 14:12:46 +0100
Message-ID: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Testing page flips I noticed 3 pain points in the GGTT code:
- Unnecessary taking force wakes (Brosts fix).
- display doesn't use GuC, so GuC invalidation can (hopefully) be
  skipped, saving 1 ms of latency.
- GuC invalidation should not be done with GGTT lock held, as it
  can be done at any time before the function returns.

This patch series solve those issues.

There are 3 potential optimizations untouched, but those don't touch
GGTT invalidation:
- In the case of pinning same FB, re-use xe_vma instead with
  refcounting, instead of allocating a new one.
- Preallocate the DPT bo when creating the framebuffer, to remove
  allocation latency in the pinning path.
- Attempt if write-combined GGTT PTE updates work again on newer
  platforms, and change writeq to writeq_relaxed, add flush at end.

Maarten Lankhorst (4):
  fix "drm/xe: Cleanup some layering in GGTT"
  drm/xe: Do not grab forcewakes when issuing GGTT TLB invalidation via
    GuC
  drm/xe: Do not perform GuC TLB invalidation for display GGTT
  drm/xe: Move xe_ggtt_invalidate out from ggtt->lock

 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 10 ++++--
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  3 +-
 drivers/gpu/drm/xe/xe_bo.h                    |  2 ++
 drivers/gpu/drm/xe/xe_bo_evict.c              |  5 +++
 drivers/gpu/drm/xe/xe_ggtt.c                  | 31 ++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt.h                  |  4 +--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |  2 ++
 7 files changed, 33 insertions(+), 24 deletions(-)

-- 
2.43.0

