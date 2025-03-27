Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6283C36014
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 23:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDB110E249;
	Thu, 27 Mar 2025 23:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVPZ9zmW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8EC10E249
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 23:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743118832; x=1774654832;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fn2bBrUIlYhe09igtvv13uk8pEkuHMAW6UAQkkxhbWM=;
 b=YVPZ9zmWg//u9aV93XH/QxAYVnOSCVSX6xPYIUHsvJlaE490JNekKKnx
 6vpt7YeUAnrFwQ/U312e2t+5PNAX4ozBbnZzZnnB1Mofa5SNFO9ShvtML
 EWlfi3jr7fYtViTBphYG3T0cKC7vexnfl6fY4I1bDjIBHGnEheJjYoS2J
 ywEx/zLbmgZpUdr8v8z/xbJw08w8yYPXXO7GU37+hfQom2aSdBP5C64cw
 neGnTiNZBHSnm6X3WbL6NaQyrkGB0SE5zehruWD1dow/tDfrVawbEHcZY
 r+/ftPSzYihqZDTIKOLxIiAEX1d96saoHV72CctdBl1mk0s8tcJ0cjRfY Q==;
X-CSE-ConnectionGUID: RLFC3h3GRqCqOaV1uno/6g==
X-CSE-MsgGUID: qVqGmeo7QoeniBFEurq4iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43714321"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="43714321"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 16:40:30 -0700
X-CSE-ConnectionGUID: SQSj70SXQ1yOafh89Eah4Q==
X-CSE-MsgGUID: MyTLdkzqSe+d+XgZOeuPcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125262912"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2025 16:40:29 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Subject: [PATCH v2 0/2] drm/xe/guc: Add LFD format output for guc log
Date: Thu, 27 Mar 2025 16:40:26 -0700
Message-Id: <20250327234028.249314-1-zhanjun.dong@intel.com>
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

Add new debugfs entry "guc_log_lfd", which supports output guc log
in LFD(Log Format Descriptors) format.
Add flag of GuC crash dump received. LFD only include crash dump
section when this flag is set.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>

Changes in v2:
Split GuC init config abi defines out from LFD abi header file
Split crash dump detect as seperate patch
Add size check for LFD functions
Make abi header comments kernel-doc style

Zhanjun Dong (2):
  drm/xe/guc: Add LFD format output for guc log
  drm/xe/guc: Only add GuC crash dump if available

 drivers/gpu/drm/xe/abi/guc_log_abi.h     | 112 +++++++
 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 261 +++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |  13 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c      |  14 +
 drivers/gpu/drm/xe/xe_guc_log.c          | 398 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.h          |   1 +
 drivers/gpu/drm/xe/xe_guc_log_types.h    |   2 +
 7 files changed, 796 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h

-- 
2.34.1

