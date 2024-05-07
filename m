Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFFDC10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 22:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7832010F848;
	Tue,  7 May 2024 22:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQHmj9a6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0627B10E8C2
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 22:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715121780; x=1746657780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UxVZ2dCUibHdsY0THbjunGYbqbe1fXXROZgSID7hRRE=;
 b=dQHmj9a6NKCbIEdtTIZJlQ5fjG0SzhLoJSs9HCMvr9FkDzrUlD+xBaN9
 /I8qfq+EeZ2j2kirDeK8mGZ/LWXMjvTjY86BwuNMfYTbEv9Vu1RwF7mNJ
 zs4PnXCjIDfxacm2+4k5lVqGYHJwRbDhJmeKn3SSN0TGhVB6bhggdaRFP
 ZQJbB46+5/ar6AQxqdum0PclR7E73BZMdxfnAbOAjW4OHBKIxOFcPqi67
 37gd8KNta5tBrvxtZ2CFLxHUkOZ09v0TVpUrlwmN8XxUnikJnn7hyuzPP
 AzhigVYBRkUzPjTBt9d1ey413DG86sWzssB25KqVTv5ZdB19U361DY+FV g==;
X-CSE-ConnectionGUID: 4U+xi3bnRdeDmufeWNXCOA==
X-CSE-MsgGUID: Q5DqwqbnTtSEb15CUd3gVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11108374"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11108374"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:42:58 -0700
X-CSE-ConnectionGUID: UqCzXEVHRgqWMvoYoLfRAA==
X-CSE-MsgGUID: K70XSfNlRwGG2X1bQR4iww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33156996"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:42:58 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, stuart.summers@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v3 4/4] drm/xe/xe2: Enable Indirect Ring State support for Xe2
Date: Tue,  7 May 2024 15:42:53 -0700
Message-ID: <20240507224255.5059-5-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507224255.5059-1-niranjana.vishwanathapura@intel.com>
References: <20240507224255.5059-1-niranjana.vishwanathapura@intel.com>
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

Indirect Ring State is the recommended mode for Xe2 platforms,
enable it by default.

v2: Set has_indirect_ring_state to '1' instead of 'true'

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8f3e4c563105..841b02ac6ba1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -166,6 +166,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_flat_ccs = 1, \
+	.has_indirect_ring_state = 1, \
 	.has_range_tlb_invalidation = 1, \
 	.has_usm = 1, \
 	.va_bits = 48, \
-- 
2.43.0

