Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76A110FC456
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 23:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A83B10E6FD;
	Wed,  8 Apr 2026 23:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjk7g2Ko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8AA10E6F7
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 23:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775691868; x=1807227868;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=YTPrY/u9wc0M17iTNAoQghkXmULPIR4h3rZf/z+mA4E=;
 b=mjk7g2Ko0xyXufWb3FZC4EJJMjupE8g3FUoQ5mfEuhennyw00fFuDUXj
 zTRT3iIHstOjDdRVb8Tfc3mi2PiSqG1g3BEZZZzX9XHXnhx+VvL90buuA
 nOxfNbcU+BR/Rx1b5HXpq1AhN+Ads3ZFjTn3rVO1sBoQf/SQkUqCnswYT
 2UvunIv9S/1dWMwWBifNIt4fxmclplU9pfTCTgoV+6j33+NLLpd2aq8sZ
 zn7yS4bd8V0lJ1uz14DlE2PGJvATGCcIcHTJ9n4f7avUyZo0O1jqU0r5D
 xllB4MKoaNWu0GmMz6Ab/UREiDQw2OfXnBmepoXjN7cxquQGItKMrY+FK A==;
X-CSE-ConnectionGUID: klb/S/KXTLi7qiaH/YeibQ==
X-CSE-MsgGUID: sO+4r+0nQXyJPDCJ6VV37A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94272794"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="94272794"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
X-CSE-ConnectionGUID: JVMJPUaaS623BrwR2NB5qA==
X-CSE-MsgGUID: DrzRtPErTv+AYoDferqhlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="227616901"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 00/10] Start fixing OA whitelist mistakes
Date: Wed, 08 Apr 2026 16:42:59 -0700
Message-Id: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbo1mkC/0XNQQ6CMBCF4auQrp1mqA2gK+9hXBQY7CTQkmkVE
 8Ldbdy4/Bbvf7tKJExJXatdCb05cQwF5lSpwbvwJOCxWBk0DVpsITrYPGeaOWUYZnLhtYKpe+e
 onfq+7VSZrkITf37Z+6N4krhA9kLuH6uxQzSIqM+dtfYCDSwuZ0+bHrXEleTGofzoIS7qOL4iJ
 oEoqgAAAA==
X-Change-ID: 20260407-oa-whitelist-cleanup-21baae7fbb78
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2615;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=YTPrY/u9wc0M17iTNAoQghkXmULPIR4h3rZf/z+mA4E=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1uhaP88k060EGFIAHPSKjlTj78d9iUD2lRELH
 pST621yMCKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadboWgAKCRBNeSQFyHKQ
 BPldD/40f1FMffzUAMk/TP/V58njyoQInfdX/aqLBvepq4a8jabOsdGioy5CMCw5J8O58BkOuOc
 JQvjraEWDOor3ryNWLuOLzd7RpwdttNghuZjQCOzVwOUM2hJjIxK9Ucl4iMeAPRZYFCPF9XcTES
 tYTpe8WbuMRs5SAjQPtsSWTMs5DXp+/DIGWfYWowiTEOdAVobs+fDoweRIx/+cR/znIf1GgdY+w
 B0p7iyjn2dh67mMxTSZonNQQD2fWE2CZs5GWJcMU8f5GjqoTKQCuUr3mthBtad1kX8msGXU5cnT
 NnSvjsruE7c6ebew/NG5MBF+xO38/ItdfaCe9YNMLqh7dQVHlRm6gT+TiiGBK9yz+5Q/SYnzxma
 7L9wReKxEbl8VVO71GXoEYlqdY0Wemf5acnBnUhvCyo0ilVAAILF7jeJWQxPqwH5Fqq5DYRDqw3
 Z2W6ZYmXUuBI76E4ManEUKkFZiOF6Cuio/BWJEsnoFI1JrYjrF6R2EdbrOS+DJX4rW4b5AvbaFD
 eE5hCOyrb+RCPp1H3vXDv2Dj2HT7lix46HYyZbvzYxtQTeZxQGUjhAugt7AIBprU3ckXCjISsDc
 bw63MgZnjibd2nn54asbedjh507sKJHCr5WNpyyCWRcnDdTyNwVB173d02GV8lvyqQ4YkJkIJVb
 aZMWaNI2351N4MQ==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

There are a number of mistakes in the OA register whitelists:
 - Unlimited upper bounds (never allowed for whitelists entries!)
 - Whitelisting registers that userspace already has access to
 - Whitelisting registers that userspace is not intended to ever need
   access to

This series addresses the first two bullets and partially addresses the
third.  For registers that weren't supposed to be exposed in the first
place, there are still some cases where we're exposing registers that we
really shouldn't be, or exposing them on engines that we shouldn't be,
but we need to confirm that no legitimate userspace has started
(mis)using them before making further changes so that we won't cause a
regression.

This series also partially unmacro-izes some of the OA entries since the
several layers of C macros were obfuscating exactly what was/wasn't
being whitelisted and making it harder to audit for mistakes.

v2:
 - Continue to whitelist OAGSAG's trigger since we've been allowing
   userspace to access it on the "wrong" engine.  Hardware only expects
   the GSC engine to access this instance, so it doesn't automatically
   grant VCS/VECS access.
 - Eliminate whitelisting of OASTARTTRIG_COUNTER; this has never been a
   valid register for userspace to have access to and was only
   accidentally included due to improper use of a RANGE_4 flag.
 - Consolidate oam_mmio_trg_vcs and oam_mmio_trg_vecs into a single
   entry with a custom match function.
 - Eliminate some layers of C macros to make it clear which registers
   we're actually referencing.

--
2.52.0

---
Matt Roper (10):
      drm/xe/oa: Stop whitelisting non-SAG MMIO_TRG registers on non-DG2
      drm/xe/oa: Stop whitelisting OAG_OASTATUS
      drm/xe/oa: Stop whitelisting OAM registers on non Xe2/Xe3
      drm/xe/oa: Stop whitelisting OAG registers after Xe3
      drm/xe: Add WHITELIST_RO macro
      drm/xe/oa: Consolidate RTP entries for OAM whitelist
      drm/xe/oa: Consolidate RTP entries for OAG whitelist
      drm/xe/oa: Consolidate RTP entries for OA MERT
      drm/xe: Enable all FORCE_TO_NONPRIV registers
      drm/xe/oa: Stop whitelisting OASTARTTRIG_COUNTER

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   7 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c    | 115 ++++++++++++++++++-------------
 2 files changed, 74 insertions(+), 48 deletions(-)
---
base-commit: 9e217a8df7b2f298a2fd850e29f970b7360dc77b
change-id: 20260407-oa-whitelist-cleanup-21baae7fbb78

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

