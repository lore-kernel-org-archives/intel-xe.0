Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13910C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 10:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B515110E62A;
	Wed, 25 Oct 2023 10:20:54 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F86C10E592
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 10:20:53 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 12:20:35 +0200
Message-Id: <20231025102045.817068-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/10] Split out most of "FIXME:
 drm/i915/display: Remaining changes to make xe compile"
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

A lot of  the changes are reverts that are no longer useful. In some cases the
compat headers provide functionality, in other cases it needs to be added.

With all reverts, the fixme patch should be mostly isolated to intel_fb.c and intel_fbdev.c

Untested.

Maarten Lankhorst (10):
  revert fixme in intel_atomic_plane.c
  drm/atomic: Add drm_atomic_helper_set_fence_deadline() function
  drm/i915: Implement fence->set_deadline.
  FIXME drm/i915/display: Use fence->set_deadline to boost requests
  fixup xe i915_drv.h compat header
  revert intel_frontbuffer changes.
  Update compat headers.
  more reverts
  drm/i915/display: Use i915_gem_object_get_dma_address to get dma
    address
  revert more (fbc)

 drivers/gpu/drm/drm_atomic_helper.c           | 15 ++--
 .../gpu/drm/i915/display/intel_atomic_plane.c | 70 ++++---------------
 drivers/gpu/drm/i915/display/intel_cursor.c   | 12 ++--
 drivers/gpu/drm/i915/display/intel_display.c  | 37 +---------
 .../drm/i915/display/intel_display_types.h    |  4 --
 drivers/gpu/drm/i915/display/intel_fbc.c      | 13 ++--
 .../gpu/drm/i915/display/intel_frontbuffer.c  |  7 +-
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  4 --
 .../drm/i915/display/skl_universal_plane.c    |  4 --
 drivers/gpu/drm/i915/i915_request.c           |  9 +++
 .../compat-i915-headers/gem/i915_gem_lmem.h   |  2 +
 .../compat-i915-headers/gem/i915_gem_object.h | 58 +++++++++++++++
 .../gem/i915_gem_object_frontbuffer.h         |  4 +-
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  1 +
 .../xe/compat-i915-headers/i915_gem_stolen.h  |  4 +-
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  6 ++
 include/drm/drm_atomic_helper.h               |  3 +-
 17 files changed, 126 insertions(+), 127 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h

-- 
2.39.2

