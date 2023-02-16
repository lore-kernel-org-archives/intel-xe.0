Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6749C61DA4
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 23:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD6310E39B;
	Thu, 16 Feb 2023 23:17:41 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4085010E390
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676589459; x=1708125459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e0gStWe9REoCWl5B9almxHNmIspAxOhals9KRaRsNfY=;
 b=II7KbccQDavKsf1A83Qjxo87Nwg64BcPBBscnkdRfTEOMoRiRzkP/svN
 SC8Prs+eUo3bTdjuiTq5YkPGNS9tbkIhznbqGfdVBaClmejN35Hig1KNf
 1ke7KKK8zPZC2DVjJLDI6Ts2QTD5VT0SAlT4yoDbGX4RqDfN7iqS9RM+2
 gqnCs57hPTgqC01xsgKKahgOVv5b/qhVX1LUAOfGEt1OXViMRvp+S3seY
 dzGs46ndQ3qyxTJ4s+42KaLV+cik4C6YE6OjSo3o8GmmgMDKTJJhp8egF
 8PAXg5JS0kXqJYDYWFCKzLvj7MSqnY2xNtiw5pLoKswrU00EIl9IjVUQj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333220830"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="333220830"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813169198"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="813169198"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 15:17:18 -0800
Message-Id: <20230216231724.2246534-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Assorted MOCS updates
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

The Xe MOCS code is heavily modelled after the equivalent i915 code, but
there are a few items that are not appropriate for the Xe driver.
Philippe's patch to add the MTL-specific table is also included.

As a follow-up, I'd like to rework Xe's MOCS to just use the xe_reg_sr
framework.  But that's a bit more invasive, so I'll save that for a
future series.


Matt Roper (5):
  drm/xe/mocs: Drop unwanted TGL table
  drm/xe/mocs: Add missing RKL handling
  drm/xe/mocs: Drop xe_mocs_info_index
  drm/xe/mocs: Drop duplicate assignment of uc_index
  drm/xe/mocs: LNCF MOCS settings only need to be restored on pre-Xe_HP

Philippe Lecluse (1):
  drm/xe/mocs: add MTL mocs

 drivers/gpu/drm/xe/xe_execlist.c   |   2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c    |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit.c |   1 -
 drivers/gpu/drm/xe/xe_mocs.c       | 160 ++++++++++++-----------------
 drivers/gpu/drm/xe/xe_mocs.h       |   1 -
 5 files changed, 76 insertions(+), 98 deletions(-)

-- 
2.39.1

