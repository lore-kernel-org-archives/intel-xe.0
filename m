Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46201CCD194
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 18:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC6110E67A;
	Tue, 14 Oct 2025 18:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqQ3pXKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB89210E679
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 18:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760465369; x=1792001369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a6X9ZulqXaPJGAZ55UcnrrryJUDIv3HXS44RF8NHaz8=;
 b=aqQ3pXKdHkIxNqL4Mghm+c8u98RLyOsJMTBcuuJfaXU4XCQv9eJDSnYO
 PvLGpHz85F+3JPb3PP+KRjrRQ3Koma8pFp2x4jMEvR7pbNeQU/YSxV/Tq
 EYPI8GufesSDSyupy+gv8IHumqwa6snlnEWC8fFG/ya24R10uNuqmRxdC
 J1zRzw5dUb9D/65GbMisMH8rKLa2sZX0tZk1c4M78+XbljEhpjMrzCgws
 VU62O2kLmXFPav4iY413+iTxeRdZRQSe0NwxF5FVWtLxX8syfxXyx1bss
 M0hbNpxWnLEpUPisBDHWaL29pew2FFvUnwh6L2R8u5g5KIkWlKvPxdtpF w==;
X-CSE-ConnectionGUID: vTFSTrJjQRqCMhgiePB5vA==
X-CSE-MsgGUID: UuBkZE3ORSusiua66xK4Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66285415"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="66285415"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:09:28 -0700
X-CSE-ConnectionGUID: 7RZY9u9YT7qYoaH32gpnXw==
X-CSE-MsgGUID: iVcaC7crR76CYRP/LPAq5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="212570162"
Received: from dut4084arlh.fm.intel.com ([10.105.10.163])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:09:28 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/6] Fix a couple of wedge corner-case memory leaks
Date: Tue, 14 Oct 2025 18:09:21 +0000
Message-Id: <20251014180927.105077-1-stuart.summers@intel.com>
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

Most of the patches in this series are just adding
some debug hints to help track these down. I split
these up in case we want to pick and choose which ones
to include in the tree. I found them useful.

The main two interesting patches are the last two in the
series which are fixing some corner cases when the
driver becomes wedged in the middle of either communication
with the DRM scheduler or in the event the GuC becomes
unresponsive. In both of these cases there is a chance
we could leak memory around the exec queue members
like the LRC and the LRC BO. These patches fix those
scenarios.

v2: Address feedback from Matt:
    - Let the DRM scheduler handle pausing/unpausing
    - Still do the wait after scheduling disable/deregister
      as with the previous patch, but skip the intermediate
      software-based schedule disable using the "banned"
      flag and instead just jump straight to the deregister
      handling which will fully reset the queue state.
      Note that for this case I am seeing a hardware failure
      after submitting to GuC but before receiving the
      response from GuC. So even if we wedge in this case
      (monitoring the hardware state change), the queue
      itself is not wedged because of the active GuC
      submission (CT is not stalled at that point).
v3: Add back in the xe pause checks and instead just kickstart
    message handling in the guc_submi_fini() routine before
    doing the async wait there.
v4: Handle the CT communication loss during wedge asynchronously
    Also combine those last two patches into one to handle
    wedge cleanup generally.

Stuart Summers (6):
  drm/xe: Add additional trace points for LRCs
  drm/xe: Add a trace point for VM close
  drm/xe: Add the BO pointer info to the BO trace
  drm/xe: Add new exec queue trace points
  drm/xe: Correct migration VM teardown order
  drm/xe: Clean up GuC software state after a wedge

 drivers/gpu/drm/xe/xe_exec_queue.c |  4 +++
 drivers/gpu/drm/xe/xe_guc_submit.c | 26 +++++++++++++++---
 drivers/gpu/drm/xe/xe_lrc.c        |  4 +++
 drivers/gpu/drm/xe/xe_lrc.h        |  3 +++
 drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
 drivers/gpu/drm/xe/xe_trace.h      | 22 ++++++++++++++--
 drivers/gpu/drm/xe/xe_trace_bo.h   | 12 +++++++--
 drivers/gpu/drm/xe/xe_trace_lrc.h  | 42 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c         |  2 ++
 9 files changed, 107 insertions(+), 10 deletions(-)

-- 
2.34.1

