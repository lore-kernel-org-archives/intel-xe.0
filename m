Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD4FCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 12:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E9110E036;
	Thu, 30 Oct 2025 12:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWFviK37";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4ED310E036
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 12:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761827069; x=1793363069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iCOjxDsdEI0lZj6KT09p+yjcFM+yAQdTu6Nvx/r0v7s=;
 b=cWFviK37DsrZA2yzp+lwQuRB0WLEWRxoKkIIRiiunRlYsmKnvZeR47C3
 eFMU0bMVcAsm0M+4uvmaxBo2tv8V8NgwyTprsSHo4GJWHRqcf7PcNYpIi
 7UsopW0hkfnN7IFfk05HrHtW89swKe8lq514ZC1P8+GfV2SU/jRFK+rYI
 zlN0Gt0bHl65cvoR8iUahfnPZIhO0AW4kl8c3hP78AtQY+aKQyv3gIPCN
 ZWyZm4aIHvrXOOQhaA0RCOoK9OAe86FS5xKSbpNCFvOgar79DS6cN5q42
 50+oufzHO1/P/1wCFNHKAywW5puCDNGQSYDW21qz0CyTlFazPjrbXk3H+ Q==;
X-CSE-ConnectionGUID: ednI6cP9Tlu+oUj4pVfOOA==
X-CSE-MsgGUID: nIWhPDMYSaWIY7su+XJbDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64062627"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="64062627"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 05:24:29 -0700
X-CSE-ConnectionGUID: qSxo6fC9Ty2bTz+P+XYLrg==
X-CSE-MsgGUID: fXb56dCMQZy0naWBJiHo+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="191103669"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2025 05:24:27 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v8 0/4] Introduce GT runtime suspend/resume
Date: Thu, 30 Oct 2025 17:53:53 +0530
Message-Id: <20251030122357.128825-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
    Use runtime naming for guc helpers (Daniele)
    Split xe_guc_ct_enable() helper (Daniele)

v3: Drop redundant logging, add kernel doc (Michal)
    Use runtime naming for ct helpers (Michal)

v4: Split xe_guc_ct_enable() patch (Rodrigo)
    Fix tags (Rodrigo)

v5: Include host_l2_vram workaround (Daniele)
    Reuse xe_guc_submit_enable/disable() helpers (Daniele)

v6: Split sumbit_pause/unpause() helpers for VF and PF (Matthew Brost)
    Assert on runtime suspend if VFs are enabled (Daniele)

v7: Add IS_SRIOV_VF() assert in VF helpers (Matthew Brost)
    Use "vf" suffix for VF helpers (Michal)
    Reword commit message (Matthew Brost)

v8: Add !IS_SRIOV_VF() assert in runtime suspend path (Matthew Brost)

Raag Jadav (4):
  drm/xe/vf: Update pause/unpause() helpers with VF naming
  drm/xe/guc_submit: Introduce pause/unpause() helpers for PF
  drm/xe/pm: Assert on runtime suspend if VFs are enabled
  drm/xe/gt: Introduce runtime suspend/resume

 drivers/gpu/drm/xe/xe_gt.c          | 60 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h          |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  6 +--
 drivers/gpu/drm/xe/xe_guc.c         | 34 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h         |  2 +
 drivers/gpu/drm/xe/xe_guc_ct.c      | 27 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h      |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c  | 38 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.h  |  6 ++-
 drivers/gpu/drm/xe/xe_pci.c         |  9 +++++
 drivers/gpu/drm/xe/xe_pm.c          | 10 ++---
 drivers/gpu/drm/xe/xe_uc.c          | 28 ++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h          |  2 +
 13 files changed, 214 insertions(+), 12 deletions(-)

-- 
2.34.1

