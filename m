Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824C5E7FDF3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F96910E3DE;
	Mon,  2 Feb 2026 21:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYTGsYNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0A710E3D4;
 Mon,  2 Feb 2026 21:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068646; x=1801604646;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=VMFCQYaEAAaeglKXDwrj34au2jp3yn8zsAFNgG26OFg=;
 b=GYTGsYNh/168qr+K6C84dYH3/yZmvJh7tNsOVG3RUfKjw45su0SroBtC
 876ez4phV8JqcquEp01Pmoy7w5gDSZBH82uHo3PK60sHgTlR10KC15b7P
 ZwbA0Yp7XwpXs+PPbZFNKK2HeFsqvhsewlU5XfyNlumGIHWSL1jJRwvR9
 dI4HAzH1ba6Te36l7vwwHvZoeEvcRRuClaSeICCGAXGu6pKM6ELto8lru
 LJEvzfSsH46mxqBqo5JP4pDtQ0oalFBJPdKpx9wk1qhez4NaPAe3n+3VB
 2nPp9c9LDcT9mhleGKyAJv38Ld2fWcz042BuYwAxbiF1/LkTlNiWiiHi+ g==;
X-CSE-ConnectionGUID: ktq1myxsTsy11d/ZfdEoFQ==
X-CSE-MsgGUID: gvumAVsXRhGdL2KLmbI5TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814323"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814323"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:06 -0800
X-CSE-ConnectionGUID: 5g/R9PAKSuSzMYNOXdf8aA==
X-CSE-MsgGUID: Fc4nVV7ZRU+059ddUNXaBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646805"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:05 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Feb 2026 18:43:07 -0300
Subject: [PATCH 01/16] drm/xe/xe3p_lpg: Add support for graphics IP 35.10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-nvl-p-upstreaming-v1-1-653e4ff105dc@intel.com>
References: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
In-Reply-To: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>
X-Mailer: b4 0.15-dev
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

Add graphics IP versions 35.10. Since there will be features enabled
that are not present in graphics_xe2, already create a new
graphics_xe3p, although currently it only enables the same features as
graphics_xe2.

Here is a list of fields, associated Bspec references and eventual
comments:

 .va_bits (Bspec 74198)
 .vm_max_level (Bspec 59507)
    The spec says "The PPGTT is always a 5-level structure even when the
    virtual address space is less than 57 bits."
 .vram_flags
   - ~XE_VRAM_FLAGS_NEED64K
     That limitation that does not exist for Xe3p_LPG.
 .hw_engine_mask (Bspec 60149)
 .tile_gsm_size (Bspec 52961)
    This is queried directly from the hardware.
 .has_asid (Bspec 71132)
 .has_atomic_enable_pte_bit (Bspec 59510, 74675)
 .has_flat_ccs (Bspec 65255)
 .has_indirect_ring_state (Bspec 67296)
 .has_range_tlb_inval (Bspec 71126)
 .has_usm (Bspec 59651)

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b5e8935fff1d..edca562462fa 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -106,6 +106,10 @@ static const struct xe_graphics_desc graphics_xe2 = {
 	XE2_GFX_FEATURES,
 };
 
+static const struct xe_graphics_desc graphics_xe3p = {
+	XE2_GFX_FEATURES,
+};
+
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	XE2_GFX_FEATURES,
 	.has_indirect_ring_state = 1,
@@ -148,6 +152,7 @@ static const struct xe_ip graphics_ips[] = {
 	{ 3003, "Xe3_LPG", &graphics_xe2 },
 	{ 3004, "Xe3_LPG", &graphics_xe2 },
 	{ 3005, "Xe3_LPG", &graphics_xe2 },
+	{ 3510, "Xe3p_LPG", &graphics_xe3p },
 	{ 3511, "Xe3p_XPC", &graphics_xe3p_xpc },
 };
 

-- 
2.52.0

