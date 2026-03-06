Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4B2FCC04D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 17:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B7E10EDE5;
	Fri,  6 Mar 2026 17:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AzV8TrUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B8F10EDE5
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 17:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772818127; x=1804354127;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=I4iZbsTblUYKs1yc/iE2E6o3ZuV6IVn3oCSDdoGpw+8=;
 b=AzV8TrUUiRXWRARmWTSdQym7kgTG7YZXqRJsdKhL7dh4xyhBJmb6Ublj
 upihCgtmrAMRkZr+mb+MPC9O6k6Yl9AZMmzEIGvTt4s/k0TOwhM75sezf
 exqfUVnYQ4Iz4uq8R7o6wTrK4c6rIqAAjxhsTXNoukRVpAUP4ZM8ziBhR
 OyHFox+WYwcKP/3ocRJtyoO/5aIfOSFGU0K3ISPfFiBb5G6jZlmmGCT7R
 uccrZ4NEkGgXsGh1btp/Gltqa5lSAg9l7O6EfvHpB28l6CpeQ3UcdwdpJ
 EP0lzYhyb30xqhb+z4HvB1Mb7D5xKX+1I/P5iY2rm1gRnI5Bjh0I4OrJQ g==;
X-CSE-ConnectionGUID: kupp9FwFSu2S+ydm/CQKog==
X-CSE-MsgGUID: BIihoVitQxmfX1JdnRVvHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73899626"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="73899626"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:28:46 -0800
X-CSE-ConnectionGUID: om1ryeCETIWxDyXiklGWOw==
X-CSE-MsgGUID: rUiD9MlDQdSZbvn4HFELkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="218229597"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.22])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:28:45 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 0/7] Extra enabling patches for NVL-P
Date: Fri, 06 Mar 2026 14:28:20 -0300
Message-Id: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auQWTtmqK0BV97DsKgwwCRYSNs0G
 MLdrSRuXf5v8b0NAnvhALdiA89JgswuhzoV0I7WDYzS5QZF6koX0shr9BZdmnBBdvY5iRtwsbE
 dOaCu2eqKFeneQCYWz72sB/9oco8S4uzfx1sqv+sPNv/hVCKhIUWdUVXdsb2Lizyd2/kFzb7vH
 8W0Pr/IAAAA
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

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 ++--
 drivers/gpu/drm/xe/xe_device_types.h | 10 -----
 drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c       |  8 ++++
 drivers/gpu/drm/xe/xe_pci.c          |  8 ++--
 drivers/gpu/drm/xe/xe_rtp.c          |  7 ++++
 drivers/gpu/drm/xe/xe_rtp.h          | 20 ++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h    |  1 +
 drivers/gpu/drm/xe/xe_step.c         | 74 +++++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_step.h         | 10 +++--
 drivers/gpu/drm/xe/xe_step_types.h   |  1 +
 drivers/gpu/drm/xe/xe_wa.c           |  4 --
 drivers/gpu/drm/xe/xe_wa_oob.rules   |  2 +
 13 files changed, 133 insertions(+), 47 deletions(-)
---
base-commit: e4b36c44f536abdf724e6a17700a47ce1631699f
change-id: 20260304-extra-nvl-p-enabling-patches-49ea48e204f5

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

