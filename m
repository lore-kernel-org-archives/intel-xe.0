Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C574FCAC58F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 17:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FC810E3B9;
	Thu, 11 Sep 2025 17:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/bXZ6hX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3498610E282
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757611538; x=1789147538;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CEtolK/aHh/m44d61AM+r6Z8JWZmj7LpbYQCZG0vn4Q=;
 b=H/bXZ6hXoEEtUqKztdT4NYbILvC3bAiE4I170sYOuilsSH8l/OrpiNiB
 PLwS3pBMtdQZnVXbfBysQfChP5J5vS4+vSuDRORKSRzdqqdHK2KpIkecD
 B6jRG6m55aNW4oycXpjvigqEWzZ959tisIY3/frL7sKMCJI8VdOma/e6L
 729EpRw4cAAVUe4xK16cOjb0aq/Sx13D6LFm9SF9jEgm3clVMOoz52Dyo
 RFWx1A4fBkY0hYhGB2yfmnDcnR5cI/Abi9wOaNkzf7tBPVqVBOonH7u7A
 YoGfkcr8vTMStRHtsJedxpQfviDoojO8WZGtbp9/WdQGJrmAPp/0fVouI g==;
X-CSE-ConnectionGUID: cuCN5m9NRZ+U302yYNmfuQ==
X-CSE-MsgGUID: mA4wTSYRRjymm/7+N1j8fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59810764"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="59810764"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:38 -0700
X-CSE-ConnectionGUID: kp0NniQWTgGRmP3HS3YcdA==
X-CSE-MsgGUID: KJOnXcr2Q1+JqZ7h9R1gXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178956833"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 10:25:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 0/5] drm/xe: Use poll_timeout_us()
Date: Thu, 11 Sep 2025 10:25:18 -0700
Message-ID: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250828-xe-iopoll-c0e1c4488ed4
X-Mailer: b4 0.15-dev-b03c7
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

This starts using poll_timeout_us() throughout xe. Tested only by
probing xe on BMG and I haven't seen any difference.

Size-wise, it's pretty much the same thing as open coding the loops:

	add/remove: 2/0 grow/shrink: 6/1 up/down: 254/-128 (126)
	Function                                     old     new   delta
	pcode_mailbox_rw                               -     159    +159
	__xe_guc_upload.isra                        1481    1522     +41
	__pfx_pcode_mailbox_rw                         -      16     +16
	wait_for_lmem_ready                          688     701     +13
	xe_device_probe_early                        549     560     +11
	wait_for_pc_state.constprop                  213     222      +9
	xe_guc_pc_apply_flush_freq_limit             390     394      +4
	wait_for_pc_state.constprop.cold              24      25      +1
	__xe_guc_upload.isra.cold                    787     659    -128
	Total: Before=2806317, After=2806443, chg +0.00%

I adapted a few timeouts since now we are not increasing it
exponentially.

Also note that this can't really be applied right now in drm-xe-next:
we need to wait a backmerge to get poll_timeout_us() to propagate back
after it's merged from drm-intel-next. But it's already sufficient to
start some reviews and broader CI test.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v3:
- A few more tweaks in xe_guc_pc
- Split last patch so print_bootrom_ukernel_err() is added on its own
  patch
- Link to v2: https://lore.kernel.org/r/20250909-xe-iopoll-v2-0-4c7ae9726e8e@intel.com

Changes in v2:
- Drop the change to pcode_try_request(). Adding the missing atomic
  handling would make the code more complex than it currently is
- Add patch to drop helper function as suggested by Maarten
- Make the wait functions simpler in xe_guc_pc.c
- Handle signal pending while waiting for lmem init
- Other minor changes as noted in the individual patches
- Link to v1: https://lore.kernel.org/r/20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com
---
Lucas De Marchi (5):
      drm/xe/device: Use poll_timeout_us() to wait for lmem
      drm/xe/guc_pc: Use poll_timeout_us() for waiting
      drm/xe/guc: Drop helper to read freq
      drm/xe/guc: Extract function to print load error
      drm/xe/guc: Refactor GuC load to use poll_timeout_us()

 drivers/gpu/drm/xe/xe_device.c |  65 ++++++-----
 drivers/gpu/drm/xe/xe_guc.c    | 250 +++++++++++++++++------------------------
 drivers/gpu/drm/xe/xe_guc_pc.c |  42 ++-----
 3 files changed, 152 insertions(+), 205 deletions(-)

base-commit: a841dfdd6d774671edaad441fb846f7a3230bb07
change-id: 20250828-xe-iopoll-c0e1c4488ed4

Lucas De Marchi

