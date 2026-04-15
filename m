Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B7FFA0C30
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 06:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8E110E0F1;
	Wed, 15 Apr 2026 06:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ah2vJXCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FC810E0F1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 06:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776233995; x=1807769995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nRRDuhp9fGhe3KxDvIqOlbDeRxBcIwcFCSM/Fnul3MU=;
 b=ah2vJXCBg0GPzCCL+O3j8vEtpPayFGog3N9slOmLMUFepclnxQJENVDA
 JNR5Z5jhJAokMdJvBa9SxVsrbBi3g8l1PFK6Is61Y63SNa8GVozOkmmZi
 XKEhkEJ2zTFyLRXKThSQimvRzcdRcIiu90gbxse6EKOoNk+4tZX2hz/YT
 lTfLI6VMpM6y7GPG+S7O4b0/r/Rfbd5WmoAEy4kBuCifpl3tgKNyADfkM
 aY4Z2FzRJIK/LjZM5R0g3x7praIF/3ymsRgbDH9Tcxd/rl0OEfWhtm8+9
 nF2rS36znMUTTd40o52JVS3nc37F5ZiCuPU7HEfGAm5Rexj9UeqXVA548 A==;
X-CSE-ConnectionGUID: lY06dbcGRkuuo3Ez6cRKRg==
X-CSE-MsgGUID: urP6t/F/TMSCuqTKc+9T1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77080164"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77080164"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 23:19:54 -0700
X-CSE-ConnectionGUID: 2gTqIwOaQIicDzVgvdLAZg==
X-CSE-MsgGUID: Iw19URghS3OTpvPdY4k45w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="227675214"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.31])
 by fmviesa008.fm.intel.com with ESMTP; 14 Apr 2026 23:19:54 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, stable@vger.kernel.org,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v8 0/2] drm/xe: Reject unsafe PAT indices for CPU cached memory
Date: Wed, 15 Apr 2026 06:19:49 +0000
Message-ID: <20260415061951.427699-1-jia.yao@intel.com>
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

