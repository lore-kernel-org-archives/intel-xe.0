Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9744FE82CC3
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 19:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576D610E5A0;
	Wed, 27 Sep 2023 19:38:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0823E10E5A0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 19:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695843537; x=1727379537;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FqrundqEdtz1AT6AF2t0NvKXF7U4kPr4A4cKXszXs3E=;
 b=dKym7ADCJZ9RlELUEJUnWpJvSbttnZSDT5lBE4JdTBZO5gB0n74Bby4o
 JTUo34PsT7nRup6/jSaEhi6mFVKOLSG7Jl5BFp4vBuizP4VhVFo26uV8p
 5KoNcX8qemBf69IVR6XkJ3oBzR7siuzlyHEXGqoPrV0TRf6XCWwNvNRrI
 rgt7Mh7xTedoKne37RtWIeswGDOW5hgvr8nyrf85Zaa/pj+FanO8NOiuU
 N/QCnpW5Wlo29oOzkvsgVj3Qqz+JYfsRbH0J3Gd9KKlcZ5X9RbqUIMssB
 r5AgPEsQ410SDl2gmO2BCq487itExMFeIio4RwWK5W1V6JQyg3tkmyzq+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381817976"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="381817976"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 12:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="742826470"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="742826470"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 12:38:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 12:38:51 -0700
Message-Id: <20230927193902.2849159-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 00/11] Refactor kernel setting of PAT
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reworks how we set PAT bits in both PPGTT and GGTT with the kernel
users in mind only. Allowing to set PAT by userspace is being added by
https://lore.kernel.org/all/20230829162840.73444-7-matthew.auld@intel.com/T/.
This can be seen as a follow up to the WIP patch that series depends on,
https://patchwork.freedesktop.org/series/122708/

I'm using that patch as a starting point, but as noted in my review
comments there, I think the overall abstraction we had and the ones we
were adding were not optimal. This is my attempt to translate my review
comments into the abstraction I was thinking of.

v2:
  - Fix kunit
  - Fix using wrong PAT table for DG2
  - Handle other review comments from v1

v3:
  - Fix kernel-doc
  - Rename pvc_pat_ops

Lightly tested on DG2.

Lucas De Marchi (11):
  drm/xe: Normalize pte/pde encoding
  drm/xe: Remove check for vma == NULL
  drm/xe: Use vfunc for pte/pde ppgtt encoding
  drm/xe/migrate: Do not hand-encode pte
  drm/xe: Use vfunc to initialize PAT
  drm/xe/dg2: Fix using wrong PAT table
  drm/xe/pat: Prefer the arch/IP names
  drm/xe/pat: Keep track of relevant indexes
  drm/xe: Use pat_index to encode pde/pte
  drm/xe: Use vfunc for ggtt pte encoding
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/xe/display/xe_fb_pin.c |  32 +++--
 drivers/gpu/drm/xe/tests/xe_migrate.c  |   2 +-
 drivers/gpu/drm/xe/xe_bo.h             |   8 +-
 drivers/gpu/drm/xe/xe_device.c         |   3 +
 drivers/gpu/drm/xe/xe_device_types.h   |  15 +++
 drivers/gpu/drm/xe/xe_ggtt.c           |  53 ++++++--
 drivers/gpu/drm/xe/xe_ggtt.h           |   1 -
 drivers/gpu/drm/xe/xe_ggtt_types.h     |   9 ++
 drivers/gpu/drm/xe/xe_migrate.c        |  34 +++---
 drivers/gpu/drm/xe/xe_pat.c            | 161 ++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pat.h            |  11 ++
 drivers/gpu/drm/xe/xe_pt.c             | 109 ++---------------
 drivers/gpu/drm/xe/xe_pt.h             |   6 -
 drivers/gpu/drm/xe/xe_pt_types.h       |  19 +++
 drivers/gpu/drm/xe/xe_vm.c             | 130 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_types.h       |   2 +
 16 files changed, 391 insertions(+), 204 deletions(-)

-- 
2.40.1

