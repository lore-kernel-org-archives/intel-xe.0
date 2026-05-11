Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07618CD484E
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 19:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3BB10E582;
	Mon, 11 May 2026 19:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpiC0x7x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FD210E275
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 19:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778528967; x=1810064967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vrz9AD8tI5FrLI8fu5hg3hVGxeCZJMIZuEizF6eBVXY=;
 b=mpiC0x7xaOObpJuubTnQaBkUG1+lPSsZplJUr5z6YUOWFz52hWl+yo47
 seprevqjKai6pYx7amaQcA5ftmPLp1v/HDK+nLkcCKedADmdCz2y3zbCl
 OrB3mBhMbJJBErRl1b5BdLGddZi/T+CkTVAzHO2jCRsH0Y1a0algNaMzn
 KUA8jhuTqmDvxaU7iowVx63aE3N3RIUQbKqcYwjFFKrw3VLd9eRVwhPCY
 vHUZJaxoPefcGQm9fJpacZEANkWq1XcQbEk3VP23QOhf51IBAPvM4hYEY
 c7BWG7cQ8DnQmBJlguGtLSVZs6zho048P7BtYK5W12dp3DvKLvjaa5/lv Q==;
X-CSE-ConnectionGUID: kWVbMjWRQLqUl6jubmeliA==
X-CSE-MsgGUID: Rks8PRKsS2u4nCTGLhYZkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79609906"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79609906"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 12:49:27 -0700
X-CSE-ConnectionGUID: xSpr3agrSESRzLlcNLnV1g==
X-CSE-MsgGUID: FU5Utit1T8m1T7QiHVqCiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="242550359"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa005.jf.intel.com with ESMTP; 11 May 2026 12:49:27 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 0/3] drm/xe: shrink and compress GuC snapshot dumps
Date: Mon, 11 May 2026 15:49:21 -0400
Message-Id: <20260511194924.2016315-1-zhanjun.dong@intel.com>
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

GuC snapshot output is currently expensive in both size and latency: large
log buffers are emitted as raw ascii85, and the surrounding dump text
includes a bit of avoidable noise. This series makes xe snapshot dumps more
compact and easier to handle by compressing the large binary payloads,
tightening the textual output, and trimming the default GuC log size.

Select ZSTD_COMPRESS/ZSTD_DECOMPRESS in DRM_XE so the xe module pulls in
the zstd compressor when built.

Reduces the default GuC log buffer from 8MB to 2MB, which still preserves
useful history while cutting dump latency and dmesg load; with typical
compression, the emitted payload drops further.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

History:
v2: Fix Kunit test error by selecting ZSTD_DECOMPRESS in DRM_XE config,
    required by zstd_is_error/zstd_get_error_name.

Zhanjun Dong (3):
  drm/xe/guc: Compress GuC log and CTB dump with zstd
  drm/xe: Remove extra newlines from LRC snapshot dump
  drm/xe/guc: Reduce GuC log size from 8MB to 2MB

 drivers/gpu/drm/xe/Kconfig      |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c  |   9 ++-
 drivers/gpu/drm/xe/xe_guc_log.c | 110 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_log.h |   5 +-
 drivers/gpu/drm/xe/xe_lrc.c     |   4 +-
 5 files changed, 109 insertions(+), 21 deletions(-)

-- 
2.34.1

