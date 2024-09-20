Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DA4CF9C68
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 21:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EBF10E135;
	Fri, 20 Sep 2024 21:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PaKwSKzD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB9D10E135
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 21:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726866911; x=1758402911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3Z52P3/X3FvjVArQEteF5MJJRWesxVW241lZbWPaCPI=;
 b=PaKwSKzDafFnOVMnEDcv/9dnCREEzuu9/4ZMqO3sMUkItXyxpxFEAZPe
 0EyC5DZeCozmLIeHUS6w4Xch9sU43q0X8HEgzBLVCYLRZ8p56DjcSk5hr
 3alvWCsfVnzb8e7mNuGj/KbTaWAk9J8qc/GdtuAvrJkF9uthsyNvkJSTM
 cNpQXT6JRc/jmdTNjK2t5uRAPtvOdKsZUJZ9zM+8yoUea27qXXxNGcLs2
 2GvgVbuuVTpUT9BjlPlRmcpxwtZUDRqOMNCIaIxomSijOtQU46wqiRNyw
 SxYyr5xDCWcORR116VFA7XKWleNAv0KL6vSj4pn69eZxhpiwvKMGNeUOY g==;
X-CSE-ConnectionGUID: Khib8+6qSIuu3JEXCZbaqw==
X-CSE-MsgGUID: K2gzKqE8QbuqWlDkwBKR8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="28786490"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="28786490"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 14:15:11 -0700
X-CSE-ConnectionGUID: SmYH0JqRT/islhHfpzJ3hA==
X-CSE-MsgGUID: tpj5Pn8WSSKx0Ex+/zL3eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="93761627"
Received: from iweiny-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.110.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 14:15:09 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 0/4] Xe2 performance tuning updates
Date: Fri, 20 Sep 2024 18:13:14 -0300
Message-ID: <20240920211459.255181-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.1
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

This series contains updates for Xe2 recommended performance tuning
settings.

v2:
  - Extra patch, #1, to fix selection of steering table for Xe2_HPM.
  - Address review feedback. Please see changelog in individual patches for
    details.
v3:
  - Minor change in patch #4 to make the setting specific to LNL.

Gustavo Sousa (4):
  drm/xe/mcr: Use Xe2_LPM steering tables for Xe2_HPM
  drm/xe/xe2: Extend performance tuning to media GT
  drm/xe/xe2: Assume tuning settings also apply for future media GT
  drm/xe/xe2: Add performance tuning for L3 cache flushing

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 11 ++++++++++
 drivers/gpu/drm/xe/xe_gt_mcr.c       |  2 +-
 drivers/gpu/drm/xe/xe_tuning.c       | 30 +++++++++++++++++++++++++++-
 3 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.46.1

