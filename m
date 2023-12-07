Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165CBC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA17F10E104;
	Thu,  7 Dec 2023 05:23:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C4C10E104
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701926604; x=1733462604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yOKLVvaRjjaXj4qPYy3at3Fiz/EHtOsfVAF4KigLX1g=;
 b=n2C5IO/ypQlUWbcCZEzDvBIAA//VdEt5u8f84BibZNnTk0th9wxEZYxu
 YPBE8UeFxXhu/3305BDOyOvynq87kyRW0AyN5wzOy2t/WZYXXtfuRGyvC
 De4cbIL+LSZx3ZFErQYJezPqohZ5HiSukeKVUpw7tzcbBeptbtWR+a30k
 e1/UYHtZJEctULrD6ife24B80sESyWvE4M4bxVoR+71ySjuC3IasdEecp
 NHCBrHJ2qZHql9eKStD+ohzsWgRzgwygC+ffpSa5E187+fG4WpXa7swnr
 L5RdgpUGGLBJ2BMN/tZbbi1LuQaDeisqgcqzpAr/64M0wwiNanE08Z1ns w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7482055"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7482055"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:23:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842086005"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842086005"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:23:21 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 07:22:43 +0200
Message-Id: <20231207052252.2092191-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/9] Intel_fb.c refactoring
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This patch set is refactoring intel_fb.c code to get rid of
ifdefs. This is done by splitting i915 and Xe specific parts from
intel_fb.c into their own source files.

Some ifdefs are tackled by adding definitions into Xe compatibility
headers.

Patch 7. should be sent to intel-gfx@lists.freedesktop.org.

v5:
  - s/user_mode_cmd/mode_cmd
  - Fix typo intel_fb vs. intel_fb_bo
v4: Empty function instead of define
v3:
  - intel_fb_bo_framebuffer_fini added
  - xe_bo_get/put and unpin moved to intel_fb_bo_framebuffer_init/fini
v2: i915 changes are now backported

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Jouni Högander (9):
  Revert "FIXME: drm/i915: xe intel_fb.c framebuffer init and destroy xe
    changes"
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
  drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
  drm/i915/display: Convert intel_fb_modifier_to_tiling as non-static
  drm/i915/display: Handle invalid fb_modifier in
    intel_fb_modifier_to_tiling
  drm/i915/display: Split i915 specific code away from intel_fb.c
  drm/i915/display: Add intel_fb_bo_framebuffer_fini
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_fb.c       | 247 +++++-------------
 drivers/gpu/drm/i915/display/intel_fb.h       |   2 +
 drivers/gpu/drm/i915/display/intel_fb_bo.c    |  97 +++++++
 drivers/gpu/drm/i915/display/intel_fb_bo.h    |  26 ++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../compat-i915-headers/gem/i915_gem_object.h |  16 ++
 drivers/gpu/drm/xe/display/intel_fb_bo.c      |  74 ++++++
 drivers/gpu/drm/xe/display/intel_fb_bo.h      |  24 ++
 9 files changed, 305 insertions(+), 183 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.h
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h

-- 
2.34.1

