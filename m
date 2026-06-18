Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467C0CD98ED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 22:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968AC10E0D2;
	Thu, 18 Jun 2026 22:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOcTe6fe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FE210E0D2
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 22:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781821545; x=1813357545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4bcC1jlNIbF7hh9+f7jH4NvJv2rNRY2wHgIg1s0VWEI=;
 b=KOcTe6fejz9K8y3iJTqnvBzkxemg1a6oWZzPdEOQUiVhv/MvNgb+BCl/
 imxsAMXdunKfjMzVJ9aPoGTkxaALmCT/SQSe7bzAp7QfVbqxhNA6Mp+9K
 I6mMd5x7PyAnfiTDiI28QcDyzwV+0mmfZ21bwh2+cNatxLQhErukkNSCs
 aWLDV2R1uYZRiY7v5FcRaamnFOS+FBdZ5AXOPWkRlvP2CkQ4ZFyyJAoh1
 QD+4KldmIpvSdizJmFQ0LliyjLn/4Q+BYp9RIRk7GVPEjbwUob8dj3cfe
 1f+u0/p7/HkWPNJuRncPGm2Dwkm+peQzKdgnKs4bYsyv0dwkKpVoLAnSc w==;
X-CSE-ConnectionGUID: HFolM2/3TwOS0Pyr0JoBnA==
X-CSE-MsgGUID: +bnWs9XtSsuKNBS/h/pkeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81785761"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="81785761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:44 -0700
X-CSE-ConnectionGUID: 33e+W3ZjR46rdonEiC69vA==
X-CSE-MsgGUID: kx/a89khTeOIcx2FFSIRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="278661288"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:45 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCHES topic/xe-for-CI 0/6] drm/xe: Use GuC fw 70.70.0 for
 pre-release platforms.
Date: Thu, 18 Jun 2026 15:25:27 -0700
Message-ID: <20260618222536.3351750-8-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

Use GuC firmware 70.70.0 (UAPI 1.37.0) for NVL-S, CRI, NVL-P.

Patches are intended to be merged into drm-xe:topic/xe-for-CI branch.

Platforms NVL-S, CRI, NVL-P are not merged to upstream at present. The
GuC definitions for those only exist in the xe-for-CI topic branch
drm-xe:topic/xe-for-ci. This patch set reverts then re-applys those
patches via cherry-pick with appropriate version bumps.


Balasubramani Vivekanandan (1):
  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

John INTEL (1):
  topic/xe-for-CI: Define GuC firmware for NVL-P

Julia INTEL (3):
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-S"

Matt Roper (1):
  topic/xe-for-CI: Define GuC firmware for NVL-S

 drivers/gpu/drm/xe/xe_uc_fw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.51.0

