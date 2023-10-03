Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20904E7545B
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 12:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E6310E2AD;
	Tue,  3 Oct 2023 12:52:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9A010E056
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696337523; x=1727873523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a2dwiVhtBbbc8XlpTRXfWer4IKmM0z8iKb+2hz1sXIM=;
 b=WJM8gOlb0L2cB1hX3S3PkKSwH54aFHM7DG8VprhY4+zVVG02532RvXfP
 nBsr88VZNGeitMIWwAZdC1IksC0UWAnCa4xadCcQ5OhBNEcN9EG98FPjs
 dtBt1K7DtuNw2GGgRhvdXoE9s+0vxkqa8IiR0xGZAeprZx1B8SguRreBN
 bYJnhS56w8vOe9PZ800Ff7uTnzDe/OfvpWJ6VNCknPpf2MsAQPxTPgk1q
 E/V9UnGe3FM1V+Sdz6gBwyaOb9UWZAv2wK+OrR4gKgLQ9Js3DA4MPbLgH
 +8mJdQHazZjKZw12rW0NJ2zIPTwKx60BLGk0Iznefk9MPJyog5MSbnWNZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="447022078"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="447022078"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="998005508"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="998005508"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 05:51:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 05:52:15 -0700
Message-Id: <20231003125217.3350838-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003125217.3350838-1-lucas.demarchi@intel.com>
References: <20231003125217.3350838-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/7] drm/xe/xe2: Add one more bit to encode
 PAT to ppgtt entries
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe2 adds one more bit to cover all the possible 32 entries. Although
those entries are not used by internal kernel code paths, it's expected
that userspace will make use of it.

Bspec: 59510, 67095
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 5090bdd1e462..7ffc26446d2e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -40,6 +40,7 @@
 #define XE_BO_INTERNAL_64K		BIT(31)
 
 #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
+#define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
 #define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
 #define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
 #define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5f69065a85cb..9282089f54bd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1223,6 +1223,9 @@ static u64 pte_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
 	if (pat_index & BIT(3))
 		pte |= XELPG_PPGTT_PTE_PAT3;
 
+	if (pat_index & (BIT(4)))
+		pte |= XE2_PPGTT_PTE_PAT4;
+
 	return pte;
 }
 
-- 
2.40.1

