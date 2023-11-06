Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A431DC4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 06:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C30D10E26D;
	Mon,  6 Nov 2023 06:48:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233B610E26D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699253331; x=1730789331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s9A4KXe8IEol6Hb1tow2zjGv30Zs3WAwWzvQZyeRvRs=;
 b=gUPLbxf656IDQEmo1bScHwRJIrVyMOdHgnPXM6RBwn3TFLvh3F6oPwf8
 gSr8o4hxughZUe7AkckkRtjkRNOIgeKGtU1NhsS/DHmqj88y7LB2MT1XS
 ZoqFXTcIqY70McbaCRK7l86mxK5H0K68zKDsNtypZ6hJNm3NO390CptpQ
 G0m22TjlcECWUgGAn0ydJ/XE5tME2CInYqUFrdTO+NUANCHBwGAAvmQnV
 XQ3XhsFv01L4IyIbTAAz4XQTYYgyMAbzhh8IVd5PtHdkPT5rNFN6U6GtG
 9MRJTKz+CgZRx5jAe/Mbzq0RBCVDykhoqfgpu9qFu4f6XGNndDCtx1411 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369424618"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="369424618"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:48:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3534564"
Received: from rdegreef-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.42.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 22:48:48 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 08:48:26 +0200
Message-Id: <20231106064834.161647-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/8] Backport i915_sw_fence to dma fence
 conversion
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

In drm-intel-next branch we have now removed usage of i915_sw_fence
from display code and using dma_fence instead. Backport these patches
and revert related FIXME patches and other branch internal changes
from drm-xe-intel branch.

For now handle i915_gem_fence_wait_priority by adding empty defines
into compatibility headers. This is not interfering ongoing work to
remove i915_gem_fence_wait_priority from i915. These empty defines can
be easily removed when that work is done.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Jouni Högander (8):
  fixup! drm/xe/display: Implement display support
  Revert "FIXME: drm/i915: fence stuff"
  Revert "drm/xe/display: Append dma_buf fences to framebuffer fences"
  fixup! drm/xe/display: Implement display support
  drm/i915/display: Use dma_fence interfaces instead of i915_sw_fence
  drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
  fixup! drm/xe/display: Implement display support
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile

 drivers/gpu/drm/i915/display/intel_atomic.c   |   5 -
 .../gpu/drm/i915/display/intel_atomic_plane.c | 101 ++++++++----------
 drivers/gpu/drm/i915/display/intel_display.c  |  91 +++-------------
 .../drm/i915/display/intel_display_types.h    |   4 -
 .../drm/xe/compat-i915-headers/i915_config.h  |   8 +-
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   7 +-
 6 files changed, 69 insertions(+), 147 deletions(-)

-- 
2.34.1

