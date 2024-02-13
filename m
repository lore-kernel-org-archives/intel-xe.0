Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA1BC4829D
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 00:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2972D10E5BE;
	Tue, 13 Feb 2024 00:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHG7AzCg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2687810E380
 for <Intel-Xe@lists.freedesktop.org>; Tue, 13 Feb 2024 00:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707784613; x=1739320613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o5oqLQ1b/XFt3MgSeGfgeNnt7ic8LFBH14HCkl7Yig4=;
 b=AHG7AzCgROALKJvJG/kh/8kdXdxzKvap+7OkoMLkuJcf3Ts0D1L1Qgwq
 Iyh6+wdj0fKku+xdY4cJ9LIVF9DFxheuQjAVB2oZdkeZ4CJAA3HVhVrUe
 QhxkBhpuhnJGgR6nzrBMUEZ+CoNE0NsJgV3bmULSKm4Gutx5MmxknBgIl
 RhFhZcy3z5ObudNbFQRlh5ps35jLqI4nnZ0KWjDIRMblzWN+4pBiT4lDp
 Q74qjEzmOuForo1IMAl/b1p/AHDjFy5h8WT1d5YtMnlUulkbWBJZCsAgw
 u7ItvmY9SVGOsOpfIh8lOFEF0gropUfcHhPyPWSuEXgSW8fxisWAMP65j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1923025"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="1923025"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 16:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7479348"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa004.jf.intel.com with ESMTP; 12 Feb 2024 16:36:52 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 0/2] Support/debug for slow GuC loads
Date: Mon, 12 Feb 2024 16:34:24 -0800
Message-ID: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Sometimes the GuC load is slower that it should be. For end users,
that usually means some kind of thermal throttling issue. Internally,
there can be any number of bugs that cause it. So don't completely
fail to load, just cope with it and report the problem.

v2: Revert include order (review feedback from Lucas)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe: Make read_perf_limit_reasons globally accessible
  drm/xe/guc: Port over the slow GuC loading support from i915

 drivers/gpu/drm/xe/abi/guc_errors_abi.h   |  26 ++-
 drivers/gpu/drm/xe/regs/xe_guc_regs.h     |   2 +
 drivers/gpu/drm/xe/xe_gt_freq.c           |  15 ++
 drivers/gpu/drm/xe/xe_gt_freq.h           |   4 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c |  31 ++--
 drivers/gpu/drm/xe/xe_guc.c               | 197 +++++++++++++++++-----
 drivers/gpu/drm/xe/xe_macros.h            |  32 ++++
 7 files changed, 243 insertions(+), 64 deletions(-)

-- 
2.43.0

