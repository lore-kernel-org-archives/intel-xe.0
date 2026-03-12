Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C877FED2D1
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 05:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1587110E95B;
	Thu, 12 Mar 2026 05:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NW6ftYbV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA60910E41C;
 Thu, 12 Mar 2026 05:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773293428; x=1804829428;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ecj3BS+xKPb9gUEOYCz7jRigFfAe4jaLs3pzyp7TZ90=;
 b=NW6ftYbVng+lsbB7y8ZTEynguMBFA/w8V8AjTwueVc404x7UwupeaXqE
 0SgNwFYqkkt+RzZiRnZhERa+4N7Y1yVY8Qa8koPExgKNvc6Z/gtEDSCb6
 vK4Fbdy84qT0m1z1ZQcRh+xBZBiuvKdNwcfWuVhb+Nm/ZNv8e5ibUgmC5
 GPquBpYYPBTJXXJsZFyDQtD6b3uX3eqKAOVJTis+owaOUAdPZf6goIL8/
 oqaATHccFfFxMSj4yN/XkjQfTpC1VXjcZ+rzf40DucKZaRuVA+NJoNBsM
 ChiKJ8HUWqBqY38oX4cB/Ff3WoE7ahXO4ES3/A6ononsGLCUG75LyWeiU w==;
X-CSE-ConnectionGUID: 8AkCFE6/Q/ODUQ+Qv2rQRw==
X-CSE-MsgGUID: DIVXaOUkRICLSRq0qmDwww==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74253895"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74253895"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 22:30:28 -0700
X-CSE-ConnectionGUID: 6PWYtpv1TAKAM9nrg+yFSg==
X-CSE-MsgGUID: SIRBVKB+SxSM7x4c/nTRPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="258611019"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa001.jf.intel.com with ESMTP; 11 Mar 2026 22:30:25 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jouni.hogander@intel.com, imre.deak@intel.com, jani.nikula@intel.com,
 arun.r.murthy@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v7 0/3] Panel Replay BW optimization
Date: Thu, 12 Mar 2026 10:30:32 +0530
Message-Id: <20260312050035.3493690-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

Unused bandwidth can be used by external display agents for Panel Replay
enabled DP panel during idleness with link on. This patch series
enabling the same.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>

Animesh Manna (3):
  drm/i915/display: Add drm helper to check pr optimization support
  drm/i915/display: Panel Replay BW optimization for DP2.0 tunneling
  drm/i915/display: Disable Panel Replay for DP-tunneling without
    optimization

 drivers/gpu/drm/display/drm_dp_tunnel.c       | 17 ++++++++++
 .../gpu/drm/i915/display/intel_display_regs.h |  1 +
 .../gpu/drm/i915/display/intel_dp_tunnel.c    | 14 +++++++++
 .../gpu/drm/i915/display/intel_dp_tunnel.h    |  6 ++++
 drivers/gpu/drm/i915/display/intel_psr.c      | 31 +++++++++++++++++--
 include/drm/display/drm_dp_tunnel.h           |  6 ++++
 6 files changed, 73 insertions(+), 2 deletions(-)

-- 
2.29.0

