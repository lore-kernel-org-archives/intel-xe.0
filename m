Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47C8D3C54A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 17:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B89510E37F;
	Fri, 18 Oct 2024 17:06:19 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC32C10E37C
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 17:06:15 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 0/4] (CI) drm/xe: Fix initial framebuffer handover.
Date: Fri, 18 Oct 2024 19:06:27 +0200
Message-ID: <20241018170631.6598-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

Should be good enough to remove flickering, but does it pass CI?

Maarten Lankhorst (4):
  drm/xe: Remove double pageflip
  drm/i915/display: Use async flip when available for initial plane
    config
  drm/xe: Move suballocator init to after display init
  drm/xe: Initialise display before GT and tile init

 .../drm/i915/display/skl_universal_plane.c    | 13 +++++-
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 10 -----
 drivers/gpu/drm/xe/xe_device.c                | 43 +++++++++++++------
 drivers/gpu/drm/xe/xe_gt.c                    | 24 ++++++++---
 drivers/gpu/drm/xe/xe_gt.h                    |  1 +
 drivers/gpu/drm/xe/xe_tile.c                  | 12 ++++--
 drivers/gpu/drm/xe/xe_tile.h                  |  1 +
 7 files changed, 67 insertions(+), 37 deletions(-)

-- 
2.45.2

