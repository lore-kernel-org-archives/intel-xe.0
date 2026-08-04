Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A373FC55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 06:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4504C10E861;
	Tue,  4 Aug 2026 06:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgQnKhgN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C477D10E11A;
 Tue,  4 Aug 2026 06:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785825062; x=1817361062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bvb90hmncxjmVI1dfzr0qk1Ou1G/kikG6niYKybZmm4=;
 b=QgQnKhgNxE5fCOc+bnIlZ69KfwFU+21SSSDGXGXlrQhzhCluSe2AMp+a
 uRDDRMAFWl9dcUxjmds01O9KnfyZZww3SpEJQzePtWm/D9Q3ryjeq7YUW
 0PGMCyeaPVVGArXiHB9xxlFeNHqS8cSKU7r8MpsRCWSwAtkugxRNkUGPm
 XraqliRtGF5OwhH92TKBHZajacy/1Bh4YUcp/YVZdSFjHODsgwHdbWT7h
 oie6EEGw1Yx5S9AgjZ8Lq5Z3bNS7lNBvmXBvtMzArSzzrMa2LmDz9xUYd
 vnpk2/zbjzAuTLpFV+IVugT8S8D7oSTZnaUtjJ0uLtNw3wg/+1atp8hRE A==;
X-CSE-ConnectionGUID: TZ1xpuISQ7GxccAmoGMjkg==
X-CSE-MsgGUID: xaOMOnRbQWiKHku/v8QzwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="90179798"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="90179798"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:31:00 -0700
X-CSE-ConnectionGUID: 1neKvEyOSE6b5A/+Ac1g8w==
X-CSE-MsgGUID: pXVTbK34RZi9EpMED6wfig==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2026 23:30:59 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 0/2] drm/i915/flipq: Fix cursor left enabled after a pipe
 disable
Date: Tue,  4 Aug 2026 06:30:55 +0000
Message-ID: <20260804063058.969207-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

IGT's kms_cursor_crc reproducibly triggers:

  cursor D assertion failure (expected off, current on)
  WARNING: .../intel_display.c:406 at assert_plane+0x11e/0x140 [xe]

from assert_planes_disabled() during a modeset pipe teardown, even
though the cursor plane is correctly targeted for disable and its
software state tracks it as disabled. The hardware register is never
rewritten because a stale flip queue entry from an earlier, unrelated
commit is discarded without invalidating the cursor's register
write-cache, so the disable update believes hardware already matches
and skips the write.

Patch 1 adds an explicit flip queue drain right before pipes have
their planes synchronously disabled, so a queued-but-not-yet-executed
update can no longer be left dangling past that point.

Patch 2 fixes the actual root cause: intel_flipq_reset(), which patch 1
(and pipe DMC firmware (re)load) calls to discard a flip queue's ring
buffer, did not invalidate the cursor's register cache, so a discarded
write could be silently "forgotten" while software still believed it
had taken effect. The cache is now invalidated whenever the queue is
reset, forcing the next update to always rewrite the real registers.

Mika Kahola (2):
  drm/i915/flipq: Drain the flip queue before disabling pipe planes
  drm/i915/flipq: Invalidate cursor register cache on flip queue reset

 drivers/gpu/drm/i915/display/intel_display.c |  2 ++
 drivers/gpu/drm/i915/display/intel_flipq.c   | 28 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_flipq.h   |  1 +
 3 files changed, 31 insertions(+)

-- 
2.43.0

