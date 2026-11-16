Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7524606A322
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QHDi7ZEM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8AB10F3E3;
	Mon, 16 Nov 2026 19:22:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8E310F3E3
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 19:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794856943; x=1826392943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LylNhcq7MFLGseBBYL6LjxLjJCYyxu1SQPFhZ5Bi+Ik=;
 b=QHDi7ZEMhrM+2jnvTlvWU3b3U/0VUhLuYIXz+ony83BiATBaQP6vSiVu
 MJIkAermJOxxMmVDyaTWSTGjGB++aIiy+qC3Bx1/OM67K9VmHwwbPmmRO
 4sZDuZ0ZfdS3uE4eGQZ5lTKIPKIAamxayKP2j0j3Mr+ZRjfY/AWfy9xoS
 vvpIM7qR9L5XsbrktZKtc5wX+kJS/ti/BFW0awsuHsr3aLr/l9kdL9RVs
 /XNNK8i+k4LAAWTbeT65d9Eho+VschzhzqVOlaTaJ+x4deF7dHSn2LEad
 OWbplBk/x9W+8/L8K8kHxQWUoznspN/1GauDNi7SnbqlReyJ59cVIKOIt Q==;
X-CSE-ConnectionGUID: QS8QiA/jTeWWC1F3gVvgbQ==
X-CSE-MsgGUID: LXH6bwnKT1Cm1/8v5GFVbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3712963"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3712963"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 11:22:23 -0800
X-CSE-ConnectionGUID: DhIIcd42RLGtq0ckDDGXag==
X-CSE-MsgGUID: EGI3oYc4S82p47Tews/iPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9642927"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by orviesa002.jf.intel.com with ESMTP; 16 Nov 2026 11:22:24 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/2] drm/xe/guc: Fix TLB invalidation WARN when GuC CT is
 disabled during GT reset
Date: Mon, 16 Nov 2026 11:22:18 -0800
Message-ID: <20261116192220.3872267-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115225731.3073489-1-zongyao.bai@intel.com>
References: <20261115225731.3073489-1-zongyao.bai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A TLB invalidation issued while a GT reset is in progress can get
-ENODEV from xe_guc_ct_send(): the CT goes STOPPED -> DISABLED ->
ENABLED across the reset, and only -ECANCELED (STOPPED) is treated as
"undelivered, report done" by xe_tlb_inval_issue(). A userptr
invalidation from munmap() on a fault-mode VM that lands in the
DISABLED window then hits the XE_WARN_ON() in
xe_vma_userptr_do_inval() and taints the kernel. Seen in CI on CRI
with xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-imm.

Reproduced on BMG by looping
  xe_exec_fault_mode --run-subtest twice-userptr-invalidate-imm
while forcing GT resets via debugfs (gt1/force_reset every 0.3-0.9s):

                              resets  WARN
  drm-xe-next (4af7fae27dc6)    292    81   (3x60s)
  + this series                 277     0   (3x60s)

With one reset at a random point during the test (200 iterations),
25 iterations warned without the series vs 0 with it.

Patch 1 maps -ENODEV to -ECANCELED in send_tlb_inval(), so every GuC
TLB invalidation type handles it the same way, as
send_tlb_inval_ggtt_full() already did. The CT is also DISABLED across
system and runtime suspend; see patch 1 for why that is safe. Patch 2
drops the now redundant special case in send_tlb_inval_ggtt_full().

v2:
- Patch 1: add Fixes tag and Cc stable, simplify the code comment
  (Shuicheng)
- Add Reviewed-by from Shuicheng to both patches

Zongyao Bai (2):
  drm/xe/guc: Treat CT-disabled TLB invalidation as cancelled
  drm/xe/guc: Drop redundant error remap in send_tlb_inval_ggtt_full()

 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

-- 
2.43.0

