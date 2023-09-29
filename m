Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F84E728F3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6933410E716;
	Fri, 29 Sep 2023 20:45:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF43A10E717
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020324; x=1727556324;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fKCjARBGIFxzRhqYtlUiWAlo4dw14LWDXIgL1y/B2Pc=;
 b=Hs7ZjyiVljvsQQ1Qt2y/AclmqqzQBHTA4np0NvnL9gIkJ7bra2Mk/Axw
 tnSFY5AdtA6YtWCDX3MbEEas7EzmjUs0mF0Pa+aThp742m4a4oeXahhfc
 osYV5Et3r91Fgx1gG6spTRhlabopNXpCJ2A245cVFWpXBxMuETRJ4Pt5D
 +JT0No3Z5XN5UIyLKHKG3k64r/wAxEwUGPcdDC4MAiedRB3vppnfgebii
 edwdZdMTAXTMuMD6Jh30ZOvIVF+KtSlB667QUEenR999ntF1GHkkT0LfD
 c1ZzR2EsH0j0CEr9yK76yreRCTNie19FyG7RbNuY9I4t/yolkLbsFPyLx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367427385"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="367427385"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="726691217"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="726691217"
Received: from anushasr-simics.jf.intel.com ([10.165.21.200])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:18:54 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 13:16:54 -0700
Message-Id: <20230929201659.2840724-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] Add Raptorlake Support
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Keep the naming convention consistent with i915.
As part of it making some consistent naming changes
so we can continue to use some macro magic moving forward.
It does make the name bigger - ALDERLAKE instead of
just ADL. But this way the platform name is ALDERLAKE_P
everywhere which is easier to remember and use.(previosuly
the driver had ADLP_ usages for some defines - like ADLP_RPLU_* etc)

While at it also adding some missing support in kunit for the
some subplatforms.

v2: Split any changes to xe/compat-i915-headers/i915_drv.h file
as a separate patch, regardless of build failures at that point.

Anusha Srivatsa (5):
  drm/xe/rplu: s/ADLP/ALDERLAKE_P
  drm/xe: s/ADL_P/ALDERLAKE_P
  drm/xe/rpls: Add RPLS Support
  drm/xe/rpls: Add Stepping info for RPLS
  drm/xe: Add missing ADL entries to xe_test_wa

 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  2 +-
 drivers/gpu/drm/xe/tests/xe_wa_test.c             |  2 ++
 drivers/gpu/drm/xe/xe_pci.c                       |  9 ++++++++-
 drivers/gpu/drm/xe/xe_platform_types.h            |  3 ++-
 drivers/gpu/drm/xe/xe_step.c                      | 10 +++++++++-
 5 files changed, 22 insertions(+), 4 deletions(-)

-- 
2.25.1

