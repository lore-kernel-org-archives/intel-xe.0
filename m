Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CEFD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 10:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D6410E237;
	Mon,  1 Dec 2025 10:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoqZlB73";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EC710E237
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 10:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764585117; x=1796121117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xd6Lp/Zf7l5EttdPWtOCehtaQEQO5BZ+5tk2IPgIqSs=;
 b=aoqZlB73Zq+00x/WemLIqrY3+82hBycTHrBYxiSmt9phzBcPsF246+Pk
 w34M3MIPvARcCxSYJtJ5kQg37XwVYfdyM+d3tpz0U2mp21jBzaXdtkPG7
 R/vyWS0WeFEWm8tAncVbSqx7pMqxFVtVax28Xmb3ZTiE2iZ8bs+exn1MI
 bMDTisfu1L/FgZiCq57iieJvIYViNcpXfy+ub5S5BWMlKGA2jx3IKX+v1
 vHVTZT5sUphevB5RJr07c9pMH7WXfueFG8+plIzgjHKtRiyQ2ToRuXBuI
 G1ob4bDdx7GiBiD0E/C5FKFX3cQq1bBIQ31E7vSInTKKzu6xdxeOWoOWC g==;
X-CSE-ConnectionGUID: nJ1LMqB9TNStIM5FG5UO9g==
X-CSE-MsgGUID: wvZUbAY0TAan+7Tg0UARDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70131279"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="70131279"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 02:31:56 -0800
X-CSE-ConnectionGUID: a3F2d9gxTOmaNWAmk9l20A==
X-CSE-MsgGUID: mJPfPGsfTOi/HzxA+m6Y1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194134153"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 01 Dec 2025 02:31:54 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: rodrigo.vivi@intel.com,
	jani.nikula@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/4] Introduce PCODE_FALLBACK_MAGIC
Date: Mon,  1 Dec 2025 15:57:54 +0530
Message-ID: <20251201102902.362650-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series introduces PCODE_FALLBACK_MAGIC bit which allows the caller to
check for mailbox command support and uses in a few places where applicable.
Detailed description in commit message.

PS: This one turned out to be a bit ugly than I thought, but still sharing
it to move the discussion forward.

Raag Jadav (4):
  drm/xe/pcode: Introduce PCODE_FALLBACK_MAGIC
  drm/xe/sysfs: Use PCODE_FALLBACK_MAGIC
  drm/xe/hwmon: Use PCODE_FALLBACK_MAGIC
  drm/xe/late_bind: Use PCODE_FALLBACK_MAGIC

 drivers/gpu/drm/xe/xe_device_sysfs.c |  4 +--
 drivers/gpu/drm/xe/xe_hwmon.c        | 12 +++----
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 11 ++++---
 drivers/gpu/drm/xe/xe_pcode.c        | 47 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pcode_api.h    |  1 +
 5 files changed, 47 insertions(+), 28 deletions(-)

-- 
2.43.0

