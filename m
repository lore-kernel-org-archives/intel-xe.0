Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D58C83F2F
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 15:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B65B10E191;
	Thu, 31 Aug 2023 15:00:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC5910E187
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693494041; x=1725030041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0hRJoPW8iX90lqZUEwb3Lpko1Ot7mz/tcqc3cA/MELM=;
 b=mYJUDsvdTaSe0jOkLyekXGPphdCJAnyZ+voSMae2gkcW7372ru934q27
 LDoeWL801bOOy1O8AaOAVKevee2Z3zbKiHh7Fsko9Px1F8iUmoSThsjNn
 iP0w94qmFU0eEGmkDu627XnyVtMgeqoLAhvPqEWbT+vxrKku4DOw5OeTk
 Rvs+87L+2D0Lc4YUXq+HNFHy2SmLRoede6nlJC9hLCmKDf0jd5GT2DmbY
 G1DREw8zRvuUVFxbTsS86iuOXg6oUo1+CpEyKGCiU0/49i6ZyGxh85lDW
 RhruKNmyfidqsAYxrsrVBIwbSqYlHBNzs9zr2EELA+xEn1R31Bn/BEzB5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462334568"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="462334568"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 08:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809667080"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="809667080"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 08:00:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 31 Aug 2023 08:00:44 -0700
Message-Id: <20230831150048.1760018-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] Fix array of binds
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

Patches should explain the issue, fixes:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/528

Matthew Brost (4):
  drm/xe: Covert xe_vma_op_flags to BIT macros
  drm/xe: Fixup unwind on VM ops errors
  drm/gpuva: Add drm_gpuva_for_each_op_reverse
  drm/xe: Fix array of binds

 drivers/gpu/drm/xe/xe_vm.c       | 422 ++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_vm_types.h |  10 +-
 include/drm/drm_gpuva_mgr.h      |  10 +
 3 files changed, 236 insertions(+), 206 deletions(-)

-- 
2.34.1

