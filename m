Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5351C3ABBC
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 12:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D672010E3E5;
	Mon,  5 May 2025 12:20:06 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB51C10E3F3
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 12:20:02 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 00/10] drm/xe/ggtt: Stop relying on GGTT internals.
Date: Mon,  5 May 2025 14:19:13 +0200
Message-ID: <20250505121924.921544-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

This patch cleans up all users of struct GGTT outside of display.

Most uses inside display have been cleaned up too, the hardest part
is fixing rotated GGTT display buffers, which I've postponed for now.

Once that's fixed, no users outside of xe_ggtt.c remain, and the struct
definition can be made private.

Maarten Lankhorst (10):
  drm/xe: Use xe_ggtt_map_bo_unlocked for resume
  drm/xe: Add xe_ggtt_might_lock
  drm/xe: Add xe_ggtt_alloc
  drm/xe/display: Remove dereferences of ggtt for tile id
  drm/xe/ggtt: Seperate flags and address in PTE encoding
  drm/xe/display: Dont poke into GGTT internals to fill a DPT
  drm/xe/display: Convert GGTT mapping to use pte_encode_flags
  drm/xe: Remove pte_encode_bo callback
  drm/xe: Implement a helper for reading out a GGTT PTE at a specified
    offset
  drm/xe: Do not rely on GGTT internals in xe_guc_buf kunit tests

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  50 +++---
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   6 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |  11 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   2 +-
 drivers/gpu/drm/xe/xe_bo_evict.c              |   4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 156 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h                  |  17 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   4 +-
 drivers/gpu/drm/xe/xe_tile.c                  |   6 +-
 9 files changed, 174 insertions(+), 82 deletions(-)

-- 
2.45.2

