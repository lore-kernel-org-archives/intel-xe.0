Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C70CCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 20:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033AE10E45D;
	Mon,  6 Oct 2025 20:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfxbSJRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471A710E45D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 20:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759781776; x=1791317776;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8n67BCg4EYt53vb01MRZhK10gzDGV58zw6fpRpk3d/0=;
 b=FfxbSJRPa7H1L2RXGbLyxtgvoGuVhs1soWPcFjkkqHAX2D+tHL5lCbgr
 EYFyoM3oVQeahgP167BGzVasSQZbY8t6E81vyPupdnKoBsrTWOuxS0ODy
 Bwg+Wa2rVab3e83V5sie8KxoHnzaDW7V/M7QkcPFtHAt3MoeugQFgPrNv
 L5n2HDNYrtPYTcjTewBz3EYpVSfa/h0BGjomY6DkWoYnYZWehtZs86b85
 yXG+Xq2GtDPpdbhz32PH/jR6SENfttinbR870Y5nxBmOWnHpTCn6aJkG4
 J4uI8ILjIRIY1flKPPS5tWMYtH4nbR28wuf93NdTxLqyJ5fJOrAox3GNr w==;
X-CSE-ConnectionGUID: 94W9bgBlSdaseOLMDrBkFw==
X-CSE-MsgGUID: ox5Cw163Rayu5Fu0bLC/HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61998386"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61998386"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 13:16:16 -0700
X-CSE-ConnectionGUID: dbV9BrwWRaelPCIp2cEveA==
X-CSE-MsgGUID: WN9M+78dS9KaihC4TAVUyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="185245403"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa004.fm.intel.com with ESMTP; 06 Oct 2025 13:16:15 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/3] Fix copyright
Date: Mon,  6 Oct 2025 20:13:24 +0000
Message-ID: <20251006201339.2603160-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
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

Fix copyright and minor refine for the same file.

Shuicheng Lin (3):
  drm/xe: Fix copyright and function naming in xe_ttm_sys_mgr
  drm/xe: Fix copyright in xe_ttm_stolen_mgr
  drm/xe: Change return type of detect_bar2_dgfx() from s64 to u64

 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 6 +++---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c    | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.49.0

