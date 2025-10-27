Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E55CCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 12:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B1610E468;
	Mon, 27 Oct 2025 12:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZL+UKGWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E43710E468
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761568315; x=1793104315;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c/9HJBRRzCCxcQRBE1uFx7FtpBTOuFiIhvWQTFaQUJA=;
 b=ZL+UKGWwzzhb9j9KMSp65g1wreQw8CsOjx76TyvaZUW8yNCWhVW2K7r+
 AWa0yqjFWkSfu7QWYhJOfGTTXV66eGfYJDmyeicCIKTugFSXe4zYsfyfH
 cLu0QbEMxVZA3NGpfQKpM4smb7TMEAgnifpZHucUWS5mvczB/gSCSi9Js
 ColdatKFs3bAHX/S6b0UEz7c3M/+oFQFIcpHCgwY/dhQW2tE5tNkbE13f
 TuLYiWCL8NVZCTbouv1YLtUIxx/7uGgHbSGQ6BTQHHPdck3n33UHdC7UK
 6w8G+Jr0OgA8eWyBaha6ZzxOW5mWWjZLRmxfrD9U98O7FYWYY52ZaHWvh A==;
X-CSE-ConnectionGUID: JrM1LLloTaGcFY8kTMKn1g==
X-CSE-MsgGUID: iJtDpTMzTgmVuXF2I8Z26w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63678873"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63678873"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:31:55 -0700
X-CSE-ConnectionGUID: TN5/qnRGTmCJjbgjqYLe2Q==
X-CSE-MsgGUID: AkouIvsgQ5OcjzvFIcqtoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184729502"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2025 05:31:52 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 0/4] Introduce GT runtime suspend/resume
Date: Mon, 27 Oct 2025 18:00:53 +0530
Message-Id: <20251027123057.3738059-1-raag.jadav@intel.com>
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

v7: Add IS_SRIOV_VF() assert to VF helpers (Matthew Brost)
    Use "vf" suffix for VF helpers (Michal)
    Reword commit message (Matthew Brost)

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
 drivers/gpu/drm/xe/xe_pci.c         |  8 ++++
 drivers/gpu/drm/xe/xe_pm.c          | 10 ++---
 drivers/gpu/drm/xe/xe_uc.c          | 28 ++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h          |  2 +
 13 files changed, 213 insertions(+), 12 deletions(-)

-- 
2.34.1

