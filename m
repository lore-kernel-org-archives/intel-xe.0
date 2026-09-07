Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B506BC79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695F610E02F;
	Mon,  7 Sep 2026 10:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tfk6bbo6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF1A10E02F;
 Mon,  7 Sep 2026 10:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788777466; x=1820313466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+W71k3T/E7ze5e2rP8qywqek9hP9wKnIMAqPT3/IX5E=;
 b=Tfk6bbo62Nh5+rih+YmFyMcUrJMjcHT+PvP3QxLur+eajdhuT3IiED3n
 MTO16zeBE3epd3efBFHzLF3713HUxNQLRdIlXSBi8PV5IqeP40Vb23gxk
 XzTO5Fh2fTnCVJREwCrwm+aUijxCpfP7JClT5t1N8ZducEg0xpBTHmIlO
 jGS/aE6hYf/fu8Xp1oPOzIYCSXJ45QeGBtc4dmnm2EaxHNtReNN6LV5xA
 A5w4cgzMMvpNIaa6Oop2znz+ZlycN5qXFBnw1gKtOVpSWljavh6pc03J2
 U1uZfSkv1aQ6qbzHRMw0BJ79dMLCoHQy2mr0tTJ8U6tKtlief2ayQ8meJ g==;
X-CSE-ConnectionGUID: 2CYh5VGxS2+QWgpXAclukQ==
X-CSE-MsgGUID: o/Xwmbx5QOKaZMmuk6Tj0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="111955874"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="111955874"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:37:46 -0700
X-CSE-ConnectionGUID: epddrH9ATGqP8BmvG3rd/w==
X-CSE-MsgGUID: ctCG/8YnTJygW9G7d0OQ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274827582"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:37:45 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
	jani.nikula@intel.com
Subject: [PATCH v2 0/2] Add validation for DMC firmware header parsing
Date: Mon,  7 Sep 2026 16:07:32 +0530
Message-ID: <20260907103731.1379922-4-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
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

The DMC firmware parser does not validate the firmware load address
stored in version 3 headers before it is used by dmc_load_program().

The firmware size conversion from dwords to bytes can overflow while
calculating the payload size.

Fix both by validating the firmware load address against the expected
range and using check_mul_overflow() for the firmware size conversion.

v2:
Added Fixes tag in commit messages for both patches.

Dibin Moolakadan Subrahmanian (2):
  drm/i915/dmc: Add sanity check for DMC load address
  drm/i915/dmc: Prevent fw_size multiplication overflow

 drivers/gpu/drm/i915/display/intel_dmc.c      | 84 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 12 +++
 2 files changed, 85 insertions(+), 11 deletions(-)

-- 
2.43.0

