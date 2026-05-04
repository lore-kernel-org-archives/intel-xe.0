Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2232CCD342C
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 09:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CA410E5F6;
	Mon,  4 May 2026 09:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8zGjmh/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1132210E617
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 09:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777888176; x=1809424176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O6DnPo6OROzIxo8NL2ASXyjySxaM/EUY41Amx4HuiB8=;
 b=Y8zGjmh/wXmCj38rrbxjUJJvnGfn6RGwIMsVvsHvzS9gmRYaczabxq8J
 x4PSvhgU4URkFFn5WKLINBSgsKZVgmDbfnlHWH1+ZVUq2NebbGA0mTaEg
 z2mYfZaYNLub2DHgZqQ1ze7emOa9BoCHnYtb+sUrZYIvVRKcrEw6/Z3ZR
 /VnHg220m+CrrZpETa6p6NEf+0xCkQpAk2I+cV/MDLO1Jk/61SWgOW1b2
 T0sW8dTY2IPMOtbYJPQDY2YbPOGsSqDRcYWxWVPSJ8eTUMQVTrO3YCS1A
 kRhoq5CCxeJMnCdo8dnyTIMy2FodlY7nZPpvTEx8g0h+bhHOTKGpNMIdO g==;
X-CSE-ConnectionGUID: OG7Yn/EKTU+une8zrMEXuA==
X-CSE-MsgGUID: 9b2o//uHTIuXuIWBzeAW6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="104192924"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="104192924"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:49:35 -0700
X-CSE-ConnectionGUID: iEQUz4ZFSOiMjAN1MtBojw==
X-CSE-MsgGUID: vgpMQrrXSzKLQXXN0qh1Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="239783377"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa004.jf.intel.com with ESMTP; 04 May 2026 02:49:34 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 0/1] Do not include LRC indirect ring state size in engine
 state size
Date: Mon,  4 May 2026 09:49:25 +0000
Message-ID: <20260504094924.3760713-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

The LRC BO layout is as shown below.

| Region                       Size
+============================+=================================+ <- __xe_lrc_ring_offset()
| Ring                       | ring_size, see                  |
|                            | xe_lrc_init()                   |
+============================+=================================+ <- __xe_lrc_pphwsp_offset()
| PPHWSP (includes SW state) | 4K                              |
+----------------------------+---------------------------------+ <- __xe_lrc_regs_offset()
| Engine Context Image       | n * 4K, see                     |
|                            | xe_gt_lrc_size()                |
+----------------------------+---------------------------------+ <- __xe_lrc_indirect_ring_offset()
| Indirect Ring State Page   | 0 or 4k, see                    |
|                            | XE_LRC_FLAG_INDIRECT_RING_STATE |
+============================+=================================+ <- __xe_lrc_indirect_ctx_offset()
| Indirect Context Page      | 0 or 4k, see                    |
|                            | XE_LRC_FLAG_INDIRECT_CTX        |
+============================+=================================+ <- __xe_lrc_wa_bb_offset()
| WA BB Per Ctx              | 4k                              |
+============================+=================================+ <- xe_bo_size(lrc->bo)

We need to pass the base address of the full golden context and the size
of just the engine state to Guc, which is the section of the context image
that starts after the execlists LRC registers. This is required to allow the
GuC to restore just the engine state when a watchdog reset occurs.

Instead of deriving engine state size by subtracting pphwsp and indirect ring
state size from the xe_gt_lrc_size(), we can directly caluculate the engine
state size by subtracting xe_lrc_reg_size() from xe_gt_lrc_hang_replay_size().


Satyanarayana K V P (1):
  drm/xe/guc: Exclude indirect ring state page from ADS engine state
    size

 drivers/gpu/drm/xe/xe_guc_ads.c |  5 +----
 drivers/gpu/drm/xe/xe_lrc.c     | 11 +++++++++--
 drivers/gpu/drm/xe/xe_lrc.h     |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.43.0

