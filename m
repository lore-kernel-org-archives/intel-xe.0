Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ABAD3CC82
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 22:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6899F10E0F6;
	Wed, 14 Jan 2026 22:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PaITwSC3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77CF10E0F6
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 22:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768431028; x=1799967028;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=q5Jhcv8b1iDyMDv5eRpjWOIaTZpQTmlkXycDRyRmYFA=;
 b=PaITwSC3DkLhP43go+6ngAYdpveais0RQagDQeMCOBmGLqTp80AvRGBx
 Rlk/+5Cpvf4Vtdmz64Tcg8EPbHgSZCyNWmseIg/dBYL+1N1D4FuOBHSfa
 0fsNVYcfP8OujZP1/dUw9zl5N86gx/hlY/z0Yf433XEnv40boHQABaKCY
 doPjKGC3tUGCbGRS6nBjfYBkI+wHQd3p/Ihfrp/IPxudqrWfuyOu11MHG
 dHbXUk8cnD2DwKLXphQz2w4v1lIdDIPLajUKuT5dkzXvxcBvNp0jNwtO+
 62FelMcno90VF1Qbf8RMnbvJ09XvfetGvDXBIpA5jkWaq2TaTMMOyUPtc w==;
X-CSE-ConnectionGUID: OkbZtjRpSqWSSW53d4+5Rg==
X-CSE-MsgGUID: tiycgUt8RGyRN3QG2/W1iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81184689"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="81184689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:50:27 -0800
X-CSE-ConnectionGUID: Sm00FmdFSwCsckc5ji7rcw==
X-CSE-MsgGUID: Pc/5z1P9RfegLbtpa1Z2TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="235522022"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:50:26 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 0/6] drm/xe/rtp: Miscellaneous improvements to rule
 matching
Date: Wed, 14 Jan 2026 19:49:50 -0300
Message-Id: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI8daGkC/x3MQQqAIBBA0avErBtQkYKuEi1MpxoIk7EikO6et
 PyL9wtkEqYMQ1NA6ObMR6yh2wb85uJKyKE2GGU6pbVFORPKtRMmJ9Wi80rb3jgfaIaqktDCz38
 cp/f9ALP8kWxhAAAA
X-Change-ID: 20260114-rtp-rule-parser-ac01472acdeb
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

This series adds several improvements to RTP code around rule matching
logic.

It first starts with making sure there is a cleaner separation of
responsibilities when it comes to the generic kunit testing for RTP.
Then it goes on to improve rule matching code by making the parsing
logic more robust and restructuring the code to resemble a formal
grammar and make it easier to add future extensions.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Gustavo Sousa (6):
      drm/xe/rtp: Write kunit test cases specific for rule matching
      drm/xe/rtp: Drop rule matching cases from rtp_to_sr_cases and rtp_cases
      drm/xe/rtp: Do not break parsing when missing context
      drm/xe/rtp: Extract rule_match_item()
      drm/xe/rtp: Fully parse the ruleset
      drm/xe/rtp: Implement a structured parser for rule matching

 drivers/gpu/drm/xe/tests/xe_rtp.c      |  38 ++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 303 +++++++++++++++++++-------------
 drivers/gpu/drm/xe/tests/xe_rtp_test.h |  24 +++
 drivers/gpu/drm/xe/xe_rtp.c            | 307 +++++++++++++++++++--------------
 4 files changed, 431 insertions(+), 241 deletions(-)
---
base-commit: 733664f1edf3c01cc68e6dd0bbdb135158a98a1d
change-id: 20260114-rtp-rule-parser-ac01472acdeb

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

