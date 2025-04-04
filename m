Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE953C369A2
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 20:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBA210E34C;
	Fri,  4 Apr 2025 20:51:44 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C021D10E34F
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Apr 2025 20:51:42 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI 00/13] Offload GGTT binding to migration engine.
Date: Fri,  4 Apr 2025 22:51:25 +0200
Message-ID: <20250404205138.620455-1-dev@lankhorst.se>
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

Another way of tackling test failure.
Test to see if it passes CI, and for discussion.

Maarten Lankhorst (13):
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
  drm/xe: Add GGTT updates to migration engine
  drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
  drm/xe: Allow for optimization of xe_ggtt_map_bo
  drm/xe: Move struct xe_ggtt to xe_ggtt.c

 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 151 ++++-----
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   6 +-
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   2 +
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  75 +++++
 drivers/gpu/drm/xe/xe_bo.c                    |   2 +-
 drivers/gpu/drm/xe/xe_bo_evict.c              |   4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 289 +++++++++++++++---
 drivers/gpu/drm/xe/xe_ggtt.h                  |  21 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  53 +---
 drivers/gpu/drm/xe/xe_migrate.c               |  87 ++++++
 drivers/gpu/drm/xe/xe_migrate.h               |  12 +
 drivers/gpu/drm/xe/xe_tile.c                  |   6 +-
 12 files changed, 517 insertions(+), 191 deletions(-)

-- 
2.45.2

