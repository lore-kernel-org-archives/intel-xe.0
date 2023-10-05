Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146FBE92FC1
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 20:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84DB10E48D;
	Thu,  5 Oct 2023 20:57:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA0410E19D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 20:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696539416; x=1728075416;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vzuSB9t2NJMHWQ7i8PgBQQJvMoxCJjZfximnQFYBCFg=;
 b=iysCQneOGFWz0y+UkcMg1tZL52mJvqRgFD+uMvYTLCIFcFE2rIC6bhyJ
 rn0bE7sEgEPp0+bj+fjcwlmTXKsEvN4tCQFepCcG1jrZEzt+nw0Pu/5fN
 0LLDD8/YLlnVfBaZhMKXKxQhPNCFM+jOWnvETnRLukjL7eXjR/KhjE7V4
 IXmyc/2UkyWI0BEbVpGrsgqMJ9zAAFMGQIPNptoOHEk5nYoMotd6q4i/2
 VSbit3xuq06L4yVfrE+aPni47V16vIEfVyqPB/Hqk6wtPXmLDq7168prU
 DCH8RdyAqwAz9KdxAajt2RmF1jdMnC1wf8hdtJDfbOrqQ2Vfi4oTP9Gth Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382490104"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="382490104"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="755613803"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="755613803"
Received: from anushasr-simics.jf.intel.com ([10.165.21.200])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:56:35 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 13:54:45 -0700
Message-Id: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
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

v3: No functional change. Reorder patches.

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

