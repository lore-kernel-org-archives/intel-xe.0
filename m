Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B58FD88CA
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 22:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C45310E798;
	Tue, 10 Mar 2026 22:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bti8Qjyd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CB710E28A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 22:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773183043; x=1804719043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W9kAFLLtJ+IIvTtGP6Mu/7epysP+r1CNR2aBDnC1CsY=;
 b=Bti8Qjyd7GFF0F/tArI29Y62q7c3/K3aueWocT2U7DI3hl7Z8oqQWAJf
 +KNLoCVyl45FH4MbZKcHiElAatFsWUjr2ZC/oU6k9hzG5QqPyAHXxfwLs
 1NqSM0/VqIpsQWQIDYt9eIjdtXMNQw/3CY5QiB4UHoGDzecrdxKDNDPr9
 X3WkFDlADcdrsR2NNa1cUszNX5HkrQ9ciX0OZi1g8eg8a1XlBYyxfbag/
 duc9AFrldtgiAX5xw1TjNVSRSbq2jpePlKqsnP0aVEnQ/XFhMkseuIw41
 Adt0NTtkf+WxscNG/GKlnYiMDvZgOGzQlmaeCLZWhngvIb2QvHBrLfO8e Q==;
X-CSE-ConnectionGUID: ZOt7xEhqQpeNRiq5i1iQXQ==
X-CSE-MsgGUID: mdSYGvSjRw6flrHPvww40w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="61817879"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="61817879"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:50:42 -0700
X-CSE-ConnectionGUID: YrzMQOq7SF6GIsqRoUpPYA==
X-CSE-MsgGUID: 6+F1HT0xRVqnnEL4iTTZQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220440984"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa007.jf.intel.com with ESMTP; 10 Mar 2026 15:50:40 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v9 0/7] Attempt to fixup reset, wedge, unload corner cases
Date: Tue, 10 Mar 2026 18:50:32 -0400
Message-Id: <20260310225039.1320161-1-zhanjun.dong@intel.com>
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
v9:
 - Limit 1 author per patch to avoid confusion in git bisect
v8:
 - Bug fix for Assertion `xe_guc_read_stopped(guc) == 1` failed
 - Add kernel-doc (Michal)
 - Rename function __xe_guc_submit_reset_prepare (Michal)
 - Remove empty errout: block, change goto to return (Michal)
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
 drivers/gpu/drm/xe/xe_guc.c        | 26 ++++++++-
 drivers/gpu/drm/xe/xe_guc.h        |  1 +
 drivers/gpu/drm/xe/xe_guc_ct.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 87 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_uc.c         | 22 +++-----
 6 files changed, 104 insertions(+), 48 deletions(-)

-- 
2.34.1

