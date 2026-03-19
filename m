Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19F9108E1FA
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 11:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87BB10E92D;
	Thu, 19 Mar 2026 11:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mg5RmXML";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8844010E92D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 11:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773921573; x=1805457573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BC9zGprXEhsbsIQS0fdZGhicl3dwenYKDlfk7ILnEuY=;
 b=mg5RmXMLvrt7jXL7EBNLKsviqb5J83f9J2P8RpgUN9HMXLx+wzS7tDXR
 km0ycQW4kWAbM4b2KQ4HJWZUOhH7dgM47F8LcieqUsgwriwgFE1b62fN0
 9lQis4GAWmKiUq66bWuk8hX4+hjH624jeYEgWfR3l2EAlZoeL8Nn9oWqR
 GErdwPuuPihMNz02wr3CjOIZLgCF14+z4JCs1aVVOUetAjYQYdqvD0W+D
 h3VIzWOf71F7IeJ0IUkTCVWeoR0Az82opWOPJd0vJz/zbnumtfqHhwc0u
 a/k/RZ3OLBwIq2XMm1IHXBc5ev2sScWffUAd3canDUrCxrFD8/3bBJbMB A==;
X-CSE-ConnectionGUID: 9vcVsl9eQ1iJ2EllmC57mQ==
X-CSE-MsgGUID: PhL503nWQn27Dqgk6MS6Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78593940"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="78593940"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:59:23 -0700
X-CSE-ConnectionGUID: tsXcdrbJRrOMuI3pIlNHVA==
X-CSE-MsgGUID: KxtHwojZR/yvmDWKQlSVsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="223160886"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.31])
 by orviesa007.jf.intel.com with ESMTP; 19 Mar 2026 04:59:00 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, stable@vger.kernel.org,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v7 0/2] drm/xe: PAT index validation for CPU_ADDR_MIRROR and
 madvise
Date: Thu, 19 Mar 2026 11:58:56 +0000
Message-ID: <20260319115858.444541-1-jia.yao@intel.com>
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

Changes since v6:
  - Correct fixes tag

Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
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

