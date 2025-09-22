Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24F3CAC5AD
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 19:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9115510E50E;
	Mon, 22 Sep 2025 19:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDoQXMch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9125810E50B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 19:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758571127; x=1790107127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=djihIGpVhawZrh7cTxs6eU2TrK8wIZmTUVkpcOfHmHI=;
 b=FDoQXMchN88tZvxp6qGwumCI5bpKZk/caW7zkbQGqoufzDUrWBw3SkbP
 8uxOaR6RESn+a0HJDnthksFA45i+CS2ZYs9PORl3kevpAOxuLmoQvk7O1
 +jJ0OTb366yQT9bmEpdn9GRbFmdq9/tFHpZZQ0w47RH1zQdkZkz6a+X4h
 tdejPavwbYinC717qU/Wwi1N6cF1Fky1HcyLFBgbU0VZct5oob6KjNuaL
 74AY1CoVhferFGVuqxpE3waFmMDKO6Hp23cxS7TA4JHJtX4QSPC5XqqvH
 VMJRgZRvru4ARCvH1KyutY8mc880QcOs/wqjzzFpPrf96dZYd8L0BHLPY w==;
X-CSE-ConnectionGUID: P5Oo0FsvS6W8tL1MZKAwBg==
X-CSE-MsgGUID: kYntJc7dS5+gEeC87k3JWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72267346"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="72267346"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:58:47 -0700
X-CSE-ConnectionGUID: Nr11uFamSG26kupLfMBoeA==
X-CSE-MsgGUID: G/XX+tgpQ0+N3sEljMpJXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="207306242"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 12:58:46 -0700
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
Subject: [PATCH v4 0/5] drm/xe: Use poll_timeout_us()
Date: Mon, 22 Sep 2025 12:58:28 -0700
Message-ID: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
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
Changes in v4:
- Restore 20s timeout
- Move more error message inside the helper function
- Link to v3: https://lore.kernel.org/r/20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com

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

 drivers/gpu/drm/xe/xe_device.c |  65 +++++-----
 drivers/gpu/drm/xe/xe_guc.c    | 268 ++++++++++++++++++-----------------------
 drivers/gpu/drm/xe/xe_guc_pc.c |  44 ++-----
 3 files changed, 165 insertions(+), 212 deletions(-)

base-commit: 3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1
change-id: 20250828-xe-iopoll-c0e1c4488ed4

Lucas De Marchi

