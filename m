Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF63DC3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A53A10E1B0;
	Wed,  7 May 2025 20:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naPkae78";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EB210E1B0
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746648856; x=1778184856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ib6KaPhEicpJUvtuNn1g/HdRkWpT4lgOdbRilBJTJSw=;
 b=naPkae78cvkWm+HnWbT0oRD1ltKf+2AfDVUkyIfBVXfhQhZC7IuJ9EcP
 AA4sSb1rqqKsVXeRH1tSehsIBQ00O1bWak1f6vvOaVtUrBGuG/AU9g6C4
 +0SVdIwqwCFvHOMBI+9HJdz8Zvh+5m8r2WrmsJ5P9fyRFjUnwFNgA/pHJ
 FLZr0xNj1dXqqKWtqMV+epo+gsqCwSjCnTSAv0K14edhl9PITHi3Z/cD2
 +B+EXdKI9qUrdelmZUKO6hKnJkGmTlqSQgardwzaDZQTyru/gugNs36cV
 PDCG21VVC8vL4VEqgYFIK3MgHDh0IjoMEIL8xX3i0gPlIIWTR/NV+TN2r g==;
X-CSE-ConnectionGUID: qEvQaYnRSauIAlm6WK4xLw==
X-CSE-MsgGUID: ghZK9gRLSdmsdNUpcQL/mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65935080"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="65935080"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:16 -0700
X-CSE-ConnectionGUID: Vg7AAOuiQFeV0m5VfexJvg==
X-CSE-MsgGUID: 8whNV/7/QByAWp2tcKFFKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136570988"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:14:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, carlos.santa@intel.com,
 sushma.venkatesh.reddy@intel.com
Subject: [PATCH v4 0/9] Add support for Mesa GPU hang replay tool
Date: Wed,  7 May 2025 13:15:30 -0700
Message-Id: <20250507201539.1316770-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add support for the Mesa GPU hang replay tool, which exists in the i915.

The main changes are as follows:

- Update devcoredump to include additional information, allowing the
  Mesa tool to extract everything it needs to replay a GPU hang. These
  updates are designed to remain compatible with the existing Mesa
  devcoredump parser.
- Introduce the DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE extension, which
  enables setting the execution queue state to the hung execution queue
  state.

v2:
- Enable the flag DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
- Fix the page math to avoid a crash
v3:
- Add pat_index and cpu_caching to properties
- A VM.uapi_flags  
v4:
- Fix null ptr deref
- Always setup default state first

Mesa PR:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34829

Matt

Matthew Brost (9):
  drm/xe: Add properties line to VM snapshot capture
  drm/xe: Add "null_sparse" type to VM snap properties
  drm/xe: Add mem_region to properties line in VM snapshot capture
  drm/xe: Add pat_index to properties line in VM snapshot capture
  drm/xe: Add cpu_caching to properties line in VM snapshot capture
  drm/xe: Add VM.uapi_flags to VM snapshot capture
  drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
  drm/xe: Add replay_offset and replay_length lines to LRC HWCTX
    snapshot
  drm/xe: Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE

 drivers/gpu/drm/xe/xe_exec_queue.c       | 25 ++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 44 +++++++++++++-----
 drivers/gpu/drm/xe/xe_lrc.h              |  4 +-
 drivers/gpu/drm/xe/xe_lrc_types.h        |  3 ++
 drivers/gpu/drm/xe/xe_vm.c               | 57 +++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h                |  9 +++-
 8 files changed, 130 insertions(+), 17 deletions(-)

-- 
2.34.1

