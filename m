Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC3ACED617
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 11:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6DE10E484;
	Tue, 18 Nov 2025 11:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qh4Ksg1X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D5510E353
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 11:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763466080; x=1795002080;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qa1diUsjcAL/0ZWj74JLiNgUFD5rJPGNmfiRBM8vyJY=;
 b=Qh4Ksg1XjjG96aPDYQSqBvQkH+VI6Z3IQvn+TJ4wHaohluhvB1KP/ILk
 xES8WKI6DB1ADTnARE/0rQqUdpTy3Sz0FaArLkenqN3Y8Kk1nXUnjsQsH
 zzJX+bFumAp3ElVnnbWDgXDDtJniu44/ydzaUIsDsYsdi6o60zWuamMG/
 oPi5exyCuSatBL9RKY7DPnnbgkchuCCoqgq/s8XrQWOk63pAnfoAaiYBS
 SdCDBG7kZbjak/n66/hhl2pg333o0777FxFN2SwSiTelUZsxizfn+zXY+
 xq3wmLM9pwHWxSvlxr48OyX25RwjQQ5PtN9sLkn7cJMm2u2rKZ7F7K8b3 w==;
X-CSE-ConnectionGUID: w9VVDtEzTtuNW0hcq0NnZQ==
X-CSE-MsgGUID: CMjL+ZW+QriH8hrE5b+hZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76163440"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76163440"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:41:20 -0800
X-CSE-ConnectionGUID: fn1zcxg/R3ylt3TdmrtgQA==
X-CSE-MsgGUID: XkkUsWEIS82PMAPQY1l+Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190763765"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by orviesa007.jf.intel.com with ESMTP; 18 Nov 2025 03:41:18 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 0/3] VF double migration
Date: Tue, 18 Nov 2025 11:41:13 +0000
Message-ID: <20251118114116.3429730-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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
V3 -> V4:
- Gated Save/restore on Guc version 70.54.0
- Enabled RESFIX_START by default.
- Updated RESFIX_DONE documention.

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


Satyanarayana K V P (3):
  drm/xe/vf: Enable VF migration only on supported GUC versions
  drm/xe/vf: Introduce RESFIX start marker support
  drm/xe/vf: Add debugfs entries to test VF double migration

 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 60 ++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 93 +++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_vf_debugfs.c   |  5 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     | 13 +++
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 28 +++++-
 5 files changed, 169 insertions(+), 30 deletions(-)

-- 
2.43.0

