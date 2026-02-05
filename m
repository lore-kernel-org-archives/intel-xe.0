Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DE2ECD999
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 19:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E193710E02F;
	Thu,  5 Feb 2026 19:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCh7cono";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F7A10E02F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 19:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770321542; x=1801857542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T8Dj+Gl4tfznC1nStStNYxNHjxdbOkvidTegIeT3RWU=;
 b=VCh7conoy/p08h52MkWuy7s47mpllnA+Awnefo2f3zzG+zYzXY/XHN6E
 0Ebr6IYSE+vzv15e/bJeO4SY1ThP4/ruqY6stsChs/GLEIVqgWniAhNOQ
 R3gRr0Wc+1P+9Skk2+LJ8YND0mDNOTzMi+ut2x+tLPUVnifhIRFrFrWWs
 EASYcuFYfqe7dJJ/4Rd6tHt+JJ5CVotnO3kr6IjyZ2Wm4ud78/WhMSO8K
 nzLJ1U06vLXSzv4wlM1r1xPElRqsO3fbdIfCNDOwSt6ahNFYpY7yteA2M
 ETldlVkOzDbael7x14d3c6V/9ay6wB3xe6SfAJO3npWDP9lRGhUM6buOf g==;
X-CSE-ConnectionGUID: z3dcLzdESB+77VYk1w8Jnw==
X-CSE-MsgGUID: B2qcU2XFT3+N00X4bnxICA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70548510"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="70548510"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:59:02 -0800
X-CSE-ConnectionGUID: 2+G56rzVRO2nklMshAYXIw==
X-CSE-MsgGUID: uf5H/ViGQQOae45zHjbytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210705466"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:59:02 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/7] drm/xe/guc: Recommend GuC v70.58.0 for LNL, BMG, PTL
Date: Thu,  5 Feb 2026 11:57:47 -0800
Message-ID: <20260205195833.2928038-9-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

Recommend newer GuC firmware for BMG, PTL. UAPI version 1.30.1.

Platforms PVC, NVL-S, CRI are not merged to upstream at present. The GuC
definitions for those only exist in the for-ci topic branches
drm-xe:topic/xe-for-ci and drm-intel:topic/core-for-ci. This patch set
reverts those patches, updates the recommended GuC versions for fully
upstream platforms, then re-adds the CI only platforms definitions.


Julia INTEL (7):
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
  Revert "drm/xe/pvc: Add GuC firmware definition"
  drm/xe/guc: Recommend GuC v70.58.0 for BMG, LNL, PTL
  Reapply "drm/xe/pvc: Add GuC firmware definition"
  Reapply "drm/xe/nvls: Define GuC firmware for NVL-S"
  Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"

 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.51.0

