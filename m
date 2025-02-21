Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8964AC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 18:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5105210EB28;
	Fri, 21 Feb 2025 18:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ebto3ZDR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A04610EB26
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 18:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740163962; x=1771699962;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=tMu++jlcaXSf0khFecdMDz2DHWNVn+LtJy/AykvBYEw=;
 b=Ebto3ZDRtuYcOao/CDG3D9cw5q3D9c0xN+8+4Co2Chd4hu9SSBA8SpvW
 u/TUG3O8cuex/V2rmKuuQS7FdambVkDwj+hzpoSM/uhjceu3BHwRS5Ik1
 51bUtDp9rfzgbxoTLnkNbFzRa1ugwc6Vt7lMts93fkWm33vSAc/Ta57vL
 lAW9zy4DiONlufjknTOdtQstwfcEaTOSHRnG14nDYyKx824f1Tr8wn2mo
 eJzeAr/4JQ//yXMO0pathfw0WE0x0E4TOOvmdSAXFNxSWU8SJ3RfxHde4
 5donFeMuny6Kpc/lOao+Db1MRgWFpgQRXKj/HrmwUVE/yxaXDnTRB6XmU Q==;
X-CSE-ConnectionGUID: GXHy+2LIT0SRbN5F+e72JQ==
X-CSE-MsgGUID: EslAsWbzRwWbfWuPKErdPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58403689"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="58403689"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:42 -0800
X-CSE-ConnectionGUID: zXl7R/BOQ2OqITA2vsM8VA==
X-CSE-MsgGUID: aNc2T6A+REGt7OzQkvum/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120071342"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.181])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:41 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 21 Feb 2025 15:51:45 -0300
Subject: [PATCH v2 6/7] drm/xe: Re-use feature descriptors for pre-GMDID
 IPs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-xe-unify-ip-descriptors-v2-6-5bc0c6d0c13f@intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.14.2
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

Now that pre-GMDID IPs are described via struct xe_ip, it is possible to
re-use the feature descriptors that have exact match with ones from
previous releases. Do that.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b533251300bd4d086618d2a98b44eae52e996847..55162296e01873681af006c3102a188ee9a9d100 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -88,13 +88,6 @@ static const struct xe_graphics_desc graphics_xelp = {
 	.vm_max_level = 3,
 };
 
-static const struct xe_graphics_desc graphics_xelpp = {
-	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
-
-	.va_bits = 48,
-	.vm_max_level = 3,
-};
-
 #define XE_HP_FEATURES \
 	.has_range_tlb_invalidation = true, \
 	.va_bits = 48, \
@@ -164,12 +157,6 @@ static const struct xe_media_desc media_xem = {
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
 };
 
-static const struct xe_media_desc media_xehpm = {
-	.hw_engine_mask =
-		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
-		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
-};
-
 static const struct xe_media_desc media_xelpmp = {
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
@@ -179,7 +166,7 @@ static const struct xe_media_desc media_xelpmp = {
 
 /* Pre-GMDID Graphics IPs */
 static const struct xe_ip graphics_ip_xelp = { 1200, "Xe_LP", &graphics_xelp };
-static const struct xe_ip graphics_ip_xelpp = { 1210, "Xe_LP+", &graphics_xelpp };
+static const struct xe_ip graphics_ip_xelpp = { 1210, "Xe_LP+", &graphics_xelp };
 static const struct xe_ip graphics_ip_xehpg = { 1255, "Xe_HPG", &graphics_xehpg };
 static const struct xe_ip graphics_ip_xehpc = { 1260, "Xe_HPC", &graphics_xehpc };
 
@@ -196,7 +183,7 @@ static const struct xe_ip graphics_ips[] = {
 
 /* Pre-GMDID Media IPs */
 static const struct xe_ip media_ip_xem = { 1200, "Xe_M", &media_xem };
-static const struct xe_ip media_ip_xehpm = { 1255, "Xe_HPM", &media_xehpm };
+static const struct xe_ip media_ip_xehpm = { 1255, "Xe_HPM", &media_xem };
 
 /* GMDID-based Media IPs */
 static const struct xe_ip media_ips[] = {

-- 
2.48.1

