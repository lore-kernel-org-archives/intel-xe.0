Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BC4CCD195
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 09:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32E610E027;
	Wed, 22 Oct 2025 09:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVoT3uZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6273C10E027
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 09:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761126186; x=1792662186;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/NR80tmIkYEMyc+2m6CemS67T5GKR+WASK/0t+I2S+0=;
 b=iVoT3uZN7Vm++nX3GwWwn7LYUDyrsXM/jW6DM/O4FiO8Mqjsdjr3qq1F
 T5Orpk6crYKd+80ww2cyeklRQFGi9pf/Xv53Rnr+cYd7Fgjbdm1rVzwpK
 fAVXoel2k3F/6Gz5FuNa6VEEfWXO+mZqvAJkee67Is6zihLoFBnseRn84
 p1+MR3qykW6Nhqh2cPrN73qDHHHRjUe5tgcdGGuEuR4lBAsScd3gMXg2K
 kSl94wMQWWvY7E/M4UYJtKaEF2hA7hEYMO0bj1aSJEXsf30jfiRPl8Sbo
 RYf+g/o3JONGOU4TvOnGF7fhX5CDAu7bYCNxNsaQjqWlLivIumt0wzWgk Q==;
X-CSE-ConnectionGUID: DYOPgJYOS9WSGGRolTIcZQ==
X-CSE-MsgGUID: yelGM/2ZRw+H6VUW5xgabA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63363948"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63363948"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:43:06 -0700
X-CSE-ConnectionGUID: aAsgyrr9RPyzpKd4Od/cPQ==
X-CSE-MsgGUID: RSBWiektT1WytomBKYKDhw==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 22 Oct 2025 02:43:04 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 0/4] Introduce GT runtime suspend/resume
Date: Wed, 22 Oct 2025 15:12:42 +0530
Message-Id: <20251022094246.3584785-1-raag.jadav@intel.com>
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

Raag Jadav (4):
  drm/xe/vf: Update pause/unpause() helpers with VF naming
  drm/xe/guc_submit: Bring back pause/unpause() helpers
  drm/xe/pm: Assert on runtime suspend if VFs are enabled
  drm/xe/gt: Introduce runtime suspend/resume

 drivers/gpu/drm/xe/xe_gt.c          | 60 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h          |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  6 +--
 drivers/gpu/drm/xe/xe_guc.c         | 34 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h         |  2 +
 drivers/gpu/drm/xe/xe_guc_ct.c      | 27 +++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h      |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c  | 34 +++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.h  |  6 ++-
 drivers/gpu/drm/xe/xe_pci.c         |  8 ++++
 drivers/gpu/drm/xe/xe_pm.c          | 10 ++---
 drivers/gpu/drm/xe/xe_uc.c          | 28 ++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h          |  2 +
 13 files changed, 209 insertions(+), 12 deletions(-)

-- 
2.34.1

