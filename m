Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D26C02185
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 06:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1848210E2DB;
	Mon, 20 Jan 2025 06:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POPtDKXu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C053410E2DB
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 06:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737353331; x=1768889331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PYXVNFEQbndSfBQqkLQlww7MTcOevIaqsIyjnk9F0WE=;
 b=POPtDKXuf46G+YXC3xiPnMfHvPgL5kkJJ3KKR1etNvSH+umzDjzDFWRP
 MWwJwujIZJ8e5zDAZxwCsTPAoe8iPSWdaomD4M9KS7m4XP6UFEUE6E5NN
 rm9g6pFYz2/YYzNAtfQFE/N3dQsVD4F/4LQ/3GDF89dSfz3MjExmV+qLc
 aGb21IFcd5ruRCQn0iNPBR0Zbh78q3Fa6yl7yAZ66IlZ/ANJ2XWhvQhlr
 xpxDBgSByUiovCwKciZ8HoS29kYARTooG+y0P5wWuJsXput8D2FLW1a8j
 qj8ifaDzOpJpRrprGk27wO+18nRMxYXpPeg4z/5/Wqsb1LwD76b7oz401 g==;
X-CSE-ConnectionGUID: S8nzbsYPRWKaV9bXMClfXw==
X-CSE-MsgGUID: ikekfeklQauXkHcBo/1BkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48380347"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="48380347"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 22:08:50 -0800
X-CSE-ConnectionGUID: riqN81OyT/Go2V6Qbb63Ew==
X-CSE-MsgGUID: m1zHaHTIRpCRyTSXA25efw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106221984"
Received: from aradhyab-desk.iind.intel.com ([10.145.169.55])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 22:08:47 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v3 0/2] drm/xe: Add and refactor workarounds
Date: Mon, 20 Jan 2025 11:39:14 +0530
Message-Id: <20250120060916.778406-1-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.34.1
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

Hello,

This patch series adds the workarounds, Wa_16021333562, and Wa_14016712196. It
further refactors  Wa_18013179988, Wa_14015568240, Wa_1508761755, and
Wa_1509372804, to use the newer macro, XE_WA(), for OOB workarounds, instead of
selection based on platform labels.

Thanks,
Aradhya

Change Log:
V3:
  - Fix the applicable Gfx platform ranges for WAs, in patches 1, and 2.
  - Add more WAs for refactoring in patch-2, and reword it accordingly.

V2:
  - Add new patch (patch-2/2) which involves refactoring the WA implementation
    as suggested by Lucas De Marchi.
  - Expand the ranges of Wa_16021333562 and Wa_14016712196 as per WA database,
    in patch-1/2, and in that process add the WAs properly instead of porting
    them for a select few platforms.
  - Reword the commit subject and commit text in patch-1 accordingly.

 
Previous Revision:
V1: https://lore.kernel.org/all/20250115080048.2282183-1-aradhya.bhatia@intel.com/
V2: https://lore.kernel.org/all/20250116091004.3060996-1-aradhya.bhatia@intel.com/

Aradhya Bhatia (2):
  drm/xe/xe: Add Wa_16021333562 and Wa_14016712196
  drm/xe/oa: Refactor WAs to use XE_WA() macro

 drivers/gpu/drm/xe/xe_guc_ads.c    |  5 +++++
 drivers/gpu/drm/xe/xe_oa.c         | 30 +++++++++---------------------
 drivers/gpu/drm/xe/xe_ring_ops.c   |  3 +++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  9 +++++++++
 4 files changed, 26 insertions(+), 21 deletions(-)


base-commit: 173baa1b2dc44e3551d9414f4919a48fe5da4880
-- 
2.34.1

