Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC97F53D72
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 16:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACA910E281;
	Mon, 16 Mar 2026 16:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6CqObwf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08E510E287
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773679376; x=1805215376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3LIjTrMNoQ3s69hcMh2yYKGbUpDlxQD9mU/IIUNfuw=;
 b=W6CqObwfDveeosRKcX61Bq/qqNJlyg5SNmETVHqAKWsXmayRxR66c6w4
 K7ss4IlBZkYVphHd7pWLXTBo0h92ByvKsDZZ9TZe7xz7fXH4ealjiFInz
 khWQppGJG0IGdogV5yIX5PKlmeUOzowrwz31d6npEKbZvEqJOnhV3DNrU
 uV49AE7+4EL8sRKFK7mzzR9SYtdvgygND12DV3f9TbsvASiYLEyIsqtr/
 703UUfCE4Mpm4Q4be3tQpah4h2o0qbmGReFXZvMa8zuEKuastAjIw+Jpy
 /Ytw6gKgasy0ZL6efYJRLxIohzdLrBGHGxbCWG7sqtAejDY2C+/dTFZ0g Q==;
X-CSE-ConnectionGUID: ng0jHEpSRZCZ5fjtd6Y+2Q==
X-CSE-MsgGUID: +ITdsUzvQvyVjIPciZZHeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="97308776"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="97308776"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:42:56 -0700
X-CSE-ConnectionGUID: 3HxLPx6RToaAzeW7mZ3IFg==
X-CSE-MsgGUID: rY5oxy4pS3Kfxa0/TCgbAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221013843"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.31])
 by orviesa006.jf.intel.com with ESMTP; 16 Mar 2026 09:42:55 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, stable@vger.kernel.org,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v5 0/2] drm/xe: PAT index validation for CPU_ADDR_MIRROR and
 madvise
Date: Mon, 16 Mar 2026 16:42:51 +0000
Message-ID: <20260316164253.262406-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129000147.339361-1-jia.yao@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
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
configurations for CPU cached memory, preventing cases where the GPU may
bypass CPU caches and observe stale or sensitive data.

Patch 1 enforces PAT validation for the madvise ioctl path, ensuring
XE_COH_NONE cannot be used on CPU cached buffers, including CPU address
mirror and userptr-backed memory.

Patch 2 applies the same validation to vm_bind, treating
DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR the same as MAP_USERPTR with
respect to permissible PAT indices.

Both patches close a security gap affecting CPU cached memory access
when incoherent PAT values are used.

Changes since v5:
 - Added an additional Fixes tag to correctly reference the root cause
   patch enabling the problematic PAT behavior.

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
Fixes: e1fbc4f18d5b ("drm/xe/uapi: support pat_index selection with vm_bind")
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

