Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E2ED11193
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 18:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A43210E661;
	Wed, 26 Nov 2025 18:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3oeH4f3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C7C10E666
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183597; x=1795719597;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LOXmSARMo2HMvVo1IpBffMOrbOVJi/9gNs2tvPBRmyw=;
 b=e3oeH4f3EASV60X3p0QG15pi4BSWPqTQ+1WMENlGK4YU4ft3ADn9HE1m
 0ZWISaiZZPnZAKFfc7dDEf0WzPa/7iKW1sbgUj/vn5aKecNEuwWyb5GgR
 fSZ6I7SQy8WbT5djy+sval+R8BqCvEJQcPOji3PtfJwQjIIbInXmCTDO+
 +Y96u3XcmnOzFNMt/WfuNi4LXdHpFRpPATb95IZWZEKyE3JUp3QhrzK0L
 hY1U+zylIG573/VUy4iEbKAnZ5y2RHE7uIXQDilC+wMczy/hFKvvh3P8y
 ceTzMNt3Bni2h9Kv81QTIyke40Pkw0/b3zi9XKA91hX8lVCeRO+hm8Fui g==;
X-CSE-ConnectionGUID: fWZj9FIHQVW8DRYnaV4QoA==
X-CSE-MsgGUID: 3R0t5OopTo20F/h+lCf/WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66269516"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66269516"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:57 -0800
X-CSE-ConnectionGUID: dKMap9igRoumN3LQp2YeKQ==
X-CSE-MsgGUID: +3GN+NuMQuykbj+vJrNs+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193121208"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/9] Add support for Mesa GPU hang replay tool
Date: Wed, 26 Nov 2025 10:59:43 -0800
Message-Id: <20251126185952.546277-1-matthew.brost@intel.com>
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
v5:
- Rebase

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

 drivers/gpu/drm/xe/xe_exec_queue.c       | 26 +++++++++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 44 +++++++++++++-----
 drivers/gpu/drm/xe/xe_lrc.h              |  4 +-
 drivers/gpu/drm/xe/xe_lrc_types.h        |  3 ++
 drivers/gpu/drm/xe/xe_vm.c               | 57 +++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h                |  9 +++-
 8 files changed, 130 insertions(+), 18 deletions(-)

-- 
2.34.1

