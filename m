Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F409EC47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 06:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A271B10E0FE;
	Thu, 16 Nov 2023 06:42:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E1010E0FE
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 06:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700116937; x=1731652937;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fqVJ0LayBwL+eq7IfYTxzLzWybawqcLp0XjXH5/9N8I=;
 b=miWaXsSmfOxHOWDzxjJCKTVz3iHH19UpvH6IwU2mLfoEhhOfWoOXQlmb
 Gk6pmt2FQ5N573UbHFuT5Ndaed4VrzYN7OwCXSy8sWFJ5I4fH3U++ANpq
 h0OheDCOSjf/DDfE5Yr9LmfMjc7UAFlpMUUO0FvUrWe4wT/4NTzm2GQqH
 XDndJGiW076d8Wloi6KeaRjOVB+kZd0HK5uYRN9Iq5ticyvmxtDTQrrFk
 coNqQOXGc1HDJlWLn4JXKhUlC2BhM64pSTBs5xRLLsLwfVX8C+RHsnV6T
 eZq0lA5VJwZmtsvW1oO91T5QyBDIKw2cUsy8bzxgxoHmeXoa1IrLRVV3v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="381422787"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="381422787"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="765216640"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="765216640"
Received: from dcarcium-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.40.251])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 22:42:14 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 08:41:37 +0200
Message-Id: <20231116064145.3969338-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/8] Intel_fb.c refactoring
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
headers and rest are removed by switching i915_gem_object->base to
intel_bo_to_drm_bo macro. Also one i915_gem_object_put is changed to
drm_gem_object_put.

Patches 5, 6 and 7 should be sent to intel-gfx@lists.freedesktop.org.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Jouni Högander (8):
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
  Revert "FIXME: drm/i915: xe intel_fb.c framebuffer init and destroy xe
    changes"
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
  drm/i915/display: Convert intel_fb_modifier_to_tiling as non-static
  drm/i915/display: Split i915 specific code away from intel_fb.c
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_fb.c       | 192 +++---------------
 drivers/gpu/drm/i915/display/intel_fb.h       |   2 +
 drivers/gpu/drm/i915/display/intel_fb_bo.c    |  93 +++++++++
 drivers/gpu/drm/i915/display/intel_fb_bo.h    |  24 +++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../compat-i915-headers/gem/i915_gem_object.h |  16 ++
 .../gem/i915_gem_object_frontbuffer.h         |  21 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c      |  62 ++++++
 drivers/gpu/drm/xe/display/intel_fb_bo.h      |  23 +++
 10 files changed, 274 insertions(+), 161 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.h
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.c
 create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h

-- 
2.34.1

