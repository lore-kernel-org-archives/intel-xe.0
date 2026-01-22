Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFDAD3EE8A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 16:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2096610E0C2;
	Thu, 22 Jan 2026 16:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0c77d/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2570110E0C2
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769099326; x=1800635326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jYJZAYpTjmCp5JY31jA7DkzjWyOnZWOnDleianp6djA=;
 b=Q0c77d/JgYTYA8ztRcwcvLUrMO+8veU3GrqEuo2ph6KYLYQoUHmNwU0Z
 vlxZUz+I3ht4LtxJsTW7D79MD15/yhB9UvMY1GOhQMY2hagdU9LTfFZe6
 kZIYsoQz4RW/Fv4TDdIDNQ00NN8+kHJ1G5o9PzGRqOwrR2C94EfeuVRr9
 HYgtXPvqiG4ItvB2oxAAMoUkLjUKGuaLxfI99Mw9tYaeaGRTNFl/3V+/6
 hVK4R2x+0rkngrvgEqxo7i0h+QR9RdSt99bS01gNTCU1+SDuxTCkB9IxN
 rElDH0gE2hjNHcEMyFFZ7IcT7x3ZTvFFKVxiGh/4IuU4Ta3wTNbwSVIvW A==;
X-CSE-ConnectionGUID: vEUit8iLQI69Rxx2ShNGBw==
X-CSE-MsgGUID: RxQWx1k1QOK0eWy0KUecjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87760404"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87760404"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 08:28:45 -0800
X-CSE-ConnectionGUID: rGgIU8QaRbKGIPtoOysvqw==
X-CSE-MsgGUID: FTEd7WDVQBWAIeFni0U2HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206595189"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa009.jf.intel.com with ESMTP; 22 Jan 2026 08:28:43 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v2 0/2] Misc refine for xe_module
Date: Thu, 22 Jan 2026 16:25:21 +0000
Message-ID: <20260122162520.3150505-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

v2: drop the pr_info to pr_err change. (Michal)

Shuicheng Lin (2):
  drm/xe: Make xe_modparam.force_vram_bar_size signed
  drm/xe: Sort xe_module.c includes alphabetically

 drivers/gpu/drm/xe/xe_module.c | 4 ++--
 drivers/gpu/drm/xe/xe_module.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.50.1

