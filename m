Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF065CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 23:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602D510E120;
	Fri, 29 Aug 2025 23:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AejP6rF2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A381E10E120
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 23:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756511600; x=1788047600;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Jn7nIzBWWsZwZhv77CJTg+n0qZsy4shsWjVrUB2q/o=;
 b=AejP6rF2dVF6WYOmq2oOXBGa1UFZ1cAUbf2noIxRqz+M/z3FJM7cRDqo
 ksnDK181Z1oZdM44ci82MDbiwBHxIPHSl3Vok38Gg8sNVesA2ukPTXjkG
 DIhC9me0vjDhr76biKF4j4UikIXzDAOFfbcqntZqGmy5F+yBibbA1SRL4
 zeoE/d59pC+5Zxa/UINYkmXHNhiBKcnHw1ZTcoxhXtWjdm2wnAKfUng7F
 1FUDmlRFoHm6EZlmvqcbZ56JNFrscEwxoJLt1e6zvCSn/voPNctZsL3Uo
 bRvQw4y2xuGBIzA/1GB1DDVT3Ls2lRRcDmE+px32wObbtv2hgr6+SNTUl A==;
X-CSE-ConnectionGUID: DNtjSj0FQHaTTZ292lVD2w==
X-CSE-MsgGUID: WlYtNfg1Qvi+mGbS5blsOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58906772"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58906772"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 16:53:19 -0700
X-CSE-ConnectionGUID: F6v2sXsgSoKpRrskRCsg+Q==
X-CSE-MsgGUID: W1NfyilhS6CT8IoGxAzUSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170406641"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 16:53:19 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/3] drm/xe: Recomment GuC v70.49.4 for PTL, BMG
Date: Fri, 29 Aug 2025 16:46:54 -0700
Message-ID: <20250829235305.672287-5-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.50.1
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

Bump recommended GuC version to resolve some undisclosed bugfixes and
enable additional PTL features.

Note that PVC is not merged to upstream at present, the GuC
definitions for those only exist in the for-ci topic branch. So this
patch set reverts those patches, then adds the bump for the fully
upstream platforms, then re-adds the CI only platforms.

Julia INTEL (3):
  Revert "drm/xe/pvc: Add GuC firmware definition"
  drm/xe/guc: Recommend GUC v70.49.4 for PTL, BMG
  drm/xe/pvc: Add GuC firmware definition

 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.50.1

