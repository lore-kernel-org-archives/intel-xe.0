Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA24D26296
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9896610E221;
	Tue, 20 Jan 2026 20:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNOdtbJY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E2C10E097
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768940184; x=1800476184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l3EddtH3afp4YEy81QhDJgKD+ATE/gquFRfDPeDhbS0=;
 b=aNOdtbJYRR/ozxQjH4doBVvljJf6PYOLB8Q+Nibof1WQ4q/T2KnIfFHd
 9yOVXN51kt6g3QuuXu0IrjBNkjrlg6cXeDooiXzKeyp6oZMo1QpXZn25Q
 g4qu+zBeghbg1g/qZ3JsUYoh/HUXu589boTAXVcs9nbVPA5cIt0tMBMZu
 FT+uze0ac+Afzo9ps15NXNWzdbsJTghid+1EFRchl3GdcL3QTLHJfJjrJ
 dEH8IP97eSA7oYl4vxN3oUY/gahuKGi3PEhTEjh+bKctJPPsdRNmwvy6+
 lCOByHTHHEtOTDpXE7Y9BE/5a6Oq3yDPAq9WNltNEcZs9HVC6VtvE/3B4 A==;
X-CSE-ConnectionGUID: nzfFPWqhTlGKu4hgu4WRAw==
X-CSE-MsgGUID: aeFCPitBTYSmraAmNxXfzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87574651"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87574651"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:16:23 -0800
X-CSE-ConnectionGUID: pFq3RWZGQyy2rm+AEQdEQQ==
X-CSE-MsgGUID: aWUkMnsyQiS+E/s9LxLAxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210373488"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa003.jf.intel.com with ESMTP; 20 Jan 2026 12:16:23 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 0/6] Attempt to fixup reset, wedge, unload corner cases
Date: Tue, 20 Jan 2026 15:16:15 -0500
Message-Id: <20260120201621.2442803-1-zhanjun.dong@intel.com>
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
v3:
 - Add patch 3-6 in series
 - For "Trigger queue cleanup if not in wedged mode 2":
     Add guc_ct_stop and reset prepare in patch of:
     Sync with baseline changes

Matthew Brost (3):
  drm/xe: Always kill exec queues in xe_guc_submit_pause_abort
  drm/xe: Forcefully tear down exec queues in GuC submit fini
  drm/xe: Trigger queue cleanup if not in wedged mode 2

Zhanjun Dong (3):
  drm/xe/guc: Ensure CT state transitions via STOP before DISABLED
  drm/xe/uc: Drop xe_guc_sanitize in favor of managed cleanup
  drm/xe/guc: Fix page fault by moving guc_submit_fini to devm

 drivers/gpu/drm/xe/xe_guc_ct.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 68 +++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_uc.c         |  2 -
 3 files changed, 45 insertions(+), 26 deletions(-)

-- 
2.34.1

