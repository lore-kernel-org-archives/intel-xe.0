Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D12CCA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 19:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362C810E35C;
	Thu,  4 Sep 2025 19:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJjK1Qxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40BB10E35C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 19:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757014168; x=1788550168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I8NWEIYKf4wLxwmnxBmpENk4k0T8snwWMHycUH2wQDg=;
 b=AJjK1Qxrvy4rtcgY/Xhjqyrui7r8j9Ra1kUI8MNJVZPjlvdFzYGURjDE
 IQisRpxxTruZR/LXJ/q0Bcfv7ZnOEc+iudVt1wQ09ES8GjvbDclNbo/ay
 B+GXWv04Z9G4n8jrvdu9IEuvbwlu7K9SOqG4XjbVSeHx2LwtjdwxOj9lf
 XXn6VymC26LvnWXm3U35OC4qqgl4HkK44cXxboR0egUsOMKHiJi9QijtK
 3Vgxxjx05MyyvDv6cVNFeTe01cHSucZlPGyjjoxrmhFewMKLIEfvF7XtZ
 h0wOBHa1E+nFtU+UIF+6181zR59xG60hxuwLqRJfAkmR2sJ73Lxk9+U9C A==;
X-CSE-ConnectionGUID: F3OIBSVgRm6TpkR82p+wFg==
X-CSE-MsgGUID: 30lJ8MadT7GdrbZ3u1jvMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70793961"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="70793961"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:29:27 -0700
X-CSE-ConnectionGUID: 7Yq5zY29SB+d0WegSuTQ8w==
X-CSE-MsgGUID: Ywzxi9StRwKr1pIksw+PuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="209153113"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:29:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/5] Small improvements around VF CCS
Date: Thu,  4 Sep 2025 21:29:12 +0200
Message-ID: <20250904192918.7346-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Michal Wajdeczko (5):
  drm/xe/guc: Rename xe_guc_register_exec_queue
  drm/xe/guc: Use proper flag definitions when registering context
  drm/xe/vf: Drop IS_VF_CCS_INIT_NEEDED macro
  drm/xe/vf: Use single check when calling VF CCS functions
  drm/xe/bo: Add xe_bo_has_valid_ccs_bb helper

 drivers/gpu/drm/xe/xe_bo.c                 |  8 ++++----
 drivers/gpu/drm/xe/xe_bo.h                 | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  1 +
 drivers/gpu/drm/xe/xe_guc_fwif.h           |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c         | 20 ++++++++++----------
 drivers/gpu/drm/xe/xe_guc_submit.h         |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                 |  4 ++--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 21 ++++++++++++---------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h | 20 --------------------
 10 files changed, 61 insertions(+), 46 deletions(-)

-- 
2.47.1

