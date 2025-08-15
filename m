Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE677CA0EDC
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 02:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F73F10E346;
	Fri, 15 Aug 2025 02:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQ28W4eo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE9210E0E6
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 02:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755226571; x=1786762571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O32u7WBEGNIjISU8nxNwfZNxo7gs7YbCMvFGseJYCIg=;
 b=QQ28W4eoRJgjXvdVBC+IDt6i+EO/5anfHR1E6bLVrFy02xtIkm7ledPu
 FoEpq/4eOogztJFYDor4QAr9eLjf4N2dSa54UdEyzYxMemoy9AVJCpueF
 jNM2drvwyYPX2lqlhC5xGd6/UJEJkrGL1O8rbusnEfmPKvx0InQQIqwrA
 ejUPgd28bXItjAKWxrfQ+tKTA7TJsEMXBLaBi0AWidB474+FYGE2nOmHt
 05PLH4K4aa0fp6rncYZaqPArAsB0S+1NYj5zZKlmG00htstMySir/qXUv
 XBn7pLNuCQD7ZiKH8uZ7Xxx7OAhQoDYgG6uwmYToDEF2cB8z2brDEe2pd A==;
X-CSE-ConnectionGUID: vWrjYmcrTIWLHpxCEU9AZw==
X-CSE-MsgGUID: rWGnP/TPSiOxtK/Ztoyxkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="80132809"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="80132809"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 19:56:10 -0700
X-CSE-ConnectionGUID: mfRhzGcsQleV/Q2qykkVYw==
X-CSE-MsgGUID: VqEam/K4Soa6AWF2Yhgypg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="166401611"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 19:56:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, tomasz.lis@intel.com, stuart.summers@intel.com
Subject: [PATCH 0/3] Core Xe changes preparing for VF resume
Date: Thu, 14 Aug 2025 19:56:02 -0700
Message-Id: <20250815025605.2387080-1-matthew.brost@intel.com>
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

Fixup a few known issues in Xe core code ahead of VF resume feature.

Small behavior changes in LR jobs, these now can be resubmitted. LR
queue's now have DRM scheduler flow control too which renders
xe_exec_compute_mode.non-blocking invalid.

Matt

Matthew Brost (3):
  drm/xe: Take preemption into account when resubmitting jobs
  drm/xe/guc: Track pending-enable source in submission state
  drm/xe: Track LR jobs in DRM scheduler pending list

 drivers/gpu/drm/xe/xe_exec.c            | 12 +---
 drivers/gpu/drm/xe/xe_exec_queue.c      | 19 ------
 drivers/gpu/drm/xe/xe_exec_queue.h      |  2 -
 drivers/gpu/drm/xe/xe_guc_submit.c      | 82 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++--
 drivers/gpu/drm/xe/xe_sched_job_types.h |  5 ++
 6 files changed, 96 insertions(+), 47 deletions(-)

-- 
2.34.1

