Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FC9D637D7
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 02:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E4710E791;
	Thu, 14 Nov 2024 02:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZT4qhNyS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584B910E0E6
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 02:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731551090; x=1763087090;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WRbWoQo7eEhT1mLXqtWi6E576TuZuydOExGJoQGXYrU=;
 b=ZT4qhNySil4Y3PDY5DTUUxUbuxr9foVPK4IBEhVGBCDawtXa6OvVubRk
 Y5BMMIyTJZ29tVDxHjDTQmvEj9iz8CARCCRIGdA+NgXe3mSsIdgkGxMz0
 kvRitA/dxx9QIq2eAwfO8uBp+5ktweXpEPvjVD7r6HLYYqz72roeMmvVf
 BQY1cSpW2WSTtQ9Wg663tyOEv3dmY5GFLd2xEMqp9MgLpVQgdwcVUfjzY
 wwoONua4QxQxqDkB7311FzVfwtefUqXY5Rde5h9TTw65hZGHOsFHj6MxC
 3xcGJJfPuiiA8DgjzklUR2elD2ki2UiLpN4u5c1wQcFOOxofBmzG7cHGZ w==;
X-CSE-ConnectionGUID: 7dvOj0wCR3+6tfMVDuNv0w==
X-CSE-MsgGUID: FmF0YHKqSTSPF1wpZBGPXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31576656"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="31576656"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 18:24:49 -0800
X-CSE-ConnectionGUID: 4oy2sUuORQS1SL90x3+kkQ==
X-CSE-MsgGUID: Zij44zRETge42vIAtwKh+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93110569"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 18:24:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/7] Devcoredump Improvements
Date: Wed, 13 Nov 2024 18:25:15 -0800
Message-Id: <20241114022522.1951351-1-matthew.brost@intel.com>
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

Mainly enabling devcoredump for LR queues. Missing is engine capture
from Zhanjun worked on to find one manually or from the GuC. Can be done
in a follow up.

v3:
 - Send correct code
v4:
 - Fix build error, reorder patches

Matt

Matthew Brost (7):
  drm/xe: Add xe_ring_lrc_is_idle() helper
  drm/xe: Add ring address to LRC snapshot
  drm/xe: Add ring start to LRC snapshot
  drm/xe: Add exec queue param to devcoredump
  drm/xe: Improve schedule disable response failure
  drm/xe: Change xe_engine_snapshot_capture_for_job to be for queue
  drm/xe: Wire devcoredump to LR TDR

 drivers/gpu/drm/xe/xe_devcoredump.c       | 16 ++++++-------
 drivers/gpu/drm/xe/xe_devcoredump.h       |  6 +++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 --
 drivers/gpu/drm/xe/xe_guc_capture.c       | 29 ++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_capture.h       |  6 ++---
 drivers/gpu/drm/xe/xe_guc_submit.c        | 20 +++++++++++-----
 drivers/gpu/drm/xe/xe_hw_engine.c         |  8 +++----
 drivers/gpu/drm/xe/xe_hw_engine.h         |  4 ++--
 drivers/gpu/drm/xe/xe_lrc.c               | 26 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h               |  4 ++++
 10 files changed, 77 insertions(+), 44 deletions(-)

-- 
2.34.1

