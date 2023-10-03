Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1BFE8FDB7
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 20:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8248510E100;
	Tue,  3 Oct 2023 20:37:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C9D10E07D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 20:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696365444; x=1727901444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uyWXH1mON+DtzbGp9SslIOKucow8+CdSZhPsm8r5CwM=;
 b=gSw0Hal2UtVvx0GSoBOfc+alRF/BgeU29ACwpGjBrLsfFkZI2vZLU3y/
 7cyjZUbGrpoebPMrIPGlwYjIl9WvYrRpV0A+gQWGJ2QS7+RW2C6wBXiAQ
 HXIu2DYPwz64/oAnw5Q6GXHDVJIxyYq2L+vhr0TsNyyaGOlW3igSmFNHQ
 2XkI3HIB2DlLLTX1XaUXrGassAIIy0t4U90YkOpKUQc8sVeK60a0rwaiT
 qrQBLE5sqdsA+VzPwcEzW13lMN94UqE98JBZZGs190i/7TTY3XUw5kZgM
 IxXOZcJXcUMw2Zfz8ZbKx6z0UP47Pxy2cmAGDYm2vVi2Uz501N1/1hSRv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382882318"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="382882318"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="821393955"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="821393955"
Received: from xuebinta-mobl.amr.corp.intel.com (HELO
 anushasr-mobl7.intel.com) ([10.212.207.176])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:37:23 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 13:37:11 -0700
Message-Id: <20231003203716.108979-1-anusha.srivatsa@intel.com>
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

v3: Add fixup! to patches to make merging easier

Anusha Srivatsa (5):
  drm/xe/rplu: s/ADLP/ALDERLAKE_P
  fixup! drm/xe/rplu: s/ADLP/ALDERLAKE_P
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

