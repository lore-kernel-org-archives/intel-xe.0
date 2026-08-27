Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F08DC61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 16:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C142C10E8B1;
	Thu, 27 Aug 2026 16:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ry7kkOZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6324010E0BD;
 Thu, 27 Aug 2026 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787849083; x=1819385083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8fZsNNcg2HVtcyjeAwR7bHQt7AFw5bOQCN6jvXl87xo=;
 b=Ry7kkOZLVObFpvyEl0aSU1NRsSXjuHXjOQ/G7ifzIEIdU4VMhPqrqpG+
 F59sgtWBpMqYSI6GB20P6bnzQCgpsD1VS0zPRGLC6LL8aMoPCzQmCcbUT
 9dZvrAdMacKcrdIefOcyGacWE4XttvT7VRlAtwkmg1QD5bw5snWaY78vD
 nKnL7O/FORdLYTY9cjg2cpwBF+5KsvThpQSX5CcZqfvoOG/Z5gtvaIAV3
 BhyCM7Y7spVAod/otTaFyP9ItdKHm6B99CWMi+4xNqWoXx0Uu5bQcQkk6
 AcqNHsm1LuMU1CCksFzQB8hApynKQCupyWuyyPXHsJaUIVb8e66Ep5Lde Q==;
X-CSE-ConnectionGUID: sBtnqEjSRCGdPLqYM3DMSw==
X-CSE-MsgGUID: RBhHgOSKQ2+2HnLAJFDvgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88276128"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88276128"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:44:43 -0700
X-CSE-ConnectionGUID: 01622ppzRRK+N0dEnvI2FA==
X-CSE-MsgGUID: cK03hShBQ0GDfBk2ASJgOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="306134047"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 27 Aug 2026 09:44:41 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/5] Enable joiner cursor fast updates
Date: Thu, 27 Aug 2026 22:11:58 +0530
Message-Id: <20260827164203.2371794-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

    This series enables the cursor fast path for joiner mode
and adds the missing secondary-plane handling to keep updates
correct and synchronized.

Nemesa Garg (5):
  drm/i915/cursor: Check joiner cursor commit status
  drm/i915/cursor: Add helper to update cursor plane
  drm/i915/cursor: Handle secondary cursor state
  drm/i915/cursor: Program secondary cursor planes
  drm/i915/cursor: Allow joiner cursor fast path update

 drivers/gpu/drm/i915/display/intel_cursor.c | 282 +++++++++++++++-----
 1 file changed, 212 insertions(+), 70 deletions(-)

-- 
2.25.1

