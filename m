Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B2ACCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE0910EB63;
	Fri,  7 Nov 2025 18:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDZGe/U3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6018810EB63
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539066; x=1794075066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/2AkKj5XAvlcADnVXeu004b1z/wvuWmotyG0fn2u0vs=;
 b=PDZGe/U32cEuz3QiOXPMuS0Ni4JcGq1HsEhZ+sDG/9+Cx8NS6Fsy8AZQ
 QNwGwpY0svrRn7/zZ4vBVuFXfS/o3zzGVTTMaJ5cdiW0P7TpiBPmz/1h4
 w4eTauwDK6pXF//+pp8B/q5Pv8NXwhfxtVQ+cz/4q9JroFpzrCCdzTBK2
 wMm/FWkISLtjawtQ/OqQy0SBKbJ/DqhaK43QsvdV73JxTuq+7N8THzA1R
 vZJHGAu0KDGFi5ymf5Qtptz/qrnUsxxbkgouqB/1t/kPVFK+aseADQjAA
 5JEkBkyrQcIy4nYeIFQ/iF5EMR3daNNEoUbdWL1AMkgQuMKRfcdTXdSoJ A==;
X-CSE-ConnectionGUID: yBN9Fn/rRFK5jS+9yGKxBA==
X-CSE-MsgGUID: CuJDc7PmTBKuHItwPh9bNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="68531488"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="68531488"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:11:05 -0800
X-CSE-ConnectionGUID: MGslGrFmQC6wJgp8beA/2A==
X-CSE-MsgGUID: P9QpsGVrTW+ZAWyXb6sIjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="187398529"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:11:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/2] drm/xe/xe3p: Add page fault prefetch bit handling
Date: Fri,  7 Nov 2025 10:10:23 -0800
Message-ID: <20251107-pagefault-prefetch-v1-0-93291d619126@intel.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251107-pagefault-prefetch-6177a6a30c47
X-Mailer: b4 0.15-dev-50d74
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

First patch is just some prep work. Second patch contains the details
about the new bit in the page fault descriptor for Xe3p.

Sharing this for early review and CI - the previous implementation was
done before the page fault overhaul from commit 816e12793c6d ("drm/xe:
Remove unused GT page fault code"). I'm still working to get all the
pieces together to be able to test in the relevant platforms.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (2):
      drm/xe: Coalesce pagefault logging
      drm/xe/xe3p: Add support for prefetch page fault

 drivers/gpu/drm/xe/xe_gt_stats.c        |  1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h  |  1 +
 drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |  2 ++
 drivers/gpu/drm/xe/xe_pagefault.c       | 22 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_pagefault_types.h |  7 ++++++-
 6 files changed, 28 insertions(+), 10 deletions(-)

base-commit: c52463739ee9b9e6cdc34d31aa705c75c82679ec
change-id: 20251107-pagefault-prefetch-6177a6a30c47

Lucas De Marchi

