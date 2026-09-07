Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8634C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 13:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63ED810E02E;
	Mon,  7 Sep 2026 13:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePMUGHku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8210110E02E;
 Mon,  7 Sep 2026 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788789060; x=1820325060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sHegxUQEBMX/xSrzMQ8SvpJgSNIyodGnWKztt9A2cc4=;
 b=ePMUGHku6mnyEC2u3MMIGGmxx3GiyATivk8RXg2K74mQwyI9jPugLhhi
 TKX3iJA6O4KUFmBkagHeJd9cc+eujCZYqX+e8ESpZXbb/oiB9+71giiLZ
 z01KmvuxCvueL65fj0sU86IySeB2tI+hdLl3e+17GtvQ5vJhmmQCNHZhX
 sQ2MWcyFavSv1h+lq4aT09yTjx1kvLJDA/naz5dakYQMOoad/j2oGIFN3
 W2dKyg+zFCWGlXCS9z27x21wSPPiP0zNZAK7KKLu2CRT0uZSMxwkDwXgq
 JC+XJFadZs01QDvQQoetJ6efZGGphM1pitbMj4XeKT7azaTqmVepKpcSu g==;
X-CSE-ConnectionGUID: cKjNgEdaTyKDuoVOI0ISOQ==
X-CSE-MsgGUID: KJar3HpKTZSYbOK6pwH9WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="114735031"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="114735031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:50:59 -0700
X-CSE-ConnectionGUID: EfrR9vBWQ9mNWigy9NA3NQ==
X-CSE-MsgGUID: WCyXitX7RnCTD1je4OSXHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268993698"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:50:58 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
	jani.nikula@intel.com
Subject: [PATCH v3 0/2] Add validation for DMC firmware header parsing
Date: Mon,  7 Sep 2026 19:20:49 +0530
Message-ID: <20260907135048.1403587-4-dibin.moolakadan.subrahmanian@intel.com>
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
Address Sashiko's parser-hardening review comments in patch 2.

Dibin Moolakadan Subrahmanian (2):
  drm/i915/dmc: Add sanity check for DMC load address
  drm/i915/dmc: Harden DMC firmware payload parsing

 drivers/gpu/drm/i915/display/intel_dmc.c      | 95 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 12 +++
 2 files changed, 93 insertions(+), 14 deletions(-)

-- 
2.43.0

