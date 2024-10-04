Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBBDCF8853
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 22:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128AF10E00D;
	Fri,  4 Oct 2024 22:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXbz1wbJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A391210E00D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728079560; x=1759615560;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Gg9UZqpfOwXuyUXFkjajZSQvNmNlQJfJkcM4eUyOkKo=;
 b=dXbz1wbJxLzUfmNtVXaFp7QuwC7c92losEKMLIpLoi0lMPoFE5F0+49B
 +l38U5xCYke/b0KI8OW4Z6fggbKfQ6o5pVGICyVM9PBRLVhzjbyVhRGpy
 SLPfhIX0lbi2QhoUu1aNdaXTNE5OYqOrKiimw8peyLn/EzgnXm4xCQIFY
 aprJV7yp4WKuOnQX7m1vfcCBW9gVq3/KDjn5Irudh1UaeVdWVFVZ3aWtg
 lQXnpTs/zHau3qFrGh4StXevkYWVRXTCQfqDSF19+ipUO1KqGQqipPBxv
 iqHtopXJLbO90Vr8SdR/3YDnzQSIDpxf0LkjJAebdjkv4aLirOSno83FR w==;
X-CSE-ConnectionGUID: bfVFwyPLRqu4nhVzM/E0vQ==
X-CSE-MsgGUID: 7knj0H3+TDqCeO+RURsdSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="30199414"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="30199414"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:05:59 -0700
X-CSE-ConnectionGUID: eLHOOtL7TO6Au7nJNIHgcA==
X-CSE-MsgGUID: 618w7GBMTYewdb4WoJRuqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74836962"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:05:58 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 0/6] Add Xe3 and Panther Lake support
Date: Fri,  4 Oct 2024 15:05:44 -0700
Message-ID: <20241004220550.94308-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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

Add the basic enabling for Xe3 gt and media and add the Panther Lake
platform definition. This defines the Xe3 feature flags and initial GT
workarounds.

Display support will follow later.

v2: Drop several patches in favor of a more lightweight approach,
address feedback on the remainder, reorder. 

Gustavo Sousa (1):
  drm/xe/xe3: Add initial set of workarounds

Haridhar Kalvala (3):
  drm/xe/xe3: Define Xe3 feature flags
  drm/xe/ptl: PTL re-uses Xe2 MOCS table
  drm/xe/ptl: Add PTL platform definition

Matt Roper (2):
  drm/xe/xe3: Xe3 uses the same PAT settings as Xe2
  drm/xe/xe3lpm: Add new "instance0" steering table

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
 drivers/gpu/drm/xe/xe_gt_mcr.c           | 17 +++++++-
 drivers/gpu/drm/xe/xe_mocs.c             |  1 +
 drivers/gpu/drm/xe/xe_pat.c              |  2 +-
 drivers/gpu/drm/xe/xe_pci.c              | 16 +++++++-
 drivers/gpu/drm/xe/xe_platform_types.h   |  1 +
 drivers/gpu/drm/xe/xe_wa.c               | 49 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  3 +-
 include/drm/intel/xe_pciids.h            | 11 ++++++
 10 files changed, 99 insertions(+), 5 deletions(-)

-- 
2.45.0

