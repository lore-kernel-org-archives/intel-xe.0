Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28D2C5B56A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 20:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D09510ED89;
	Tue, 11 Aug 2026 20:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I95ExfdW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D910D10EDB0
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 20:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786478958; x=1818014958;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4N2BtrZUsn05FGSUg6WGwNjSjsYrtmkX181Cr2XMlNs=;
 b=I95ExfdWh1x2/cKTMIbhFvVV4gvFfJFsD2fQfVwzTBmF8VX49ZskXPiW
 FzT+Prut6KqgDOQzjqxkZsvvcea8CTi2h5pB812QmcniRsBZ4whWTb0xM
 ibbcNAYA/b9cThfDN7WXYsWE/fCGb5r/CXkmvtcTL6Jy7PzrGhGRQ16IB
 StryMhLEL7zYpulLgfTBvw6GghEoF3BwdSQpSAmwYPwFG7vVGb4YULFEZ
 UFVcTpmi8Gjlzfy7oliXpYZom8HmxNlatyf9jlh2dSZrv1jyUs1rWrNtT
 wvm90sdhx+sKTgmw38p2S+wg/K7iyZM1oJWl9gAQRZci6kqrF18K5h6ZW w==;
X-CSE-ConnectionGUID: mG2PzcByStmQ82i2txLTew==
X-CSE-MsgGUID: pSvEiKsMRiyx+v+xTHvyPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87033178"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="87033178"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:09:17 -0700
X-CSE-ConnectionGUID: +rVf87n/R7+8nKEImeF+2Q==
X-CSE-MsgGUID: mLzA/0WcQLGxQwrTG3jcGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="260111067"
Received: from rajeevra-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 13:09:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] drm/xe: small pagefault handler improvements
Date: Tue, 11 Aug 2026 22:09:03 +0200
Message-ID: <20260811200906.10400-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (2):
  drm/xe: Use guard(spinlock_irqsave) in pagefault handler
  drm/xe: Remove redundant full pagefault queue check

 drivers/gpu/drm/xe/xe_pagefault.c | 49 ++++++++++++-------------------
 1 file changed, 19 insertions(+), 30 deletions(-)

-- 
2.47.1

