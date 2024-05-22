Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E36C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 05:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6B110E1E2;
	Wed, 22 May 2024 05:33:24 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DA510E12D;
 Wed, 22 May 2024 05:33:22 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [v6 0/3] Fix cursor FB unpinning.
Date: Wed, 22 May 2024 07:33:38 +0200
Message-ID: <20240522053341.137592-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hopefully last attempt.
Small bug in drm_vblank_work_flush_all left, fixed now hopefully.

Maarten Lankhorst (2):
  drm: Add drm_vblank_work_flush_all().
  drm/i915: Use the same vblank worker for atomic unpin

Ville Syrjälä (1):
  drm/i915: Use vblank worker to unpin old legacy cursor fb safely

 drivers/gpu/drm/drm_vblank_work.c             | 22 +++++++++++++
 .../gpu/drm/i915/display/intel_atomic_plane.c | 13 +++++++-
 .../gpu/drm/i915/display/intel_atomic_plane.h |  2 ++
 drivers/gpu/drm/i915/display/intel_crtc.c     | 31 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cursor.c   | 26 ++++++++++++++--
 drivers/gpu/drm/i915/display/intel_cursor.h   |  3 ++
 drivers/gpu/drm/i915/display/intel_display.c  |  3 ++
 .../drm/i915/display/intel_display_types.h    |  3 ++
 include/drm/drm_vblank_work.h                 |  2 ++
 9 files changed, 102 insertions(+), 3 deletions(-)

-- 
2.43.0

