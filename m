Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63C0D2FEC0
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 17:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F79F10E5A2;
	Tue, 27 Jan 2026 17:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYLxh5iX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4EA10E5A1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 17:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769533497; x=1801069497;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2CRB4Y6/NtST+Fzs+FroVSFoFRrNQWH5xogDxDWYu7w=;
 b=BYLxh5iXysv3BrmhFpy+vQulTzU0+KiUMBhQZA2MaKnU2RLHN9BRuYdE
 d3wadBOybAsr8szzcjmbjEQC4Tfp35uCvPXwt5w7/sDOI5KLxntBIYF4X
 MzIrGK5ZmKeqBgMlB3onn7+P3N28PwP+WrahCgPwhEzJyL3Ut9+ELJBVk
 tQNk9BUGKaNjkfUYBAhMGDO1sO4EziRM6YAcQ6co5Tf/ZXThn6XXmh6Vz
 NGJ6uFEtex+57y43INIlHirQ3a9Yq/8ExCYXm4ekOLEWZ69Mdvee2HoiU
 /20ly/X9Z1kDx2orRLoXksDiKPwRclGo0QQx6Ghbak7pQRXFIVgJNompc w==;
X-CSE-ConnectionGUID: urPRk+7OR4OrYR6bkJNV9A==
X-CSE-MsgGUID: hlAY/770Q8+oYKhSPSPH8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93393521"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93393521"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 09:04:57 -0800
X-CSE-ConnectionGUID: 7voIWiNLQa+3s/1GyyKa8w==
X-CSE-MsgGUID: OEWepBL8TDWMr6jPxsYHaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208039382"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa008.jf.intel.com with ESMTP; 27 Jan 2026 09:04:57 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 0/5] Attempt to fixup reset, wedge, unload corner cases
Date: Tue, 27 Jan 2026 12:04:50 -0500
Message-Id: <20260127170455.618616-1-zhanjun.dong@intel.com>
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
v4:
 - Make guc_submit_fini a devm managed action
 - Squash patch 2 with 6 from v3
 - Commit message update (Matthew)
v3:
 - Add patch 3-6 in series
 - For "Trigger queue cleanup if not in wedged mode 2":
     Add guc_ct_stop and reset prepare in patch of:
     Sync with baseline changes

Matthew Brost (3):
  drm/xe: Always kill exec queues in xe_guc_submit_pause_abort
  drm/xe: Forcefully tear down exec queues in GuC submit fini
  drm/xe: Trigger queue cleanup if not in wedged mode 2

Zhanjun Dong (2):
  drm/xe/guc: Ensure CT state transitions via STOP before DISABLED
  drm/xe/uc: Drop xe_guc_sanitize in favor of managed cleanup

 drivers/gpu/drm/xe/xe_guc_ct.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 68 +++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_uc.c         |  2 -
 3 files changed, 45 insertions(+), 26 deletions(-)

-- 
2.34.1

