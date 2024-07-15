Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF80C3DA4B
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 18:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFA110E48D;
	Mon, 15 Jul 2024 18:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2ycdfhr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9289F10E48A
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721066761; x=1752602761;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pDyErmtQhCUVTF/dtV1V+ZFr6CsaJmKgvKkYvzd/BIY=;
 b=a2ycdfhrLDwBeP5CtyY7RrOYfP+lqpDz9w8WXilACTuu91V5KrMZejm8
 wK8Q0DudHApJSBjLoY1/w+wqajFlWV6T23aouIniY+0wtO6/AgdrT7jyP
 WwtquyzeDfRDeoI6m9KjdMx+XLcxStYei5IvhKKFJQPEK/s9xjih2XT37
 gVy5dqIPMaAS23dOL1wqEQu23vBGRRANUgspNbOPYprUr1xK/swODAEj1
 OrUBUWsuMI1YaQ6xdCAppWxrOvFPpwvMfBGa7D/ClRP7nG7CQGG9WEmUM
 t/g/3QhwkGrjB4yuQGJyqqKCfP/LwkIA/6wby00ptjavG1ZuM5zPpPY5U w==;
X-CSE-ConnectionGUID: kEER+ZTVT12JoOIk9Qzvmg==
X-CSE-MsgGUID: eJTkfMF3RGizEWE7zU39iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18579910"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="18579910"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 11:05:52 -0700
X-CSE-ConnectionGUID: fgzG5hHfQeSGm7G2lbPLow==
X-CSE-MsgGUID: mhQGu2WqSSOCLmWrsxyIFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49556558"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.120])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 11:05:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: Add NEEDS_2M BO flag
Date: Mon, 15 Jul 2024 20:05:36 +0200
Message-Id: <20240715180538.1418-1-michal.wajdeczko@intel.com>
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

In addition of NEEDS_64K BO flag, add similar one to force 2 MiB
alignment of the buffer objects. Explicitly use this flag during
VF LMEM provisioning as LMTT uses 2 MiB pages and one day we may
drop requirement of allocating pinned objects as contiguous.

Michal Wajdeczko (2):
  drm/xe: Normalize NEEDS_64K BO flag
  drm/xe: Add NEEDS_2M BO flag

 drivers/gpu/drm/xe/xe_bo.c                 | 11 ++++++-----
 drivers/gpu/drm/xe/xe_bo.h                 |  5 +++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  1 +
 drivers/gpu/drm/xe/xe_lmtt.c               |  2 +-
 4 files changed, 11 insertions(+), 8 deletions(-)

-- 
2.43.0

