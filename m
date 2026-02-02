Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A369E7FDF0
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A73110E4AE;
	Mon,  2 Feb 2026 21:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jb8P1Mm8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF3B10E4AD;
 Mon,  2 Feb 2026 21:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068666; x=1801604666;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=daq76531YfEN6i3dDPWvLpMN80HrZMzb0Lqd8nizngM=;
 b=jb8P1Mm80uNu5JWWmhHMXW9hm4e0YIhyms4RNDheUx5me4tv8DwdpG8S
 r4aAky4+DSolrv9ob5MFa3ygcE7nPqYGc9QIL8/HKlFWr+gdPZqF5mlqf
 b7hivC7TFyx2KlER9epyseTBA+MJccqduxd1g3LpA86m7yIupXdmv84au
 Sjvn1395ADk5x2S18epIFdXkAW4TiD1AQgOHMJyEnoZHAfgrOTOv5SMZH
 2GVChNnMkHRyOGik5zf8FBIDYLfTHlfFH97YAYo/+wx8PpfSrwNfzxQxQ
 XrAFPUaILa8v9U7hgntMi0RnYLo3kIxU6c/gX9Ejev5Icm9nqGARUvp5W g==;
X-CSE-ConnectionGUID: 4YyNa/NQTf2VYwBwhw2KQw==
X-CSE-MsgGUID: z7yrHFinQoW8+kFDxvBVJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814362"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814362"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:26 -0800
X-CSE-ConnectionGUID: PvDnsI11TPipBbPDMnGCgA==
X-CSE-MsgGUID: tSnNLhkjRd2eOo+cVGbYHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646881"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:24 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Feb 2026 18:43:20 -0300
Subject: [PATCH 14/16] drm/xe/nvlp: Attach MOCS table for nvlp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-nvl-p-upstreaming-v1-14-653e4ff105dc@intel.com>
References: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
In-Reply-To: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
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

The MOCS table for nvl-p is same as xe2/xe3.

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

