Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D714EF532E9
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 08:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975CC10E536;
	Tue, 24 Mar 2026 08:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoU6MVRJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DADE10E536;
 Tue, 24 Mar 2026 08:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774339495; x=1805875495;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+bd1veo5TPmSZV07onsl7Yq7TjisnB0ot1ZCtIRwk8c=;
 b=JoU6MVRJK0p9PpA4/nB/WHhXwmsQ0X81Nsvb2Zd7twDZoQPTdb0YpKa9
 E+IE23aTdDGjkJfJ9OcgHquu/ntup5M6pzvmPO3p0k6Q5/Uhq1XqQ9si9
 4+n/PLtrn2u4E/CG2jYmZFI9WmPwEQX9TQxgllhkzOaRPtR1dsaPLfkZT
 bKyoQNtam0qLmDze3dqpE7FkHiuHi9UjEtH74J3r8yjseWfoECsqz6cM+
 RYERXj+a84l2tiwSm9iFdd7uvXPutkjEDKZfECqoOR1qSZzY9pG4wLdyF
 yElOFfTtFUwObMqgNQICC2GiHoAE68xFsXtRYHF12dtrB8GYbSuYr3feD w==;
X-CSE-ConnectionGUID: S3HP6St0TYGOAICQjPMeeg==
X-CSE-MsgGUID: eB4TNPzMQ32sCJyQZg7yPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86045469"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="86045469"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:04:55 -0700
X-CSE-ConnectionGUID: Mg7CgWkSRpei0mzioNNqAg==
X-CSE-MsgGUID: NlflSawhSPWXgD8d0MzaiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223494924"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.170])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:04:52 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH 0/4] drm/i915/display: don't access display PCH registers in
 non-display code
Date: Tue, 24 Mar 2026 10:04:24 +0200
Message-ID: <20260324080441.154609-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
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

Hi,

This change moves the display PCH register accesses from the i915 code
to the display code.  I created a small "framework" to do this, which
relies on the PCH_TYPE to figure out which initialization needs to be
done.

The callpoints are still on very specific points in the generic
clock-gating initialization, but there's no way around this without
overcomplicating things.

In v2:
   * Rebased and added Jani's r-b;
   * Mostly to retrigger CI with a known base;

Cheers,
Luca.


Luca Coelho (4):
  drm/i915/display: move clock-gating init for IBX to display
  drm/i915: move CPT clock gating init into intel_pch
  drm/i915: move LPT clock gating init into intel_pch
  drm/i915: move CNP clock gating init into intel_pch

 drivers/gpu/drm/i915/display/intel_pch.c  | 93 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_pch.h  |  1 +
 drivers/gpu/drm/i915/intel_clock_gating.c | 86 ++-------------------
 3 files changed, 101 insertions(+), 79 deletions(-)

-- 
2.53.0

