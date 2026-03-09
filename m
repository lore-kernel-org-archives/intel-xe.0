Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FA3FCA193
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 21:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460D110E5CB;
	Mon,  9 Mar 2026 21:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBafjcJN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142B10E5C7
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 21:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773092411; x=1804628411;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=xo088VBdWhdX2fbD9iVZV3p2HZC0XEkup1qeuLLzz+s=;
 b=GBafjcJNqv6EhPE3HuWf20UBHJ05wiEVFixGc+ai5/xa/bl9qvk9NyXS
 dNrMn99CFzf+SSmZC1DkS5yybH0Vd6rbKkCSMWgCqiR2biDPIYk8EPqYI
 GHejKzsP3fwWAnLvpXEpFee7lFhO8SxHLlnKUV63b3DQXyZwaV24J4KCG
 Tcw429oP0zjY+y1sSh+uR2Bn15lLq3I0S5YN7Ip8lOomTdcZv04Hl9aKA
 r5RkBtFpGeRTWo5kfzQTDa37+CbHbNy7kCwg6d5lDMr6F2H6/uzEt2BZW
 iaebXlIzkhlmMEKvtuDval39oSW24JRfqAZUCr6Oo4BVxemsTqBhEZ3sW A==;
X-CSE-ConnectionGUID: Lhn2P0hZSg+gZhb/gO3DIg==
X-CSE-MsgGUID: f0wJMJNdRnKzv3szwTrPGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="91702264"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="91702264"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:40:10 -0700
X-CSE-ConnectionGUID: 8ALWtLmsSWqXlzgvd8+t1g==
X-CSE-MsgGUID: bdBuP8oDRy6UNHqm9E6EDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="216346686"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:40:08 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 0/8] Extra enabling patches for NVL-P
Date: Mon, 09 Mar 2026 18:39:43 -0300
Message-Id: <20260309-extra-nvl-p-enabling-patches-v4-0-2e7fcead971a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNQQ6CMBCF4auYrh0zlIFQV97DuKh0kCZYSEsaj
 OHuFhIT4kKW/1t87y0Ce8tBnA9v4TnaYHuXgo4HUbfaPRisSS0kyhJzJOBp9Bpc7GAAdvreWfe
 AQY91ywFIsaaKJVJTiEQMnhs7rfz1lrq1Yez9a32L2bJ+4eI/HDNAKFCiKWSlDOuLdSN3p7p/i
 gWOcouVO5hcsNzUjS7vREy/WL7F1A6WJwwpKxWiMaSqLTbP8wfLsEc2YgEAAA==
X-Change-ID: 20260304-extra-nvl-p-enabling-patches-49ea48e204f5
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
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
base-commit: 50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c
change-id: 20260304-extra-nvl-p-enabling-patches-49ea48e204f5

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

