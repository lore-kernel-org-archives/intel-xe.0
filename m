Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB93CD6E64
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 23:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4430113B77;
	Tue,  2 Jun 2026 23:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goQmWs8n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46EA113B74
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 23:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780441753; x=1811977753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RqxV2uMC6F61KwvoGun9ZJuntlThB3AU9huuMgTDMnk=;
 b=goQmWs8nWaIEALiRq6868m5Bw5S55L0sc+4d89nCezVHNc0i9Jimg4RL
 N2HeaDHMxt7NnTithnzQxIc0e0e7v9DA9tuT/30b0u0SxXGX6/r39YMdf
 hbKhAI4vrI+J+HwNbB37DvGvX4tBwtzz8chJvilC5IBoPJ06Wh/Tnn2mT
 M2GLyJu3FLplRRhUiztvghebv2u0Fx/lWIdpZJLj2UYeTkcum9pewiQQU
 59z0bVD9+rYg2UfrbmkZvZFMgholx+xHJsQpMmdllpO7k3g52SSIBHvIQ
 WwcbAVymxexVHte2/PvD1rkP0mCazcOQVekIGInGL0Dxc/novx1s2Xbcw g==;
X-CSE-ConnectionGUID: dY86StbXRU6tNqRxVdMcew==
X-CSE-MsgGUID: 70Bkwc1tSoKAzk8fkBxHag==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81215045"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81215045"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 16:09:12 -0700
X-CSE-ConnectionGUID: 9lm9rAL+She04SQqbePTUQ==
X-CSE-MsgGUID: mKX6nWTRTr+692YPnpQqSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="244154618"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 16:09:12 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/2] drm/xe/oa: A MERTOA bug-fix
Date: Tue,  2 Jun 2026 16:09:06 -0700
Message-ID: <20260602230908.2350117-1-ashutosh.dixit@intel.com>
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

Ashutosh Dixit (2):
  drm/xe/oa: Rename last argument of WHITELIST_OA_MMIO_TRG
  drm/xe/oa: Fix offset alignment for MERT WHITELIST_OA_MERT_MMIO_TRG

 drivers/gpu/drm/xe/xe_reg_whitelist.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.54.0

