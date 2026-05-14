Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE10CD4F3C
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 17:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA4510E0D2;
	Thu, 14 May 2026 17:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4kGeVkK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4635510E0D2
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 17:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778781349; x=1810317349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LOisIeM127T4VcbwpB2iYzHraqb8r7RriLDm74sUGic=;
 b=V4kGeVkKN1LRL2qSzTf6IfMWojTz7fCoMuvG7xhvxqlvYTz3t7FRIoRY
 cYfxsKkjjLBcX92twliPTGTMFkmPsVxr1uHwCNWSWHJiKoZ/l4IdFWpOh
 vi/mEvbhcqIDvJUGtX1qeONUaLO+AoIOVMlZR6Snkrr3kPCWy1mmwQqQj
 oqfzLK4z0GPHmRx6tHEqHzAdpXAUKCJwjvTT94hmInSemMuLX9EG1n9u4
 4A2d33HEp5G1PoaTEXVqKULrtfQu5AUvqY+/mZRcnINsY3Giv2YyZ3CRD
 JOcex96ThpZSvW87hEjYWO8hJKrnO4wmKCQn373v8H20c9FDpyLOtMej5 g==;
X-CSE-ConnectionGUID: PrHDWmJhQO2fdJ6DTgLt8A==
X-CSE-MsgGUID: sgfeBRzISJW3vPRAcwjNbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79762709"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="79762709"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 10:55:49 -0700
X-CSE-ConnectionGUID: NLv3qjM/TX+jFHATUMrfeg==
X-CSE-MsgGUID: WqqV5uheSgmK3F6S945XQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="235407068"
Received: from cs2n1.iind.intel.com (HELO cs2n1..) ([10.223.246.13])
 by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 10:55:48 -0700
From: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
Subject: [PATCH v2 0/1] drm/xe/pf: Fix CFI failure in debugfs access
Date: Thu, 14 May 2026 23:19:17 +0530
Message-Id: <20260514174918.1556357-1-mohanram.meenakshisundaram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514090352.1554803-1-mohanram.meenakshisundaram@intel.com>
References: <20260514090352.1554803-1-mohanram.meenakshisundaram@intel.com>
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

This v2 patch addressed all your review comments in commit message

Mohanram Meenakshisundaram (1):
  drm/xe/pf: Fix CFI failure in debugfs access

 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c | 6 +++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.34.1

