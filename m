Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B096C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 05:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9A010E8EC;
	Thu, 30 Jan 2025 05:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fb1KvpHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69DC10E8EC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 05:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738216795; x=1769752795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8OClO/l29KedGNtwiTCkstjY4sR7zEbvs2iKFgD6C28=;
 b=fb1KvpHZYy/OTL3OymC1BVsktllrvRESW25ukdZSdrYnvCBjE/OTVT9X
 6H2LSsy9To2AuyALG2jFlDr+hS2piXjcPGxxCJmdyBBcjkO0PmFcDPbVp
 ql7n9JIvbAgmjCZ+FucmkMVIlV7PlPP2BVGKofJQgByKDLUCdKiY+MSh8
 0jqJLH6pIw1O3UQG/WidKTY0rer4bk/zjER153Q5Or8Xgjh1fbwxWg5C0
 Zp7lCWtrX0oWE3Nxgr5tbRB04SX8KpLmWs1TeL4jVculCqkFABRlMcdLd
 70wh65VdcBSgbrlo5h3HRyRJaRYmw8A9mAEMGoNYxPha4UJ5ivpfqiH5W w==;
X-CSE-ConnectionGUID: kiHFJ/HcQqqQV8Q1CMElQA==
X-CSE-MsgGUID: Njx1DVR0Q5CkRyUs2iy0ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38917054"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38917054"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 21:59:54 -0800
X-CSE-ConnectionGUID: MNg6Cjk/RNaXjE5WikwSdg==
X-CSE-MsgGUID: X/BORi7kQhacVoS142tBAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="140133510"
Received: from dut2050adlp.iind.intel.com (HELO DUT2050ADLP..)
 ([10.190.239.12])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 21:59:52 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v4 0/2]drm/xe: Add and refactor workarounds
Date: Thu, 30 Jan 2025 05:59:37 +0000
Message-ID: <20250130055939.282988-1-aradhya.bhatia@intel.com>
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

Hello,

This patch series adds the workarounds, Wa_16021333562, and Wa_14016712196. It
further refactors  Wa_18013179988, Wa_14015568240, Wa_1508761755, and
Wa_1509372804, to use the newer macro, XE_WA(), for OOB workarounds, instead of
selection based on platform labels.

Thanks,
Aradhya

Change Log:
V4:
  - Combine Wa_16021333562 condition check with another workaround in patch-1.
  - Fix the offset value for the pipe control emit for Wa_14016712196 in patch-1.
  - Add Tejas Upadhyay's R-b tag for patch-2.

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
V3: https://lore.kernel.org/all/20250120060916.778406-1-aradhya.bhatia@intel.com/

Aradhya Bhatia (2):
  drm/xe: Add Wa_16021333562 and Wa_14016712196
  drm/xe/oa: Refactor WAs to use XE_WA() macro

 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_oa.c         | 30 +++++++++---------------------
 drivers/gpu/drm/xe/xe_ring_ops.c   |  4 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  9 +++++++++
 4 files changed, 23 insertions(+), 22 deletions(-)


base-commit: 7748289df510638ba61fed86b59ce7d2fb4a194c
-- 
2.45.2

