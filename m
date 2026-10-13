Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E00CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 22:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC94410E999;
	Tue, 13 Oct 2026 22:28:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E4710E15E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 22:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791930527; x=1823466527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SlPKMADjmXyp5gZHy12CjeMdtkstSrQIOR22DFZshJI=;
 b=dTxI7nx8ddfKAq/nMaA536ssWAFWE1jiRaZiKaoIFfj6sMCNUoVNlPvs
 WjOq35XzfBLsvj/E6Vuy7UePXCnoqYDTfYBLG7kb+FvYDKnP3syGMCufx
 c4QP3CopFS3uAP+Judaan16edgj0sZzl+ggih/BXpY5XZkg5wEoTCnmJ/
 G5cOvCw7dQwRxS7mfaXFW3wV8+InWlzTZkfBX3cdpV1JnDbiWV8468YaJ
 XNKI4FdVpC1LDM5hiipYbH0Nt5cBgUPUfmSGtoW3IpvAr7tDgdJ6VgSae
 uX2sJ1AfF83v/oM5IzcXeWiZQ7eEBreOspzlQtzPN8FOwIwBs6VvL8VgC g==;
X-CSE-ConnectionGUID: V6buY5QcT8GbRTI4we9SHw==
X-CSE-MsgGUID: Zir0sp2ZTmyqEEJkweZk5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="555668"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="555668"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 15:28:47 -0700
X-CSE-ConnectionGUID: sMcRn2BYSreefSIA/3WO4A==
X-CSE-MsgGUID: NHjkbil3TeOF3Ecq4GLD3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1163668"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by orviesa007.jf.intel.com with ESMTP; 13 Oct 2026 15:28:48 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 julia.filipchuk@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v11 0/3] drm/xe/guc: Compress GuC log and CTB dump with zstd
Date: Tue, 13 Oct 2026 15:28:44 -0700
Message-ID: <20261013222846.308259-5-alan.previn.teres.alexis@intel.com>
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
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

---
History:
V11: Patch3: In ct_dead_worker_func, call xe_guc_log/ct_snapshot_free
     after xe_guc_ct_snapshot_free (Sashiko).
v10: Add a new patch to introduce dump_cache to optimize GuC CT/ Log
     compression e2e flows and manage errors across parses. (Sashiko
     and Rodrigo).
     Patch2: Reorder Kconfig compression dependency (Rodrigo) and round
     up buffer size to dword as per final output-dump expectation.
v9: Rebase to latest drm-tip, no functional changes, added Signed-
    off by Alan on 2nd patch. (Rodrigo)
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

Alan Previn (1):
  drm/xe/guc: Add dump_cache to optimize GuC CT/Log compression flow

Zhanjun Dong (2):
  drm/xe: Remove extra newlines from LRC snapshot dump
  drm/xe/guc: Compress GuC log and CTB dump with zstd

 drivers/gpu/drm/xe/Kconfig            |  15 ++
 drivers/gpu/drm/xe/xe_devcoredump.c   |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c        |  31 ++--
 drivers/gpu/drm/xe/xe_guc_ct.h        |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h  |   3 +
 drivers/gpu/drm/xe/xe_guc_log.c       | 222 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_log.h       |  11 +-
 drivers/gpu/drm/xe/xe_guc_log_types.h |  20 +++
 drivers/gpu/drm/xe/xe_lrc.c           |   4 +-
 9 files changed, 281 insertions(+), 33 deletions(-)


base-commit: 83b6bc1390606facc1c0426727905f9fcd75836d
-- 
2.43.0

