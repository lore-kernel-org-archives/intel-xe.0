Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A2C606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 22:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NFclyQSo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2C210E3E2;
	Fri, 30 Oct 2026 22:58:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AC610E2C7
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 22:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793401085; x=1824937085;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=F7zbfZT3He6CNxQgOsXzVyoN6Th8eDxATF/epELgDYE=;
 b=NFclyQSo+C0bfsmXYhRP0WI8kl5qlMKy0H4AjIarRoRFG7kW6Eyeegq+
 20E4nRRViUfUSf3nu4C739UMHdpwIozBEuB1KichkXYt6semu5amezoHI
 qhH5hOX70Of/qGRYhxIEGp2GxS0hTKvKYLU33yz0pJMgezZsKiCm5IVmv
 qHM2YK4cajER3xFK4DnderkRgP4ySn2CH5HodExhlmZWq+3Hzu+iML102
 G08/alLg3eXAct/r5bGmV/mZHHq/HCZnzIuvE/E/haBZzMTBDvM4t/LrQ
 1Cq5rRmUjq+6V3ox9Cfocw8QvKKWPEbsa/Jm5KG3jQYEnoZtybLxtFxI0 Q==;
X-CSE-ConnectionGUID: XOkaAQE4Rla4y6EGIJerIA==
X-CSE-MsgGUID: waSBbz0ETxyecePaB1fyFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2197981"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2197981"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:58:04 -0700
X-CSE-ConnectionGUID: ThOI8csxRVG1uTjJGhI1GQ==
X-CSE-MsgGUID: XuHFiahCRBuRHd3pGh1iTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5637688"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.197])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:58:03 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 00/10] drm/xe: Clean up adjust_idledly() and implement
 Wa_16031259911
Date: Fri, 30 Oct 2026 19:57:39 -0300
Message-Id: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQrCMBCF4auUWRvJJG3auPIeUiSmUzugjSSlK
 qV3NxbcuPwfvG+BRJEpwaFYINLMicOYQ+0K8IMbryS4yw1KKoNSoXi6MxqpUVXWIgrtGu2N7Zq
 qlpBPj0g9vzbw1OYeOE0hvjd/xu/6o/Q/NaOQ4iLLSve19SXhkceJbnsf7tCu6/oBbwC9fKwAA
 AA=
X-Change-ID: 20261021-wa_16031259911-3a83c69d8570
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>, 
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There is a new workaround, namely Wa_16031259911, to be added to the
xe driver that applies to graphics IP versions 35.10 and 35.11.  The
workaround is similar to existing ones that apply adjustments to
RING_IDLEDLY.

The current implementation can be improved though: adjust_idledly()
can be cleaned up and refactored to make the code easier to follow
sequentially as well as to add new workarounds (such as
Wa_16031259911); the GuC ADS regset accounting has a subtle issue
where the addition of RING_IDLEDLY is not accounted for.

This series addresses those issues first and then adds the
implementation of Wa_16031259911 as the final step.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v2:
- Change idledly_units_ps and maxcnt_units_ps to u64 in adjust_idledly()
  to avoid 32-bit multiplication overflow. (Sashiko, Matt)
- Replace the call-site comment for adjust_idledly() with a comment at
  the function definition instead of just dropping it. (Matt)
- Link to v1: https://patch.msgid.link/20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com

---
Gustavo Sousa (10):
      drm/xe: Bail from adjust_idledly() if in VF mode
      drm/xe: Sync Wa_16023105232 in xe_was to match OOB rule
      drm/xe: Use picosecond as common unit in adjust_idledly()
      drm/xe: Factor out {min,max}_idledly_ps in adjust_idledly()
      drm/xe: Bail from adjust_idledly() if no applicable workaround
      drm/xe: Drop early and redundant workaround checks in adjust_idledly()
      drm/xe: Replace MAXCNT comment with a comment on adjust_idledly()
      drm/xe/guc: Increment regset size for Wa_1607983814 inside hwe loop
      drm/xe/guc: Increment regset size for RING_IDLEDLY workarounds
      drm/xe: Implement Wa_16031259911

 drivers/gpu/drm/xe/xe_guc_ads.c    |  16 ++--
 drivers/gpu/drm/xe/xe_hw_engine.c  | 158 ++++++++++++++++++-------------------
 drivers/gpu/drm/xe/xe_wa.c         |   5 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules |   6 +-
 4 files changed, 93 insertions(+), 92 deletions(-)
---
base-commit: 238c1e3e984e2b7f948cb24165314b8d719a23d6
change-id: 20261021-wa_16031259911-3a83c69d8570

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

