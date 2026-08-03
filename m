Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB66C55196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 18:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922D110E098;
	Mon,  3 Aug 2026 18:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bk5l0xIp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907F310E098;
 Mon,  3 Aug 2026 18:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785782023; x=1817318023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wAAOOPjFW8E3S7KVznrlkawoUhx1qNqt9HdXdrhNeS4=;
 b=bk5l0xIpnVMhHyxtxBDb5iJG5HUnf3DAkq6oTW3nJsxpHQ19bnt126Vc
 8H37QuMZtUdE/dEspCSxHBX6fPbcMWCIE2oxVBmQDPikMrZQZJjWV8esH
 Q6MB/CgjXvit5WrM9NU/58G9lV7Wo6Wp9LXWLjRTJJQmvghqDMnM2zh3E
 dUMUU6hVqQvUE3j+o/PTMs1cYqzqO9E0JuB1jmV3sk9icgNPhYjlV+TDQ
 ALGiZCHrvPmcaPcZPkVKEXpd5f+ZreM3R1NynFHjT0hzhwuet3ojYcrSk
 A2pWdB8YPZ8Qdvugx1gaDVJQjcEVSQzMGSP+WxZyEdPnAaFsZe+Wn1yN2 Q==;
X-CSE-ConnectionGUID: uY3G26NETXiDXJFls4NkOA==
X-CSE-MsgGUID: qjJ9nMpNT9CDnDGdxTS24A==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="90214481"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="90214481"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 11:33:42 -0700
X-CSE-ConnectionGUID: FrMghYBqScCct61/CsVI9Q==
X-CSE-MsgGUID: eJU/y35DTvyr0e+xN0+cgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="291228595"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 11:33:41 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 0/2] drm/i915/display: Enable AS SDP Skip Frames
Date: Tue,  4 Aug 2026 00:23:03 +0530
Message-ID: <20260803185305.562609-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
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

When Panel Replay is active the transcoder timing generator runs at the
panel's maximum refresh rate, but content is often presented at a lower
rate. In that case the Adaptive-Sync SDP (AS SDP) only needs to reach the
panel often enough to satisfy its maximum frame time, so transmitting it
on every frame is redundant and shows up as repeated SDPs on the link.

Xe3LPD adds a HW skip-frame counter in PR_ALPM_CTL that lets the source
send a single AS SDP and then suppress it for a programmed number of
frames. Program this counter so that one AS SDP is followed by
(max_vrefresh / flip_rate - 1) idle frames, matching the effective
content rate and allowing the link to be driven down to as low as 1Hz
when the hardware supports it.

ToDo: Currently using CMRR debugfs as an interface to get the flip rate
from userspace, this will be extended to a property interface to receive
actual content fps as follow up.

Uma Shankar (2):
  drm/i915/display: Enable AS SDP Skip Frames
  drm/i915/display: Keep AS SDP flowing when skip frames is enabled

 drivers/gpu/drm/i915/display/intel_alpm.c     | 65 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_psr_regs.h |  2 +
 2 files changed, 62 insertions(+), 5 deletions(-)

-- 
2.50.1

