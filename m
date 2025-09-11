Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C13CAC58F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 19:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1536910E166;
	Thu, 11 Sep 2025 19:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPzDSNZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6874D10E166
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 19:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757619405; x=1789155405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aHdtcdQaYqabziNUY2/wkYBQMAbcnysQ+E9kEnjlKkM=;
 b=WPzDSNZsfQALZSfQq20tbBI/0xVvQMC1EVpaB/qXx4flPQa9TtdHoyHS
 pBtoOLubL8GtllW0NQROmuCWliNWbGY30l7kqsRCOveyYjqmS+tdlws4W
 88DkaAOneFPjpA8n5OAJhcwhwkt4EU/v0Fc7wqt8oB53g83J9qyn7IQGc
 jyiY1f0wZTET1cWEEZ8BAuYdIZShMD4Yp7hDbXNtzft8MFBeBHtRthTkl
 VHB+aJDJtCypPa4xSA3rhuJuS21l26npia35EPw61hxPFdMrrCh+WHUcy
 GDYp4NsmFOCSgEz+GfRjGSdh3m7hy+fUlCkxA0lITwZPNCDEG5m/iyYfz A==;
X-CSE-ConnectionGUID: bmAWxR7QRyWicFAABgaq7Q==
X-CSE-MsgGUID: 3FsnAO6ZTVS0gAqmvpffJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="70582677"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="70582677"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 12:36:42 -0700
X-CSE-ConnectionGUID: qhCyxqdITKScnOZKZgRj2w==
X-CSE-MsgGUID: sfIU5kn5QPeMW2NkBY9R1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="204544705"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 12:36:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 0/6] drm/xe: Add user commands to WA BB via configfs
Date: Thu, 11 Sep 2025 12:36:24 -0700
Message-ID: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
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

This also prepares the codebase to use the same functions for mid
context restore.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
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
Lucas De Marchi (6):
      drm/xe: Update workaround documentation
      drm/xe/configfs: Fix documentation warning
      drm/xe/configfs: Extract function to parse engine
      drm/xe/configfs: Allow to select by class only
      drm/xe/lrc: Allow to add user commands on context switch
      drm/xe/configfs: Add post context restore bb

 drivers/gpu/drm/xe/xe_configfs.c | 369 ++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_configfs.h |   6 +
 drivers/gpu/drm/xe/xe_lrc.c      |  32 ++++
 drivers/gpu/drm/xe/xe_wa.c       |  45 +++--
 4 files changed, 414 insertions(+), 38 deletions(-)

base-commit: a841dfdd6d774671edaad441fb846f7a3230bb07
change-id: 20250523-wa-bb-cmds-2a81a7121fc2

Lucas De Marchi

