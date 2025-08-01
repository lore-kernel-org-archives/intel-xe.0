Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BD0C87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 18:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AE210E317;
	Fri,  1 Aug 2025 18:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCTpe8qM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0BC10E317
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 18:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754072043; x=1785608043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R8CLGgPUQENjV4dr8AYDZjJeXvJL2YonDJnDflQL7vU=;
 b=VCTpe8qMRfEcUZUTLC9vIPPwuu5dQPvcmeE9b6adaWL0h4kZkolSP8gL
 q9xiHlv07igOxgBxJWGOvVPcxk9xupZ6uq1SAL/mQT/8eQUkRPUkIWIlq
 4RAfmJNZyDo6BTrgsXhPCvrbV4TXMXwyHvpggy+9/Y4MKfiIysr476mkx
 q9/LropEiK1VcKZvEBgV2o0QbHSu61fGBo1z6nluRIeHaoKzS8FUsQHzh
 mvPwKMlY7ASErYlkM2KPz5RAW/tW0fioIcx7uXp/v3UEZv8O29n1Aq98U
 eh55e2bvC7lP24eQTAPr3kV2DnuDKCVmWWpxhZzVmzzgHC/apH7kJcH7F Q==;
X-CSE-ConnectionGUID: LPCQsbzXSn6qVlOzyuNdPQ==
X-CSE-MsgGUID: hM5hx65JSBurhy+kgBztug==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56315548"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56315548"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:14:00 -0700
X-CSE-ConnectionGUID: D8pHXQZ2Svmv0iWKmkk/uw==
X-CSE-MsgGUID: 74pP5FLkSGqtp68n8usD7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163553795"
Received: from mkolod1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:13:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/6] Misc xe/kunit improvements
Date: Fri,  1 Aug 2025 20:13:44 +0200
Message-ID: <20250801181350.180780-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (6):
  drm/xe/kunit: Update struct xe_pci_fake_data step declarations
  drm/xe/kunit: Introduce xe_pci_fake_data_desc()
  drm/xe/kunit: Drop custom struct platform_test_case
  drm/xe/kunit: Promote fake platform parameter list
  drm/xe/kunit: Use default GMDID version if none provided
  drm/xe/kunit: Extend platform generator with PTL

 drivers/gpu/drm/xe/tests/xe_pci.c      | 178 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/tests/xe_pci_test.h |   6 +-
 drivers/gpu/drm/xe/tests/xe_wa_test.c  |  82 +-----------
 3 files changed, 181 insertions(+), 85 deletions(-)

-- 
2.47.1

