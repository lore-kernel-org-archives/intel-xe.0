Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A05C3DA64
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 15:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D6D10E880;
	Thu, 25 Jul 2024 15:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjQvxcrh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCDB10E87D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721920915; x=1753456915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4agniaRMJxkbGp1kuIMBbrauz/aHDgnO3/59HJN9YRo=;
 b=mjQvxcrhU4muD+UZztOb0KffyWJtGx7RuomwW8TsMw1Q0fYbGQUAsXgH
 dz/20LCBiqP5suZhSdVHE0F865HLM8eef1KGI4pDBaB54CFkdrMSGLD6I
 VUg2xlVm2AN8YQiJpoKRfVHNDiOPyXGdNyNlO3zO3wAtlmDLCD1Y6XjIF
 LqcE0rFrtNbdt2U4iy2RG45Z4z/OiaIMqq3p3BdclzRH/EIArX09Qb1jG
 5Fp2z0jpBHtWMpzyN7YOmO7ksSfcSCt1Ec+DNJpEYlntIjzmZKa/+9kdh
 Xp01RNmjf9dFc+7AY4J+n/VA/X2a56zBoUmR82i4e/jedZVt4QUB1+Dck Q==;
X-CSE-ConnectionGUID: AgxU/eVnTzGVLWYSeJYwyw==
X-CSE-MsgGUID: ICIv/CpNR+yym5pXbFUdjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="42198060"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="42198060"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 08:21:54 -0700
X-CSE-ConnectionGUID: WyRHLNScQ4qzY+2iCLwp1w==
X-CSE-MsgGUID: 3/OcpFAHQ0euD4y+sq70qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52646736"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 08:21:53 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [RFC PATCH 0/2] Implement stats layer to measure events
Date: Thu, 25 Jul 2024 17:05:43 +0200
Message-ID: <20240725150550.13085-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add basic stats layer to track and show stats of various events over
debugfs. Tagging it as RFC to gather inputs on how the final
APIs/implementation should look like.

Cc: Matthew Brost <matthew.brost@intel.com>
Nirmoy Das (2):
  drm/xe: Implement APIs for measuring various events
  drm/xe: Keep track of TLB inval events

 drivers/gpu/drm/xe/Kconfig.debug            |  11 ++
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |  11 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  31 +++--
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |   1 +
 drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
 drivers/gpu/drm/xe/xe_stats.c               | 145 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_stats.h               |  66 +++++++++
 drivers/gpu/drm/xe/xe_uc_fw.c               |   2 +-
 9 files changed, 262 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_stats.c
 create mode 100644 drivers/gpu/drm/xe/xe_stats.h

-- 
2.42.0

