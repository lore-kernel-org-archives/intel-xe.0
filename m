Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F5AC54FB9
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 09:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9312B10E256;
	Tue, 21 Nov 2023 09:53:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D2210E256
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 09:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700560433; x=1732096433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iCppw+CQDCu5nHt+Aj1gVPlg9LnS5B5v1Cxo5yWHUpE=;
 b=ki3RFo42M3HOcKO6IDHKy5bScPB4qVB4/NIRc1qWNIumABOrbiO6UorT
 KW7sZeEFqJoWY+0KWY/OB8LfllOtDG61Q5tq0mptA/P1bqzjT8SWOCB21
 89beEofTuK2coLcKEyt8C6C9cILgCmuidBQWDkB6+HuaLiFN3wWIjgHx0
 cgefeqpVO2lbZJ0e5SlWEco47l1Buwdz/VyRWbngRpHSD90w5PaTqZyzF
 m3ez9bMf41ihxE1JIK0+kfLu5vXPfJcd3w1QtJsa3RRnBHN+jXXn3/emk
 gYe01Gnr1H7wNxxhaO5VtOKD6KgDEAGXrtXA7WxgIAz2t4OpTkdg/RMsW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376841003"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="376841003"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 01:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="766586330"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="766586330"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 21 Nov 2023 01:53:51 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 15:31:12 +0530
Message-Id: <20231121100117.3584066-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121100117.3584066-1-himal.prasad.ghimiray@intel.com>
References: <20231121100117.3584066-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 1/6] drm/xe/xe2: Support flat ccs.
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

Enable flat ccs for XE2_GFX_FEATURES.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 682ba188e456..d9754f3d45f7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -157,7 +157,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 #define XE2_GFX_FEATURES \
 	.dma_mask_size = 46, \
 	.has_asid = 1, \
-	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
+	.has_flat_ccs = 1, \
 	.has_range_tlb_invalidation = 1, \
 	.supports_usm = 0 /* FIXME: implementation missing */, \
 	.va_bits = 48, \
-- 
2.25.1

