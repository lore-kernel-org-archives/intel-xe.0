Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2CCD0D17D
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 00:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B770910E0FA;
	Thu,  8 Jan 2026 00:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Azw3LkEa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BB010E0FA
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 00:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767831612; x=1799367612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dRKl0rO7eR/1RW4UXco8s8l+aDpD48ezhdY4MA5SRss=;
 b=Azw3LkEaGCwWV7Kgiag4xmLY5xbaO90ihBbLU005c+WCEjGtNsLlnNKW
 InODlLt9am+mQvBa1y5CSFKUDO5KNb2lV4VfhIZx57eQNEo5L2n8sSImJ
 DeG02lAsWeY+pi5794MJ4up6P0kYFW4A+RXqWkHEOpn1VMS3zVnA/oY/2
 vJRliZviLyG7vcFb60yct0nFLVjRbDsKwurTiMLh6KPLSMWHL8AMsSboi
 0ITsEVhQ2oYN9CSaLNObB9tc9tS6Q40okyUKKoUz9RfnGNk2HJ+Yfs4PW
 ekAnDLL0mTYGKgh3epdohWMc/zFmaBalusekVTIErazAloSGUCCyaS2ZN Q==;
X-CSE-ConnectionGUID: abRzfxv2Q/eiRVMmNZihKA==
X-CSE-MsgGUID: ImveKBl6TZOQTZA7ykaCSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="71785537"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="71785537"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 16:20:11 -0800
X-CSE-ConnectionGUID: LL1U+zB9ThaOG8klmBu6kQ==
X-CSE-MsgGUID: jkjk/4ZlQMihaFIPWrKoPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="203500978"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 16:20:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 0/4] Start fixing OA whitelist mistakes
Date: Wed,  7 Jan 2026 16:20:01 -0800
Message-ID: <20260108002000.384449-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
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

There are a number of mistakes in the OA register whitelists:
 - Unlimited upper bounds (never allowed for whitelists entries!)
 - Whitelisting registers that userspace already has access to
 - Whitelisting registers that userspace is not intended to ever need
   access to

Correct the first two bullets above.  The third bullet will need more
investigation to determine whether any userspace has developed an
unnecessary and unwanted dependency on these registers (in which case we
can't easily take them away without breaking userspace).

Going forward we should also probably unmacro-ize these OA entries
because they make it harder to see exactly which register(s) are being
whitelisted and harder to audit against the formally allowed lists.


Matt Roper (4):
  drm/xe/oa: Stop whitelisting MMIO_TRG registers on non-DG2
  drm/xe/oa: Stop whitelisting OAG_OASTATUS
  drm/xe/oa: Stop whitelisting OAM registers on non Xe2/Xe3
  drm/xe/oa: Stop whitelisting OAG registers after Xe3

 drivers/gpu/drm/xe/xe_reg_whitelist.c | 41 +++++++++++++++------------
 1 file changed, 23 insertions(+), 18 deletions(-)

-- 
2.52.0

