Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C35C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 22:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151B810EA95;
	Thu,  6 Mar 2025 22:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAio7HRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70D810EA56
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 22:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741298898; x=1772834898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q9E2lPNUigZM9mLFdLGtRuHy5FoaxHAFl37oEe2c74o=;
 b=hAio7HRr/YWh95HZjdM8G0+RS9kDfS4qFQND8N/CtLjSY0tc3fiHQUQP
 gYlbCH7MuuCVyl7zc7nn1SFCESLmcHhvpVRO+b6qkVNNNUq7VeWq8g7Hx
 MlrlhxduZj8aLa/MkJ9lhmHXQauRQnHOTA01UDIUGundQ97fEOprzdU49
 UXghxTpeTMJL1rFlWuaKzr8wRsywTTmfEGQCZAjbMrMKe6B1PzJHqCFjl
 gEy5wIw8u58kVftaENpck3no5VvdpGGQwN6/e5pVGOxmKRkXTE4ZsOz9I
 TFxCfQ1jfVD8m0PN8PdGciHe8lWXCdJKlYRx5ngFzCkyMzs6Lr1OfYvDL A==;
X-CSE-ConnectionGUID: kOANAs00RDOph4MuGZ7hMg==
X-CSE-MsgGUID: oVGM3PNGQ3yDlwU3goF0sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53735092"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="53735092"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:08:18 -0800
X-CSE-ConnectionGUID: AlPFUOl6S6+T5Cl5pj8ViA==
X-CSE-MsgGUID: bPZdNAB9SMO8skpPxwX0Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119659582"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:08:17 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/2] drm/xe: Remove GEN11 prefixes from documentation
Date: Thu,  6 Mar 2025 14:08:03 -0800
Message-ID: <20250306-drop-gen-v1-2-03683e56006a@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
References: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The registers are already named without the GEN11 prefix. Do the same in
the memirq documentation.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 404fa2a456d5870837fce225b5150398733d1e98..49c45ec3e83caf9aeff279912b80a0b109bc4a94 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -86,7 +86,7 @@ static const char *guc_name(struct xe_guc *guc)
  *   This object needs to be 4KiB aligned.
  *
  * - _`Interrupt Source Report Page`: this is the equivalent of the
- *   GEN11_GT_INTR_DWx registers, with each bit in those registers being
+ *   GT_INTR_DWx registers, with each bit in those registers being
  *   mapped to a byte here. The offsets are the same, just bytes instead
  *   of bits. This object needs to be cacheline aligned.
  *

-- 
2.48.1
