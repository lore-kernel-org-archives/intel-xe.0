Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873DEF8E4A7
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 05:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430B510E174;
	Fri, 17 Apr 2026 05:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBV6wUj2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C46410E174
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 05:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776405564; x=1807941564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y+pbNHaGI/qun7rM19bS2zigwvEUEuecNLoSu0RRjPg=;
 b=UBV6wUj2Dhz22aQ4g0pOIExaSjkuZKAyxongBoWq3kxo2Hc/ORQoDJhs
 Xxw72h7lgrsbBGh6xCCzCbnKsWskJLM0ai3lG4bptxqtKG6w0ldGMrAyo
 x+qiQzG4UqigKqOwF94/xqzQxh966v0YnXWSagnWX2QAlAXwktphU1Yx5
 f3HJ+yaYgNxtv2Wr9CrCdzLK9XltsYhKeMfEHrVMTUa0wP4jZKofmepMg
 025BzZIRnBNqb619uionarG8P6zV1x9/9vRM6wONxscqQFTET7btNB/yc
 RTcwTwvWxxrBEruXCSoU+/8sfyWv558v4Qgyz1gQ43t6s2z4UFK9rNMIx w==;
X-CSE-ConnectionGUID: dfmPSCwTSrmamVS7rEk6pw==
X-CSE-MsgGUID: bryjM1UfQVC5mSrh8F+RPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="102878725"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="102878725"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:59:23 -0700
X-CSE-ConnectionGUID: 8rWlx4HhTCCSInfucycFzw==
X-CSE-MsgGUID: wvs2048STTGDtgU0tW9d0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="230871795"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.31])
 by orviesa008.jf.intel.com with ESMTP; 16 Apr 2026 22:59:23 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, stable@vger.kernel.org,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v8 0/2] drm/xe: Reject unsafe PAT indices for CPU cached memory
Date: Fri, 17 Apr 2026 05:59:15 +0000
Message-ID: <20260417055917.2027459-1-jia.yao@intel.com>
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

This series strengthens PAT index validation to reject unsafe
configurations for CPU cached memory, preventing cases where the GPU
may bypass CPU caches and observe stale or sensitive data.

Patch 1 enforces PAT validation for the madvise ioctl path, ensuring
XE_COH_NONE cannot be used on CPU cached buffers, including CPU address
mirror and userptr-backed memory.

Patch 2 applies the same validation to vm_bind, treating
DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR the same as MAP_USERPTR with respect
to permissible PAT indices.

Together, these patches close a security gap affecting CPU cached
memory access when incoherent PAT values are used.

Changes since v10:
- Just add the iGPU logic but keep dGPU logic

Changes since v7:
- Rebased onto latest drm/xe tree, no functional changes.

Changes since v6:
- Corrected Fixes tags.

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
Cc: stable@vger.kernel.org # v6.18
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Mathew Alwin <alwin.mathew@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

Jia Yao (2):
  drm/xe/uapi: Reject coh_none PAT index for CPU cached memory in
    madvise
  drm/xe: Reject coh_none PAT index for CPU_ADDR_MIRROR

 drivers/gpu/drm/xe/xe_vm.c         |  2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 45 ++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)

-- 
2.43.0

