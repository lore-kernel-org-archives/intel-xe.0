Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DC6F3092A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F52F10E002;
	Thu,  5 Mar 2026 10:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hz0vhcLa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6B210E002
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 10:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772706831; x=1804242831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y+XVEr2sdDBD7gGFF1UuCtmlJONuTUATW4lf9gRPEWA=;
 b=hz0vhcLav6B59Oa78/Ppo2umA9B52edKVr9VYlovR4yhMjVq/eJVQFrI
 biamrh9aF06CI280Y9dfw0AadbzaxuGwteGOxRUAWTn28WVivmGsRPRgh
 7kDepaXoBcoiOFVYwT//7ZLhhlVDzQ4CI6u5EoFI3HATwG3QPFLxnWdCA
 H3SogSxqPYPPUSX2FBnES40+9AJCz9XRjKDEE/2jFTHTEitjtAJZFvYvm
 nGAvJ5foFN2q8Snhn8LY1PO6xw+aFVomqozbmpRfvZRYIo+y+3N67bM6/
 F/sde5/ll/ZEDpZ9Jy4yOINveiq1oTQJVBGxFMaURRv2sKAisD7fcyduI g==;
X-CSE-ConnectionGUID: mHwn+L4DTbCSDnleQPI81g==
X-CSE-MsgGUID: ef06p/rsSRmKWPsm0aml+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73859082"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73859082"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:33:50 -0800
X-CSE-ConnectionGUID: 0f/ms+5EQ1SBet3uUPadCQ==
X-CSE-MsgGUID: m6h7E9KJRVqWHvS5Ws14Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="223326113"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:33:49 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, michael.j.ruhl@intel.com,
 daniele.ceraolospurio@intel.com
Subject: [RFC PATCH 0/4] Add ocode late binding support for CRI
Date: Thu,  5 Mar 2026 16:14:41 +0530
Message-ID: <20260305104441.2857181-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

Ocode is the OOBMSM telemetry/manageability firmware, and on CRI it is
loaded through late binding flow.

Dependancy: There is dependancy on mei side of patches to support ocode late binding,
	    which are not upstreamed yet. Hence, this patch is marked as RFC.

Badal Nilawar (4):
  drm/xe/xe_late_bind_fw: Refactor pm flow
  drm/xe/xe_late_bind_fw: Add support to load Ocode firmware on CRI
  drm/xe/xe_late_bind_fw: Track firmware load status
  drm/xe/xe_late_bind_fw: Enable late binding support for CRI

 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 143 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |   7 +-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  25 ++++
 drivers/gpu/drm/xe/xe_pci.c                |   1 +
 drivers/gpu/drm/xe/xe_pm.c                 |   9 +-
 5 files changed, 161 insertions(+), 24 deletions(-)

-- 
2.52.0

