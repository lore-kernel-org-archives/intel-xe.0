Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCB9CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 13:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E7910EACC;
	Fri,  7 Nov 2025 13:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4lQOIZx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D79810EACC
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762523573; x=1794059573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9krZBwmvaNjvRWrYZbZNP8wvnyaSWMAUeiEMabbGmZU=;
 b=b4lQOIZxkZj81k+qYx4POH/tlJbL5gV6eCOgqHNlBCxeX1iBOKm1LtBG
 mxpj8B+z75Y6ing44J4D89ABaHddYb7GAYx67Rsl8TvVtqoPNqn8N1piX
 M0uTTVonBEJ7Jx8y7g6s4S07asGik3JwVDkcrn5De1jJ+O97I0itwtR6O
 Y+NKgY7NY7snmrSB5ne2tk+M0lO7K08ataBMlbUIG2HsKllaFmIW/0fiy
 DnCPJ9LjRnRvJJKFq1+qje+dYun+OSmUN5eoRr283JI31t0M1Uxz/rUer
 f9/O2KK9uPIbJ5VN/cO5bAwn8vOW9boa5kALw0YIVf8zEt9aSYTwIQuKV Q==;
X-CSE-ConnectionGUID: w6MvZDKNQ+alqyZp12G3JQ==
X-CSE-MsgGUID: sxL8PZK9RXesVA8oNutrFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64826571"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64826571"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 05:52:53 -0800
X-CSE-ConnectionGUID: EuayqfWpQSOZwaBXM1FzpA==
X-CSE-MsgGUID: qKEz1fecQ9mBJ6XbgR5Aww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="192135405"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 07 Nov 2025 05:52:52 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 0/2] VF double migration
Date: Fri,  7 Nov 2025 19:40:14 +0530
Message-ID: <20251107141015.29051-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In scenarios involving double migration, the VF KMD may encounter
situations where it is instructed to re-migrate before having the
opportunity to send RESFIX_DONE for the initial migration. This can occur
when the fix-up for the prior migration is still underway, but the VF KMD
is migrated again.

Consequently, this may lead to the possibility of sending two migration
notifications (i.e., pending fix-up for the first migration and a second
notification for the new migration). Upon receiving the first RES_FIX
notification, the GuC will resume VF submission on the GPU, potentially
resulting in undefined behavior, such as system hangs or crashes.

To avoid these hangs, a new VF2GUC action `VF2GUC_NOTIFY_RESFIX_START` is
sent along with marker and when GUC receives the same marker with
`VF2GUC_NOTIFY_RESFIX_DONE`action, it starts scheduling work loads from VF.

---
V2 -> V3:
- Fixed review comments (Michal W).
- Updated commit message.
- Fixed CI.BAT issues.
- Added helper function to assert on unsupported GUC versions.
- Added debugfs entries to test VF double migration.

V1 -> V2:
- Squashed "Enable RESFIX start marker only on supported GUC
versions" commit into a single commit. (Matt B)
- Use fault injection for testing VF double  migration feature (Matt B).


Satyanarayana K V P (2):
  drm/xe/vf: Introduce RESFIX start marker support
  drm/xe/vf: Add debugfs entries to test VF double migration

 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  40 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 111 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c   |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  13 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c              |  46 +++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_types.h        |   5 +
 6 files changed, 211 insertions(+), 9 deletions(-)

-- 
2.51.0

