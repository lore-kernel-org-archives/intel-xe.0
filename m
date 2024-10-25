Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E371D116FC
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 06:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E030710E9F2;
	Fri, 25 Oct 2024 06:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AO4myD6U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C8B10E9F2;
 Fri, 25 Oct 2024 06:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729836123; x=1761372123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ygLf1qwjCGJnVMN2z4MEIWKbmlDCHscQUfhIZo+LoAw=;
 b=AO4myD6UV4GcXENhN3eJnWXhHpcaBRTUSkJ8KDAZ3rZdu5j0UDqnBqlP
 bOQeQ15/ViT7MTy8u/E/0JasTSB2Dfo2XaGWkmrB6W9dZWUx6/JG0QuGg
 Gc3LRBJOgE5LWnP7IgF7JJ8Vjkf9d/rJxbEY2/XmInTcMHI3eHM3se4y6
 NLUmZOKBUxsw9Inn0lPbLWzvreeSxymdk+gH0CmA7luB6wfhsaFmAzZpp
 hRteCnMOdasfNDIl9RVMnL8GU6ZOGLMs1psiNLDDHI72qiIACTSngGOQL
 6pE4vvnI5T4Alf0/s+KJZrAuaZSY5VvB2YWDGKWvbk8S/6IZVdRZCRIgX Q==;
X-CSE-ConnectionGUID: et9/iYI8SWeQgJTyee4Omw==
X-CSE-MsgGUID: 5cxV82PRQqG/MI/60ZUCeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29620700"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29620700"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 23:02:03 -0700
X-CSE-ConnectionGUID: vdAklypHQ4Wq98Yu5gXo6g==
X-CSE-MsgGUID: McwnwT7DRsGp05wtMIttvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80734425"
Received: from unknown (HELO kandpal-X299-UD4-Pro.iind.intel.com)
 ([10.190.239.10])
 by orviesa009.jf.intel.com with ESMTP; 24 Oct 2024 23:02:01 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, matthew.d.roper@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 4/5] drm/i915/xe3lpd: Increase max_h max_v for PSR
Date: Fri, 25 Oct 2024 11:31:35 +0530
Message-Id: <20241025060136.9884-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025060136.9884-1-suraj.kandpal@intel.com>
References: <20241025060136.9884-1-suraj.kandpal@intel.com>
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

Spec states that PSR max active is same as max pipe active values.
Now that each pipe supports 6k resolution increasing max_h and
max_v for PSR too.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index c22386a31a63..a358beb39846 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1453,7 +1453,11 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 		return false;
 	}
 
-	if (DISPLAY_VER(display) >= 20) {
+	if (DISPLAY_VER(dev_priv) >= 30) {
+		psr_max_h = 6144;
+		psr_max_v = 4096;
+		max_bpp = 30;
+	} else if (DISPLAY_VER(display) >= 20) {
 		psr_max_h = 5120;
 		psr_max_v = 4096;
 		max_bpp = 30;
-- 
2.34.1

