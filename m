Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21389C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 11:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1E510EAA0;
	Fri,  8 Dec 2023 11:29:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BBC10EA9B
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 11:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702034984; x=1733570984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hXrr1ApuJeB5RIfYSa1n8adzh/Q6P6mJdRwHCzHbspg=;
 b=nzKFD6sXxDSmGTsV1ESnjNMXCcvzzn6gicT+P50FUT9wI7GZOMWc6JTQ
 s5tRRZKTmjUVym+8m1no4+xsevAkWbm3h0QV6OtrNMG9tjKIUlqwhNPuU
 /WMIfUDZRW7r7D8cLcGYsQ/NmkTQ1ZMdoY74i9qW23eHcDs7eM0NkZLyt
 mCPJsNMhLOI6wvTz10+1YW6KvWmasd1Gg79ivlxIPCVgbUlqViVVDJ1QF
 eaptKlY1TJflaGoU59D2CKyoi4wq9dgY+QgtGOaPSL+eTdP0vtlOWIVLo
 q05q1vYMX5fb/PXAMKBTVIHtK/DV2lh6YmIu4Dn2tzFzjyr5sE1STYMQI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1474128"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1474128"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 03:29:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721843382"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="721843382"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.236])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 03:29:30 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/2] Huge PTE and scratch page updates
Date: Fri,  8 Dec 2023 12:29:16 +0100
Message-ID: <20231208112918.15411-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The first patch restricts encoding of huge PTEs to 1GiB and adds a define
for the maximum level for which huge PTEs are available.

The second patch replaces scratch PTEs with NULL PTEs.

Cc: Brian Welty <brian.welty@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Thomas Hellström (2):
  drm/xe: Restrict huge PTEs to 1GiB
  drm/xe: Use NULL PTEs as scratch PTEs

 drivers/gpu/drm/xe/xe_pt.c       | 68 +++++---------------------
 drivers/gpu/drm/xe/xe_pt.h       |  6 +--
 drivers/gpu/drm/xe/xe_vm.c       | 84 ++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h       | 11 +++++
 drivers/gpu/drm/xe/xe_vm_types.h |  1 -
 5 files changed, 82 insertions(+), 88 deletions(-)

-- 
2.42.0

