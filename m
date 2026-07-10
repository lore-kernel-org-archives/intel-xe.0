Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203A3C4450B
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 11:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD19D10F86B;
	Fri, 10 Jul 2026 11:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="jekgGVCw";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C62D10F879;
 Fri, 10 Jul 2026 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1783682105;
 bh=sUY6+wTS+iTpUp3gUnkIDFQjqphmwgx2JrX51Cpp61w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jekgGVCw/0uoyPbZeSCTsQWaRVgkDT9b14WcYSgkYY9IRzpLVc32+8zoxcWVTb9eq
 KhJcdfaHwPO6PEocimcZoCSzhL/jpBOeLLRYl9yzdWKMjEikL+MrQt7n9s8PyM+1qe
 hiPZswLxoMA/yArIE8rdVbFkzl+8SwpYWz1Yuub2efmXfy16hG9SVKLarCXZvXVX5j
 bw9KSeHKcU2LIvox5OOftS/IFPqTfmd8IldY104edr8nyzOJgeROk1wlcDwqI49xNC
 HfGJV1NbysIfBgczaXbZRuAzqfiuBkPnB4e+FDsACKc47E3TvVH7lWm+Fl0ez6LL3T
 8H2oOSxLJ/E+Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 11/11] drm/i915: Print the phys_base in addition to the
 dma_addr for the BIOS FB
Date: Fri, 10 Jul 2026 13:15:38 +0200
Message-ID: <20260710111539.1274555-12-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710111539.1274555-1-dev@lankhorst.se>
References: <20260710111539.1274555-1-dev@lankhorst.se>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Print the dma_addr, phys_base and memory region name for the BIOS FB.
Should make it a bit easier to see whether everything looks correct or
not.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patch.msgid.link/20260511214122.8468-15-ville.syrjala@linux.intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/i915_initial_plane.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_initial_plane.c b/drivers/gpu/drm/i915/i915_initial_plane.c
index 549fe1dc5b6eb..98858a78e46a3 100644
--- a/drivers/gpu/drm/i915/i915_initial_plane.c
+++ b/drivers/gpu/drm/i915/i915_initial_plane.c
@@ -69,12 +69,12 @@ initial_plane_phys(struct drm_i915_private *i915,
 		return false;
 	}
 
-	drm_dbg_kms(&i915->drm, "Using dma_addr=%pa, based on initial plane programming\n",
-		    &dma_addr);
-
 	*out_phys_base = dma_addr - mem->region.start;
 	*out_mem = mem;
 
+	drm_dbg_kms(&i915->drm, "Initial plane dma_addr=%pa phys_base=%pa mem=%s\n",
+		    &dma_addr, out_phys_base, mem->name);
+
 	return true;
 }
 
-- 
2.53.0

