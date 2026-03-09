Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAACFCA17B
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 20:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9D310E598;
	Mon,  9 Mar 2026 20:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfeZ34z5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5154910E598
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 20:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773086869; x=1804622869;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=Ikj4RfP1ITUe8TmWux4U6/RxlRRV3sjrkDE/FSvABGw=;
 b=XfeZ34z5hkHCxn5UX7S+104GpFmd8uStn1Il7JOWVOpZvlSdHX7L8QqJ
 FL/qab+jWM8wViO1Bx9nsfAzG2mSouFYaiShRA69Q+ZroTIAA6xlrC70L
 La+tz+rlKyWWspD2bZRjD6tI83TQ9mrH6Z1tkXTzWWD9PQdnVfzuCRMq2
 u4ieRjf6u0uHz8PZL6GrvKyoWyZLd+3lIicfVUPnl3nAHsuIl/o2SlIxn
 fES33NisCnDMsES4dtCUHyr3QOWQzPrIUnkFOBkNExmXcDMzLLG9Nh5Ur
 Hyexaf2NQx3FfQv1g+bm7yt6kj4ERdWHv1jhxZA3zqXVcfjtBKn8iwzsF w==;
X-CSE-ConnectionGUID: Yj7SxpxdTryBDow0j3T/7Q==
X-CSE-MsgGUID: pAAxfHs4QUSZVIs9qiMP4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="61694876"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="61694876"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:07:48 -0700
X-CSE-ConnectionGUID: 1cYdYxOrRZq72UZHYkSiEA==
X-CSE-MsgGUID: pACFJigaQvS3Ax/xjo1rvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="242879473"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:07:47 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 0/8] Extra enabling patches for NVL-P
Date: Mon, 09 Mar 2026 17:07:28 -0300
Message-Id: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNQQqDMBCF4atI1p0SYyLaVe9RuojJqAM2ShKCR
 bx7VSi4apf/W3xvYQE9YWC3bGEeEwUa3RbFJWOm165DILs1E1yUvOAScI5eg0sDTIBONwO5DiY
 dTY8BZI1aVii4bBXbiMljS/PBP55b9xTi6N/HW8r39Qur33DKgYPiglslqtqivpOLOFzN+GI7n
 MQZK/9gYscKa1pdNlKiPGPrun4AsNB/KBUBAAA=
X-Change-ID: 20260304-extra-nvl-p-enabling-patches-49ea48e204f5
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

This series contains some extra enabling patches for NVL-P.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v3:
- Incorportate Matt's feedback regarding Wa_14026539277.
- Added extra patch, namely "drm/xe: Call xe_wa_process_device_oob()
  after xe_sriov_probe_early()", to allow
  FUNC(xe_rtp_match_not_sriov_vf) to be used for device OOB workarounds.
- Link to v2: https://patch.msgid.link/20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com

Changes in v2:
- Minor update in patch "drm/xe/nvlp: Implement Wa_14026539277" to skip
  the workaround if on a SRIOV VF.
- Link to v1: https://patch.msgid.link/20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com

---
Gustavo Sousa (8):
      drm/xe: Modify stepping info directly in xe_step_*_get()
      drm/xe: Drop unused IS_PLATFORM_STEP() and IS_SUBPLATFORM_STEP()
      drm/xe/nvlp: Read platform-level stepping info
      drm/xe/rtp: Add support for matching platform-level stepping
      drm/xe: Call xe_wa_process_device_oob() after xe_sriov_probe_early()
      drm/xe/nvlp: Implement Wa_14026539277
      drm/xe/xe3p: Drop Wa_16028780921
      drm/xe: Translate C-state "reset value" into RC6

 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  8 ++--
 drivers/gpu/drm/xe/xe_device.c            |  6 +--
 drivers/gpu/drm/xe/xe_device_types.h      | 10 -----
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_gt.c                | 27 +++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c            |  8 ++++
 drivers/gpu/drm/xe/xe_pci.c               |  8 ++--
 drivers/gpu/drm/xe/xe_rtp.c               |  7 +++
 drivers/gpu/drm/xe/xe_rtp.h               | 20 +++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h         |  1 +
 drivers/gpu/drm/xe/xe_step.c              | 74 ++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_step.h              | 10 +++--
 drivers/gpu/drm/xe/xe_step_types.h        |  1 +
 drivers/gpu/drm/xe/xe_wa.c                |  4 --
 14 files changed, 135 insertions(+), 50 deletions(-)
---
base-commit: 9583680736b058808148da4717ca824d25702418
change-id: 20260304-extra-nvl-p-enabling-patches-49ea48e204f5

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

