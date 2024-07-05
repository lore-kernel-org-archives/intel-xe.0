Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE79C3271E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 19:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CA810E1AD;
	Fri,  5 Jul 2024 19:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfKIKVJM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0933710E1AD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jul 2024 19:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720206668; x=1751742668;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=73j7RHLqiGgG/pJBATi21G3ANBR0c5O5TgT5wZtdVJg=;
 b=GfKIKVJM7LCm0pWFh8QkpnAGay38Y07wRD6CbKtI3XWLrJylTeyvTodd
 t3XlebG/V9CReBUWI6O9C34ZuektdZQHQrEPe14NO8LkNJllSKIRPYkd9
 Z2xS17aS2Ztpv6ti12bApiWLta4qgHl1wQ1nXsq2/Q9NuEOvCgWbd4faK
 RI4pl6hkz6w5pyVM2FE2S+i1NKdvqTiGxHzjcVJxYi/4pmmC8BbglYGWy
 iSjguN7jtuKZDBErzRIp2W4eN+aYy1VNrJvn6sBmn6jfKwG1SvcutjsvM
 XVvej6DL+8vVkZ/+t5HpKHAgXLXbO3UrWTrl9LhTn0cjSgm7Az16W7YgS A==;
X-CSE-ConnectionGUID: atREMH4XTzaJbVua5rv5Gw==
X-CSE-MsgGUID: J6EeI3+1QE2uTG588e/ICg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17644039"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17644039"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 12:11:08 -0700
X-CSE-ConnectionGUID: VoQh8oPFSNOyionZKBCFtw==
X-CSE-MsgGUID: PIxaMLptRGuo95Vvb3/tBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="51781482"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.48.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 12:11:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe/kunit: Minor cleanup
Date: Fri,  5 Jul 2024 21:10:55 +0200
Message-Id: <20240705191057.1110-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
  drm/xe/kunit: Kill xe_cur_kunit()
  drm/xe/kunit: Drop XE_TEST_EXPORT

 drivers/gpu/drm/xe/tests/xe_bo.c       |  4 ++--
 drivers/gpu/drm/xe/tests/xe_dma_buf.c  |  4 ++--
 drivers/gpu/drm/xe/tests/xe_migrate.c  |  2 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c     |  8 ++++----
 drivers/gpu/drm/xe/tests/xe_pci_test.c |  4 ++--
 drivers/gpu/drm/xe/tests/xe_test.h     | 10 +++-------
 6 files changed, 14 insertions(+), 18 deletions(-)

-- 
2.43.0

