Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3134DCEDD89
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 12:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0058110E6EB;
	Wed,  9 Oct 2024 12:51:07 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067F110E6EB
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 12:51:05 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 0/6] drm/xe: Make struct xe_ggtt private.
Date: Wed,  9 Oct 2024 14:51:08 +0200
Message-ID: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
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

Sent as a separate series.

I have merged the patches to make pt_ops and ggtt private, and reworked xe_fb_pin.c

xe_fb_pin.c had the problem that some parts belong there, while others belong to xe_ggtt,
I'm hoping that with the callback function to populate the GGTT node, I've fixed the layering
violation that would have to happen otherwise.

I've solved it by creating a xe_ggtt_node_insert_transform() function that calls back into xe_fb_pin.c
to populate a given xe_ggtt_node. This way xe_fb_pin can still write a rotated GGTT, while outside
the scope of this function the details are hidden.

Writing DPT requires the same encoding as GGTT, but since it's a normal bo it only needs access to the
GGTT encoding function. With the insert transformation function being the only way to write to GGTT,
it should be safe to export the encoding only.

The display quirks stay in xe_fb_pin.c, while the details of GGTT stay in xe_ggtt.c now!

Maarten Lankhorst (6):
  drm/xe: Use xe_ggtt_map_bo_unlocked for resume
  drm/xe: Add xe_ggtt_might_lock
  drm/xe: Add xe_ggtt_alloc
  drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
  drm/xe/display: Dont poke into GGTT internals to fill a DPT
  drm/xe: Move struct xe_ggtt to xe_ggtt.c

 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 146 +++++++--------
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   2 +-
 drivers/gpu/drm/xe/xe_bo_evict.c              |   9 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 171 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_ggtt.h                  |  17 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |  53 +-----
 drivers/gpu/drm/xe/xe_tile.c                  |   4 +-
 8 files changed, 245 insertions(+), 163 deletions(-)

-- 
2.45.2

