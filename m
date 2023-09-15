Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9248DEE6455
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 10:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608AC10E61C;
	Fri, 15 Sep 2023 10:57:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B020710E61B
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 10:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694775456; x=1726311456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C8pR78pGh1MMKzpLGnX9mgDT/jGVNjwHkTfjFSu65VE=;
 b=BOQrYfb4pGCu9vZf+uQwJ++U8DSHdnP3bW8MQnTuXy0qQPZ55lGLg0wM
 sE3As0EuqKMXQ09Sohy49uvKfKjKln4RG6/gp3JuCvZ7DqFTA/UKHJg9U
 bKNxivTMzUwxEKx8PRDpB8wQckp7wtmUDkcldp+CCisbsBhzcEa5Sm1FT
 Z8qPjI4u7eOj2k6UgHX2Jsi3j5I+sM/CCCJXPYDjXBVKp9tlDbUiG7lXx
 ZcALmJI1SYVOhsELdBwIV4sa3ecFsuOGDe+CX62ktzrw56CGTu8qTWjBO
 U1L1bUGT1bf8qxcEKVcJl7inFkSkiQXBujvP7lNriezeUFaQCi3EGjjX8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="379140073"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="379140073"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 03:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="835171626"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="835171626"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 03:57:34 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 13:57:18 +0300
Message-Id: <20230915105724.1025509-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Backport patches reorganizing
 intel_frontbuffer.h/i915_gem_object.h
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
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This patch set is backporting c1464a89e1a4 ("drm/i915: add minimal
i915_gem_object_frontbuffer.h") and replicating changes to Xe
frontbuffer code. This allows us dropping completely following patches:

c3e942a06433 (FIXME: drm/i915: include intel_frontbuffer.h from skl_universal_plane.c)
0300da12681b (FIXME: drm/i915/psr: include intel_frontbuffer.h from intel_psr.c)
57f941a90c2c (FIXME: drm/i915/drrs: include intel_frontbuffer.h from intel_drrs.c)

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Jani Nikula (1):
  drm/i915: add minimal i915_gem_object_frontbuffer.h

Jouni Högander (5):
  Revert "FIXME: drm/i915: include intel_frontbuffer.h from
    skl_universal_plane.c"
  Revert "FIXME: drm/i915/psr: include intel_frontbuffer.h from
    intel_psr.c"
  Revert "FIXME: drm/i915/drrs: include intel_frontbuffer.h from
    intel_drrs.c"
  fixup! drm/i915/display: Move releasing gem object away from fb
    tracking
  fixup! drm/xe: Add frontbuffer setter/getter for xe_bo

 drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 +
 .../gpu/drm/i915/display/intel_frontbuffer.c  |   1 +
 drivers/gpu/drm/i915/display/intel_overlay.c  |   1 +
 .../drm/i915/display/intel_plane_initial.c    |   1 +
 drivers/gpu/drm/i915/display/intel_sprite.c   |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  90 ---------------
 .../i915/gem/i915_gem_object_frontbuffer.h    | 104 ++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   1 +
 drivers/gpu/drm/i915/i915_gem.c               |   2 +-
 drivers/gpu/drm/i915/i915_vma.c               |   1 +
 .../gem/i915_gem_object_frontbuffer.h         |  12 ++
 drivers/gpu/drm/xe/xe_bo.h                    |   3 -
 15 files changed, 127 insertions(+), 97 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object_frontbuffer.h

-- 
2.34.1

