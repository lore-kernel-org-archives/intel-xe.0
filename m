Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0F1C44507
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 12:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242CF10E063;
	Tue, 14 Jul 2026 12:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HjwekEge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E5F10E013;
 Tue, 14 Jul 2026 12:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784031221; x=1815567221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vG3zV5yBOegJ/brgONR/GRjZG/dWgDGsVAaeJ1NFmbk=;
 b=HjwekEgehK8X+WJHYJdOEArFIQao4pk41t6jYt96RIvo2HgsR7+zlUKH
 ZrIc7f7Z7MqAro1X7y9i+SDetgp87rAIRAAAtNTvIEpbXJhu+M/yS5nj/
 3Ye/g3CI4kvsMam3CaHXXgrQCnTHL9qNbLgARNR8YR8l+CTTG3L3V1W7o
 uEZzGkuTmA6ZITrb/s5Ims0bUjdte6vrHh2JeaQylktTzHRB+JIYxCTaS
 y845KtJOkCvX0Q02l78RUoNHj1vEhMLafY8RCpGvIZZiJsTLCEo+frDnN
 GVh/w49bEN57Uzc4PaUKvdZNW0ZslFWY+nmxpR4XKbSMxdbiqrZKrneWa Q==;
X-CSE-ConnectionGUID: wEjUpUJSQUCLuLQkD6ooWw==
X-CSE-MsgGUID: n0/k1FmiSqqiJQrdhrA22A==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88472467"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="88472467"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 05:13:40 -0700
X-CSE-ConnectionGUID: V8J3Z/FETd+Rt/bK664e+A==
X-CSE-MsgGUID: Y7SnqLeRQ72ojkxzi4wesA==
X-ExtLoop1: 1
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 05:13:39 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	jani.nikula@linux.intel.com
Subject: [PATCH 0/2] Add validation for DMC firmware header parsing
Date: Tue, 14 Jul 2026 17:41:44 +0530
Message-ID: <20260714121146.1415532-1-dibin.moolakadan.subrahmanian@intel.com>
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

Dibin Moolakadan Subrahmanian (2):
  drm/i915/dmc: Add sanity check for DMC load address
  drm/i915/dmc: Prevent fw_size multiplication overflow

 drivers/gpu/drm/i915/display/intel_dmc.c      | 84 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 12 +++
 2 files changed, 85 insertions(+), 11 deletions(-)

-- 
2.43.0

