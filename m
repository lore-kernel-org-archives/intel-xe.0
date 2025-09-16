Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AACCAC592
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 21:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF4110E80F;
	Tue, 16 Sep 2025 21:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gksq/6h7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A1F10E555
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 21:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758057363; x=1789593363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j3OFszoeEwZ+PXLWw/6Zk0Jo1EuPyvEzv+InU6UmSdM=;
 b=gksq/6h7vquLZLVcd392hxp/8+rHUxm+JV4THIbdZWqgui54ci2CKK3d
 OmK3CeP3NkKWaHOSRhpC59lIB+Kvz8tkQhJL0jfl/BGi0sxO3DygQkXw1
 BxS0xaHlYQFLxT06225HgwN3DCjRnfWIOy4s0m/q97v6IRIPKxq2W9lDT
 Pl96BSiwsr58XXwS1IXItC3KMUwbkwzEPbMOZi7+4wbeURmULfaTygbak
 7hoDwOPx76XyEFNmxrYsu5zo51gdd0ItuNFoWuYL9T8cYG0HSv7s8YsY2
 t9lFABKGwpud23pPWjKvlU9dnI/ZjuLYxmY02KOJfIvvsOYC8K7Dl4byi w==;
X-CSE-ConnectionGUID: l0wGhAUrQX6J5IR2hM0g2Q==
X-CSE-MsgGUID: 8aoFfISLSZ2HSJIzY+nNuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="82949097"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="82949097"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:03 -0700
X-CSE-ConnectionGUID: Pit0Rw23ThmZv1qfM+DWkg==
X-CSE-MsgGUID: dvHk3SgvTkCsT6MXldUtDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="175146053"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:16:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 0/7] drm/xe: Add user commands to WA BB via configfs
Date: Tue, 16 Sep 2025 14:15:37 -0700
Message-ID: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
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
	# mkdir  /sys/kernel/config/xe/0000:03:00.0
	# cat > /sys/kernel/config/xe/0000\:03\:00.0/ctx_restore_post_bb  <<EOF
	bcs cmd 11000001 4F100 cafebabe
	vcs cmd 11000001 4F104 0FF1CE
	rcs cmd 11000001 4F108 BAADF00D
	EOF
	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
	# intel_reg read mmio:4F100 mmio:4f104 mmio:4f108
                                    (0x0004f100): 0xcafebabe
                                    (0x0004f104): 0x000ff1ce
                                    (0x0004f108): 0xbaadf00d

Same thing can be done with ctx_restore_mid_bb (as long as the register
is not overwritten during the engine restore phase). Which one to use
depends on the purpose of the debug.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v5:
- First patches that were just tangentially related (and actual fixes)
  already applied
- Add new patches to support mid context restore (aka INDIRECT_CTX in
  the LRC)
- Link to v4: https://lore.kernel.org/r/20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com

Changes in v4:
- Taint the kernel
- Link to v3: https://lore.kernel.org/r/20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com

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
Lucas De Marchi (7):
      drm/xe/configfs: Extract function to parse engine
      drm/xe/configfs: Allow to select by class only
      drm/xe/lrc: Allow to add user commands on context switch
      drm/xe/configfs: Add post context restore bb
      drm/xe/lrc: Allow INDIRECT_CTX for more engine classes
      drm/xe/lrc: Allow to add user commands mid context switch
      drm/xe/configfs: Add mid context restore bb

 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |   3 -
 drivers/gpu/drm/xe/xe_configfs.c        | 418 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_configfs.h        |  10 +
 drivers/gpu/drm/xe/xe_lrc.c             |  83 ++++++-
 4 files changed, 484 insertions(+), 30 deletions(-)

base-commit: c3610fc0ab7c1c668031b3804549187d75550e93
change-id: 20250523-wa-bb-cmds-2a81a7121fc2

Lucas De Marchi

