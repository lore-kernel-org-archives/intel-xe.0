Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8A0CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA5710E2FF;
	Fri, 31 Oct 2025 18:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYrz2ks6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5E410E2FF
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935385; x=1793471385;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TXwQV2K0wqY5iFPfkHYf4XEPn0BxHwF+i9hrwac4cdU=;
 b=gYrz2ks6rROybw7OzcM/sO1QgMVbQpqKF7iXg/UsGKfw/shWC0z9Vs8E
 U6sc/z7jELk3g9Ihhqf1IVOQOvrjTl4Re6Y4hrQIQjIoyatU9STlEIzsE
 1CvHGg5B6wlhz8VUY5PLc0atRwaDDo6F9l3oIzKFAVjJXA/6YbTtTJlAS
 qPuyC6SKTrQiVk82HilzxFTqe1TLEZywgjqZ0K0NyXw6Z4I3Ua+6tzpQG
 c+/AFEUGbGvxxBBF1OUSdYMmi2MSiwrz6B2rKcEA6EThgs7W7jbUE03Ut
 qP+htgSHndTaPdNty6QGDOOBwxnuZbSBxweMczJ+hj7TAB16Dh67K/DAJ A==;
X-CSE-ConnectionGUID: 5dzmIPkeT3CnmEg0Ar2+aw==
X-CSE-MsgGUID: wHSc9n6KRx+zdCsChtB8og==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63123866"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63123866"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:44 -0700
X-CSE-ConnectionGUID: FBdmjB6CRXGxo+yhFCK0Ww==
X-CSE-MsgGUID: 8X7y14LERdi6mtIWINLC1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="185987645"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:29:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 16/16] drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
Date: Fri, 31 Oct 2025 11:29:36 -0700
Message-ID: <20251031182936.1882062-17-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
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

xe3p_xpc supports multi_queue, enable it.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b5eaf0fc105c..43f1cc47b9b3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -111,6 +111,7 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
+	.multi_queue_enable_mask = BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_ENGINE_CLASS_COMPUTE),
 };
 
 static const struct xe_media_desc media_xem = {
-- 
2.43.0

