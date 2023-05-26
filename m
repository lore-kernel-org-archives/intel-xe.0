Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67AFC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 17:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBF610E086;
	Fri, 26 May 2023 17:10:42 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F5210E086
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685121039; x=1716657039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UX/ARxGO76e7MGHOW807wCvfNieQqIRxALt6XIVohwA=;
 b=Ji28bT85OmOUo41KvpHXPp2t+P6cwAjffQ6v8pYd28nZdKU5bqJYdzAr
 2fO+nAwV3hCTfAqsDkZ8lw5f4sAkScfrMDq1nSK/VG0x0OnwOeSWQ9MlH
 eyEoR1yJ9WAumIGBNec80/nYShBSeQHxsmzW87h11usmoGfDymBbWFXCp
 cjVVCFcvxkk0UN1iZkSMLbiZnrYJQL8Jin59/6h8PR4lddlnfd4P9gsjq
 AYqBfgDV8gE/8A1thFwrSbIv03xyad+4pFiCWod7zTFZcZEA22ELWlTA3
 +OQ0+p5IHLLiis0Cxx9eW6w1Pecyjn6SUFhVPovs1GSv1o2jHQiznuSSE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353094918"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="353094918"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:10:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879603328"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="879603328"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:10:28 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 10:11:58 -0700
Message-Id: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] RPLS and other minor support
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

While the first version of RPLS support was reviewed by
Matt Roper, noticed some minor changes that were missing
in stepping info and workarounds support for the other
subplatform - RPLU.

As part of it making some consistent naming changes
so we can continue to use some macro magic moving forward.
It does make the name bigger - ALDERLAKE_P instead of just ADLP.
But this way the platform name is ALDERLAKE_P everywhere which is
easier to remember and use.(previosuly the driver had ADLP_ usages
for some defines - like ADLP_RPLU_* etc)

Anusha Srivatsa (6):
  drm/xe/adlp: s/ADLP/ALDERLAKE_P
  drm/i915/adlp: s/ADLP/ALDERLAKE_P
  drm/xe/adlp: Add missing ADL-P entry in xw_test_wa
  drm/xe/rpls: Add RPLS Support
  drm/xe/rpls: Add Stepping info for RPLS
  drm/xe/rpl: Add missing RPLP and RPLS entry in xe_wa_test

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

