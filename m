Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B6606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SvENljLB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C3610F1CE;
	Mon,  9 Nov 2026 11:46:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2031B10F1CE
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794224759; x=1825760759;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yvRk09KZMD2YdzJHX0AUnIvBe1b9ap0uvG9rMkkKUL4=;
 b=SvENljLBY3d7eoH2LMp+whe93l+vfWRMOiTVWoMVWe8I5rdi3F5zh4Ae
 hJbYd5UKCHOGiTSPOOVrd+M6fBp0od14aBsrTIGoNitLduIq6w5dk3NzU
 CN/gIZv+/at8pQvgJ8D8RA0h6fIoGi5GQDrc1NCh5uHoKuwgPM9vUOpzZ
 eEACui39XjlF2jChBbAauH7Hm6WAea/cRZnUhAU6r2LqGwOXCrGOxP7fD
 N9X3eMTOMksyZD0OD1YblTqglekgYl4mOkwJkWmiNunvTlzKBMA6VEbAt
 N8MsbpzFeGLIJFTNgoY5HVDtnFixfWObe0DNixyySvj+JJBEJlL8So/TE A==;
X-CSE-ConnectionGUID: 4t59GpoNReC2FbFHyV/CPQ==
X-CSE-MsgGUID: Xav8JfEaTqSy8gS5SBxAvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2944058"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2944058"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:45:58 -0800
X-CSE-ConnectionGUID: Hm5LRgmjSJiJ9utTvKrn8w==
X-CSE-MsgGUID: 7BehBOmyTzeVNdNwNAz+aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8174593"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:45:58 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] drm/xe: Clean up the GU_MISC irq handling
Date: Mon,  9 Nov 2026 13:45:50 +0200
Message-ID: <20261109114554.19597-1-ville.syrjala@linux.intel.com>
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

Clean up the mess with the GU_MISC interrupt handling in xe,
and don't enable the GSE interrupt unless the display needs
it.

The whole thing is still rather ugly because the interrupt bits
leak into the xe_display.c code, but that matches how all the
other irqs are currently structured so leave it be for now.

Ville Syrjälä (4):
  drm/xe: s/xe_display_irq_enable()/xe_display_gse_irq_handler()/
  drm/xe: Extract xe_gu_misc_irq_{postinstall,reset}()
  drm/xe: Only enable the GSE interrupt when display needs it
  drm/xe: Use intel_display_gse_irq_handler()

 drivers/gpu/drm/xe/display/xe_display.c | 21 ++++++++++++++++--
 drivers/gpu/drm/xe/display/xe_display.h |  6 +++--
 drivers/gpu/drm/xe/xe_irq.c             | 29 +++++++++++++++----------
 3 files changed, 41 insertions(+), 15 deletions(-)

-- 
2.56.0

