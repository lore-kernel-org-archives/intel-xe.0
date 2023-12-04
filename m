Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C78C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 06:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1FD10E165;
	Mon,  4 Dec 2023 06:49:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC9210E165
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 06:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701672595; x=1733208595;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qsdKkx5oHVPMB484xbFlVXI23R+Q+Ti4C0FgmFbmtrk=;
 b=eZc9W0cGdgZnUEw+A/p37Tg23ZMWyNXyWD+sbB/OzAHt/STm1DF3//k2
 mqpi07+9aj27qJ6Rh2UVGWZBhcL4S91UD0XcNN4hXFw6MFc27q/6XLEyo
 cjETPfaIcLZ7ySQpzbF0biGMWRfgdZ0G1Bc1DSKs0w8JpSGKeC7bU3Jkk
 E4fhocoGF2RWMAJtDaqwUEj7TDOa8+XUoEb0T8hFAdhxOeBqcSFOcQFwM
 lYejQLF/wniKOLKSX8kOBfe5H79uHIrQdgt8Dvg0b0tYYHfeuosfqe5ev
 Oc3elYZ/CpZArcIJIWWoawQB5ZvlXB040ornwh3RikGKw6136MK2D6zsW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373880066"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="373880066"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 22:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="836482780"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="836482780"
Received: from martinro-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.46.174])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 22:49:51 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 08:49:23 +0200
Message-Id: <20231204064932.869215-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/9] Intel_fb.c refactoring
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
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_fb.c       | 219 ++++--------------
 drivers/gpu/drm/i915/display/intel_fb.h       |   2 +
 drivers/gpu/drm/i915/display/intel_fb_bo.c    |  92 ++++++++
 drivers/gpu/drm/i915/display/intel_fb_bo.h    |  24 ++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../compat-i915-headers/gem/i915_gem_object.h |  16 ++
 .../gem/i915_gem_object_frontbuffer.h         |  21 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c      |  62 +++++
 drivers/gpu/drm/xe/display/intel_fb_bo.h      |  23 ++
 10 files changed, 288 insertions(+), 173 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.h
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h

-- 
2.34.1

