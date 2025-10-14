Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B870CCD187
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 07:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2035310E55F;
	Tue, 14 Oct 2025 07:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJN4ncAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7238C10E55F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 07:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760427087; x=1791963087;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6kmEbICjJJ8Br5NCnpdGKJ9BdN6umCW/DXMP7aIf9TQ=;
 b=MJN4ncAuYXO4AzJXB9fsIohZm2epwaRQe1tfypkZ+DYwu4VsfdpQBJ1l
 yWG8thSyDI/3IjwRnGxpZauz0v6TkCDj9/mljUQ5dhLIipWVR4OLJRQYe
 Cj7hBFIRbbX/rGACkP7A3dnVZD+k5zuK6zPmTuTNOGLsrxyAsFcFVD/P6
 Ar2DlzCkdyx9yqXi1MbZMgx1Eg6DYjEqaRBZ9kWxSmANWZqDLYAhBlB5X
 7DTvz+Lo/YLH6jzOyOhz8cYceXSPP3rbmWbApA76d+E347OLwXbw0lgpX
 OvQZyBA4Sf2zkR5dRgt3pP9kRqnExZ1dXqUALvi2/mI/AzvcHTxE0jJVx w==;
X-CSE-ConnectionGUID: /gxU87TjRPGjpi7a/ZNmQQ==
X-CSE-MsgGUID: kbVJxXJUSvO+iS4RtAM8MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62474471"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="62474471"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:31:26 -0700
X-CSE-ConnectionGUID: eoturQ9ASBeM0M1KXP869g==
X-CSE-MsgGUID: Jn17JLG9SMebTcMhbrwyRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181826219"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 14 Oct 2025 00:31:23 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 0/2] Introduce GT runtime suspend/resume
Date: Tue, 14 Oct 2025 13:00:34 +0530
Message-Id: <20251014073036.3282329-1-raag.jadav@intel.com>
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
    Split xe_guc_ct_enable() (Daniele)

v3: Drop redundant logging, add kernel doc (Michal)
    Use runtime naming for ct helpers (Michal)

v4: Split xe_guc_ct_enable() patch (Rodrigo)
    Fix tags (Rodrigo)

v5: Include host_l2_vram workaround (Daniele)
    Reuse xe_guc_submit_enable/disable() helpers (Daniele)

Raag Jadav (2):
  drm/xe/guc: Make xe_guc_submit_pause() available for non-VF cases
  drm/xe/gt: Introduce runtime suspend/resume

 drivers/gpu/drm/xe/xe_gt.c         | 60 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h         |  2 +
 drivers/gpu/drm/xe/xe_guc.c        | 34 +++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h        |  2 +
 drivers/gpu/drm/xe/xe_guc_ct.c     | 27 ++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h     |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 -
 drivers/gpu/drm/xe/xe_pm.c         | 10 ++---
 drivers/gpu/drm/xe/xe_uc.c         | 28 ++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h         |  2 +
 10 files changed, 162 insertions(+), 7 deletions(-)

-- 
2.34.1

