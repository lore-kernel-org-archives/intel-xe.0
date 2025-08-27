Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B28CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 22:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB7F10E919;
	Wed, 27 Aug 2025 22:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HwLa0xYQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08A510E919
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 22:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756334165; x=1787870165;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vGAjHSpWem15a339QH8MFpCMWxs4vb5/JDUZO4Lo+Nw=;
 b=HwLa0xYQrJG/2brVNZhv9aYPsFqouuooEtzHkqiYqIXnEq3+IN1K9Bms
 K88yC1mILYvk2ry8GGLbNL+ZNGRs1fqKXtWRXufZDpxMVg46KgwVyB1aJ
 11eFn2CWqU59MZdvil26g3MerdRO38GJmnWhC2IpXREuEKgKUQVEerHrY
 slrxbBOQg+egHWxc7bW5ne26rrm7tSVDBbrzDOGVhg0jtLDL/wrVs2cPA
 x9PeiojSmDzlwD4AiQdggooQ5thh53GkDEP4Z+5zugAM4dCjgqsBrGVgR
 nyiG3R2M9v2TMheFIxGkl2LuEXycslwK1oxiUZDBNTxr3DotREDMgpyDm g==;
X-CSE-ConnectionGUID: wKTVGOCJQ7iaMaHBu2jrkw==
X-CSE-MsgGUID: 97lKGpC1T/+TVVMkB/ptnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69308114"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69308114"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 15:36:04 -0700
X-CSE-ConnectionGUID: ENYI+v/+Qo+DQHrTanKS+g==
X-CSE-MsgGUID: 7zK9tCxuR9u5FCA6KwsD+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170117858"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 15:36:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v2 0/6] drm/xe: Add user commands to WA BB via configfs
Date: Wed, 27 Aug 2025 15:35:25 -0700
Message-ID: <20250827-wa-bb-cmds-v2-0-3cdf4d63c72a@intel.com>
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
Changes in v2:
- Drop other refactors and fixes already merged
- Add documentation and make sure it works with intel_reg
- Refactor command parsing to be able to easily extend it for other BBs
  to be added in future.
- Link to v1: https://lore.kernel.org/r/20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com
---
Lucas De Marchi (6):
      drm/xe/configfs: Extract function to parse engine
      drm/xe/configfs: Allow to select by class only
      drm/xe: Update workaround documentation
      drm/xe/configfs: Fix documentation warning
      drm/xe/lrc: Allow to add user commands on context switch
      drm/xe/configfs: Add post context restore bb

 drivers/gpu/drm/xe/xe_configfs.c | 367 ++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_configfs.h |   6 +
 drivers/gpu/drm/xe/xe_lrc.c      |  25 +++
 drivers/gpu/drm/xe/xe_wa.c       |  45 +++--
 4 files changed, 406 insertions(+), 37 deletions(-)

base-commit: 6e22fa06326d0e47e6344ddf35b9d78bd5d00101
change-id: 20250523-wa-bb-cmds-2a81a7121fc2

Lucas De Marchi

