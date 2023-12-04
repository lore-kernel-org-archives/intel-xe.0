Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB18C10DC1
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 16:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C733A10E36A;
	Mon,  4 Dec 2023 16:41:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC73910E302
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701708068; x=1733244068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ESYWdqQo/fLC93ksJTeKTJiq08T90XqPy6I+p1uslN4=;
 b=iRK1mQn/YOf+kfuLJsZoXQUy4xF/MSQWYj8EHzmfJgVD/ybqmeGnDE+S
 f0r95vj2WtYtLaJiBpcfDEVcHYmbK8c2C0vQAQAUJLYZGTsUQ8myXBv7j
 NINKFmXwSCJDVrtI8iq7GgXjaLg3Q/lelTLENrQ4GK1JVEkCg7qTbbixK
 ThW8p+nzLy+XxPyZopTLxZucCMcR6bLEJE4hoy0+TAIQM8LrulfznXM0a
 Lv0ZnUV5ZE3Zi0PmoMCsnNMcRTErZi2dGNpE5AHt4poQjWbQ7rQvEXdFc
 GitC60BrFoNXZvE2RPCk1cS9izMWR76dVI/vLUaOki5Ad9tvnQBy3uJGh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="829410"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="829410"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 08:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="746895004"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; d="scan'208";a="746895004"
Received: from jstelter-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.61.71])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 08:41:04 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 18:40:38 +0200
Message-Id: <20231204164047.1166360-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/9] Intel_fb.c refactoring
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
 drivers/gpu/drm/i915/display/intel_fb_bo.c    |  92 +++++++
 drivers/gpu/drm/i915/display/intel_fb_bo.h    |  26 ++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../compat-i915-headers/gem/i915_gem_object.h |  16 ++
 drivers/gpu/drm/xe/display/intel_fb_bo.c      |  74 ++++++
 drivers/gpu/drm/xe/display/intel_fb_bo.h      |  24 ++
 9 files changed, 300 insertions(+), 183 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.h
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h

-- 
2.34.1

