Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D316F45A0D
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 22:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587AE10E05E;
	Fri, 10 Apr 2026 22:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSR55Gjy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E96010E05E
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Apr 2026 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775861467; x=1807397467;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=5eZdo6qeNKGckZIPAJN2JqJjWMbmmYb6x2BXd8eY52g=;
 b=dSR55GjyJ3QGF+DrFo7yg7gzUo/gsqmcHJ6kiaCes5/zHTSYhfa5pKZN
 lQpBVeD5HtQcRkX5GX2iTddLiQG0jmOuZfLgkM6HNmjqtrTtyIYLwGhhp
 grt56M8ZLIkt9Wt1mVHW5sIvS00nNk9tIpfpJETdWWYdNOeiVjejcytXp
 POU15Dm4yJJuunVvpyCzeMO2SscuwYbtZp8i88aknT6+U9BHHnRHKFQou
 IPtCE1aTunuosgwoVBCKBNv15kEh/C5k9mz11QbIiHsuUogXvpZpMOagv
 abl3QwI6xGXhEl1ZMEIX0bg7ASOaIzM8rKEjIVQ4hSJnUsGZAoRrSuCTO w==;
X-CSE-ConnectionGUID: Sr7vBNQ1Tneqr2SXx62zGQ==
X-CSE-MsgGUID: xwtkRMLQSba9LJwqcKszBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76849547"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="76849547"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 15:51:06 -0700
X-CSE-ConnectionGUID: c1XXdKkfTgqw3goxmnC13A==
X-CSE-MsgGUID: J/cEOZGxSW2y868+UnnztQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="222728513"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 15:51:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/3] Xe3p tuning and workaround fixes
Date: Fri, 10 Apr 2026 15:50:27 -0700
Message-Id: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0MD3YpU44L4ktK8zLx0XeMU00TT1DQTg5QUAyWgjoKi1LTMCrBp0bG
 1tQAToTI3XQAAAA==
X-Change-ID: 20260410-xe3p_tuning-3d5a5ef40dd0
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=904;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=5eZdo6qeNKGckZIPAJN2JqJjWMbmmYb6x2BXd8eY52g=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp2X7aCjVcvX8OV/UlUhuEy03DTIT7npBaZo3Ad
 9S18J0KOV2JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadl+2gAKCRBNeSQFyHKQ
 BNB7EAClP+8fIYCsTXHc4jDpCbJEthYf+WcjXvnL/d6WO0UBmV+pd1S2O3AGBpnNM44E7fmMW/I
 VxC4XooBv/hgalu7SVT16LAMh6nGnocJxbDiy0XFS/QE5vEldlfjFZSKk+8BBAU10N/m2oYEq/6
 czr4ChOKtRXGqSe+m2+SZb8z9lJ/e9oFMOUWaEthv61a4qf95eJoVKj5PulPRfnC1JBiSRL7SnI
 eMxnwGmnmyupayDpvdF3eo8cN9H2Ini4fdSeIAuQHjnSLqfRlcNv6OA4Vj0J+6VX6lO/GgrEgOo
 jYWiy/pV94ETQQ6XitTwCnix72uqEArAt2stPp1eHU7+tarEqnyNohttBcIbckbjwj/P2+xl5xI
 BYQbTwYIn1hdD+V533IH30hqYCOta3iMuR0EQBcLwgXE+oJny/XaRuJYCmMV5hTgJ5OMT8YPl/U
 shuzgDkKcsM+yc/8cM9wpaUM6UAwGWxascKPNFq9V7S1Xn0wh7MOtM5Qv3urk2YcwcFFlRaNhof
 pmdge9Vi7jW+iyKprWoGYs6X0mId/oKPc1usoU58+GFdh24gkQwuKoj4mdFv1bTSRuVVIyCgOuy
 3lLOCesNLqS0gLpUmyFr5GqoMPUTgWuFLPkEI8U/vJxcbZNrRVkmF7AN9LOAdVeQHw2bgIR4RcU
 tYUGHv5PpBB+xIg==
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

The igt@xe_debugfs@check-gt-reg-sr IGT test (which wraps the new
register-save-restore-check debugfs interface) reports that a handful of
reg_sr items are not behaving properly.  In all three cases the report
was correct and highlights some necessary driver fixes.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Matt Roper (3):
      drm/xe/tuning: Stop applying CCCHKNREG1 tuning from Xe3p onward
      drm/xe/tuning: Use proper register offset for GAMSTLB_CTRL
      drm/xe: Mark ROW_CHICKEN5 as a masked register

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 drivers/gpu/drm/xe/xe_tuning.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 8abbd7e03e9925203b7e9cda9b4ea3e3800b74d2
change-id: 20260410-xe3p_tuning-3d5a5ef40dd0

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

