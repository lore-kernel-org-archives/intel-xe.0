Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB592C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 11:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96DE10E4FD;
	Tue,  5 Dec 2023 11:27:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C0B10E4F9
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 11:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701775649; x=1733311649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0ARJFoCr4GdPghg3fCuSPzgH+pWTz9vFEA74KoGBayw=;
 b=E6Ho4ahdKKzCfcmVjGBTald4Xwi9D/VQPNhU/4Um1wi3zGOTQtWwL3gL
 oxK0pBJ7nbNXFQEDJ+v1cPzUyD8BL+N4Xaio/VhrN1F0TnM0ruTX0sZ/H
 Zyo9fChedTSxGteoyF8qfQJkk4g7rcQK+TcYYOmy95zuBvcrl9dJpvShS
 sCKTaOHRs+B9KEHSzyaaeSEODfMvyFKLANA4gXtQ+TQcGTQgNX0Ksc0Cm
 ItEyxAemTQ5hu2PpkJfM34QDsnHN925LfW6ijIAr1CV1dY0v0fkygBAmq
 3d6J1eQIpPz4PRViCjrcaabsNeJp/wWY59cXEcfWUeb7lpyVEfwXvoK90 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="396675972"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="396675972"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:27:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="774606537"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="774606537"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.33.227])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:27:26 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 13:27:08 +0200
Message-Id: <20231205112717.1349830-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/9] Intel_fb.c refactoring
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

