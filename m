Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECD3C5AD2B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F89C10E82A;
	Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxT/XCHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E74010E81C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608496; x=1803144496;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=nKI7Q959ZvZkvYg8iavf0h/ZVFxbTxvzItGN+x5Wyak=;
 b=TxT/XCHltmYuTQU3XNiOqQfGIVHTbOFCU6xamkn/5yurJrO0sJM3yTTV
 tR92rQebEkI6IOTuNgFfWgCV36MyFPqM/6uYD40ogOHyzks7GygG6jZ5F
 ncIYuQ+g2ZUTSgeti0Yrj6RD+66X7gy965+XWA1cLnOtGoZ3VMz1QH435
 sKp97zLhDQq8gSr3taxHVWjF0gP3w9ASxTixHHJkohUM3txFsH0aa2/6l
 y2DPSpLr53hrpd4FGgprrmqz2/FohVp3M/goCdUiiSJSB4ymhUw+h/qZe
 6IPldF3KFrEREnrtvEBsuKut9oHncz/AF/YvP0rDeMBAsiHS0QqL7+F5q A==;
X-CSE-ConnectionGUID: Sz96kiCfRTOV8Y4YDANfqg==
X-CSE-MsgGUID: jiQ6gy23R+qLLtTcURmAgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606727"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
X-CSE-ConnectionGUID: 8RBVy4BRRCGEqnv/vpmgDQ==
X-CSE-MsgGUID: bvSAfHt3RqKAeNrixdGiPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138662"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 00/23] Workaround cleanup & simplification
Date: Fri, 20 Feb 2026 09:27:22 -0800
Message-Id: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2ZmGkC/4WNQQ6DIBBFr2JmXRpAaqSr3qMxDZGhTqJgQG0bw
 91LvUCX7yX//R0SRsIE12qHiBslCr6APFXQD8Y/kZEtDJLLhktRMxfiOqclopnYyzz6EY1fZ6Y
 0dxfTaq24gjKeIzp6H+F7V3igtIT4OX428bN/k5tgnOlGOGltbVrUN/ILjuc+TNDlnL/Spzzyv
 AAAAA==
X-Change-ID: 20260213-forupstream-wa_cleanup-490f5a899404
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4153;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=nKI7Q959ZvZkvYg8iavf0h/ZVFxbTxvzItGN+x5Wyak=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJms6++QeKDY/YlecMLxxh4OhJr1e5mT8xHw6
 mCWFl1XeQSJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrAAKCRBNeSQFyHKQ
 BLKaD/9tcE/9kwt8z3TJ5H3hv9WQRtT3m9FASWubU50MebPShYuAtXXFN6ra4mYHfxwhI5wtaj4
 8JJAo89npJ35ljsX/c/NU6/rhIRJFZoIrH0DRm8QKRr5IB8973Nnb6dWMfs5oncrMHA/hNmf6lL
 LUuBa9sk2nmC/yL0ESQvnvI57+Fj34FXjOF0ZvPbLKbPPiSPgclVbinsg7d19DftID7hRcq1JZn
 il4XDqdzCeVCBbCz27USz0XAvpBiUYhTh3ydIJHFTwh4aL+I++vE3XBOSKO+IWUQpyO9EOzj3n9
 7BvC5bjBulkBREvRJcsxHZMtMT5zDM9cg9jgltlNmUcXRlSFlu2msHNqVKgxEneoAmZZtqLASBS
 SsViaqmtZ41UEidEpVNTrsqHgAz1IkjPcKcFGzADFsrkU/uB0HT7Aq27Zhvpt0od5LbptWNDEE3
 ArMXnA0Gh824EzVj9pLU+EcVqrzEyLHgYuDUzhI3i+J/ZMqaaBiAAxpLjh/nxtLx29iV4C1mxgd
 3IPAf94mmqHEvtdpZvh/r+mwtGKCWQtJwYfw1jyo9gBtFR4E5s4qy33/bkyc+ANI7k46y91ZgwZ
 1zMsexpjbW6mlYdROYfh7rJPnTu8Dc8/yfmtI9EQkGIKsqYIPIazaXk2OLTmt2U9R2Emukr+kcQ
 NWI7heJsaI+lEGA==
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
series also drops some Xe1 workarounds that were only relevant to
pre-production platforms (the Xe KMD doesn't officially support Xe1
platforms since i915 should be used instead, but pre-production Xe1
hardware is especially out of scope).  There's also one BMG workaround
(Wa_15010599737) which was invalid and is dropped completely.

[1] https://lore.kernel.org/all/20260203233600.GT458797@mdroper-desk1.amr.corp.intel.com/

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Changes in v2:
- Also remove an unused flag and two functions that are now dead code
  when dropping PVC pre-production workaround 1509372804.
- Consolidate the newly-added entry for Wa_18041344222 on graphics
  version 20.04.
- Consolidate OR'd ranges for Wa_14023061436.
- Link to v1: https://lore.kernel.org/r/20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com

---
Matt Roper (23):
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
      drm/xe: Consolidate workaround entries for Wa_14023061436

 drivers/gpu/drm/xe/xe_guc.c        |   3 -
 drivers/gpu/drm/xe/xe_guc_rc.c     |  29 ---
 drivers/gpu/drm/xe/xe_guc_rc.h     |   2 -
 drivers/gpu/drm/xe/xe_oa.c         |  19 --
 drivers/gpu/drm/xe/xe_oa_types.h   |   3 -
 drivers/gpu/drm/xe/xe_wa.c         | 374 ++++++++++---------------------------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  36 +---
 7 files changed, 112 insertions(+), 354 deletions(-)
---
base-commit: 5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13
change-id: 20260213-forupstream-wa_cleanup-490f5a899404

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

