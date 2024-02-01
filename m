Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE02C48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C3510EAD6;
	Thu,  1 Feb 2024 19:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+r9EKzp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827F610EAD6;
 Thu,  1 Feb 2024 19:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706814182; x=1738350182;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B4JMJ5phljrnHqFEnDgd235bD6Outh2bPsomC4ldoR4=;
 b=k+r9EKzpIVUmdwLSjU3alQcUGP4Q0db/guhA35NB8RHQT2wLOXhTj3yY
 6TL4IRFS3z53xnSDQXrpAlU8lFbIIKO80HNlohYhCXcq3Z+GhOIwUHWV8
 5uqeEcSls7W4eN92FPIIM+MIj9sFeO/V1Kz0ZD2K93WJzlrTJWx86itJG
 7pJWn2ZqAqmFoEOd0JHdOiP8CHIShzoExjrERE9+L6lE4kuwrweW/mZc4
 cLqkmubSi93cKimPL3EACZy1rUcbulHLIxn09IGn22fY0J1YqWwB1xZls
 z9Kcw9BowuIgsAAsv726rN6T7xQ1WvTuT9EhTfZID0eU2lwN8DYVLng/r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407694469"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="407694469"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:03:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="912219403"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="912219403"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.1.219])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:02:59 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v3 0/6] lib/kunit: Support writable filter* parameters
 of kunit module
Date: Thu,  1 Feb 2024 19:59:16 +0100
Message-ID: <20240201190237.150754-8-janusz.krzysztofik@linux.intel.com>
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

v3: Don't read-compare-write, just write the values (Lucas),
  - skip calling igt_sysfs_set() when the string to be written to
    filter_action is empty (Lucas),
  - warn if we leave the filter_action set to "skip" while setting a non-
    default value of the filter parameter,
  - transform generic kunit_set_params() to kunit_set_filtering().
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

 lib/igt_kmod.c | 115 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 79 insertions(+), 36 deletions(-)

-- 
2.43.0

