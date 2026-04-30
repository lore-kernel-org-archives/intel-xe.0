Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43624CD13D3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 16:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6FA10F3C3;
	Thu, 30 Apr 2026 16:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4tWeYXe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A850510F3C3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777565704; x=1809101704;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5rvn8YNs5Xfj0MrZNYsXwqhLE+JV+yA63+W8uJlKOXU=;
 b=P4tWeYXeR5FAed3b7V84M6rG54b/40p/obXZhhDPIFbaRXW5jH1j0phh
 YyaLW7pFXjZAA3hEPsk0nz7vEd7aJ1R6D2mKURexF5IMbz9zWAnc0XGa5
 O+hwXO8biZKbR0xXujtLPrVBfF6BYCjvJ934Eq+Za/cXOwtORNDxtzlgB
 xD2SNc9Pb1Oa3VgQF/Xeztezsqo+PGIo3sSirdMHRkfsZgjQdrTWI+xeD
 Z/hcil1SEBnSrY5fd2q1QiAyHb0CZwrXzndH8gL2Q79pZg1RqKoXTJNJh
 qyd5F5CDX4D/f6lLJTKH0F6E1AHOG95U0N+oVsV6S/mLxfdg9QOY9LWDE w==;
X-CSE-ConnectionGUID: VMW6w4WjS2O49LOrD+pV+w==
X-CSE-MsgGUID: 11uzWBd2QTCqGZZQQfIv8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89620092"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="89620092"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 09:15:03 -0700
X-CSE-ConnectionGUID: nSttRV/aRMSKoceCarCV3w==
X-CSE-MsgGUID: 6D8kOCdNTpyzX6u6d1PT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="238609916"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 09:15:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] More MERTOA WA's
Date: Thu, 30 Apr 2026 09:14:55 -0700
Message-ID: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

Ashutosh Dixit (4):
  drm/xe/oa: Refactor oa_unit_supports_oa_format
  drm/xe/oa: MERTOA Wa_14026746987
  drm/xe/oa: Add val arg to xe_oa_is_valid_config_reg
  drm/xe/oa: MERTOA Wa_14026779378

 drivers/gpu/drm/xe/regs/xe_oa_regs.h      |  3 ++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  2 ++
 drivers/gpu/drm/xe/xe_oa.c                | 40 ++++++++++++++---------
 3 files changed, 29 insertions(+), 16 deletions(-)

-- 
2.54.0

