Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD82FCC9A4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 00:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F27110E605;
	Tue, 10 Mar 2026 00:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3qhBbAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFDA10E616
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 00:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773103376; x=1804639376;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=FNa//x+Hp5pJhyh2gZ50S3xNWhE3hstkPGAuVju2rkc=;
 b=g3qhBbASjGq+GxY8YzSdthJMDGoY0aidcQqclqA39H/RhVf1UQTtd4NA
 IEYCRHiv4bg1pdZHH0H/4n1zXRI85p7QJ1U2IQmnEzqYGYEYTLdnw78Ey
 8aR7njNMcHZs/ZEcvO5mE5OEVVfu+YoGTVevE+1RcWKJEsJrThwfeELSo
 h4QtDk6kvOpibiZjqu4IiV0zihOjEv0px/GiXiMn5wSCMKM+2ew3mTsNP
 r4z61g9k3kQoHT8Lwb2s2X03zO2Zn3XnYm1Et67xtBT252LK6nFCUT+aN
 gvww2Q6V7PevPTow+1VqD88+mkmRBCWBRQom741SX5DkHIXYkgXTExTmU g==;
X-CSE-ConnectionGUID: l2WMG9gJSNaEDICu4K9StA==
X-CSE-MsgGUID: j6TlgqDTSyym7LC7XbDmVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74183463"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="74183463"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 17:42:53 -0700
X-CSE-ConnectionGUID: b17sAedOTXW8zbxjZHSGwQ==
X-CSE-MsgGUID: rmMLkd2bSjePULrVcb6YuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219063507"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 17:42:52 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v5 0/7] Extra enabling patches for NVL-P
Date: Mon, 09 Mar 2026 21:42:05 -0300
Message-Id: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XPwYrCMBDG8VeRnJ1lmk5q48n3EA8xmdpATUtSg
 iJ9902FBdfDyh7/c/h9zEMkjp6T2G8eInL2yY+hhNpuhO1NuDB4V1pIlA3WSMC3ORoIeYAJOJj
 z4MMFJjPbnhOQZkMtS6ROiUJMkTt/e/LHU+nep3mM9+dartbrD6z+hnMFCAolOiVb7dgcfJh5+
 LLjVaxwlq9Y8wGTK1Y725nmTMT0jtWvmP6A1QVDqhqN6Bzp9h2j/2BUMMm7zrJxelf9enNZlm+
 cG8SQrwEAAA==
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
Changes in v5:
- Drop "drm/xe: Call xe_wa_process_device_oob() after
  xe_sriov_probe_early()".
- Back to using IS_SRIOV_VF() instead of FUNC(xe_rtp_match_not_sriov_vf)
  for Wa_14026539277.
- Link to v4: https://patch.msgid.link/20260309-extra-nvl-p-enabling-patches-v4-0-2e7fcead971a@intel.com

Changes in v4:
- Minor update to "drm/xe: Call xe_wa_process_device_oob() after
  xe_sriov_probe_early()" to move the call a bit further down in order
  to keep SRIOV-related function calls grouped.
- Link to v3: https://patch.msgid.link/20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com

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
Gustavo Sousa (7):
      drm/xe: Modify stepping info directly in xe_step_*_get()
      drm/xe: Drop unused IS_PLATFORM_STEP() and IS_SUBPLATFORM_STEP()
      drm/xe/nvlp: Read platform-level stepping info
      drm/xe/rtp: Add support for matching platform-level stepping
      drm/xe/nvlp: Implement Wa_14026539277
      drm/xe/xe3p: Drop Wa_16028780921
      drm/xe: Translate C-state "reset value" into RC6

 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  8 ++--
 drivers/gpu/drm/xe/xe_device_types.h      | 10 -----
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_gt.c                | 39 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c            |  8 ++++
 drivers/gpu/drm/xe/xe_pci.c               |  8 ++--
 drivers/gpu/drm/xe/xe_rtp.c               |  7 +++
 drivers/gpu/drm/xe/xe_rtp.h               | 20 +++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h         |  1 +
 drivers/gpu/drm/xe/xe_step.c              | 74 ++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_step.h              | 10 +++--
 drivers/gpu/drm/xe/xe_step_types.h        |  1 +
 drivers/gpu/drm/xe/xe_wa.c                |  4 --
 13 files changed, 144 insertions(+), 47 deletions(-)
---
base-commit: 50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c
change-id: 20260304-extra-nvl-p-enabling-patches-49ea48e204f5

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

