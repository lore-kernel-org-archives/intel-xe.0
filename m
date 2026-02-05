Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245E5ECD9B0
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 23:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71CE10E1B2;
	Thu,  5 Feb 2026 23:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="InixMJBj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8394510E19F;
 Thu,  5 Feb 2026 23:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770334839; x=1801870839;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=i6cchyq5BCZi7iB6ZhixQj2V/T+TOCQFe/bCL7kXrBg=;
 b=InixMJBjWon8N4A9nbNICmFuIYFJxl3TQf2DgidPnPvkpdauMXRshCht
 Vjt5kk9ed+IMGi6saHmjEjO4+fGhPl9ToPeSpck/Ya2YXDXo7dLK8mVxf
 uuVznwRdfSncFFthmpuz5QOIsiydkbSxuXRthMEsw+V3JRsBd9wNRq6TT
 J4TzWyOLJw8hQi/0F32vDUAPaes690yvMfNGXdpRWnUydvsKIaP+5R1Hs
 MQ977MtYqtiKhOWf8lnTaScUVxjLEjjCYMUVaSwLmZ/ZIRyFSacDe1jGt
 oOa7rsaHGdOona5SGaKLW864lFb4T+weP0dJITI0E039QPwxHGFco206B Q==;
X-CSE-ConnectionGUID: 23rx5JyzQiiZJ7gaFj3fpw==
X-CSE-MsgGUID: sCY8GS8sQsCrTG3Z057+5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82658693"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82658693"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:39 -0800
X-CSE-ConnectionGUID: We6b8XFBQ4Snj9AYL7R2TA==
X-CSE-MsgGUID: KraBBVCeRfiqHh+TdDM+zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210500156"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.82])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:37 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Feb 2026 20:39:41 -0300
Subject: [PATCH v2 13/15] drm/xe/nvlp: Attach MOCS table for nvlp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-nvl-p-upstreaming-v2-13-9ec14f00cc6c@intel.com>
References: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
In-Reply-To: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
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

From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

The MOCS table for NVL-P is same as for Xe2/Xe3 platforms.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 54822497c21e..1d19df860bea 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -600,6 +600,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->wb_index = 4;
 		info->unused_entries_index = 4;
 		break;
+	case XE_NOVALAKE_P:
 	case XE_NOVALAKE_S:
 	case XE_PANTHERLAKE:
 	case XE_LUNARLAKE:

-- 
2.52.0

