Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C73E9A04D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D2410E323;
	Wed, 18 Feb 2026 22:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="io75LsMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854C610E323
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771452589; x=1802988589;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=Rof9GyUUaMo/uM3Su+V5iaGVCYhRPRITaBJ1XfaTSnM=;
 b=io75LsMmlR8uTzPDtra4GEN0nGp1CspGjGGDMkCmKZsfQZYN2M7aIBy5
 bWI7k2THMZ7m5NawrKEI7IW+tig89K1o36OgvrsMXVTXx6ggDfELPUfBN
 1KrSmCEliE04PD7Mara85tEqWYXiS7DS4nkaHSGLQpNBGfP0D+GAM4V8a
 ED+s+IG7EMwzwCb/4LZ4jvxyMGWy+oCmFSbDY5RY8qg14TKHXKi/Z6zxs
 XLzWCFfB/W6R5gQTR8qSwPXsBAzZm2saD1uRdWjSD+BynOlMdn6N69GIn
 EtO7PMaPGP++lkycnc14pQOhsbUICLW/7jwpgFO3pYt901cao87dOB6nM w==;
X-CSE-ConnectionGUID: uDNzJqknTye+tnO7ZdQrHA==
X-CSE-MsgGUID: v+gdFFSQTeOlvs3VBS6udw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76399064"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76399064"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:09:49 -0800
X-CSE-ConnectionGUID: XWV4NhKJSK24b4weDAVtXA==
X-CSE-MsgGUID: 8sgwPJqfRdSX3zh5z+1beQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214329406"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:09:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v4 0/4] Add debugfs facility to catch RTP mistakes
Date: Wed, 18 Feb 2026 14:09:11 -0800
Message-Id: <20260218-sr_verify-v4-0-35d6deeb3421@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIg4lmkC/03MywrCMBCF4VcpszZhkkgvrvoeIpKmExuwTZmEq
 pS+u8GVyw/O+XdIxIESXKodmLaQQlwKzqcK3GSXB4kwFoNGXaNWrUh838rFf0TTDtrgoNA6D2W
 /Mvnw/rWut2LPcRZ5YrL/BYOIne5kY7RSRtRitjlP9JKj5LgS92HJ9JQuznAcX9JFVF2fAAAA
X-Change-ID: 20260218-sr_verify-78b230b10acf
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Harish Chegondi <harish.chegondi@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4630;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=Rof9GyUUaMo/uM3Su+V5iaGVCYhRPRITaBJ1XfaTSnM=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpljisf5k+Qi30vBOQyg3grc5uCLudtA2XVivxr
 fEuhDXqBYeJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZY4rAAKCRBNeSQFyHKQ
 BEuGEACuEMssdOewYr9BLd0EooICJzwqGwhRCYqPSslYy8i9fvBa4lfW3ZxLrVxPTVEgapF18WK
 ZRKPivG12OQh6aC8D5Qsyk/Oc2mkh3XQ4MNo3W72aU5ZzQi3PXOlqKSw3ms0WlcrsO2bhG6mjsM
 VDd4MFgz1Ii8MI8K2X0ukFalsqpo758hD4G7luWy9/GQ1bGuG9RZVg6bcSpZ/RTgRW6CPn1DkVF
 QQDgnEUTSCV9gHMNURNGOgMyuFYDGpcArVeGrnxTyWUBnJtyJVixaXzpKKZ/u/1I3E8pcefj4H+
 RYl5HOQakU7D5SqRq+8ZibNEGnmbckdE1jbUvMtwTXuqS2CUIWR0TplrBcJ03fb0ylrp0Y5H3SC
 GXfRiUvUV4aHopUXo0jEguBLGW0ivz6qMlber0tOyrA0tMFP3LkjY/lWdstS6jY3H4KvDxiiLF9
 fdUau6Ugk7wlivi6NJvqBAqQnZvSdDIzlIohmSAvyBYrrcLhVRqoUieoL9R1xArfZ01amOIVCSo
 e0axYehVFDDmVqnzpxOrN/EDp5U/NMqBXjA+LRG3PsunH6GVEKNjCR9skeQpRjAagm/NRFqqhuR
 f+8052BwzX5UMA+DLoP0U0fqNCGbYCvrPTqNIokqzzdavsK8A2zeNCNyLxhUowaJQaw8SNVtyHF
 KbJWDmp/DW3r8qw==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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
effect.  Applying LRC programming ensures that every GPU context created
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

v4:
 - Add an extra parameter to xe_rtp_process_to_sr() to determine whether
   the RTP -> sr processing should be performed for SR-IOV VF devices or
   not, rather than adding the VF conditional checks to the callsites.
   (Ashutosh)
 - Fix a missing parameter to kerneldoc for xe_reg_sr_lrc_check.

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

To: intel-xe@lists.freedesktop.org

--
2.53.0

---
Matt Roper (4):
      drm/xe/reg_sr: Don't process gt/hwe lists in VF
      drm/xe/reg_sr: Add debugfs to verify status of reg_sr programming
      drm/xe: Add facility to lookup the value of a register in a default LRC
      drm/xe/reg_sr: Allow register_save_restore_check debugfs to verify LRC values

 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  3 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c     | 26 +++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c      |  6 ++-
 drivers/gpu/drm/xe/xe_lrc.c            | 96 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h            |  4 ++
 drivers/gpu/drm/xe/xe_reg_sr.c         | 72 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_reg_sr.h         |  7 +++
 drivers/gpu/drm/xe/xe_reg_whitelist.c  |  2 +-
 drivers/gpu/drm/xe/xe_rtp.c            |  8 ++-
 drivers/gpu/drm/xe/xe_rtp.h            |  3 +-
 drivers/gpu/drm/xe/xe_tuning.c         |  9 ++--
 drivers/gpu/drm/xe/xe_wa.c             |  9 ++--
 12 files changed, 231 insertions(+), 14 deletions(-)
---
base-commit: 7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5
change-id: 20260218-sr_verify-78b230b10acf

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

