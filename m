Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CB7D42BBF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6774210E644;
	Tue, 12 Nov 2024 20:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIoHqx1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F80A10E644
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731441928; x=1762977928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aKiEV+jPfRQz3/UPWDaLFzJD8dFBjc5HUjXksgGPKLs=;
 b=DIoHqx1ntFrW8b22XSKZJoVCgwh89BlsBTJrLO6vUDWOUkXTDEIjXG9T
 IeD7jvQRF5/k1CFkgbyCyqDGh2Qh4EVSxqHCVEgD7wxrWmd4umELRRF6v
 iKyFCi0Oz4KM9iKyUY2pt9MJAOQS5p3gn8BkiMOZ8j0N1wE1MrExFcBDC
 UXfDc/WVh1rL9REIbmCanXeYwUplVdmKW3vW0eqVxsXwm4nlgu7v2Ezjy
 jBcsoTz2thpZg51jYETiWWkqGpoIPyQwIAzOzd1mqhKBfRZmHOM41WOoS
 PDqcCdHxpCFsGrXNWhi2J74pregtOQwDcCy9Njl9oAsXbH8BX3ECNb5Yw Q==;
X-CSE-ConnectionGUID: UezMLatJRE2Lbi0CnpE8mw==
X-CSE-MsgGUID: yrHzlPj+R5m560eti2qtQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31394337"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31394337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:05:28 -0800
X-CSE-ConnectionGUID: bKkRxV3gTQGTixoxY33i7w==
X-CSE-MsgGUID: SwfoqNkJTe+phUgbyVRLkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="92710347"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.85.128])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:05:26 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 0/4] Add iomem helpers for use from debugfs
Date: Tue, 12 Nov 2024 21:04:50 +0100
Message-Id: <20241112200454.2211-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

This series attempts to promote helpers used by Xe [1] to libfs.
Earlier attempt [2] with similar helper was unnoticed.

[1] https://patchwork.freedesktop.org/series/140848/#rev1
[2] https://patchwork.freedesktop.org/series/133507/#rev1

v1: https://patchwork.freedesktop.org/series/141060/#rev1
v2: use iterate_and_advance to treat user_iter separately (Matthew)

Cc: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org

Michal Wajdeczko (4):
  iov_iter: Provide copy_iomem_to|from_iter()
  libfs: Provide simple_read_from|write_to_iomem()
  drm/xe: Add read/write debugfs helpers for GGTT node
  drm/xe/pf: Expose access to the VF GGTT PTEs over debugfs

 drivers/gpu/drm/xe/xe_ggtt.c                | 52 ++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h                |  7 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 62 ++++++++++++++++
 fs/libfs.c                                  | 78 +++++++++++++++++++++
 include/linux/fs.h                          |  5 ++
 include/linux/uio.h                         |  3 +
 lib/iov_iter.c                              | 66 +++++++++++++++++
 7 files changed, 273 insertions(+)

-- 
2.43.0

