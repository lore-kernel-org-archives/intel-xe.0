Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EC9C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 23:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D4710E073;
	Wed,  2 Sep 2026 23:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2imOnrA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87C210E073
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 23:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788392444; x=1819928444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=91MywIDdJywPlzaw7E6NrYPG96sJkZF7e69L1r79xRQ=;
 b=G2imOnrAMutVI5QRzMNA5nlv1sfUmGtZ+H/ywL5dhskGkfx/FE1QoJbY
 dXH2ElXn8RSz1GckLy4vxuGVbfR4003sLs2AHs0rlB0VRqSLP7TBLLddf
 17LKAPTkk/xyDqKG/xDmCJal5t7BjPTNw/hm82dt+4z+S1KzYY3OiSbR1
 +zZf3kBYz9hUGZAeiJaZ1FZlowg/CxK1dltmawS/UMgW9k8pdIGb1xYdU
 YeoMnkD1PFLSEkCzbfVJ6zdJXqJl5tbUiT+0N6D/K8Sjt1O4XAxKO86Ym
 Kd1nxLywFQCFOZ0EgzvL712/wphIVWeqJiMGNY1j1At79VI/fxx6SEDEt g==;
X-CSE-ConnectionGUID: EBMmQ+dER2mC8T6OHZgQjw==
X-CSE-MsgGUID: Gphm/fZrSc+CalOwKGt32g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88738927"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88738927"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 16:40:44 -0700
X-CSE-ConnectionGUID: 0QQS4N4NTeSwZolkRZQ7tQ==
X-CSE-MsgGUID: bEaKqSVdSRO9STaRi/liYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273054823"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by orviesa003.jf.intel.com with ESMTP; 02 Sep 2026 16:40:43 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 julia.filipchuk@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8 0/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Wed,  2 Sep 2026 16:40:32 -0700
Message-ID: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
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

GuC snapshot output is currently expensive in both size and latency: large
log buffers are emitted as raw ascii85, and the surrounding dump text
includes a bit of avoidable noise. This series makes xe snapshot dumps more
compact and easier to handle by compressing the large binary payloads,
tightening the textual output.

Select ZSTD_COMPRESS in DRM_XE so the xe module pulls in the zstd
compressor when built.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

---
History:
v8: Improve patch #2 description on clarity and wording (Rodrigo)
v7: Add *why* to the commit message (Rodrigo)
v6: Remove intermediate build files(Julia)
    Remvoe unnecessary comment(Julia)
v5: Update cover letter messages to remove shrink log size.
    Fix kernel-doc warning.
v4: Remove ZSTD_DECOMPRESS dependency.
v3: Add Kconfig option to control compression of GuC log and CTB dumps,
    allowing users to choose between reduced dump sizes or lower memory
    usage.
    Remove "reduce GuC log size from 8MB to 2MB" patch, to be added later
    if needed.
    Replace pr_err with xe_gt_err and add more error print.
v2: Fix Kunit test error by selecting ZSTD_DECOMPRESS in DRM_XE config,
    required by zstd_is_error/zstd_get_error_name.

Zhanjun Dong (2):
  drm/xe: Remove extra newlines from LRC snapshot dump
  drm/xe/guc: Compress GuC log and CTB dump with zstd

 drivers/gpu/drm/xe/Kconfig          |  15 +++
 drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
 drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
 drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
 drivers/gpu/drm/xe/xe_lrc.c         |   4 +-
 7 files changed, 185 insertions(+), 31 deletions(-)


base-commit: a7f2b1429f908875e6b235c7902fc47805b07bf4
-- 
2.43.0

