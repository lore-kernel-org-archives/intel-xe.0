Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D99CD37AA
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 19:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBA010E678;
	Fri, 15 Sep 2023 19:47:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19B110E66F
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 19:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694807236; x=1726343236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tUx/r4NdUtxaN3iGPB8+F0Wako51IkZl7NOPU21YhLM=;
 b=jaAMQoBQ4W8L/hTvHUFCgvOtDVr3C2x0fziSLjWH00eR5OStDkZ2aLLF
 oEGAZSRBvrqUx3iVKSoQt+WWw/luVXVAC7BvUMVgo7/s/TgX99kzE1Q4O
 D7C09VgN/8jTigqbuF3L23RnCp8hKKZCAS5yUL9sOEHjiz2Z5YsOoRsSu
 c67QwXSQQdmXMS/mUN+9tNA1Sn6HafpkSoZ+q/pXBCJSIJSu8DmcdSceQ
 V9jRjYZCMIay4CeN77K5odw4oCPkxryvQmob8HDSV5Iw1mwIFqUpQt0O1
 h9qmmTDu6lzZa8ED45iOJuJ8ORtKmWsWy7j7yks0VM+rpyLxjGy7CxMpA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="382063296"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="382063296"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 12:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="888324500"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="888324500"
Received: from jmanzo-mobl.amr.corp.intel.com (HELO anushasr-mobl7.intel.com)
 ([10.209.15.212])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 12:46:39 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 12:46:56 -0700
Message-Id: <20230915194700.184626-1-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] Add Raptorlake Support
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

Anusha Srivatsa (4):
  drm/xe/rplu: s/ADLP/ALDERLAKE_P
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

