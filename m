Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CFEC77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 08:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC07610E5A6;
	Fri,  5 May 2023 08:30:31 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4634410E5A6
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683275430; x=1714811430;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=debeLmw8P0FhRJfKEOfqlRvD1lMMRiRMRdB71fgW6mg=;
 b=RCY9rAt/CqSGh8QgdE8fd4qXcCxpTkzvfbqYkv5grm0ikROQHLxeXKjg
 PAKQxk6Z1tBTk/B8O5GqaHJ8ZC05xps8IzNAlXskmwThNMnmri7aZiSj5
 SUJXPyNXO+Y8Az6perFsxrSn1kSFze/D3mfDnOTzGrvTyHPFhi07md4+J
 EpFRQVUnJcSiLIZ+AiKj2Tf7lXWWQ5lri1QBlE8HutEjjVOFzYzec/p4s
 0FTxLjnAjrqWxd2DLA/w+TK9Vc9wwiVPMWc8Lj1g/7Bo+7Y2mf740Lay+
 mte1CUzjm6CHGPafe8bEU3JsO1Ypcnr5SeKVEMk0bf3YeGcooQA2rD5mE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="328783126"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="328783126"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="943749023"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; d="scan'208";a="943749023"
Received: from pklosowski.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.36.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 01:30:24 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  5 May 2023 11:29:36 +0300
Message-Id: <20230505082956.2247875-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 00/20] Xe frontbuffer tracking
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
Cc: jani.nikula@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This patch set is taking frontbuffer tracking into use for Xe driver as
well.  This allows using custom dirtyfb ioctl implemented for i915 instead
of doing full atomic commit on dirtyfb ioctl. It also provides support for
CPU/GPU frontbuffer rendering with features like PSR, DRRS and FBC. Even as
frontbuffer tracking is targeted being discontinued it is seen as too risky
to remove it completely at this point.

DirtyFB IOCTL
Dirtyfb ioctl is modified to be dma fence aware:
1. If all the fences for the buffer dirtyfb ioctl is called on are all signaled
perform flush.
2. If there are unsignaled fences for the buffer perform invalidate and add
dma fence callback for them and initiate flushes when these each of these
happens. Also perfrom flush immediately on each fence which are already
signaled.

i915
Patch set is keeping current frontbuffer tracking implementation as it
is. It is just refactoring the code to allow using it with Xe driver as
well. I915 is currently using hooks in gem code to perform frontbuffer
tracking flush when GPU rendering completes. Patch set is initiating extra
flushes which are perform on dma fence signaling. This will be triggering
extra updates for features like PSR and FBC addition to the flush
triggerd by the gem hooks.

Xe
Instead of modifying frontbuffer tracking for Xe driver this patch set is
doing minimalistic changes to current implemenation and using it as needed
for Xe as well. Functionality is pretty much same as with i915 driver. As
Xe doesn't have gem hooks to trigger frontbuffer tracking flush it will be
relying completely on dirtyfb ioctl and frontbuffer tracking flush
initiated by the ioctl. This requires user-space using GPU frontbuffer
rendering to import completion fence using dmabuf_import_sync_file.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Jouni Högander (20):
  Revert "drm/i915/display: Neuter frontbuffer tracking harder"
  Revert "drm/i915: Remove gem and overlay frontbuffer tracking"
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  drm/i915/display: Change __intel_frontbuffer_get parameter
  drm/i915: Add macros to get i915 device from i915_gem_object
  drm/xe: Add macro to get i915 device from xe_bo
  drm/xe: Add intel_bo_flush_if_display define for Xe
  drm/i915: Add intel_bo_flush_if_display define for i915
  drm/xe: Add struct i915_active for Xe
  drm/xe: Add i915_active.h compatibility header
  drm/xe/display: Include i916_active related headers
  drm/i915: Add function to clear scanout flag for vmas
  drm/xe: Add function to clear scanout flag
  drm/i915/display: Use i915_ggtt_clear_scanout
  drm/i915/display: Use drm_gem_object_get/put
  drm/xe/display: Use frontbuffer tracking for Xe as well
  drm/i915: Add new frontbuffer tracking interface to queue flush
  drm/i915: Handle dma fences in dirtyfb callback
  drm/xe/display: Use custom dirtyfb for Xe as well

 drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 -
 drivers/gpu/drm/i915/display/intel_cursor.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
 .../drm/i915/display/intel_display_types.h    |   8 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  75 ++++++++--
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 132 ++++++++++++++++--
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  72 ++++++++--
 drivers/gpu/drm/i915/display/intel_overlay.c  |  14 ++
 .../drm/i915/display/intel_plane_initial.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |   1 -
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   7 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  25 ++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 +++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   5 +
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   4 +
 drivers/gpu/drm/i915/i915_driver.c            |   2 -
 drivers/gpu/drm/i915/i915_gem.c               |   8 ++
 drivers/gpu/drm/i915/i915_gem_gtt.c           |   1 +
 drivers/gpu/drm/i915/i915_vma.c               |  32 +++++
 drivers/gpu/drm/i915/i915_vma.h               |   2 +
 .../drm/xe/compat-i915-headers/i915_active.h  |  12 ++
 .../compat-i915-headers/i915_active_types.h   |  12 ++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  13 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |   7 +
 29 files changed, 442 insertions(+), 49 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h

-- 
2.34.1

