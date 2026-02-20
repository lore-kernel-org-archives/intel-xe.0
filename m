Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B152C5ACD9
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF0B10E819;
	Fri, 20 Feb 2026 17:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BcKlTfII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A349710E819
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771606923; x=1803142923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sqWzEe45Afd/19zQCuawiiZtiEydKJFqPkQymHKp1zg=;
 b=BcKlTfIIlHjhiECClg+uRj6Zuprvm34ZBbWPlSqTYg97xLyHkVRey22t
 WY/sIUm8cn+mKHe7iieAPG8Vq4b6ZLlu4snmbdgcrHcGuKVljmUe9d3Af
 k/T99yzL4+noVheP/angaVeCMOBwA8rVdnN0yME/8H29Y+hGQ4A4zliX5
 xrK7MNozWAaPRM5AHrZ16HA8HowEKVOGrMevvY/41hmCNMYcSHsbN3wrS
 5Sse8G77yuKfDwor2p0SO6qrjiOo5ldOtohdDHW7DTRPrZH2dDcPWfz66
 Bzk2PH+hlchPjq6P1dRWsdahefdU9GM/TRjMvwSQ2YZpnmOEN88Bkq55j Q==;
X-CSE-ConnectionGUID: 1XasSPl/So+bG3ftwx3JYQ==
X-CSE-MsgGUID: ZbunEmNZSca6v2oP9ii7MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="98163642"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="98163642"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:02:03 -0800
X-CSE-ConnectionGUID: QtL38K2XSDmqyDldL8/C9w==
X-CSE-MsgGUID: zN7ZeaMST2+WISX7nHnj3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="237860846"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:02:03 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v6 2/3] Reapply "drm/xe/xe2: Enable Indirect Ring State
 support for Xe2"
Date: Fri, 20 Feb 2026 09:01:38 -0800
Message-ID: <20260220170137.328131-7-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220170137.328131-5-julia.filipchuk@intel.com>
References: <20260220170137.328131-5-julia.filipchuk@intel.com>
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

This reverts commit 03d85ab36bcbcbe9dc962fccd3f8e54d7bb93b35.

Previously this was reverted due to failures on LRC context switch.
Issues should be root-caused and resolved with GuC WA 14025515070. Now
setting indirect ring state is available by default.

Note: Will be cleared if WA not available due to older GuC version.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e1f569235d8a..ff8039198da1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -100,6 +100,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 #define XE2_GFX_FEATURES \
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
+	.has_indirect_ring_state = 1, \
 	.has_range_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
-- 
2.51.0

