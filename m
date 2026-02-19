Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23869E9A058
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 18:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A4010E72C;
	Thu, 19 Feb 2026 18:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNmvRxk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B0D10E72C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771524423; x=1803060423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wkY78LqkcNhOBY4Vnc16DsGxLjCr4R74B/aB73yeldk=;
 b=XNmvRxk+PYHF1pJuCnQmlm7N6roeUmiX9nNl4ireC1yWI4RafZWq+RbW
 /2H456FREGyW208r5L90CTJ+DNkUro1NI2kGiO/4ynzdG6Cljo3kr/uAF
 VYf3SlI5zIKuX2V0yinGYCi8GIuvEhx4XONMmhEWiZOpD+mR0MyyDWwXG
 a2A3kvqlb+/cyYuwAdm6GLx1HVGnF7SwKkIAvgTSGdtUgrHn/dB3O+rk0
 Ek7MV7VWSEF20mkordxyFiUwCovb8qDywOUWNN57UH46CbyoZqbEoeidk
 g+GJlqyp4G2jctHfaYp88b4WPeMiGQppRxBMwFolFRnBXCc0hPY4IatTA w==;
X-CSE-ConnectionGUID: q1Oe+XqgRrK9ufjWfBW3uA==
X-CSE-MsgGUID: /z/pI2lKR+6JVYiQBBEzSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76482809"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="76482809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:07:03 -0800
X-CSE-ConnectionGUID: tvm5EN7PROireVohrQJThg==
X-CSE-MsgGUID: Xn6Z+22cTfWDDn6mn7s8Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245189010"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 10:07:03 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko@freedesktop.org, Michal <Michal.Wajdeczko@intel.com>,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v7 0/7] Attempt to fixup reset, wedge, unload corner cases
Date: Thu, 19 Feb 2026 13:06:54 -0500
Message-Id: <20260219180701.2418453-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

We have several bug reports [1], [2], [3] describing failures in reset,
wedge, and unload corner cases where memory is not properly freed or
fences fail to signal. This patch attempts to address the issue by
forcefully killing any remaining queues on driver unload and wedging the
device if not in mode 2.

Zhanjun Dong

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
[2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
[3] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6029

---
History started from v2 (v1 not found):
v7:
 - Add "Open-code GGTT MMIO access protection" and rebase with baseline changes
v6:
 - Split guc_submit_fini into 2 parts, device related by devm and software
   only part by drmm
v5:
 - Removed redundant xe_guc_ct_stop() and __xe_guc_submit_reset_prepare()
   calls (Michal and Matthew)
 - Split patch 3 into 2 patches(new #3 and #4), #3 is for fixes old patch purpose,
   #4 add as separate commit uses the enum for better code maintainability (Matthew)
v4:
 - Make guc_submit_fini a devm managed action
 - Squash patch 2 with 6 from v3
 - Commit message update (Matthew)
v3:
 - Add patch 3-6 in series
 - For "Trigger queue cleanup if not in wedged mode 2":
     Add guc_ct_stop and reset prepare in patch of:
     Sync with baseline changes

Matthew Brost (2):
  drm/xe: Always kill exec queues in xe_guc_submit_pause_abort
  drm/xe: Open-code GGTT MMIO access protection

Zhanjun Dong (5):
  drm/xe: Forcefully tear down exec queues in GuC submit fini
  drm/xe: Trigger queue cleanup if not in wedged mode 2
  drm/xe: Use XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET enum instead of
    magic number
  drm/xe/guc: Ensure CT state transitions via STOP before DISABLED
  drm/xe/uc: Drop xe_guc_sanitize in favor of managed cleanup

 drivers/gpu/drm/xe/xe_ggtt.c       | 15 +++---
 drivers/gpu/drm/xe/xe_guc.c        | 18 ++++++-
 drivers/gpu/drm/xe/xe_guc.h        |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 86 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_uc.c         |  2 -
 6 files changed, 88 insertions(+), 35 deletions(-)

-- 
2.34.1

