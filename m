Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025BDC43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 20:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71A210E0CC;
	Tue, 14 Jul 2026 20:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXTA+sF7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED92510E0CC
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 20:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784061024; x=1815597024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8/rwHRdByTvzm7BFO4dqoktooEtljM2hsQ4tGCUmOdc=;
 b=TXTA+sF7qNIIxXWHPnVbBe8o2Mlu5duVcELBiAProGNLALViEhyUsz4j
 QIx5CEbMOxmk6tQkJfz/LQmL1Wp0kek5u1Exfr6s0NhrRdFG8COYB4FtI
 47qWA1/Ckoitk7qa/twt4LDGIi6KCRzOcrtaqlu8fdIx0jGMa9sHdjWf1
 wG+du03n9vgf1vAPUc9X+bkthK7fuk4PAcpe2YvXQn0mP3ywfJ8kCckI3
 6fpDAvPMao//SB1mgciuhpv0k1YtI+exUeTcT1LaMcSYgW2UJqiItkhxJ
 pIYp0lhIdaNjS9puJ8FwiVbCrCAFMG4R3NdJr9PBsrgAPSExEYdYpxTvO g==;
X-CSE-ConnectionGUID: k7lNQQjaSKSW8EGD8hfS5Q==
X-CSE-MsgGUID: iT+Af1SdQSW0r8J/JVmNqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96057714"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="96057714"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 13:30:24 -0700
X-CSE-ConnectionGUID: u316Jr7FSEeVMwqlbbZv+A==
X-CSE-MsgGUID: ItHIjUZiRpaAnxoFJzEhpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="279241332"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 13:30:24 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/5] drm/xe/guc: Recommend GuC v70.65.0 for LNL, BMG, PTL
Date: Tue, 14 Jul 2026 13:29:56 -0700
Message-ID: <20260714203012.855004-7-julia.filipchuk@intel.com>
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

Recommend newer GuC firmware for LNL, BMG, PTL. UAPI version: 1.34.0

Platforms PVC, CRI, NVL-P are not merged to upstream at present.
The GuC definitions for those only exist in the for-ci topic branches
drm-xe:topic/xe-for-ci and drm-intel:topic/core-for-ci. This patch set
reverts those patches, updates the recommended GuC versions for fully
upstream platforms, then re-adds the CI only platforms definitions.

- Patches 1-2 revert patches from *-for-ci topic branches.
- Patch 3 updates recommended guc version. Intended to merge into
  drm-xe/drm-xe-next.
- Patches 4+ re-apply reverted patches.

v0: Resubmit. NVL-S fw_defs now upstream instead of in topic branch.


Balasubramani Vivekanandan (1):
  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

John INTEL (1):
  topic/xe-for-CI: Define GuC firmware for NVL-P

Julia INTEL (3):
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL

 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.51.0

