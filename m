Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A256ECD6F7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 23:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EA710E669;
	Wed, 11 Feb 2026 23:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRMh5dGO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF0D10E669
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 23:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770852859; x=1802388859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qWoS6A4ZV58vsd0RMqAxvwwia8bvNx57UtL2XRYPQeU=;
 b=VRMh5dGO8Jmkkwa58DYKmFk+vuZql+YcN4xt6rLrT8IqrrivTNZ0EA8Z
 fLorncf8GwtruCXsfOMrV8BXjW6GzRa+CjsjM8hJ0bUdHtBZ/fupCUj5D
 uwqZpfzNMpg0nDqChcL7wkZLRxiiv/Fj5eugP3e6lFlsRbubiTU9qHnaF
 mzlP2sLM4i1PNRVQouW8ZiR8F7NlDx7Llh0lynrTllO+QjZz/UizuWBdR
 mZma3UL7XNdCKsurrTDYPcw1yV8nxWmLzDIB8dO9kWa3nm7XN4aFW+K4A
 SYFpJbTpF3WKYju8rhNHhcVfvBrjmsChZ+k0OHS0fpJbMImLyWGVmcWKr g==;
X-CSE-ConnectionGUID: RaFm5S1XRnSPv0v1LtSCEA==
X-CSE-MsgGUID: 7Lj6CXt6SH6+sLdIC7GHEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="59585359"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="59585359"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:34:18 -0800
X-CSE-ConnectionGUID: hXrqdPz6TGWFbpxjbLMJ2w==
X-CSE-MsgGUID: BS8HNl47SIC5NN6PFuFj5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="216931312"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:34:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v2 0/4] Add debugfs facility to catch RTP mistakes
Date: Wed, 11 Feb 2026 15:34:12 -0800
Message-ID: <20260211233411.614951-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.53.0
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

Unlike i915, Xe doesn't currently do any readback verification of
workaround/tuning settings that it tries to program.  If an entry gets
placed on the wrong table, or applied to the wrong platform/IP, the
programming may be silently ineffective without anyone noticing.

i915's solution of doing verification at application time was
problematic because raising warnings during probe would be treated by CI
as a fatal problem and would prevent CI from even attempting any other
testing until the issue was dealt with.  Let's avoid that with Xe and
instead perform the verification on-demand when a debugfs entry is read.
This makes it very easy to do verification at various times during
manual debugging.  It should also be simply to wrap a dedicated IGT test
around the debugfs entry such that any unexpected failures are reported
against that one test rather than bringing down the entire CI system.

Note that verification of LRC programming is a bit more complicated than
verification of GT/engine programming since we can't just blindly read
the register values from the CPU and expect the RTP values to be in
effect.  Applying LRC progamming ensures that every GPU context created
should have the updated values in the LRC, and those values will get
loaded into the register when the hardware context switches to it.
However when no context is running on the hardware, the register values
may revert to their hardware defaults which do not have the programming
applied.  Instead, we should verify LRC programming by parsing the
engine's 'default LRC' image and making sure the desired programming
appears somewhere in one of the MI_LOAD_REGISTER_IMM state emission
commands.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>


Matt Roper (4):
  drm/xe/reg_sr: Don't process gt/hwe lists in VF
  drm/xe/reg_sr: Add debugfs to verify status of reg_sr programming
  drm/xe: Add facility to lookup the value of a register in a default
    LRC
  drm/xe/reg_sr: Allow register_save_restore_check debugfs to verify LRC
    values

 drivers/gpu/drm/xe/xe_gt_debugfs.c | 26 ++++++++
 drivers/gpu/drm/xe/xe_lrc.c        | 96 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  4 ++
 drivers/gpu/drm/xe/xe_reg_sr.c     | 71 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_reg_sr.h     |  7 +++
 drivers/gpu/drm/xe/xe_tuning.c     |  7 +++
 drivers/gpu/drm/xe/xe_wa.c         |  6 ++
 7 files changed, 215 insertions(+), 2 deletions(-)

-- 
2.53.0

