Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941BDC021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 09:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED5410E537;
	Tue,  4 Mar 2025 09:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdMLPo8T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30A910E537
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 09:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741080997; x=1772616997;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eebmOxBds7vIewQIk+x/DT48AJQ/BxMgRMkebHG/Qhc=;
 b=SdMLPo8Tl/xv8GlXTJA4QVpKicOAM0siJG9xMhoCuId/SrfwB3BDpZRR
 7wX/XQe3Y2KdF2GET4yMFHdJdIPbt8Bwm2fkv205eMRWZQtQh5dxCZ+7m
 0KJ+Lg8cORaJZfGR7Cv2KtYdRqmYc9GKnhenU1OttiMc2Mg8q8BTEBVvP
 DgEkpRJzbMitk+je8RmnuOpBHP2EaTjAVTwq2q6bY/t8Od7+UOYnL+5+U
 zxBCcjTcKpXjyZWFm74GUTUru10XclHFY7nsLcFmkD9rlEMvoIuFpEwVt
 Cdv043byI8BDPjgtMkbr4cRb/1yVX8vF+2DHxPEGVMjshHQmoGCrV+JM4 Q==;
X-CSE-ConnectionGUID: f2pGWKCURaqbb+chxDSXWQ==
X-CSE-MsgGUID: MIU+JEtIR7uQ+QyDRH1yaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45764782"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="45764782"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 01:36:37 -0800
X-CSE-ConnectionGUID: lJ6Bl1w5S6q/QjhMnSw1AA==
X-CSE-MsgGUID: +jPPFjUWT4+yEP4q/DVLjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118837707"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 01:36:34 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH 0/3] PMU support for function engine activity
Date: Tue,  4 Mar 2025 15:27:40 +0530
Message-ID: <20250304095743.3274062-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Extend PMU support for engine activity for PF and VF's.
PMU provides two counters (engine-active-ticks, engine-total-ticks)
to calculate engine activity. To get function engine activity from PF,
the user must provide the function values using the format

function - config:44-59

If 2 VF's are enabled, then the applicable function values are

0 - PF engine activity
1 - VF1 engine activity
2 - VF2 engine activity

This can be read from perf tool as shown below

./perf stat -e xe_<bdf>/engine-active-ticks,gt=<id>,engine_class=<class>,
			engine_instance=<instance>,function=<n>/,
	       xe_<bdf>/engine-total-ticks,gt=<id>,engine_class=<class>,
			engine_instance=<instance>,function=<n>/ -I 1000

Riana Tauro (3):
  drm/xe: Add support for per-function engine activity
  drm/xe/xe_pmu: Add PMU support for per-function engine activity stats
  drm/xe/pf: Enable per-function engine activity stats

 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 200 +++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   7 +-
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |   8 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c             |  20 ++
 drivers/gpu/drm/xe/xe_pmu.c                   |  39 +++-
 6 files changed, 237 insertions(+), 38 deletions(-)

-- 
2.47.1

