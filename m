Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641ADCD5BAC
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 08:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05B910E21C;
	Fri, 22 May 2026 08:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBRX4DVv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EFD10E21C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779439559; x=1810975559;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=fwEbjvUPEu1gYqos2FBbsiXNNORgFeClfunMW+a6ePY=;
 b=IBRX4DVvYmBUOQJqJQ3aacEKjjrNEda+JOjQLPWlyLXUAbalmwwaZCGJ
 WIu6i+NlcmF2ePf1Tdl/DHDkDphEHjTx4z1bruCStTXnq+3x1f6qhumqQ
 NcPFxnJeYkh+pW6XhHbFreWkgSPK8ClNESNZWeyIK+u1GPBQLuS3Wkyb5
 jjYTRxwmb8/HaRF9t2XIE60+VGjWTImiA2WGbaRIoWJ8YG/oGoGy6s491
 yctn+I2wQRKIyhXOOlepcuzgvjgR9UyuXyyR3aUlLHM2N/9WR+Lg+NnjP
 9MIXf51SI0WvUkNWfbx+Bt0PmZQ+4kAd8ukLtGb3aNKUmpzaR6un3yP7Z Q==;
X-CSE-ConnectionGUID: XMSeIJiFTZeWDmH5/07H1w==
X-CSE-MsgGUID: N5c9RUbWSFK+ZxCtT7mASQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80220403"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80220403"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:45:58 -0700
X-CSE-ConnectionGUID: 1VJyBGFSSBu5Y/2hzJfb1g==
X-CSE-MsgGUID: p9T6eQu2TMOcwNvunEAs3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="264679490"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [192.168.1.24])
 ([10.124.223.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:45:57 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 0/7] drm/xe/rtp: Miscellaneous improvements to rule matching
Date: Fri, 22 May 2026 05:45:15 -0300
Message-Id: <20260522-rtp-rule-parser-v3-0-0c51039899f4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auQrh3TlvLnynsYF22ZShMEMsVGQ
 7i7hY0mxuU7yfPNwgKSx8BO2cIIow9+HFLkh4zZTg83BN+mZpLLkguhgOYJ6NEjTJqSBW25UJX
 UtkXDkpoInX/ui5dr6s6HeaTX/iCK7fp/Kwrg4HTDZVPUpXHu7IcZ+6Md72zbivLjVc5/vUxeF
 BU2tVHaFOLbr+v6BoduZrjuAAAA
X-Change-ID: 20260114-rtp-rule-parser-ac01472acdeb
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Violet Monti <violet.monti@intel.com>
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
Changes in v3:
- Added eBNF grammar for the rules to the kernel-doc.
- Fully reviewed now. Sent for fresh CI results.
- Link to v2: https://patch.msgid.link/20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com

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
 drivers/gpu/drm/xe/xe_rtp.h            |  29 ++-
 5 files changed, 486 insertions(+), 252 deletions(-)
---
base-commit: 7e25390024f8a4a9fdd6ec50f000ee25c006c02f
change-id: 20260114-rtp-rule-parser-ac01472acdeb

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

