Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52EEC43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 00:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8694C10E3EA;
	Tue, 14 Jul 2026 00:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djRsIs+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD1E10E3EA
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 00:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783990128; x=1815526128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rh1ijewsIfhqJ4M7WBKmOA0mwbudGh2PkwI7h9cSasU=;
 b=djRsIs+bhoNztIvhX04OXiN/fjqSqoPP0Cws3+fD95uSUJvCGYi2azhy
 YR5dqkwm4kQdC0AJ54g69VqHipJGE96aprrlV5aAjrpJM/zEMVhXMjBLN
 6FqetATKwBYPEe9pQvsmGfYFzi8sgZ9eC8zpzwAPEQBa3RL2uPrb6yQSz
 RQ+wGCvErvhSEmqqArUQnh0UlG/7kqGI5fRpEduzSGSB9Rk5Z36udBJvi
 zsallOMn7D4+dR7q58+aXBCQFB6RPVsMv8sN4VqEFaJ0P4CHfdWbYsFGu
 i3lXMh5WTR8NVg3cz6iBd4r0y8KI5P+5tTOHIcs4cyrSSSa1jpfn1VK6t Q==;
X-CSE-ConnectionGUID: +WDLydDsTKqpeXFNnOOYFQ==
X-CSE-MsgGUID: FdSFyfj6T42dchOW2tSsNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="72130909"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="72130909"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 17:48:48 -0700
X-CSE-ConnectionGUID: FSotHvi3S0KklpEEqVpx2Q==
X-CSE-MsgGUID: xTz2qf5dR8ujeWAUr4HN5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260583028"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 17:48:48 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 0/2] drm/xe: Use IBC v3 on PTL
Date: Mon, 13 Jul 2026 17:43:57 -0700
Message-Id: <20260714004359.3905038-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Also add a debugfs entry to monitor the IA/GT bias values.

v3: Use debugfs instead of sysfs (Rodrigo)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Use IBC v3 on PTL
  drm/xe: Add debugfs for IA/GT bias

 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  4 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c            | 70 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  9 +++
 4 files changed, 83 insertions(+), 1 deletion(-)

-- 
2.38.1

