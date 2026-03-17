Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24F5FD7077
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 10:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F7610E1ED;
	Tue, 17 Mar 2026 10:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aaALP3b7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A2510E1ED;
 Tue, 17 Mar 2026 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773744094; x=1805280094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eXfcoFuMBRNi4wRBdRjV2uz5b/WwGJGR35sQWGBbzLM=;
 b=aaALP3b7IT2W84rjDu/DnTDn327Qm7Plq4BodjjRWPLLKZRkyyMJ9nzR
 7JvQQV2o2tPocMBFue4AmavyZfM+l1ILmtaWWHjLbTcHviX0/9qmxBZ5/
 WyvQPNaPF8wmSldbXVY03AU8fWfsC1BQ4FW5uzEwXgMnz4mTvubWIRwQZ
 g2xdYUrDsn8uv2NiOmt3yxuGv76VsTaj5a9O/GY9P9fZwrfoQC8obb7uX
 4pDytdk4hJmRedNmX3GLagXH9BBvPGzzljJRr+UolJ/gpQHp2uU8S3ao1
 yNuYpapfDa9j3hfG0fk1PELkbjG72VX1C30eLM05UqRTIcb1X4N793DVv Q==;
X-CSE-ConnectionGUID: ltuulqfGQk64u4L3Thxijw==
X-CSE-MsgGUID: lRx9CIB9R+GU1SrrFH9iqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77381972"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="77381972"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 03:41:33 -0700
X-CSE-ConnectionGUID: TAH5+9qnT/SEA4Rpy+0zgQ==
X-CSE-MsgGUID: 1hMjdiNBSEaw9kiU3GnqmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221455814"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.118])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 03:41:32 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH 0/4] drm/i915/display: don't access display PCH registers in
 non-display code
Date: Tue, 17 Mar 2026 12:40:47 +0200
Message-ID: <20260317104119.1690065-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
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

I have another, more direct and less "generic" way implemented,
without the mini-framework, but I think the current approach is
cleaner.

Please review.

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
2.51.0

