Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20A8C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 21:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B577310E6FA;
	Fri, 26 May 2023 21:15:57 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349E10E1F7
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 21:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685135755; x=1716671755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x5UbH3d5t+ys2B7Fw7xNecrqRzWSVzCrCXWI95p+qsU=;
 b=XZwaBMKJFZ6oZzlbkOIL9wrNPvTGf8IXIbR2lzvauSSRf+pVak9SnHNQ
 /5YR6MieNUJhH7gocGYA3NKeBl4570ewaEh0Vw+EMwvEY4nRzANH+vq6E
 TZF2t4Tl75DzwqD8gtIh2BA9HPx2dW3ROuGTegGOGE9dVFAs/WQS7n0FZ
 y+O27bcpaJJGO5rUhFp768oW2eFok62iwGj/+t0W9q2SJEFl6oBIqLWLi
 6JEJ1JUIhdQ9Ymg5rDbHuoILyQ+FyX2J7TXqFJdxMQJasnRxhBK0Yk1PB
 VDbF0d2dM750+/UqX9QG6s0J5RF24+YPLqecsLjfLDwFHssEKZV2jLG97 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382555218"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="382555218"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="1035495040"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="1035495040"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:15:54 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 14:17:25 -0700
Message-Id: <20230526211730.2774851-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] RPLS and other minor support
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

As part of it making some consistent naming changes
so we can continue to use some macro magic moving forward.
It does make the name bigger - ALDERLAKE_P instead of
just ADLP. But this way the platform name is ALDERLAKE_P
everywhere which is easier to remember and use.(previosuly
the driver had ADLP_ usages for some defines - like ADLP_RPLU_* etc)

v2: Squash the addition of platfroms to the kunit tests
in the patch that introduces the platfrom.
- Add missing commit message and move patches accordingly.

Anusha Srivatsa (5):
  drm/xe/adlp: s/ADLP/ALDERLAKE_P
  drm/i915/adlp: s/ADLP/ALDERLAKE_P
  drm/xe/rpls: Add RPLS Support
  drm/xe/rpls: Add Stepping info for RPLS
  drm/xe: Add missing ADL entries to xe_test_wa

 drivers/gpu/drm/i915/display/intel_cdclk.c        |  2 +-
 drivers/gpu/drm/i915/i915_drv.h                   |  2 +-
 drivers/gpu/drm/i915/intel_step.c                 |  2 +-
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  2 +-
 drivers/gpu/drm/xe/tests/xe_wa_test.c             |  5 +++++
 drivers/gpu/drm/xe/xe_pci.c                       |  9 ++++++++-
 drivers/gpu/drm/xe/xe_platform_types.h            |  3 ++-
 drivers/gpu/drm/xe/xe_step.c                      | 10 +++++++++-
 8 files changed, 28 insertions(+), 7 deletions(-)

-- 
2.25.1

