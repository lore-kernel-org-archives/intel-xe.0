Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61989CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2979610E1D5;
	Thu,  2 Oct 2025 23:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtvGwrDR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4D210E1D5
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759448315; x=1790984315;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a3mMOkhZH978HZn4+YMRpiRKLqs9B7CSiJg2ZHnhQLk=;
 b=MtvGwrDR2Oq3lQspEVRWNDmS0F6epGypFE8nohRalR3VShfeXoaWK1By
 9l16N0YGDiOmet4JmDyBhEk2c2/ODSTL6q7RcvKoTmtqYolm2jvhP075Y
 eRZAUr4K1v3WcVrELGh4wZVxefcYZsdG6EthZz3aRitvXL+5Cq3madTRI
 ZaxtuWHNRTVpZ+q+pzbE/0Qf6ihdEPaVxmJ9/LE7yi1uwGO79QLlBN5l1
 Use2uDbzYd/zpIpwjIJWsetqJ4wQfQQPJ+cPEzR5p16H6Y+Ft/0w/OU5i
 DaU0UtCRXpmDe9yuanp7Gp8jNa13CUSe7RbV4VkFaGjlgTzpy3OJaj/7R A==;
X-CSE-ConnectionGUID: aCZKFSbuR/+wODlIQpAsAQ==
X-CSE-MsgGUID: XKLzy0dkQ9Kuxb+yS9tmfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84360279"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="84360279"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:38:35 -0700
X-CSE-ConnectionGUID: MaFsLBmOQ+SH2ignvooRRg==
X-CSE-MsgGUID: /vST6/uLRbq+Rfcv6J2dtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="183180106"
Received: from sachowdh-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:38:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [CI 0/3] Revert old VF migration recovery code
Date: Fri,  3 Oct 2025 01:38:21 +0200
Message-ID: <20251002233824.203417-1-michal.wajdeczko@intel.com>
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

Due to change in the VF migration recovery design this code
is not needed any more.

Matthew Brost (3):
  Revert "drm/xe/vf: Rebase exec queue parallel commands during
    migration recovery"
  Revert "drm/xe/vf: Post migration, repopulate ring area for pending
    request"
  Revert "drm/xe/vf: Fixup CTB send buffer messages after migration"

 drivers/gpu/drm/xe/abi/guc_actions_abi.h |   8 -
 drivers/gpu/drm/xe/xe_exec_queue.c       |  24 ---
 drivers/gpu/drm/xe/xe_exec_queue.h       |   3 +-
 drivers/gpu/drm/xe/xe_guc_ct.c           | 183 -----------------------
 drivers/gpu/drm/xe/xe_guc_ct.h           |   2 -
 drivers/gpu/drm/xe/xe_guc_submit.c       |  78 ----------
 drivers/gpu/drm/xe/xe_guc_submit.h       |   2 -
 drivers/gpu/drm/xe/xe_map.h              |  18 ---
 drivers/gpu/drm/xe/xe_sriov_vf.c         |   3 -
 9 files changed, 1 insertion(+), 320 deletions(-)

-- 
2.47.1

