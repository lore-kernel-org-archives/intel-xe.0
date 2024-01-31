Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888FDC48285
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 18:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7642510FAEC;
	Wed, 31 Jan 2024 18:12:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134D410F5EE;
 Wed, 31 Jan 2024 18:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706724742; x=1738260742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qJrqIQ1suxBKctsI+S6dsFEyilVKQPEEUX9fOBEv/JE=;
 b=AdGivXiJuNblxSrbQUAHexQUPUNa874VUSeeUwJ4eIbaZ0qfRNLX8miM
 igk9l16Tqg9oh+yK6TkVYs1RmQW/xZSK8HRIVX1wsAhT/BwvHkSYoHZ9I
 zq2VHhedKlogvDyo+FZoOvyHdmYzG9QYY6ZXQUT12FS7ugJ5eBdnuEfr1
 LRpAmwdUyuVGoM2ZPkFreGhbEndCeP3cggGI6Ps5YwN3QChmyfXmfvO/H
 oFcfMN7PKgOylhlUPGumH/qFTz6wMlmpTzV3aem014ER1fBSx/P2GNqRU
 I62ruyPQM8mUgO4X93W00jkurNZaEMw//1Rx0M/LB+kRqf+4i5X4VyBeH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17067184"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="17067184"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931930475"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="931930475"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.2.5])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:12:17 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/6] lib/kunit: Support writable filter* parameters
 of kunit module
Date: Wed, 31 Jan 2024 19:03:47 +0100
Message-ID: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
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
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of wasting resources on reloading the base Kunit module each time
a different set of filter parameters is needed, try to write the required
values to sysfs representation of those parameters.  If that fails (e.g.
on older LTS kernels with read-only filter parameters), fall back to
reloading the module.

This change also provides a workaround for the issue of impossibility to
unload the base Kunit module on Xe platforms, available as soon as the
module supports writable filter parameters.

While being at it, fine tune processing of skips on errors during test
case list collection phase.

v2: Work around ineffective writes of empty strings to sysfs module
    parameter files (Lucas) by using human readable non-empty strings that
    give the same results as default NULLs,
  - drop fallback to reload of base Kunit module method if assigning new
    values to module parameters via sysfs fails (Lucas), instead use the
    existing fallback to blind execution like if getting a list of test
    cases was not supported at all,
  - split move of open_parameters() helper up in the source file as well
    as cleanup of base KUnit module unloading to separate patches (Kamil),
  - skip on empty list of test cases (new patch),
  - address the issue of commit description suggesting two separate
    changes combined in one patch (Kamil).

Janusz Krzysztofik (6):
  lib/kunit: Skip on empty list of test cases
  lib/kmode: Prepare open_parameters() helper for reuse by kunit
  lib/kunit: Unload base KUnit module only before reloading it
  lib/kunit: Support writable filter* parameters of kunit module
  lib/kunit: Report early kernel taints explicitly
  lib/kunit: Process module remove error after list errors

 lib/igt_kmod.c | 138 +++++++++++++++++++++++++++++++++++--------------
 1 file changed, 98 insertions(+), 40 deletions(-)

-- 
2.43.0

