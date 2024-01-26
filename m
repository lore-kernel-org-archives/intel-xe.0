Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F715C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 22:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D8510FF44;
	Fri, 26 Jan 2024 22:46:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D16E10E240;
 Fri, 26 Jan 2024 22:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706309204; x=1737845204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OEpu9q0/fAi2wmSQur0rJtgTJ8D7dFIK5QtDEjeCkc4=;
 b=ZnGyPRQWQMQrCbypPSX2pnmiI3CFA18yMRh351Sv/jaKbkL+U106ocP+
 T+RJx3tRVjExORR/+GeWbU3r1UBFn1OowXsWvOcJpLf+43S5TSthPXvF/
 W78qtOSLannU1Rc8+P4/5MmmdBjdG+CzH8K7yvIhLwtvjdkgyLbeECFvS
 LRYAikfmeKGgVLCQSkYW7knAMqeZI2+IOUfY/NC6taAtYOADZiA9By/lf
 bRx/D+ntOU0qE4w9l0d+522xZ59M2XNxuypbXl2I6pwn5IUsf8yYvLxbM
 7nUVIv9wCDraA8n2b4qiODByEzP4IFafrWpSaCP9jKidg8k0nwkReUc3z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9982792"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9982792"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 14:46:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2714168"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 14:46:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915/display: Move some LNL registers
Date: Fri, 26 Jan 2024 14:46:35 -0800
Message-ID: <20240126224638.4132016-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

2 patches removed from the earlier batch of updates in LNL due to
using saved_port_bits which is not entirely correct.

This time, instead of the 2 preparatory refactor patches, just make sure
to set the the bits in later writes to DDI_BUF_CTL(). Notes that it's
not needed to set clear the bit in intel_dp->DP when disabling since the
enable part starts from scratch in intel_ddi_init_dp_buf_reg().

Lucas De Marchi (2):
  drm/i915/xe2lpd: Move D2D enable/disable
  drm/i915/xe2lpd: Move registers to PICA

 drivers/gpu/drm/i915/display/intel_cx0_phy.c  | 87 ++++++++++---------
 .../gpu/drm/i915/display/intel_cx0_phy_regs.h | 63 ++++++++++++--
 drivers/gpu/drm/i915/display/intel_ddi.c      | 60 +++++++++----
 drivers/gpu/drm/i915/display/intel_tc.c       | 16 ++--
 drivers/gpu/drm/i915/i915_reg.h               |  2 +
 5 files changed, 155 insertions(+), 73 deletions(-)

-- 
2.43.0

