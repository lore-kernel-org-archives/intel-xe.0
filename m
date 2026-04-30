Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B10CD13DA
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 20:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A5C10F457;
	Thu, 30 Apr 2026 20:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dj3GB9nf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F96A10F457
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 20:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777580496; x=1809116496;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=IsfvuDe/un85sj6gBc3xnP6F/MH/7L3XoXCOd3JgrLc=;
 b=dj3GB9nfIi8Wbj1DUCi5Ysxrbkbr88k1dvurzGxOoqxRooINN4sWqVGC
 7GE12dDqUT8Mmo1JNEkHqpMqCaeIoUzC73bTd8RIeLTuZtxSXiBXI06FA
 P8RlEs+Py37NqugXBy9+ZPiLLbhapyTlILLfPLgQpPzTRGX7Oem1uZmqp
 y2ZGcDi9OB0N5xCitbm1gAOpDa7QDGrQ7iGbFGkj55fxuAzJdaYfChn5t
 tcMSvCyV5DzJmvh9uiVEe8UdJGAVD11RbHk/Owh1NWHvQeBLgYEyc/AT4
 ACmqPfwk3p9QG8o49MH9yn1dBoVicRT2W9uj7UiFrfGeZa7V+Tqe730ot g==;
X-CSE-ConnectionGUID: 10Zm+mlyRtOIK2WixJZhmg==
X-CSE-MsgGUID: boKZZdAfRJ2o+deEj6Iy5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82150889"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="82150889"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:35 -0700
X-CSE-ConnectionGUID: HG6TvfNRRTmjcXRBx+ndpQ==
X-CSE-MsgGUID: Yg/b8K1TT86NZZNINdP+4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="232030487"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.55])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:34 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 0/7] drm/xe/rtp: Miscellaneous improvements to rule matching
Date: Thu, 30 Apr 2026 17:20:01 -0300
Message-Id: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7Zi2QRRX3sOwKGUqkyCQaW00p
 He3snf5fvLe3yCQMAW4VhsIJQ68zAXMoQI32vlByENhMMo0SusaJa4or4lwtVJctE7p+mysG6i
 HYq1Cnt978d4VHjnERT77QdK/9X8raVTobatMe7o0vfc3niNNR7c8ocs5fwHEKU0xrgAAAA==
X-Change-ID: 20260114-rtp-rule-parser-ac01472acdeb
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
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
Changes in v2:
- Incorporated review feedback. See individual patches for the
  changelog.
- Incorporated the addition of the match type XE_RTP_MATCH_PLATFORM_STEP
  after rebasing on latest drm-tip, which is reflected in some of the
  patches.
- Link to v1: https://patch.msgid.link/20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com

---
Gustavo Sousa (7):
      drm/xe/rtp: Write kunit test cases specific for rule matching
      drm/xe/rtp: Drop rule matching cases from rtp_to_sr_cases and rtp_cases
      drm/xe/rtp: Don't short-circuit to false in or-yes case
      drm/xe/rtp: Do not break parsing when missing context
      drm/xe/rtp: Extract rule_match_item()
      drm/xe/rtp: Fully parse the ruleset
      drm/xe/rtp: Implement a structured parser for rule matching

 drivers/gpu/drm/xe/tests/xe_rtp.c      |  38 ++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 327 +++++++++++++++++++++------------
 drivers/gpu/drm/xe/tests/xe_rtp_test.h |  23 +++
 drivers/gpu/drm/xe/xe_rtp.c            | 321 +++++++++++++++++++-------------
 4 files changed, 461 insertions(+), 248 deletions(-)
---
base-commit: f3b0eacc6be937779388c8412909b66717926980
change-id: 20260114-rtp-rule-parser-ac01472acdeb

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

