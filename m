Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF88CD8CA4
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 19:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB76110F902;
	Mon,  8 Jun 2026 19:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B07oj7AN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A68610F902
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 19:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780946334; x=1812482334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rQC/qzZZbKWF0alTok3bFCEdoJNsR5tZePrepty1oDE=;
 b=B07oj7ANbArp3Pmd01Zg/nThxMj4Mx7HQBgDq48sr7xoaOPQ252ihcQK
 SIE4hnioFsnoUF/ppsbEReVdyu8Un7fQX/RojOqlxBveFhbCsgGmZUaV1
 7ftzpPZPCLe0zZ7ERnTWBbi/ySb3rRymL3k5hkQzfSnKzuGrqDaZSQhLc
 XxtrCtu6sVMmIgbWIi3hdioBA0+r7b9VyT3o4mDf+bx+ZYpef/mNUSt8i
 TS4vMUIAnBq4sjbiTgUnQkJp30qMfntaGYNff7ReFrMxQGyc3OO4em58U
 lkJmgpjNj3QLH970shOGUiRiyX4e6oeKEDJQjEOVZkOd1LaT46k7rVTHN w==;
X-CSE-ConnectionGUID: uUbd/o0FQ1eNvDHsh3rGsQ==
X-CSE-MsgGUID: uTYNbBSHQB2vB9fUfzR64Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92019423"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="92019423"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:18:54 -0700
X-CSE-ConnectionGUID: yoycBYb/TSmWu1lFo65E6w==
X-CSE-MsgGUID: 2nuchjBVQEWsLDn/VUdxLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244789308"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:18:54 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/9] drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL
Date: Mon,  8 Jun 2026 12:17:43 -0700
Message-ID: <20260608191831.2337033-11-julia.filipchuk@intel.com>
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

Recommend newer GuC firmware for BMG, LNL, PTL. UAPI version: 1.34.0

Platforms PVC, NVL-S, CRI, NVL-P are not merged to upstream at present.
The GuC definitions for those only exist in the for-ci topic branches
drm-xe:topic/xe-for-ci and drm-intel:topic/core-for-ci. This patch set
reverts those patches, updates the recommended GuC versions for fully
upstream platforms, then re-adds the CI only platforms definitions.

- Patches 1-4 revert patches from *-for-ci topic branches.
- Patch 5 updates recommended guc version. Intended to merge into
  drm-xe/drm-xe-next.
- Patches 6+ re-apply reverted patches.



Julia INTEL (9):
  Revert "drm/xe/pvc: Add GuC firmware definition"
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "topic/xe-for-CI: Define GuC firmware for NVL-S"
  drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL
  Reapply "drm/xe/pvc: Add GuC firmware definition"
  Reapply "topic/xe-for-CI: Define GuC firmware for NVL-S"
  Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Reapply "topic/xe-for-CI: Define GuC firmware for NVL-P"

 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.51.0

