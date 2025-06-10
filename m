Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FC7C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 10:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8700E10E4E4;
	Tue, 10 Jun 2025 10:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="An6QPt+7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE9810E4DD;
 Tue, 10 Jun 2025 10:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749550540; x=1781086540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w7IFbFulmId/vnM82KSmQB5g6oAW4h/xcLLhbzRZqmY=;
 b=An6QPt+7+2pwUiUozi3YGdn/57VUDPHUMMOPlMeaAeoR9NZbiy9EqLXx
 ynsW9W5hSZxfZwI7gcUgIHln+Th7L09WYoo51VZm3pQbU67jN7jcXNX9+
 C3Q//qcxtMH+VzIG6HeA8s6UCYgDsMnPGGlHnaJQ7q18J/oYrN54CQdxW
 cod0Q+CvHjxK2F5TWbt9oLA746ny1VrobyOSFWIXdg0pdrZEKU9SSnn1E
 LB2R2gpiRB6icPggOcZq0WdWQoqiPnvPVUwE3VlCN/q6R+fze5DFYp8OT
 YzZaiMkw/vonvjO5qp0G6O4WIrQd1GLEK5sfgCeSSI/WSOxEFitftCW+s Q==;
X-CSE-ConnectionGUID: m1wZd7XPRiuQCAh9KzxG+g==
X-CSE-MsgGUID: BMJbmL9kRA2mt/iSHTMv5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51738623"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="51738623"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 03:15:39 -0700
X-CSE-ConnectionGUID: naLx2pqiQg2M1sQLUN0szg==
X-CSE-MsgGUID: xgIHGnNLT9yVCBVRzw7nlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="169969238"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 03:15:37 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@linux.intel.com
Subject: [PATCH 0/2] Add kernel param to limit the eDP rate to HBR2
Date: Tue, 10 Jun 2025 15:34:47 +0530
Message-ID: <20250610100449.185927-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Revert the existing patch that rejects HBR3 for all eDP panels that
do not support TPS4. Add a patch to add a kernel parameter to limit
the rate to HBR2 for eDP panels that might be unstable with higher
rate.

Ankit Nautiyal (2):
  Revert "drm/i915/dp: Reject HBR3 when sink doesn't support TPS4"
  drm/i915/dp: Add kernel param to limit eDP rate to HBR2"

 .../drm/i915/display/intel_display_params.c   |  2 ++
 .../drm/i915/display/intel_display_params.h   |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 21 ++++++++++---------
 3 files changed, 14 insertions(+), 10 deletions(-)

-- 
2.45.2

