Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4386D46C15
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 23:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A293A10E783;
	Wed, 28 Jan 2026 23:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnBgKNvS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7DF10E77B
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 23:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769642196; x=1801178196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gU6wQd0y6v//+qIKVBKh3E3iDKvCjABkd3vNrXEqbwc=;
 b=RnBgKNvSIiThLHylUTNXhmF5uoB/3U5nZo7QiOJ79SOHfm0kUaTQtwvs
 KZ9Vz/zNb09+hlc1ftiMsX8CcGRWO8Gk6LZmiWs9yMekR8SLRM0AdWzH6
 W89P5e2+KNw7rteRhOgA/GbgYOsMe+4h7/WMEoKz9FU7lhWJ8ro+v7ydP
 9K8FqalPxa3zPXz/teh7OrEtXnLrbSQcrvtKbnNr6+8rqU0tBEfYAcLht
 X0nHWuhVNfHWZf/ep/I6f9R2I2dCnylX7qDda89k1GwZwUfnsCMNokwPS
 kBeGu3pqJ4fVZxouJU11MF6HKUgRinrZlFsESu3lkx4xh8gDcZQiWuXYd g==;
X-CSE-ConnectionGUID: NZ4273WiS0Gawhzv2v8bCQ==
X-CSE-MsgGUID: zc6G/1SNRYC47158Ujy1nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="73462214"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="73462214"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:16:36 -0800
X-CSE-ConnectionGUID: lgmfeR7tS5WkNhKq0tclnA==
X-CSE-MsgGUID: 5MPH82nvQi22sQsrzMmU8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213266636"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2026 15:16:35 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v5 0/6] Attempt to fixup reset, wedge, unload corner cases
Date: Wed, 28 Jan 2026 18:16:28 -0500
Message-Id: <20260128231634.982494-1-zhanjun.dong@intel.com>
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
  drm/xe: Forcefully tear down exec queues in GuC submit fini

Zhanjun Dong (4):
  drm/xe: Trigger queue cleanup if not in wedged mode 2
  drm/xe: Use XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET enum instead of
    magic number
  drm/xe/guc: Ensure CT state transitions via STOP before DISABLED
  drm/xe/uc: Drop xe_guc_sanitize in favor of managed cleanup

 drivers/gpu/drm/xe/xe_guc_ct.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 67 +++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_uc.c         |  2 -
 3 files changed, 44 insertions(+), 26 deletions(-)

-- 
2.34.1

