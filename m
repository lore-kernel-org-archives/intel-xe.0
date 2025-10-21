Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C316ACCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C6310E5D7;
	Tue, 21 Oct 2025 12:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QP+5SRsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD2D10E5D7
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761050302; x=1792586302;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N6tBPjJAKYTKih4pqgMlKyNFE3NmNnDDWCxKvaLtUb4=;
 b=QP+5SRsT4wf5LmTIS1Vem569Dh1m/V0kmP4mkKKtoWV6WNVpkOyD9D6F
 2VV1VhQ0xrhVxjEzpHqa3O8HJm/4pH2m9h/jMK5IMmIGhf/zFJMSao/s2
 m9ML9TzWI+ijHF4JDzTqs2Ukx7Nh4bOouMHeTfXSQ+RjLf7vH7Y+pRROY
 2Ay4A/N4Tw08Jb4X6GODovSMJQoInZFW85FsrDCXwn4G1A3A3mXljheYR
 szmbrHw4bTPJf2mkpV4ajdqmwPsr7qzdA2DYLzty79Uee6G1VH5hYm4AH
 RagyIssvez+suA4KBVwvAYkrpw/TgxeWT97LwZPc7rtQeepoaIMTPqaNC Q==;
X-CSE-ConnectionGUID: gcAFdiPhTVGWwW0SdCWPxg==
X-CSE-MsgGUID: HxwPNWvRTe69uqp+MBinLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50747432"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="50747432"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 05:38:21 -0700
X-CSE-ConnectionGUID: 2BdcyjICQnaXOtqRHu4uSQ==
X-CSE-MsgGUID: FbrUVoQaSoCW4FH09M4Y8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="187850336"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 21 Oct 2025 05:38:20 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v5 0/5] drm/xe/vf: Minor fixes to post-migration recovery
Date: Tue, 21 Oct 2025 14:39:38 +0200
Message-Id: <20251021123943.1436375-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

The series contains few minor fixes, mostly related to VF driver probe.

The fixes are not strictly related, but all go under VF migration category.

v2: Add fixing the currently broken GuC ABI check

v3: Add separation of xe_sriov_vf_ccs_migration_bb_needed()

v4: Remove platform version check, discard early MIGRATED ignore patch,
 move and rename CCS BB check functions, switch target of "Fixes" tag

Tomasz Lis (5):
  drm/xe/vf: Helper for telling whether CCS migration BBs are needed
  drm/xe/vf: Revert logic of vf.migration.enabled
  drm/xe/vf: Fix GuC FW check for VF migration support
  drm/xe: Assert that VF will never use fixed placement of BOs
  drm/xe/vf: Do not disable VF migration on ATS-M

 drivers/gpu/drm/xe/xe_bo.c             |  6 ++++
 drivers/gpu/drm/xe/xe_sriov_vf.c       | 35 +++++---------------
 drivers/gpu/drm/xe/xe_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c   | 46 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_sriov_vf_types.h |  6 ++--
 5 files changed, 63 insertions(+), 31 deletions(-)

-- 
2.25.1

