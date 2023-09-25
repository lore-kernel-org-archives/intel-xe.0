Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC32CE79A5
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 22:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7683110E339;
	Mon, 25 Sep 2023 22:11:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD8010E335
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 22:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695679890; x=1727215890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fhSADDTdr818DSv1gopdN+qgkeG3zMztqb6NOULdIFw=;
 b=CAv7f+NAnquuBzMRTT/XUx/ulwZH5E9l+erO/DB9qVjgRC5e6V9X44cY
 rxeTUWEC0nosMwLhlGyD1w4PGkv6nhTadnsTguAeOFXeqobJ7Sc4Vnu13
 qtqO4pccWjJTxwIBDQjPvtJrp+2I6jRNUOzARCsi6AgfbyrevTuDiuhO3
 TaOfLI85gaYIBIqlBy6zNCmKViilrr9BsaLTi0M5Hh0YVpU9hvkU+NLG2
 2zIMCyl6zccgK+z0JenbDHOAVzK9yVIF0cVJDf2dtnBIhXA6xpk2TbFav
 7+SD/oy4AZOTYA/p/8k9wBXhQDrMu4lehxyIAEHrjV7aM1g39vHYdmzZ2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412332997"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="412332997"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="742087743"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="742087743"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:11:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 15:10:40 -0700
Message-Id: <20230925221049.2681491-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/9] Refactor kernel setting of PAT
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
 Matthew Auld <matthew.auld@intel.com>
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

Lightly tested on DG2.

Lucas De Marchi (9):
  drm/xe: Normalize pte/pde encoding
  drm/xe: Remove check for vma == NULL
  drm/xe: Use vfunc for pte/pde ppgtt encoding
  drm/xe/migrate: Do not hand-encode pte
  drm/xe: Use vfunc to initialize PAT
  drm/xe/pat: Keep track of relevant indexes
  drm/xe: Use pat_index to encode pte
  drm/xe: Use vfunc for ggtt pte encoding
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/xe/display/xe_fb_pin.c |  32 +++++--
 drivers/gpu/drm/xe/tests/xe_migrate.c  |   2 +-
 drivers/gpu/drm/xe/xe_bo.h             |  11 ++-
 drivers/gpu/drm/xe/xe_device.c         |   3 +
 drivers/gpu/drm/xe/xe_device_types.h   |  15 +++
 drivers/gpu/drm/xe/xe_ggtt.c           |  53 ++++++++---
 drivers/gpu/drm/xe/xe_ggtt.h           |   1 -
 drivers/gpu/drm/xe/xe_ggtt_types.h     |   9 ++
 drivers/gpu/drm/xe/xe_migrate.c        |  34 ++++---
 drivers/gpu/drm/xe/xe_pat.c            |  68 +++++++++++---
 drivers/gpu/drm/xe/xe_pat.h            |  11 +++
 drivers/gpu/drm/xe/xe_pt.c             | 109 ++--------------------
 drivers/gpu/drm/xe/xe_pt.h             |   6 --
 drivers/gpu/drm/xe/xe_pt_types.h       |  19 ++++
 drivers/gpu/drm/xe/xe_vm.c             | 124 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_types.h       |   2 +
 16 files changed, 337 insertions(+), 162 deletions(-)

-- 
2.40.1

