Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5287CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 22:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC3C10EAEE;
	Thu, 28 Aug 2025 22:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTREUcVY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF2110E00A
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 22:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756418719; x=1787954719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2dG1EsYfI+WaKaoXGKxGWwwM1lr6LgYlwD1Lt8bftxQ=;
 b=jTREUcVYOvzPwfC4aY1EHCIiRJv2rfKm7AFAk+PA8a10gNO3aSmKZyR3
 M5T+f6o67uNcDVCWwldDFsYvWcigjth4SzS7nGr5bSMUAkVDAhQedlBod
 V+Z5a6HBC6ZDVv0Ay6VqRE7krzH56MozMXt+aVvG79ZBh/WjdFwUu0sqk
 vhWvyefEcE2j9Dr3IP7/cF6cI9uc4b9oOSnw89ZrClbggiZsEs3xZlNyF
 FJxV7+rS0oucCr3nZ4Jx3dsGH8xYiey9VLFNkFJYMKEHL4A/DmsfdgF7M
 lVyw385R8TlZo0YjHDqipJeaHgyiPixXhE+lrRgRpuwpll90T9MatdVfw Q==;
X-CSE-ConnectionGUID: lf8q2l2WR8KR/mEJhAprLg==
X-CSE-MsgGUID: p6udwK9XSO2+dKknV6YqUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84106378"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84106378"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:05:18 -0700
X-CSE-ConnectionGUID: aAJSDg1tQ0iE42AKLhx2jQ==
X-CSE-MsgGUID: +cu/p3DKRWmvZGovsPU5JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170126758"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:05:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/4] drm/xe: Use poll_timeout_us()
Date: Thu, 28 Aug 2025 15:04:55 -0700
Message-ID: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
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
exponentially. We probably need to double check them to make sure we
have sane values.

Also note that this can't really be applied right now in drm-xe-next:
we need to wait a backmerge to get poll_timeout_us() to propagate back
after it's merged from drm-intel-next. But it's already sufficient to
start some reviews and broader CI test.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (4):
      drm/xe/device: Use poll_timeout_us() to wait for lmem
      drm/xe/guc_pc: Use poll_timeout_us() for waiting
      drm/xe/guc: Refactor GuC load to use poll_timeout_us()
      drm/xe/pcode: Refactor pcode_try_request() to use poll_timeout_us()

 drivers/gpu/drm/xe/xe_device.c |  50 ++++----
 drivers/gpu/drm/xe/xe_guc.c    | 269 +++++++++++++++++++----------------------
 drivers/gpu/drm/xe/xe_guc_pc.c |  40 +++---
 drivers/gpu/drm/xe/xe_pcode.c  |  33 +++--
 4 files changed, 176 insertions(+), 216 deletions(-)

base-commit: a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97
change-id: 20250828-xe-iopoll-c0e1c4488ed4

Lucas De Marchi

