Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86132C678DC
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 23:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E7A10E259;
	Thu, 17 Aug 2023 23:04:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6910110E27E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 23:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692313454; x=1723849454;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8HDNDZddKDYzMXIiEVdccTWbJ/qbp00za/VlkdLx1Rc=;
 b=l2+Ypd6Qdgke/RcQ8IQ59MP0WxPQ2NgoWYy4f52IzEghzW5GSAn5euay
 dV4/qsIKW+8PxtBMVpIAVqp02pT86phm5FNOo3JciMxk3tyCPO28YujHk
 ZZ7ZcxG7N1DeqCY8rqCYswSfKLXCpyTNWATVUJbWLTpGYeRkTbM/ACGhS
 mwTdUm5FRy+lY3KEomG3cpTqVI+zuOIDALlxzAefUu0w0h6eR7lUldhfV
 WIL3BOTKhDshAcxbrt2tyATCGGgLwSsOfYDhtXNzWBbdaFQ0JVebFxMv0
 vJQND9HY1OpxmxuU71KFFGmGCNnsCGhxECf4QU4X8Rpib+LmEmz+Z1Aww g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="375736156"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="375736156"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 16:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734827867"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="734827867"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 16:04:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 16:04:08 -0700
Message-ID: <20230817230407.909816-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] Stop tracking Tile4 support
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that i915 has moved the Tile4 feature flag into the display-specific
code, it's no longer necessary to track this feature at the Xe driver
level.  Cherry-pick a couple i915 patches that made the handling
self-contained within display, and then remove Xe's own tracking.

Matt Roper (4):
  drm/i915/selftest: Simplify Y-major tiling in blit selftest
  drm/i915: Eliminate has_4tile feature flag
  fixup! drm/xe/display: Implement display support
  drm/xe: Stop tracking 4-tile support

 .../drm/i915/display/intel_display_device.h   |  1 +
 .../i915/gem/selftests/i915_gem_client_blt.c  | 39 +++++++------------
 drivers/gpu/drm/i915/i915_drv.h               |  1 -
 drivers/gpu/drm/i915/i915_pci.c               |  1 -
 drivers/gpu/drm/i915/intel_device_info.h      |  1 -
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  1 -
 drivers/gpu/drm/xe/xe_device_types.h          |  2 -
 drivers/gpu/drm/xe/xe_pci.c                   | 10 +----
 8 files changed, 17 insertions(+), 39 deletions(-)

-- 
2.41.0

