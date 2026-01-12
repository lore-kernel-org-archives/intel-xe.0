Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF3FC9EC8C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 23:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF24810E440;
	Mon, 12 Jan 2026 23:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqxsaxAl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCC910E435
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 23:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768260457; x=1799796457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eajqgzIg5h4p4KzTc7RHRSIyLBrkG6/NY6HI7+fD6rE=;
 b=IqxsaxAlHZjGwKXW1AHQ4bh4Ss3CemolQbxmJqqCCKzgcZ91Nu7Tqqba
 HjRsw+vGHEwAZ8qj1If2Uzj9t7vaAW0iNx8k9ddlcTbd1OED/zR63SvZ5
 VKPsf9zfui2UuftEwvKEnpgnTOeF9uvM0AhotV0cRz+daoqVUzRbWXdDo
 N4OtZ4g0K53c1pMMTdl2oLIU/7y05FTD/5HXl/Jnbn0kZqwSAza495Wl8
 8k8trxDT1lKKh0Shmiy1yfJZdR/ITvkYuus60cMxt1VAksu3Vc4IH4Iwi
 cnVqEvr3FM4zrKdylJZJ2ROVST5uY30/WH2cec1scLCEaZz5zSmTIBKhQ A==;
X-CSE-ConnectionGUID: 2TKBw54jTFG3RdpvNIRyhQ==
X-CSE-MsgGUID: F8Q11kkKR0WFMi+cmUzPfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69594774"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69594774"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:37 -0800
X-CSE-ConnectionGUID: 8e83IrFGQ+eBM5qTkdn+3Q==
X-CSE-MsgGUID: 2Aca0mfKT8ayFycs/VWAvQ==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v3 11/11] drm/xe: Enable context TLB invalidations for CI
Date: Mon, 12 Jan 2026 15:27:30 -0800
Message-Id: <20260112232730.3347414-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112232730.3347414-1-matthew.brost@intel.com>
References: <20260112232730.3347414-1-matthew.brost@intel.com>
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

Do not review, CI only.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6ea1199f703e..8a03bed61378 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -96,6 +96,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_range_tlb_inval = 1, \
+	.has_ctx_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
 	.hw_engine_mask = \
-- 
2.34.1

