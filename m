Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E9FC83F27
	for <intel-xe@archiver.kernel.org>; Sat, 19 Jul 2025 07:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2717E10E1E2;
	Sat, 19 Jul 2025 07:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlpjraRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB96810E1E1
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Jul 2025 07:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752910661; x=1784446661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U9f/jXfVJjWHwV2sw0AYXnNT6h/T3QmlDfoLMiJVcl4=;
 b=WlpjraRpGjVqJeM5604WnjFO8VHA3gilYb1Vw5hofYN4TuvR/O5y87ZW
 9G1kZwiPybddHrWwwTVDPiE5zwq8Z1jYxGyeck3ENRjZaISx1/ppkSkUr
 /taEFjNgpinvpqTAu/+ua2eLZRzY/CK858VroIdt7u8VjR2WjfQXl3lCC
 4pZSE5DSGjH38ub/E1VCWsSaRDxCjIl4leWmLpOuoqOM+n0nBqev9akmq
 Mt+6dBqBCEo/Zk66zdPmEkSqJ/Q8R9Hq2ji8hie3eu8MU76ORt56QAQ1B
 qp430mrfxxgcmG9o/W1VB/ceWjoG8bgqeJ81tgXgAk2B2NCHsYIwM24cM w==;
X-CSE-ConnectionGUID: zAiPjsuQQ+SjHs2BAaV+rQ==
X-CSE-MsgGUID: a9oa7C3jS8iXqCfurcxvJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55159701"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="55159701"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 00:37:41 -0700
X-CSE-ConnectionGUID: 8bxVNzpYRwWb8NSqeQIfbQ==
X-CSE-MsgGUID: P2TsKbRYSf+WzBVU9YgagA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="158844429"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa008.jf.intel.com with ESMTP; 19 Jul 2025 00:37:39 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 2/9] drm/xe/vf: Skip fixups on migration before getting
 GGTT info
Date: Sat, 19 Jul 2025 09:37:38 +0200
Message-Id: <20250719073745.74251-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250719073745.74251-1-tomasz.lis@intel.com>
References: <20250719073745.74251-1-tomasz.lis@intel.com>
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

The RESFIX state should be achievable only after a successful
handshake. If VF KMD has no GGTT configuration yet and we still got
into RESFIX state, then either we're dealing with unclean initial
state due to unusual actions before probe, or the migration
happened while xe init (started by probe) was running.

In 1st case (migration before probe), we should just skip migration -
init procedure will ensure exit from RESFIX state as it starts GuC
handshake with a reset.

In 2nd case (migration during xe init), the migration procedure should
execute normally if GGTT configuration was already acquired from GuC,
and can be skipped if it was not acquired.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index b282838d59e6..7f0b8afc566b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -763,6 +763,15 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
 
+	if (!gt->sriov.vf.self_config.ggtt_size) {
+		/*
+		 * If driver initialization is running in parallel to this handler,
+		 * and it did not reached acquiring GGTT config yet, then ignore
+		 * the migration - init procedure will create the GGTT at new place.
+		 */
+		return;
+	}
+
 	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
 	/*
 	 * We need to be certain that if all flags were set, at least one
-- 
2.25.1

