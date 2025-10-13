Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B87CCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 22:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4886010E13A;
	Mon, 13 Oct 2025 22:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cF0sHKtW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E9910E0D3
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 22:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760394697; x=1791930697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/iIt5KRVmYXuAxml8Id7Q06K6o7o12/+wSjAQFc33sg=;
 b=cF0sHKtWuXqfKrSO4j7Ivm+ECYc6ZgiF0bpIgtyIr/xb02NGsVriF/Ro
 68tXGixit+f6aMPTjcDun3rnBJClVED3PsXm4GGG85XfDPuVkYSBz6lve
 /0g5trnjKtbDYpk9QeSosaDP8d4BagIKqxw1T8OskNt2xynrhal4GcpXI
 xYskfAyCMCg0NuZXiEQXwnKS/YQw3GTU7eqh9uREVc9bLgWOuddCBpHGw
 7gbldflQUtVjxNiwqAqvEiQ6VNLLA7L8n+nO+pgd1OpC32UdN/0Z+THrD
 IHDV6vKWKYuRDt03IUCYy7oNcO2L5P9HdIjqm5k9a1MVTEWKoR6mG0S7h g==;
X-CSE-ConnectionGUID: Fqy3solyS86xImYEFyi3lw==
X-CSE-MsgGUID: 1AKZWb8oT3C1uGeI5kzOVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="79987305"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="79987305"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:37 -0700
X-CSE-ConnectionGUID: 9Nkb3YfZSZevwVlJaesB0w==
X-CSE-MsgGUID: wwL8ICWzRbuwt3PfYTDJfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="212677573"
Received: from dut4084arlh.fm.intel.com ([10.105.10.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:31:37 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/7] Fix a couple of wedge corner-case memory leaks
Date: Mon, 13 Oct 2025 22:31:28 +0000
Message-Id: <20251013223135.189357-1-stuart.summers@intel.com>
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

Stuart Summers (7):
  drm/xe: Add additional trace points for LRCs
  drm/xe: Add a trace point for VM close
  drm/xe: Add the BO pointer info to the BO trace
  drm/xe: Add new exec queue trace points
  drm/xe: Correct migration VM teardown order
  drm/xe: Kick start GPU scheduler on teardown
  drm/xe: Check for GuC responses on disabling scheduling

 drivers/gpu/drm/xe/xe_exec_queue.c |  4 +++
 drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_lrc.c        |  4 +++
 drivers/gpu/drm/xe/xe_lrc.h        |  3 +++
 drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
 drivers/gpu/drm/xe/xe_trace.h      | 22 ++++++++++++++--
 drivers/gpu/drm/xe/xe_trace_bo.h   | 12 +++++++--
 drivers/gpu/drm/xe/xe_trace_lrc.h  | 42 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c         |  2 ++
 9 files changed, 111 insertions(+), 10 deletions(-)

-- 
2.34.1

