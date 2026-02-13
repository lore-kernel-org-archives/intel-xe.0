Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFD8EF99DF
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2967810E848;
	Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCLJD80I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC35510E327
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021957; x=1802557957;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=49ugFZGk9W9FdO1aPibIbBbsLc5RnKyFs11Do0HWUws=;
 b=TCLJD80IKSzQ91L8cDYsB10zywyuD2hpLgxxLOgET1XShFhDo3nmGIgZ
 Dkugtq2akYAAQVQj17Qf6aCeKAE2dFSTMMCoP1fYXBLXujBzcPq+s2s1n
 hmwoQLjQhkAvXkAhvDm6Y1Zc05ShvjX2ak2N6/rdECXd7l+aOO9dKxR1C
 0gj/jYaWgFSD0F5Hdu9HLKCT8Nor55QVx3XvcLl3ZcCSU9yjUrnG87G9D
 53Xrc6KwZ3iRxjADO4DW+XCVI40weCfPXuBEqE0jremvxacLCEzR7sQTt
 9XqlJeSGyWHT/IA8YYIyiZi5/fJlFyCoCgHtdXrM0mL2XMplBGO/L0YtP g==;
X-CSE-ConnectionGUID: tEY1cWz+Q4SORs5PuxuHvQ==
X-CSE-MsgGUID: 11W5vHW/RXqCgTdX2HCgWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654428"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654428"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
X-CSE-ConnectionGUID: NxHHy6ogRlyxfT391GL/aw==
X-CSE-MsgGUID: hf6KhsE7SzuNx5d7H7GqKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705620"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 00/22] Workaround cleanup & simplification
Date: Fri, 13 Feb 2026 14:31:35 -0800
Message-Id: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEmmj2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Nj3bT8otKC4pKi1MRc3fLE+OSc1MS80gJdE0uDNNNEC0tLEwMTJaD
 mgqLUtMwKsMHRsbW1AIm+nxBoAAAA
X-Change-ID: 20260213-forupstream-wa_cleanup-490f5a899404
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3569;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=49ugFZGk9W9FdO1aPibIbBbsLc5RnKyFs11Do0HWUws=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aArw6D3zLAZQymVz0afRGSSOYeAz34R29Nk
 6Hkc3vh42+JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgAAKCRBNeSQFyHKQ
 BBI0D/4rXSgLpPCjGln5N9hUilQN/M7ZRTfb1/r82mv5GBureFMTHOnZd/7/E9HDaXhWg9lGnr2
 klCfA095eNTj9kxAWiaxMUYDnubwqvMlD4cq9AIMp0DNaJOb+I5oxN4C9W58U8PU+ia/DeLWlWl
 Fxy8Wi1PLZysC3hsPpEj7IdbqTcEqVPj5fTZnf7pDiTHW1lAWR3KuXexd2w2nV72Dv9KZ4Wjdr/
 nLB552gB3NXnUpDTIgiBZ8YWQZqyr7Up/M2TW7YWpQ8ZmMEHvJPXtRv3SEZsSWFKCW3k9RL9uYc
 Qgi6MfSrGF8EiEOY4Kp1HylVga5FIceNrgJ7yS1lUs7K04sys5nEaVx7M/4p5w0xJBzcB4I1HCM
 UwxlR+gbP/k704I7Yk9QgzQoTcm4Pob2SP/19OYTzUB0uhABppsY3HDfiK74u1lEWsqjv1Zeei7
 0hGnYNzlHHrrqwCqZwkcn6b6+GTJWZQGakNzYs3BeZskkhuCum/Aw6OAvV5isNOAYbbkGJDt47B
 Tfg6ZQUBEEM4u7x3P4B3kZ8pWMnmytrSayGTS4nfwlTM+kupU2uSeZbvkHVnnnjt4DGUkem2f/D
 13yMS5FkrUYs/fvRPf6Je38/bCfpON0Dfbfmbm9ypZgpzyV4jl1q8AdBD51yrAb02Y0nSedg04n
 k1QTQK/Bo/uQruA==
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

The majority of the patches in this series relate to the new policy of
allowing GRAPHICS_VERSION_RANGE() and MEDIA_VERSION_RANGE() to extend
across currently-unused version numbers.  Obviously there are a lot of
unused numbers between major IP generations (e.g., Xe2's 20.xx to Xe3's
30.xx), but there are also cases where random version numbers in the
middle of a bunch of other versions go unused (for example, we currently
have variants of Xe3_LPG IP using every version number from 30.00 to
30.05 *except* for 30.02).  Allowing ranges to cover currently-unused IP
numbers allows simpler RTP matching rules and cleaner code.  The price
for this is that additional work and review will be required if an
intermediate IP version like 30.02 shows up in the future --- we'll need
to analyze each range that covers the new version to determine whether
the workaround also applies to the new IP, or whether we need to split
the existing range into two separate ranges.  The platform enabling
engineers are willing to take on this extra review burden. [1]

Aside from RTP rule consolidation according to the new policy, this
series also drops some some Xe1 workarounds that were only relevant to
pre-production platforms (the Xe KMD doesn't officially support Xe1
platforms since i915 should be used instead, but pre-production Xe1
hardware is especially out of scope).  There's also one BMG workaround
(Wa_15010599737) which was invalid and is dropped completely.

[1] https://lore.kernel.org/all/20260203233600.GT458797@mdroper-desk1.amr.corp.intel.com/

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Matt Roper (22):
      drm/xe/mtl: Drop pre-prod workarounds Wa_14015795083 & Wa_14014475959
      drm/xe/pvc: Drop pre-prod workarounds
      drm/xe/wa: Document new policy regarding workaround IP ranges
      drm/xe: Consolidate workaround entries for Wa_16021867713
      drm/xe: Consolidate workaround entries for Wa_14019449301
      drm/xe: Consolidate workaround entries for Wa_16028005424
      drm/xe: Consolidate workaround entries for Wa_16021865536
      drm/xe: Consolidate workaround entries for Wa_18032247524
      drm/xe: Consolidate workaround entries for Wa_16018712365
      drm/xe: Consolidate workaround entries for Wa_14020338487
      drm/xe: Consolidate workaround entries for Wa_14018471104
      drm/xe: Consolidate workaround entries for Wa_16021639441
      drm/xe: Consolidate workaround entries for Wa_14021402888
      drm/xe: Consolidate workaround entries for Wa_13012615864
      drm/xe: Consolidate workaround entries for Wa_18041344222
      drm/xe: Consolidate workaround entries for Wa_14019877138
      drm/xe: Consolidate workaround entries for Wa_14019386621
      drm/xe: Consolidate workaround entries for Wa_14019988906
      drm/xe: Consolidate workaround entries for Wa_18033852989
      drm/xe: Consolidate workaround entries for Wa_15016589081
      drm/xe/xe2_hpg: Drop invalid workaround Wa_15010599737
      drm/xe/wa_oob: Consolidate some OOB rules

 drivers/gpu/drm/xe/xe_guc.c        |   3 -
 drivers/gpu/drm/xe/xe_oa.c         |  13 --
 drivers/gpu/drm/xe/xe_wa.c         | 366 +++++++++++--------------------------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  36 +---
 4 files changed, 111 insertions(+), 307 deletions(-)
---
base-commit: 0558a31efefc20e307523a43c37a29f4eab171dc
change-id: 20260213-forupstream-wa_cleanup-490f5a899404

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

