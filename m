Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2DDC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C70010E449;
	Tue, 14 Nov 2023 13:05:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059C610E441
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699967106; x=1731503106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sH0jKK14iXx6VzbeCLsnCqIa9ijU58BrsaDChnbdqi8=;
 b=DYvx343j6kWpc5vx71qP3bMmQprDkl8hBu2Qbh3TUYy2p0wude0jzft1
 Gpc9KAm8QkQA5y8jgPSGvUDOsawLfGO7SWOZ439YDeVlVHy0N4vo/zLMz
 r1cRPjsmZboL/HhapDZ97ZSQBZNPkIfEXsNCRv9bDV+kgAqRwKo76MBEn
 lIs+lghzOwcnFT5pvnv+aYmjQz6bn9ANPK7ZTZYGdFB30F5SszNCEwnsB
 Xhfmn71zTB1xYVZEadIphIlmm1k55ksW5/AmpamQkMTouD1yBdK0xTG2q
 U6IApxtVLLS8kwXj3JHqgx+daqnkj/sPm2WlH57YfHDZvD1X5jpnGZu2o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394565344"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="394565344"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793778907"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="793778907"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.56.172])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:05:03 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 15:04:34 +0200
Message-Id: <20231114130443.2503708-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/9] Intel_fbdev.c refactoring
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

This patch set is removing all the ifdefs from intel_fbdev.c. This is
done by splitting i915 specific code into it's own source file and
similar source file is created for Xe for Xe specific code.

Remaining ifdefs are dropped by adding some compatibility headers.

Some of the patches are similar as in set from Maarten Lankhorst
<maarten.lankhorst@linux.intel.com>:

https://patchwork.freedesktop.org/series/126200/

Patches 3 and 9 are supposed to be sent to
intel-gfx@lists.freedesktop.org. Let's first agree if this is
acceptable solution from Xe point of view.

v2: Add missing forward declarations into intel_fbdev_fb.h

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Jouni Högander (9):
  Revert "FIXME: drm/i915/display: Allow fbdev to allocate stolen
    memory"
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
  drm/i915/display: split i915 specific code from intel_fbdev
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev

 drivers/gpu/drm/i915/Makefile                 |   3 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 203 +-----------------
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 116 ++++++++++
 drivers/gpu/drm/i915/display/intel_fbdev_fb.h |  21 ++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../compat-i915-headers/gem/i915_gem_mman.h   |  17 ++
 .../compat-i915-headers/gem/i915_gem_object.h |  11 +
 .../gem/i915_gem_object_frontbuffer.h         |   4 +-
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +
 .../xe/compat-i915-headers/i915_gem_stolen.h  |   4 +-
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   6 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 101 +++++++++
 drivers/gpu/drm/xe/display/intel_fbdev_fb.h   |  21 ++
 13 files changed, 312 insertions(+), 198 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
 create mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.c
 create mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.h

-- 
2.34.1

