Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B83C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE1410E1A3;
	Thu,  1 Aug 2024 20:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kb29Fnvd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA8D10E1A3
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 20:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722544818; x=1754080818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lqDm9fPLSW5H42Bj4NggfkMiZAITorJKWx3c8Tpr4aU=;
 b=Kb29FnvdPFc33wtDprE4tk0o++YcOJnD0DoLKFGGvorD5GHS9m++1fZO
 Wt8WOABWCQTt6CngsiVbr9HHazYCd1INOtuqsAxy1sgEeEPsqQXhM2hvX
 GlHSJ400TOTIpx7WZwo5u18yJ3PeTSe0sresKg8mLLNG5pHy/FR3DkUMo
 K+6dp4cv9AGUuSM8RMwYpke8HQ9SUTX1670GEvyH/IIPH7elFRBHPc9lw
 De5a36V4DT/7+V60hmhoI3ARN6HuMaDWnu8MiWiqN5MAEzzLf5AOcrFdn
 vY7DmQZ/ei7eD1uiFiDMt8EqSkR1+ypz1hmlDm2qvxBnXwKnrL2LFRM3J g==;
X-CSE-ConnectionGUID: hIhGE/d8TBKTfYEm52CewA==
X-CSE-MsgGUID: x4GllMu3S06evSxNt5P+zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20698327"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="20698327"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:40:18 -0700
X-CSE-ConnectionGUID: i57vSFRHQkq/PzJ14DeBEg==
X-CSE-MsgGUID: KqjEBPlcQaSn9Cawg0n0VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55084620"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:40:17 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/3] Release GuC v70.29.2 for LNL, BMG
Date: Thu,  1 Aug 2024 13:40:07 -0700
Message-ID: <20240801204010.3042850-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
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



Julia Filipchuk (3):
  Revert "drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"
  drm/xe/guc: Release GuC v70.29.2 for LNL, BMG
  drm/xe/guc: Pick for-ci GuC firmware for PVC

 drivers/gpu/drm/xe/xe_guc.h   |  3 +++
 drivers/gpu/drm/xe/xe_uc_fw.c | 12 +++++++-----
 drivers/gpu/drm/xe/xe_uc_fw.h |  6 ++++++
 3 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.45.2

