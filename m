Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A68E6C5F7
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 03:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F0F10E8C2;
	Tue,  3 Dec 2024 03:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etFhWnOl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56BE10E8B8;
 Tue,  3 Dec 2024 03:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733197025; x=1764733025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vtIAVO+TjdkG34eSjwY3rY1mgt3tOS/ECW7F2+pD1ks=;
 b=etFhWnOlVLjNh1xNb0iN9QpTk8PWO+/ydSYOkiVs5nytCjUoqgk2NXAp
 6SMJeAVuoBF/eoGoLVmdJijzCcOacAK2GTtUVcBX8rzv6jZk3YNRr68iH
 XSL6HZTRjc4d2eeYagam3cqiq08W9vpXt2zt6MIrNo3SiscU7hvuq7mlA
 +n1QwnwvhnQXCxr8/5GQeHgpAgDIU8eHsHEXtxcPgcCyIS3lwRwf3yEzv
 b+kEsx4HIiSsmh4mFpeASyy/iDVhZFbLiECxZWlu8JLsRI291KxT1YGyu
 DRxPUemAlAOxfkGrvO1cv1r3CF5ECo3Lrl1qR6oar/ey7Yqnch/fK5mpt w==;
X-CSE-ConnectionGUID: NU6Ksuh3QTirWooZTj+0oQ==
X-CSE-MsgGUID: JpuxfdMyQsyCFTmXiEiPzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="20980531"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="20980531"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 19:37:05 -0800
X-CSE-ConnectionGUID: kerMH3bbTKWXRo28shYIwQ==
X-CSE-MsgGUID: NShqU1hHS7+MnpKsyykX5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="93388845"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa006.jf.intel.com with ESMTP; 02 Dec 2024 19:37:05 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 0/1] Maintenence of devcoredump <-> GuC-Err-Capture plumbing
Date: Mon,  2 Dec 2024 19:37:02 -0800
Message-Id: <20241203033703.3215624-1-alan.previn.teres.alexis@intel.com>
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

The GuC-Error-Capture is currently reaching into xe_devcoredump
structure to store its own place-holder snaphot to workaround
the race between G2H-Error-Capture-Notification vs Drm-Scheduler
triggering GuC-Submission-exec-queue-timeout/kill.

Part of that race workaround design included GuC-Error-Capture taking
on some of the front-end functions for xe_hw_engine_snapshot
generation because of the orthogonal debugfs for raw dumps of engine
registers without any job association. We want this to also be handled,
even if indirectly, by GuC-Error-Capture since there is a lot to manage
when it comes to reading and printing the register lists.

However, logically speaking, GuC-Error-Capture node management,
despite being the majority of an engine-snapshot work, is still
a subset of xe_hw_engine_snapshot.

This series intends to re-design the plumbing for future
maintenence and scalability, rearranging the layering
back to what its should be (xe_devcoredump_snapshot owns
xe_hw_engine_snapshot owns xe_guc_capture_snapshot)..

Alan Previn (1):
  drm/xe/guc/capture: Maintenence of devcoredump <-> GuC-Err-Capture
    plumbing

 drivers/gpu/drm/xe/xe_devcoredump.c           |   3 -
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |   6 -
 drivers/gpu/drm/xe/xe_guc_capture.c           | 406 ++++++++----------
 drivers/gpu/drm/xe/xe_guc_capture.h           |  10 +-
 .../drm/xe/xe_guc_capture_snapshot_types.h    |  68 +++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  21 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             | 117 +++--
 drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  13 +-
 9 files changed, 359 insertions(+), 289 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h

-- 
2.34.1

