Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1259EC982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 13:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E49510E70A;
	Tue, 22 Sep 2026 13:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhuJAnbW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FBE10E5A4;
 Tue, 22 Sep 2026 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790084164; x=1821620164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iHIe8xLqFKO/d9RHhAhYl7b7Bf3Hvcqp1VHvevYoYTI=;
 b=MhuJAnbW+ahhSxG+jtoIUVc5yvfFXMETqEoq+I5U1j8s73zCY3aEbYWE
 4N3ulhzkbxCFTrjPNoo68GA7FlM2UtRO1Fhq7SlTv0FJBsDwaHRFlbigk
 sUho3gMmUYmmNae8JH2TVbRTLGKjdMhg+tAp89yyh5oqA71Wk/FzhRKY6
 CpaTTEr1I+3mh7aFh9w0MsSM6KSRAxnOD1dYtHI7VBzVHO5uJhEv1B0Jn
 vxpMGy9Z2qjG+wToScklBSnxo/++Rgvol8usEe9LtfCqmyj4Iq1VLhFgz
 pr1ggYGmV2YioI6zIw9AArKXe/tE+O05/rfryuNqv0h6JrxjA4ctB6ybX Q==;
X-CSE-ConnectionGUID: fjbxXPa0QK6ncBGgU1Bgpg==
X-CSE-MsgGUID: Ukv8JZSzQIe6/Hj7GV6okg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102036730"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="102036730"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 06:36:03 -0700
X-CSE-ConnectionGUID: oh/JjnajQpehNRZvaWw5sQ==
X-CSE-MsgGUID: 06DfE0CpTtiAXwrqFE9Jcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="301053399"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 06:36:02 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
	jani.nikula@linux.intel.com
Subject: [PATCH v5 0/2] Add validation for DMC firmware header parsing
Date: Tue, 22 Sep 2026 19:05:36 +0530
Message-ID: <20260922133535.3180973-4-dibin.moolakadan.subrahmanian@intel.com>
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
v3:
Address Sashiko's parser-hardening review comments in patch 2
v4:
Publish mmio_count, start_mmioaddr and dmc_fw_size only after the
payload allocation succeeds, so a failed allocation cannot leave
stale state for a later dmc_load_mmio() call (Sashiko)
v5:
Change patch ordering (Mitul)
Change drm_warn to MISSING_CASE (Mitul)

Dibin Moolakadan Subrahmanian (2):
  drm/i915/dmc: Harden DMC firmware payload parsing
  drm/i915/dmc: Add sanity check for DMC load address

 drivers/gpu/drm/i915/display/intel_dmc.c      | 76 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 12 +++
 2 files changed, 83 insertions(+), 5 deletions(-)

-- 
2.43.0

