Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2E2C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD0010E8C4;
	Thu,  9 Nov 2023 15:08:06 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76B010E21C
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:08:02 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 16:07:50 +0100
Message-Id: <20231109150759.44549-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/9] Break up remaining changes to make xe
 compile.
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

New version, splitting it up into smaller changes. Hopefully this version flows better.
The set_deadline changes have been dropped for now, but it should work as intended.

First patch should go into i915 and is on the ML, after that some fixups and reverts.
After that we update headers, add a FIXME, and then split out fbdev, intel_fb and
i915_gem_object_get_dma_address.

Maarten Lankhorst (9):
  drm/i915: Use drm_atomic_helper_wait_for_fences helper.
  fixup! drm/xe/display: Implement display support
  drm/i915/display: Revert all before remaining changes to make xe
    compile
  drm/i915/display: Revert remaining changes to make xe compile
  drm/xe: Update headers to be more compatible with i915
  FIXME drm/i915/display: add_dma_resv_fences is i915 only
  drm/i915/display: Use i915_gem_object_get_dma_address to get dma
    address
  FIXME drm/i915/display: Minimal changes to fbdev to make xe work
  FIXME drm/i915/display: Make intel_fb.c code compatible with xe

 .../gpu/drm/i915/display/intel_atomic_plane.c |  13 +--
 drivers/gpu/drm/i915/display/intel_cursor.c   |  12 +--
 drivers/gpu/drm/i915/display/intel_display.c  |  58 +---------
 .../drm/i915/display/intel_display_types.h    |   4 -
 drivers/gpu/drm/i915/display/intel_fb.c       |  89 ++++++----------
 drivers/gpu/drm/i915/display/intel_fbc.c      |  13 ++-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 100 ++++++------------
 .../gpu/drm/i915/display/intel_frontbuffer.c  |   7 +-
 .../gpu/drm/i915/display/intel_frontbuffer.h  |   4 -
 .../drm/i915/display/skl_universal_plane.c    |   4 -
 .../compat-i915-headers/gem/i915_gem_lmem.h   |   2 +
 .../compat-i915-headers/gem/i915_gem_mman.h   |  17 +++
 .../compat-i915-headers/gem/i915_gem_object.h |  76 +++++++++++++
 .../gem/i915_gem_object_frontbuffer.h         |   4 +-
 .../drm/xe/compat-i915-headers/i915_config.h  |  19 ----
 .../xe/compat-i915-headers/i915_gem_stolen.h  |  13 ++-
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   6 ++
 17 files changed, 205 insertions(+), 236 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h

-- 
2.39.2

