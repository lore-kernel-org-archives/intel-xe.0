Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CC8C44507
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 00:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1E110E26B;
	Thu, 16 Jul 2026 00:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2Ipr3yL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6D910E26B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 00:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784160191; x=1815696191;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zfVEbZYD8wipnbfzmItjIuESZ82agaEtjmupTuLDkE4=;
 b=m2Ipr3yL/7dAk5GfSl/HsiNgAHJPTvBzUMp8sG6I6Ydjbd5m6Xyi7UKJ
 181NTinfEu7Fy6EwfUUR7UK41xcXxjgB5O+a6Nhu+/C2iOc+v87jE3N+b
 7PC2HZaBLPGrqdrgX58vZP6INiDxOYuBIWggCjfGLkM+fv45gIGHj0QG9
 VWrBoo+tfcqgKGG9Qatg5jaiyxPfqQ4CMpDRgKtZ6D2/fCal0wE6CgYn3
 2Y4HKpt2kxo4YTbbk1NVGfbFWbaZMZ1P69/jHRw8Vw7RvN+Z0esiMZdww
 vklFV0Ub/sdzxLFN6rrTON3NdHADRcpsLkoylvYgcwDnwZOte9WpBdCPS w==;
X-CSE-ConnectionGUID: Zb5ol2LeTR6+xti6v9hFQg==
X-CSE-MsgGUID: j2zCaGXKRFaSBYXk10zQeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95457242"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="95457242"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 17:03:10 -0700
X-CSE-ConnectionGUID: S0EkO2GkRyClNpMrnDlSig==
X-CSE-MsgGUID: hredvCocTYq5wTBemNK27A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="254574137"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by orviesa006.jf.intel.com with ESMTP; 15 Jul 2026 17:03:11 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 0/2] drm/xe: Use IBC v3 on PTL
Date: Wed, 15 Jul 2026 16:58:22 -0700
Message-Id: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
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
v4: Address comments(Rodrigo)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Use IBC v3 on PTL
  drm/xe: Add debugfs for IA/GT bias

 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  4 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c            | 83 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  9 ++
 4 files changed, 96 insertions(+), 1 deletion(-)

-- 
2.38.1

