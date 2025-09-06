Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD63CA1012
	for <intel-xe@archiver.kernel.org>; Sat,  6 Sep 2025 05:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A78510E1A3;
	Sat,  6 Sep 2025 05:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnUUWTCk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8938110E1A3
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Sep 2025 05:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757137852; x=1788673852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fYhH90/ZByl4gYsgkamisgWqVp/iSDuBNLPkFEXATG8=;
 b=UnUUWTCkDwQ0QwurCM/RZp92QDjc8jzY0s2oszQCxfsrZWakq8HX71Nm
 l3vIeLfbuWi01j/3ItUbShHfZlL8+DNZUCh56hcR0Ef5ky9ac8LplFACk
 Q811BBPposd5FecrL1Exe24eQlZYx/k60CMvRj6mt4iWT8c1CGjuXRVf9
 zfZHjcAxg880ovTQSVTVu40ouE7STewH4tASlMdi2obNS/3vtSd3tAxpe
 4ApPY1IVQfaIO7Hm0ZX5U+J+rGVzBvPG8ST4ucqcFInl19/eA+Own5Rag
 RA4aafeGDcv0mPTXkIK+THNqv8Yf3aTlvLzn7xkloP91i+WmrsGhwhait A==;
X-CSE-ConnectionGUID: acZHcEAIRfavEZ+d7IXUBg==
X-CSE-MsgGUID: z1Ws4mOtS9qfyJBVrrF2Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59628637"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; d="scan'208";a="59628637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 22:50:51 -0700
X-CSE-ConnectionGUID: DA7f0pNMR0S0G4hwcnwOQg==
X-CSE-MsgGUID: 1FXRPBlkQRaHnMcFbpo+fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; d="scan'208";a="203262828"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 22:50:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 0/6] drm/xe: Add user commands to WA BB via configfs
Date: Fri,  5 Sep 2025 22:50:28 -0700
Message-ID: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250523-wa-bb-cmds-2a81a7121fc2
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

Integrate WA BB (aka post context restore bb) with configfs to allow
validation to experiment with the GPU, executing commands on every
context switch.

Setting some registers to experiment:

	# echo 0 > /sys/bus/pci/drivers_autoprobe
	# modprobe xe
	# mkdir  /sys/kernel/config/xe/0000:04:00.0
	# echo '
	rcs cmd 11000001 4F104 DEADDEAD
	rcs reg 4F100 DEADBEEF
	' > /sys/kernel/config/xe/0000\:03\:00.0/ctx_restore_post_bb
	# echo 0000:04:00.0 > /sys/bus/pci/drivers/xe/bind

Testing it worked with intel_reg:

	# intel_reg read mmio:4F100
	(0x0004f100): 0xdeadbeef
	# intel_reg read mmio:4F104
	(0x0004f104): 0xdeaddead

This also prepares the codebase to use the same functions for mid
context restore.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v3:
- Minor updates on first patches
- Fix kunit build (without CONFIG_CONFIGFS_FS)
- Fix use of binary attributes failing the expectation of a failed write
  producing an error code
- Link to v2: https://lore.kernel.org/r/20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com

Changes in v2:
- Drop other refactors and fixes already merged
- Add documentation and make sure it works with intel_reg
- Refactor command parsing to be able to easily extend it for other BBs
  to be added in future.
- Link to v1: https://lore.kernel.org/r/20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com
---
Lucas De Marchi (6):
      drm/xe: Update workaround documentation
      drm/xe/configfs: Fix documentation warning
      drm/xe/configfs: Extract function to parse engine
      drm/xe/configfs: Allow to select by class only
      drm/xe/lrc: Allow to add user commands on context switch
      drm/xe/configfs: Add post context restore bb

 drivers/gpu/drm/xe/xe_configfs.c | 367 ++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_configfs.h |   6 +
 drivers/gpu/drm/xe/xe_lrc.c      |  25 +++
 drivers/gpu/drm/xe/xe_wa.c       |  45 +++--
 4 files changed, 405 insertions(+), 38 deletions(-)

base-commit: 6a483fa08dd4b4f355b65acc8aa24a335baccd2b
change-id: 20250523-wa-bb-cmds-2a81a7121fc2

Lucas De Marchi

