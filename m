Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C45ACAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C322610E858;
	Thu,  2 Oct 2025 23:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2eeGe4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C546A10E0CF
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759446287; x=1790982287;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2at5qFNv75SlWPiKJ52DrO8sSS6rQGKSD3sAK0XIZS8=;
 b=Y2eeGe4moYQiDfCqQYk06M5vQzvKCng4/1nIou3vYmve5ghCyevGzEjj
 Bc1c/1DvVahw32qmo9VtMkAGRthmXZOtNSc2BOiu0yKI7AnTdjQ6VugKO
 ujgAkXvlctJNM9DAvY6RugXf2a3aw8a49B6eLh2dN0ci/drBTDnlpmT84
 oEL1sQ31rzS/RpsOKZ0Op3RiAFg9XYYSZDFbACk3JI0GpoMmBgvrh6IPp
 mSjmmYhxeEHQBeLpQ8FNIVi/kKV5M3vYmysWi469nnIj/aYeETBNbRUTU
 Etmv8sSE2zfpHaD6nP4VZYtc2/Sxy43YalF44n4/0MSXUQ+MX6yvQir+Y w==;
X-CSE-ConnectionGUID: X3F+D1DnQ1qHZBrMmlUsmQ==
X-CSE-MsgGUID: 1L5QkH4sSWKcl0kaExSm2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79165576"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79165576"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:47 -0700
X-CSE-ConnectionGUID: e+2+uvkORRmGQmDHu6AcsA==
X-CSE-MsgGUID: Pv2edYhcQ2KGdkQ470sF/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179566713"
Received: from dut4351arlh.fm.intel.com ([10.105.10.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:46 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/7] Fix a couple of wedge corner-case memory leaks
Date: Thu,  2 Oct 2025 23:04:37 +0000
Message-Id: <20251002230444.313505-1-stuart.summers@intel.com>
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

Stuart Summers (7):
  drm/xe: Add additional trace points for LRCs
  drm/xe: Add a trace point for VM close
  drm/xe: Add the BO pointer info to the BO trace
  drm/xe: Add new exec queue trace points
  drm/xe: Handle missing migration VM on VM creation
  drm/xe: Don't send a CLEANUP message on sched pause
  drm/xe: Check for GuC responses on disabling scheduling

 drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 37 +++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_lrc.c        |  4 +++
 drivers/gpu/drm/xe/xe_lrc.h        |  3 +++
 drivers/gpu/drm/xe/xe_trace.h      | 22 ++++++++++++++--
 drivers/gpu/drm/xe/xe_trace_bo.h   | 12 +++++++--
 drivers/gpu/drm/xe/xe_trace_lrc.h  | 42 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c         |  2 ++
 8 files changed, 118 insertions(+), 11 deletions(-)

-- 
2.34.1

