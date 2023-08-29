Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCA2C71153
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 14:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A0C10E2A3;
	Tue, 29 Aug 2023 14:13:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAED10E29B;
 Tue, 29 Aug 2023 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693318379; x=1724854379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zPKOzTVr4yYNHbk++q9kyrCbff2/yOujuOkuz1+hYPw=;
 b=TWZ1SpyH2SFDr0Y13jvt4TgzpbZy2JIlL7pnXLzw4CIuc5N6O/8+yuUi
 VfGTXvn6ZYsN/11/JQvPh4egX+PvXsMB3rnRT+eOtHgs7cMCLjg1CmgrY
 k8QpJoMFw8H+TdBj7zPCdsrRascuDBDnujBO6wOzA2eESV9txAMU9qqrb
 rjTPlbyfzw9+qhVrcobQwWQY3wd4tP0nnl9NDPNOzFF6KSYCamEU+m1Sd
 ZycmH+iIjigxOIUk0+1+fTBgJEpEU3nHF/kOtOlVBfQcbcGqVIH9WDAg8
 OSUilUoI48Zb4wS2lg3THQCj6EsLe1AoVy6ixS3wDtWZfnRkQ/prVGnNC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441733926"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441733926"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804123942"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="804123942"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:11:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 07:11:03 -0700
Message-Id: <20230829141107.1505705-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH igt 0/4] Add LNL support to xe tests
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add Lunar Lake support so xe driver can be tested. This brings the new
xe_pciids.h from kernel since now the PCI IDs is not going to be added
on the i915 side.

Janga Rahul Kumar (1):
  tests/xe_debugfs: skip page table level check for Xe2

Lucas De Marchi (2):
  lib: Add xe_pciids.h
  lib/intel_chipset: Add Lunar Lake support

Zbigniew Kempczyński (1):
  lib/intel_device_info: Add blitter cmd info for Lunar Lake

 docs/reference/igt-gpu-tools/meson.build |   1 +
 lib/intel_chipset.h                      |   5 +
 lib/intel_device_info.c                  |  14 ++
 lib/xe_pciids.h                          | 215 +++++++++++++++++++++++
 tests/xe/xe_debugfs.c                    |  23 +--
 5 files changed, 248 insertions(+), 10 deletions(-)
 create mode 100644 lib/xe_pciids.h

-- 
2.40.1

