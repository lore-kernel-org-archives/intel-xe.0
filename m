Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BE7CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 16:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4006910E247;
	Tue,  9 Sep 2025 16:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bb53xL8z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0217310E247
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757433775; x=1788969775;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Hl3kIf8VyuuYIcWTMWQgctMc5bDoqlAcl9DEtSKjx8=;
 b=Bb53xL8zV0Qtdk8MtTIFaXe5K4VZPqt56F8oOlKSrRs1tb6wa2180M6J
 nb0Eqoz8C/F/DLehMYOxcSgXT0xKNaEn86NCAi6GafjwyP5+KQ36C1pSh
 P+fsucw377yNt2+UwMfgTLSfHjF3D+lcrG3pLhre4I8ODAVQY1xyKxDqn
 P+42RKwnIWmSa5ZMBiL9yHvAIppznJwJ18K52/pVR1xYjWJPsmsHEGKJj
 6IriBQ6A+eO0LBc9ZcrzqNr7G4IvSabJk7xXQc5BJXJQHQAs2hKAGT/iN
 L2vRfIGeFPKQg2G0YsElY5bgj7yfs210fO+opIihnCm8CAkRcwZvkkHc2 w==;
X-CSE-ConnectionGUID: uBepR1nNRG+TzeF0d665Aw==
X-CSE-MsgGUID: 0u4Q0pVVSRmASnQkn7oypg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="47296491"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="47296491"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:02:53 -0700
X-CSE-ConnectionGUID: bVqOMwiGROW+rmVpgt1DXA==
X-CSE-MsgGUID: lWoEH6TVS3ih9ElSBCOBcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172993654"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:02:53 -0700
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
Subject: [PATCH v2 0/4] drm/xe: Use poll_timeout_us()
Date: Tue,  9 Sep 2025 09:02:34 -0700
Message-ID: <20250909-xe-iopoll-v2-0-4c7ae9726e8e@intel.com>
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
Changes in v2:
- Drop the change to pcode_try_request(). Adding the missing atomic
  handling would make the code more complex than it currently is
- Add patch to drop helper function as suggested by Maarten
- Make the wait functions simpler in xe_guc_pc.c
- Handle signal pending while waiting for lmem init
- Other minor changes as noted in the individual patches
- Link to v1: https://lore.kernel.org/r/20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com
---
Lucas De Marchi (4):
      drm/xe/device: Use poll_timeout_us() to wait for lmem
      drm/xe/guc_pc: Use poll_timeout_us() for waiting
      drm/xe/guc: Drop helper to read freq
      drm/xe/guc: Refactor GuC load to use poll_timeout_us()

 drivers/gpu/drm/xe/xe_device.c |  65 ++++++-----
 drivers/gpu/drm/xe/xe_guc.c    | 250 +++++++++++++++++------------------------
 drivers/gpu/drm/xe/xe_guc_pc.c |  36 +-----
 3 files changed, 146 insertions(+), 205 deletions(-)

base-commit: 8fe674bb9096ac6a63d4f4d57f035f045a0f98c1
change-id: 20250828-xe-iopoll-c0e1c4488ed4

Lucas De Marchi

