Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1BCC07E98
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 21:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27E910E333;
	Tue, 28 Nov 2023 21:36:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5165110E333
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 21:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701207395; x=1732743395;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BMvKIVEKCfm/iMwtaM/zarVCT7e0HzMEv6MFwi+fwD0=;
 b=Na96WZRrFhjeNJmN+0wxvOhEeRfgSBA0BILThVm66qrSiBXxVLdRl+Lp
 QcF9RUphNAi/26w3QZ9KAdrrxVIze/N8T4vNIG1V7whohbzkSGKvMh/ms
 MFDuzPlj3dN/4NftWEyx6czVn8796+Ups23LGujzIY2YwTSxZ63pGDB8s
 VO1VEpKdNDzJV6ZNOsq+NxJsVglv6i3zFGwP+8MozPaEtftiJqAG6tWbo
 u2dpf1CkTw1+EgUTdKL1rM9tPbc4hXpYgzfG7+x3IkKiaT/LvKOZr0nKL
 1JRxYiNCkw5j/R8C+PsL0ORbZPx35xZef3Xq+6k/U4vj2G0LJL9/9rtyw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="390193764"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="390193764"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 13:36:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="886587843"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="886587843"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 13:36:34 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 13:36:32 -0800
Message-Id: <20231128213634.3633-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe/xe2: add pagefault support for LNL
 platform
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

Two patches to properly support device page faults on LNL.
Not yet enabled, that would be follow-on change in xe_pci.c.

Brian Welty (2):
  drm/xe/xe2: Update LNL platform to support device page faults
  drm/xe/xe2: Respond to TRTT faults as unsuccessful page fault

 drivers/gpu/drm/xe/xe_gt_pagefault.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_migrate.c      | 7 +++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.38.0

