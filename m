Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710A6C5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 19:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FBE10E7C1;
	Wed,  4 Jun 2025 19:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELOj+S6K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E239610E7C1
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 19:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749063633; x=1780599633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RqKc95IWTihKChkBdrN6DIbuy/8+2cdoQmj1TM07JUA=;
 b=ELOj+S6KTomrSFcMhxyfpYP+Ww2dhE2IiBCFNkAgP6DACIg/o8rwbdhK
 ejzYN1MzK4tfk3rGK+frz7+zWbO774S3j48MGSaPyRV7BuWPSjbMV1yyd
 QSHgV0wSWYVKUyhQriXGmSXIXenTvCtBDrEfiEBapBiSE83UfxPT5IxmZ
 8gTWP+c4LAD8tIpHpcUwgJWxfLpDarOXx/vF2FbVXvXSYw1AvIpSYycE1
 TuR3Jl5goKYLtCQcwsCo5oH5h6+Iz8i4UTkP6320WGuqBmPA5Y/0r5yco
 hOVpHla1rXwwTgrYnv1bBBff4usX8S1lSlq0XOkxFcsul53n4fxSpVS/1 A==;
X-CSE-ConnectionGUID: ynhR5nEESu2nRIqSg7Ehgw==
X-CSE-MsgGUID: Fh2CarsaRN6sQwGuJWJ6tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50279990"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="50279990"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 12:00:32 -0700
X-CSE-ConnectionGUID: l9o/Bf0pRTK5+G8cmzfuGA==
X-CSE-MsgGUID: M+9BxYrZSLCFKPMd1C71wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150066465"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 12:00:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] PF: Print debug stuff using debug printer
Date: Wed,  4 Jun 2025 21:00:19 +0200
Message-Id: <20250604190021.725-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

In the past we didn't have the xe_gt_dbg_printer() helper.

Michal Wajdeczko (2):
  drm/xe/pf: Print runtime registers using debug printer
  drm/xe/pf: Print configuration KLVs using debug printer

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.47.1

