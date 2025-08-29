Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FAACA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3AD10E1DF;
	Fri, 29 Aug 2025 17:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAeaKViy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBFA10E230
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 17:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756487985; x=1788023985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xNjr9qxbIfDz8AuofdevvBUGDnJp7kdUGdyHia61IHA=;
 b=jAeaKViyQ3YSUUt6/aMmfddkIrGkQotSnAxbBEP0cmOtKRLwDGJ5GjxY
 PIlJW430smHjKuQ9ooTW0ecuPlGlD0uwuuyx/4pTmTMRA/Jz/7MUEt1LI
 8F9mlTqWgr1D/GALXuX/1J3PKTBRumlB5JYLZr4PEUhVKC2BXlD9uvkRl
 Dwp/jYZnUaZQxEe3EfIwk/nSwrW45a0/lQ3IZauGyKTe2Njr5zpEmra4N
 2dSrA9qMMRocNb0YACqcJLVUzbdd2I2Tb78OZ0XPdrATSK9zCMAX9u7az
 Hk6iAWS7+ufsBLfCunKedEWgVEQkHpWVFbI0mqhWkONduxfGgZa6K0RM/ w==;
X-CSE-ConnectionGUID: eQ+GfhxASWG8h9CPCo9y2Q==
X-CSE-MsgGUID: 44ypU13WQBKSQdzRLXLOoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70212758"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70212758"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:19:45 -0700
X-CSE-ConnectionGUID: iVMJgAzITfeveOqqp7MNxQ==
X-CSE-MsgGUID: oSJdjElsS7u3h0UC3Y0Kfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170818259"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:19:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/7] Misc xe/kunit improvements
Date: Fri, 29 Aug 2025 19:19:15 +0200
Message-ID: <20250829171922.572-1-michal.wajdeczko@intel.com>
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

We will soon be adding some more kunit test suites to validate the code
against different platforms. Improve xe/kunit param generators to allow
better code reuse.

v1: https://patchwork.freedesktop.org/series/152440/#rev1
v2: rebase
    copy whole struct (Lucas)
    don't look at vendor/class_mask (Lucas)
    use %u.%02u notatation and print IP name (Michal)
    add dut modparam to test future platform
    allow to stub IP lookup helpers
    drop dangerous xe_wa_test_exit

Michal Wajdeczko (7):
  drm/xe: Allow to stub lookup for graphics and media IP
  drm/xe/kunit: Update struct xe_pci_fake_data step declarations
  drm/xe/kunit: Introduce xe_pci_fake_data_desc()
  drm/xe/kunit: Drop custom struct platform_test_case
  drm/xe/kunit: Promote fake platform parameter list
  drm/xe/kunit: Drop xe_wa_test_exit
  drm/xe/kunit: Allow to run tests against custom platform

 drivers/gpu/drm/xe/tests/xe_pci.c      | 311 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/tests/xe_pci_test.h |   6 +-
 drivers/gpu/drm/xe/tests/xe_wa_test.c  |  91 +-------
 drivers/gpu/drm/xe/xe_pci.c            |  38 +--
 4 files changed, 338 insertions(+), 108 deletions(-)

-- 
2.47.1

