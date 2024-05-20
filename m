Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD09AC25B7A
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 21:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6579410E67C;
	Mon, 20 May 2024 21:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmFz/hbt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F68310E464
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 21:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716240231; x=1747776231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B4qlPgSnpHXpskNBZnuUnOrbugk+SsI9S7Mc/8ibaIo=;
 b=TmFz/hbtu7tDNMtuMW3rVZXoE575F18aZwwyRpq/88xfW9PZyNnf57Ar
 xRdkH7f04oW/6jTUK1QsEJ93EVrqaD4I1a11iOLJ0EgKVgRG2CwCHEJcR
 dczYWJTKudwbU/VZ0Wqpe/p/0iygF63Yb05fbT7q0fXouL8/mi77pRvxw
 tylb44d1LVAuLVpVAD+L671pp7p5aK4Xe5pqWyoZBA5KxcxW9Y0q06NG5
 hKHQkRoPRYClsfCdkafDOqb8ifG/iHIUcOvErxhOdLVUVv6eD2wOd+f3i
 fjYYEmXbtPaDVWHVIQ3hBZxMwgx13RDEhnU1+/DHYutS1PCbfIXy/lXCm A==;
X-CSE-ConnectionGUID: xVdDNmW2Q3Gu2KP9v5Gm4w==
X-CSE-MsgGUID: hqhlLHx3SSesQ5PLAjYIhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12573254"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="12573254"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 14:23:50 -0700
X-CSE-ConnectionGUID: wBSJ8HJARLqDdC3UMxQQeg==
X-CSE-MsgGUID: s8YQvTcYQVmpB5wIUcNV2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="37053924"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 14:23:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] Custom GuC initialization if VF
Date: Mon, 20 May 2024 23:23:28 +0200
Message-Id: <20240520212330.2436-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (2):
  drm/xe/guc: Allow to initialize submission with limited set of IDs
  drm/xe/vf: Custom GuC initialization if VF

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 17 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 ++
 drivers/gpu/drm/xe/xe_guc.c         | 42 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.c  |  4 +--
 drivers/gpu/drm/xe/xe_guc_submit.h  |  2 +-
 5 files changed, 63 insertions(+), 4 deletions(-)

-- 
2.43.0

