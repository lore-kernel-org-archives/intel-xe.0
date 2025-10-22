Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41D7CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 00:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B5810E67A;
	Wed, 22 Oct 2025 00:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWnhX9UT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21D610E66A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 00:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761094543; x=1792630543;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x+JIaZEoge6CI6tJNqslT66YfmZU/ZOnHUbLEvHHxJI=;
 b=bWnhX9UTHCH2XIGEGPJbTt6IZfiZhWidkLb06S+xwGGFLzw4YbcZXJ4O
 8whv1EUB9CeT2pWSRxuhxt87W3W6wF2kw4lwCkiKwst5+yaBQdyLKJqGL
 vC5NhXLLoGIxzqshVM8vYR8Pf2XlaKQJ+bVlz378v7FoCOnDg3GJ3Z6tU
 z3ViTBPhdOSkhubwbxdQ0kDmLdTZI0Ph9x1Qih00Wrew+EYKlWatpqnzo
 lXN3RL8d7GD212zN/cZi7jDYag6JxUu+65BH2DtRjmZ12XoEOJAlZQvQ0
 nwOHM0c74nyLItzYM9cHMGYG29eAcfgvfESu5cQqieaJGPnIlfE9QaB/a A==;
X-CSE-ConnectionGUID: Jc0kfhm+R0OaV0XR02JfUQ==
X-CSE-MsgGUID: lWzmi93HQcuss4FAia39mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50807411"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="50807411"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 17:55:42 -0700
X-CSE-ConnectionGUID: 2/1ntbB5TKu2ENx89oxJgA==
X-CSE-MsgGUID: i0kPhyaKRYuZmnPU/syQOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="182938775"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 17:55:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] Fix low hanging workqueue / reclaim issues 
Date: Tue, 21 Oct 2025 17:55:35 -0700
Message-Id: <20251022005538.828980-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

While working on [1], noticed a couple in Xe related to workqueue /
reclaim. Pretty low hanging, let's get this fixed.

Matt

[1] https://patchwork.freedesktop.org/series/156283/

Matthew Brost (3):
  drm/xe: Check return value of GGTT workqueue allocation
  drm/xe: Do not wake device during a GT reset
  drm/xe: Avoid PM wake reference during VF migration

 drivers/gpu/drm/xe/xe_ggtt.c        |  3 +++
 drivers/gpu/drm/xe/xe_gt.c          | 19 ++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  5 -----
 3 files changed, 15 insertions(+), 12 deletions(-)

-- 
2.34.1

