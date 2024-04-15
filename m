Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D55DC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 17:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92DC11273D;
	Mon, 15 Apr 2024 17:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZan6Ou3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616A010FCC2
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713202787; x=1744738787;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WkJ5y1R6Q7ou5hBOeFjTnBNwQTgR7DkqPEt46YayPRg=;
 b=AZan6Ou37eMB12Ty4GjXzXhcgcwORayrIysIL8c1q/Gz+zXGGqjBzKSZ
 6GFfLB3WMmk7xKFlkz6yCt4RRZ7OuOcXO7bce5szIr9K0dGIPJaBtVukb
 5yLegyReS1ZcKTMYiBBKykd8V5kmm9+RG4Y0J/qg104nD+qPKik5bDhH+
 72v7fT5GxyXu5sEw3zqbZfUOGiCCDyGHDDQS1wxGfjEvywXxcgqn+WeFs
 52kXyW/HhLG87z7DYFa5rtLu/QveDZFt5VCaoaY1/iyXZD+tkI+6snyBo
 BAU+A4px02ikdg0l6Ix2mUs3NMEmwggDtC+dvgEC7nSr2lU38156DmSLm g==;
X-CSE-ConnectionGUID: Pjxyl5CLQmujVcvgT9D8rQ==
X-CSE-MsgGUID: Qcc/Bxv0Tl24t9jc1sjVKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19998700"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19998700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 10:39:46 -0700
X-CSE-ConnectionGUID: 0HkIGm8KSBml+n1R3fbJOA==
X-CSE-MsgGUID: TIXAUQxWShyyJKzFO6khKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22082743"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.45.29])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 10:39:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/6] PF: Add support to configure SR-IOV VFs
Date: Mon, 15 Apr 2024 19:39:31 +0200
Message-Id: <20240415173937.1287-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: add comment to explain GGTT provisioning on media-GT (Piotr)
    add comment to explain GGTT fair allocation logic (Piotr)
    fix typos and indents (Piotr)

Michal Wajdeczko (6):
  drm/xe: Add helper to format SR-IOV function name
  drm/xe: Allow to assign GGTT region to the VF
  drm/xe: Add xe_ttm_vram_get_avail
  drm/xe/guc: Add PF2GUC_UPDATE_VF_CFG to ABI
  drm/xe/pf: Add SR-IOV PF specific early GT initialization
  drm/xe/pf: Add support to configure SR-IOV VFs

 drivers/gpu/drm/xe/Makefile                   |    2 +
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |   55 +
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h         |    2 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |   44 +
 drivers/gpu/drm/xe/xe_ggtt.h                  |    4 +
 drivers/gpu/drm/xe/xe_gt.c                    |    7 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   52 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h           |   20 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 1973 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   56 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   54 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   13 +
 drivers/gpu/drm/xe/xe_sriov.c                 |   17 +
 drivers/gpu/drm/xe/xe_sriov.h                 |    1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   12 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |    1 +
 16 files changed, 2313 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h

-- 
2.43.0

