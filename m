Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3C2C3ABD8
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 21:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0734510E4B1;
	Mon, 12 May 2025 21:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knoYTHM1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BFD10E072
 for <Intel-Xe@lists.freedesktop.org>; Mon, 12 May 2025 21:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747086809; x=1778622809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ogg0m2kCVppbdcJE9VB+cGUj47/C+4luZ/Bp6+xQ/Es=;
 b=knoYTHM1eJpLq+fdwcYiKKixiymNfsYyPpBveLAlEH6QIsGPZdC15yn6
 9Gryod6h+d44JpJuS0Plq68lT9FIzRkswMFD3h0w7GZdTfwfUQDghpOjm
 d/oPbr2vm6+g87kH4c43krfPaQr/2tZvkiqXLlnDleMzRY/HRF0yAxCGQ
 v2/DkU4ZLWjuz+NSzfNmFAqJH+TpuMKeflQGu7ZkbLiU5SLN9YgiUTsvl
 Ba+erPAg4Knmv93tPc7o8PaG8laEL8kVGZbsUWR0P2QKPlVlj92QHCFXK
 sQrBSCsuCyGmK5ntoOfyZ8lUcU+TQNAMFBs7LosvemwcxSPbrg4CbIQSR A==;
X-CSE-ConnectionGUID: MjRfh8laThubA5OP3KqXJw==
X-CSE-MsgGUID: tce1oEHHT/GUap86YqDRCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48156814"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="48156814"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 14:53:25 -0700
X-CSE-ConnectionGUID: 68GlsbMwTPCmUih2/0tx5g==
X-CSE-MsgGUID: rORbakdDTVqLk7ck5X2OgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="142375158"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 12 May 2025 14:53:25 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 0/4] Track FAST_REQ H2Gs to report where errors came from
Date: Mon, 12 May 2025 14:53:20 -0700
Message-ID: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
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

Most H2G messages are FAST_REQ which means no synchronous response is
expected. However, errors can still be returned. Add support for
tracking the FAST_REQ H2Gs and matching up an error response to its
originator.

v2: Split RESPONSE define into separate patch, re-word
comments/prints, fix consistency of conditional compilation (review
feedback from Daniele & Michal W).
v3: Split into more patches, add more RESPONSE defines, improve
debug print message (review feedback from Michal W).
v4: Bunch of minor tweaks (more review feedback from Michal W).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (4):
  drm/xe/guc: Remove double blank line
  drm/xe/guc: Add missing H2G error code definitions
  drm/xe/guc: Rename CONFIG_XE_LARGE_GUC_BUFFER
  drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from

 drivers/gpu/drm/xe/Kconfig.debug        |  11 ++-
 drivers/gpu/drm/xe/abi/guc_errors_abi.h |  14 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c          | 116 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_ct_types.h    |  15 +++
 drivers/gpu/drm/xe/xe_guc_log.h         |   2 +-
 5 files changed, 131 insertions(+), 27 deletions(-)

-- 
2.49.0

