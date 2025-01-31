Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B14C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 15:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AF610E01F;
	Fri, 31 Jan 2025 15:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L1QiWDum";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAFB10E01F
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 15:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738337854; x=1769873854;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sdc22J7pVujoLVcZsGuwJjurT/LcBKIlPcs+haIMzcA=;
 b=L1QiWDumBhBGBp8x/bOZ1rbgKaE9Osz0yw9SJJaWli+Oyjf9TRzf1RyD
 FaiT+33gCULKHkYRvaFTRE1SD9fKkcS42S2+Gk7Uf+k/gzKaXBH0umbPh
 FgqrLcnhZEjP4kF1izmKfZHeV/WM/Tzi1lWvylUc9aThl0CpZ5/BBw/bQ
 zPs+EMFaYpm9h0iVIkmpIdKLC1ok8qsPR3KoI2Uw+64sYr1qtCEtB9xN6
 yeGJ5YojGkoXMpsbkZT5VKJ18pUD1um5jwzIgaA2w/jnfpbQVfaDcCbAu
 mewr01EzIJGWW/srapbt5FnvzwleWaryqzJc907ZuAY5F+CghBvaAfCxb Q==;
X-CSE-ConnectionGUID: rqfg6wtXQDeV2vItGKqpKw==
X-CSE-MsgGUID: bWgcJ+5RQCOP2rVWtCAPnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="50294199"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="50294199"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 07:37:33 -0800
X-CSE-ConnectionGUID: ch5B7Ku5QSStC2XN765Ruw==
X-CSE-MsgGUID: ybZn6oHMTHCT9b5PBKMNvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="110240411"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.100])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 07:37:30 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH] drm/xe/relay: Don't use GFP_KERNEL for new transactions
Date: Fri, 31 Jan 2025 16:37:13 +0100
Message-Id: <20250131153713.808-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

VFs use a relay transaction during the resume/reset flow and use
of the GFP_KERNEL flag may conflict with the reclaim:

     -> #0 (fs_reclaim){+.+.}-{0:0}:
 [ ]        __lock_acquire+0x1874/0x2bc0
 [ ]        lock_acquire+0xd2/0x310
 [ ]        fs_reclaim_acquire+0xc5/0x100
 [ ]        mempool_alloc_noprof+0x5c/0x1b0
 [ ]        __relay_get_transaction+0xdc/0xa10 [xe]
 [ ]        relay_send_to+0x251/0xe50 [xe]
 [ ]        xe_guc_relay_send_to_pf+0x79/0x3a0 [xe]
 [ ]        xe_gt_sriov_vf_connect+0x90/0x4d0 [xe]
 [ ]        xe_uc_init_hw+0x157/0x3b0 [xe]
 [ ]        do_gt_restart+0x1ae/0x650 [xe]
 [ ]        xe_gt_resume+0xb6/0x120 [xe]
 [ ]        xe_pm_runtime_resume+0x15b/0x370 [xe]
 [ ]        xe_pci_runtime_resume+0x73/0x90 [xe]
 [ ]        pci_pm_runtime_resume+0xa0/0x100
 [ ]        __rpm_callback+0x4d/0x170
 [ ]        rpm_callback+0x64/0x70
 [ ]        rpm_resume+0x594/0x790
 [ ]        __pm_runtime_resume+0x4e/0x90
 [ ]        xe_pm_runtime_get_ioctl+0x9c/0x160 [xe]

Since we have a preallocated pool of relay transactions, which
should cover all our normal relay use cases, we may use the
GFP_NOWAIT flag when allocating new outgoing transactions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_guc_relay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index 8f62de026724..e5dc94f3e618 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -225,7 +225,7 @@ __relay_get_transaction(struct xe_guc_relay *relay, bool incoming, u32 remote, u
 	 * with CTB lock held which is marked as used in the reclaim path.
 	 * Btw, that's one of the reason why we use mempool here!
 	 */
-	txn = mempool_alloc(&relay->pool, incoming ? GFP_ATOMIC : GFP_KERNEL);
+	txn = mempool_alloc(&relay->pool, incoming ? GFP_ATOMIC : GFP_NOWAIT);
 	if (!txn)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.47.1

