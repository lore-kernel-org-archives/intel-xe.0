Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBF5EEA871
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 00:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCD910E6CC;
	Fri, 13 Feb 2026 00:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrPAegZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4892610E161
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 00:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770941375; x=1802477375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zave7NEa39pS9K3jIB8hIjz1a1uJzGhITQ8hZbi7iS0=;
 b=nrPAegZ3+cnxdJrIIWThmDAgWZlfpeshbjjZCU68IBfxKTQzpOUtQRSS
 Y4fxkiDsh15xOPQvMrHb8Ewn8pTLY702vM5Txi9ZSc5vlNeXZvKBf6SHy
 bbmDFYE6/Ct+drQaOsdsa2iFYWiysiUZfnDEsQB0SzWuGLbhxP6ufRLQQ
 SQqwQzGfnsZ7Nto15YbdmjbfQkRDaE01gIGWhiaIK87dgCLV57BVHBrG3
 QcHiJxmMSdP0d1Yg3/HS+szsfKKjewkhQ2Evl1ri5xIrXRo8yrSXmEHof
 EiRc2ebnEJYtnuSvBGGxtOBSVU8q3E3WuWdVqu57FxibJGj3nHKkwZXtJ g==;
X-CSE-ConnectionGUID: jYShCGZCRkWudS4szlrXGg==
X-CSE-MsgGUID: 3xKCLjuySOmu2Yg7W+/2UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="94764094"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="94764094"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 16:09:35 -0800
X-CSE-ConnectionGUID: 2lVwx4doQ1qGfnxOXbfhzA==
X-CSE-MsgGUID: WV+KltxSRk+QcgmFBpFG/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="212595820"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 16:09:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v3 0/4] Add debugfs facility to catch RTP mistakes
Date: Thu, 12 Feb 2026 16:09:30 -0800
Message-ID: <20260213000929.732113-6-matthew.d.roper@intel.com>
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

v2:
 - Avoid processing RTP -> SR for gt/hwe lists in VF to ensure the
   debugfs entry is safe to use in an SR-IOV VF.  (Ashutosh)
 - Add verification of LRC adjustments by searching engine type's
   default LRC.

v3:
 - Add missing checks to avoid SR-IOV VF processing of RTP -> SR in
   hw_engine_setup_default_state() and
   xe_reg_whitelist_process_engine().

Matt Roper (4):
  drm/xe/reg_sr: Don't process gt/hwe lists in VF
  drm/xe/reg_sr: Add debugfs to verify status of reg_sr programming
  drm/xe: Add facility to lookup the value of a register in a default
    LRC
  drm/xe/reg_sr: Allow register_save_restore_check debugfs to verify LRC
    values

 drivers/gpu/drm/xe/xe_gt_debugfs.c    | 26 ++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c     |  3 +
 drivers/gpu/drm/xe/xe_lrc.c           | 96 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h           |  4 ++
 drivers/gpu/drm/xe/xe_reg_sr.c        | 71 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_reg_sr.h        |  7 ++
 drivers/gpu/drm/xe/xe_reg_whitelist.c |  3 +
 drivers/gpu/drm/xe/xe_tuning.c        |  7 ++
 drivers/gpu/drm/xe/xe_wa.c            |  6 ++
 9 files changed, 221 insertions(+), 2 deletions(-)

-- 
2.53.0

