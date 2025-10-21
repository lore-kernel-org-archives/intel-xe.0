Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24444CCD1AB
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 22:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA4910E669;
	Tue, 21 Oct 2025 22:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJTO8btz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D1110E667
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 22:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086814; x=1792622814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/YTNO78IxO1mIRHT/3sT4yac4tc7pyGAhk27FKzvDC0=;
 b=YJTO8btz4eg80G4ySk1ILwVaVK4/lou60FCAM+TZObzWHtGnF+6wIVRv
 SYUrC0v+Cqp+Di4jr+zKSoQS0TBz2nC9cPw0ZMXWBMhcH8ZsuaLGthtx3
 DoBEy0+u/08jzHMlEuWBA0nUY3l1+1s6RSd8QM62hlE7GTOZrSbb0WypB
 6o5sK41mVn3dhzm98tnua++T25HIXCqjwEHyZLY1AVdsEgb4P5OTVsEti
 ftyS62oiNSC79lusm+5QMoCuYgr/erdg5vd20zInXMs7ob5bcP+o0Zjze
 si1Plq9zQcm7yML3+T25NfpxlYhofYtk3QlqKFfSctgfGcqHt3OaDlRaz Q==;
X-CSE-ConnectionGUID: Ryvp7MY4Qnyj0p7UYBJaNg==
X-CSE-MsgGUID: kAvB2MGSQjOJv2Wgeg38qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67089083"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="67089083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:46:54 -0700
X-CSE-ConnectionGUID: dwo9GUZoRISmxxhMZy32fQ==
X-CSE-MsgGUID: lw53Gl2kRqCIiHKCbhIlzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188989343"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa004.fm.intel.com with ESMTP; 21 Oct 2025 15:46:53 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 0/4] drm/xe/vf: Minor fixes to post-migration recovery
Date: Wed, 22 Oct 2025 00:48:13 +0200
Message-Id: <20251021224817.1593817-1-tomasz.lis@intel.com>
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

v5: limit scope of some functions, switched 'Fixes:' tag to a different
 commit

v6: removed writing false zeroed var, squashed two patches,
 added kerneldoc, moved location of some checks 

v7: Typo, equivalent gt getter, exposing conditionals

Tomasz Lis (4):
  drm/xe/vf: Revert logic of vf.migration.enabled
  drm/xe/vf: Fix GuC FW check for VF migration support
  drm/xe: Assert that VF will never use fixed placement of BOs
  drm/xe/vf: Do not disable VF migration on ATS-M

 drivers/gpu/drm/xe/xe_bo.c             |  6 ++++
 drivers/gpu/drm/xe/xe_sriov_vf.c       | 39 ++++++++--------------
 drivers/gpu/drm/xe/xe_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c   | 46 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_sriov_vf_types.h |  6 ++--
 5 files changed, 67 insertions(+), 31 deletions(-)

-- 
2.25.1

