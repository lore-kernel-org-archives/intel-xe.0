Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A897BC5DF66
	for <intel-xe@archiver.kernel.org>; Sun, 16 Aug 2026 22:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D0C10E2F4;
	Sun, 16 Aug 2026 22:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+V+GqxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4079E10E093;
 Sun, 16 Aug 2026 22:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786920022; x=1818456022;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T/tFIT6fxxlxtiMTg58YsJhncm9D+X+YwbzruoRiwgY=;
 b=I+V+GqxWCtBXNw0NWOmL61BgLTnKvCjUxFbPfCWsb/puUtdvpee4/Zxu
 pqKgcXPa6Sa8d91LQ1pd+l5t1FmkWj/t/kQAyZJO433+LTMxo8lzGe3ZO
 bcD5abGahPcuVsU6Kz4SHWcUP7hV721L0ApKL82WtEhg4nr+9SscxoMF2
 C/MAYeL1TiXaduukfxeoaANsyc5zB57uADZWIYBGza0dCjmE5pZTqSplX
 0DDTuni9SXABQqQm6g99tO3hsV2S1l4LrCtn0WW+xdy8xjvtUJziOoTV4
 YUXhqPrQC9CLLmsD+x/Y3RIEUx9Q8IQIhPomocLayHk20xKrNmwSFYIsh A==;
X-CSE-ConnectionGUID: I1IUpr9tTzS/ro8SRenkpg==
X-CSE-MsgGUID: 1yNxmOKBTrStrX0RJNLuIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98761667"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="98761667"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:21 -0700
X-CSE-ConnectionGUID: 2ZEDhgSrRrS6bTv5mWNOVg==
X-CSE-MsgGUID: sVlaMQNASBKUCen12EaqLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="269948331"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.249.236])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:19 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	imre.deak@intel.com
Subject: [RFC PATCH 0/5] pm_pme support on display hotplug
Date: Mon, 17 Aug 2026 01:39:59 +0300
Message-ID: <20260816224005.886035-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Initial RFC patches for the pm_pme support for display hotplugs
to see if these proposed changes are in the right direction. This
is not complete yet. I am still figuring out the need to keeping
HPD interrupts enabled for PME generation in suspended state

TODO list:

1. Restrict this to specific display versions or rely on the 
   pci_dev_run_wake()
2. How to check display hotplug generates PM_PME (Bspec 68857, 68867)
 	2.1 HPD -> PME generation work in D3. But it requires hpd
            interrupts and path enabled and unmasked as per the bspec.
            I am still figuring this out.
3. So far I have not been able to test this properly with HPDs. Some
   IGT tests worked successfully which do not involve HPDs. But 
   main thing to verify is that HPD can generate PME in the suspended
   state

Vinod Govindapillai (5):
  drm/xe/pm: add xe_pm_pme_supported() helper
  drm/i915/display: add pme_capable() to the parent interface
  drm/i915/xe: plug the pme_capability query for xe
  drm/i915/display: add intel_hpd_polling_enabled()
  drm/i915/display: skip HPD polling if PME is supported

 .../drm/i915/display/intel_display_driver.c   | 21 ++++++++++++++++---
 .../gpu/drm/i915/display/intel_display_rpm.c  |  7 +++++++
 .../gpu/drm/i915/display/intel_display_rpm.h  |  1 +
 drivers/gpu/drm/i915/display/intel_hotplug.c  | 11 ++++++++++
 drivers/gpu/drm/i915/display/intel_hotplug.h  |  1 +
 drivers/gpu/drm/xe/display/xe_display_rpm.c   |  6 ++++++
 drivers/gpu/drm/xe/xe_pm.c                    | 21 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h                    |  1 +
 include/drm/intel/display_parent_interface.h  |  1 +
 9 files changed, 67 insertions(+), 3 deletions(-)

-- 
2.43.0

