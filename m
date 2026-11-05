Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E95606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 20:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aCDGtUqq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB9D10E951;
	Thu,  5 Nov 2026 20:34:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7823110E378;
 Thu,  5 Nov 2026 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793910879; x=1825446879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GGtr0XYVkuP3QXO4mn+Lhv3jPHjuhK4kv2lxLzdSg6I=;
 b=aCDGtUqqlyFeLRJ+PZYwTRWT9cKQ8p2jBSkrLukKxqnIUGBsqR4LDE26
 icpSqmvIf1/1CSvu3YZVdVcbjuXhru0yRW47wPPO/BJ6/ma9vYCPmjHNd
 8gTy+LMZBSeAYCSpFJNpa2aFR8EsXQnZ3i/7DyOC2q0gTK/Ih/03MEBVX
 zaui3V04YCbmcU/DOkoy9B1SFF+IYywmD8TnO2RDxzqK1hILe1AI3O3IC
 y33nL5Zr7XBF8MeGX/P98htPcpvEN60kHfYsOsysCHoM611krVkEfmss7
 JRZRTN5q4hh89Rmpb39b3VEOT27n/jAMkFbMxfiUgO0aeqI/jFaV+Ots0 g==;
X-CSE-ConnectionGUID: gzKeUibxQFi8bA+uUbyomA==
X-CSE-MsgGUID: 2wqDCkMjSYmrqaWtPoDJvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2617406"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2617406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:38 -0800
X-CSE-ConnectionGUID: B0gpvpAfQia4u9cBNRLlGg==
X-CSE-MsgGUID: ZxpEr7rARNaLDwTYi4EHqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7151596"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 12:34:32 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/5] drm/i915/irq: Clean up the GEN11_GU_MISC mess
Date: Thu,  5 Nov 2026 22:34:22 +0200
Message-ID: <20261105203427.8696-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Clean up the mess around the GEN11_GU_MISC interrupts. Now all
the interrupt register details live in i915_irq.c where they
belong, and the display will only know that a GSE interrupt
needs to be handled.

Ville Syrjälä (5):
  drm/i915/irq: Relocate gen11_gu_misc_irq_ack()
  drm/i915/irq:
    s/gen11_gu_misc_irq_handler()/intel_display_gse_irq_handler()/
  drm/i915/irq: Extract gen11_gu_misc_irq_postinstall()
  drm/i915/irq: Keep GSE interrupts masked if display is not present
  drm/i915/irq: Reorder GU_MISC vs. display in gen11_irq_postinstall()

 .../gpu/drm/i915/display/intel_display_irq.c  | 29 ++---------
 .../gpu/drm/i915/display/intel_display_irq.h  |  3 +-
 drivers/gpu/drm/i915/i915_irq.c               | 48 +++++++++++++++----
 3 files changed, 45 insertions(+), 35 deletions(-)

-- 
2.56.0

