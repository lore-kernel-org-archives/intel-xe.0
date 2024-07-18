Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F079EC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 20:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B636510E0EF;
	Thu, 18 Jul 2024 20:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJMbEySS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D2110E0EF
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721334717; x=1752870717;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O5lMz744iKh6KfSIroLMh8b9Ft3ZzLVpGMTgokCf1Wk=;
 b=aJMbEySS7O2UWFS/YkXaDWg2eSPT2pvN1+1ga/uv3VFds+v0PjP2jMi7
 tskMWaixm/eYazfnvYPParvX0YyHaaaeBnDBbaGKLvpqqcWO/Ud4tm42K
 r9zONsHHYso5z8ckGAN2dimTSykdV24vlABX/HJqjImnIVDSKP05qk6+B
 qn61VV+xKBvS78uSdCDMtgpwkJlJdr8IDmL8/VDmxefyyjTean177hIn6
 goIzUtrZlkB/peRFGqhlbMaOAa0fTw0sCGxAo+xoH5msl+P47jyOJh8Ud
 nFZ6+07q1NfyabDzV8U6NEXdtVTbaOjyhTZwmTf6UOScVRcA8+uWmhWTt Q==;
X-CSE-ConnectionGUID: Fgu5BTphR1SXmNysRCMiAg==
X-CSE-MsgGUID: vIqa9+dsQTKWxPRQrsZbcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19059943"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="19059943"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:31:57 -0700
X-CSE-ConnectionGUID: S2jSNFmCRteoPFwcXgHZTQ==
X-CSE-MsgGUID: jT1U3xbKTva0fDWajudznQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="81520621"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:31:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/4] Have xe_vm and xe_exec_queue take references to xef
Date: Thu, 18 Jul 2024 13:31:48 -0700
Message-Id: <20240718203152.3566929-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
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

Just posting the revision that will be pushed for reference. This rev
only has documentation changes compared to v2, so will not run CI on
this.
-----
xe_file_close triggers an asynchronous queue cleanup and then frees up
the xef object. Since queue cleanup flushes all pending jobs and the KMD
stores client usage stats into the xef object after jobs are flushed, we
see a use-after-free for the xef object. Resolve this by taking a
reference to xef from xe_exec_queue.

Issue: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908

The series adds xef refcounting and ensures all consumers of xef take a
ref to it.

v2:
- Include review comments from v1
- Squash patch 3 and 5 from v1 to add Fixes/Closes tags

v3:
- kernel-doc fixes (Lucas, Matt)

Note: Patches 1 - 3 can be merged independently

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (4):
  drm/xe: Move part of xe_file cleanup to a helper
  drm/xe: Add ref counting for xe_file
  drm/xe: Take a ref to xe file when user creates a VM
  drm/xe: Fix use after free when client stats are captured

 drivers/gpu/drm/xe/xe_device.c           | 58 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_device.h           |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
 drivers/gpu/drm/xe/xe_drm_client.c       |  5 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++-
 drivers/gpu/drm/xe/xe_vm.c               |  6 ++-
 7 files changed, 71 insertions(+), 21 deletions(-)

-- 
2.38.1

