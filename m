Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4B4EE6B49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 18:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB48A10E8B3;
	Fri,  6 Feb 2026 18:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxnoxLTO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C8610E8D6;
 Fri,  6 Feb 2026 18:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770403009; x=1801939009;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Z+W8W8cc2beKeABbAQce3A6jT51rdfm5elYBLJ7roSY=;
 b=GxnoxLTOo3rBvAxnYGK0flw4gMzXa1sdMveOaloMR6hHfHAVmTd54iF9
 DJ8AXQkhKyUXzxOQ7/ekr2FREbRzZaAxd67Y1lZjhxkJplhkqk2OHdATz
 Iz9Q0Kv6BEgd3eXwtydZ7Bu/WTPUvQ7Tk7Bs/fudrkuBckChKBsw4np10
 Nzmuj9FhusDTu8V+zQidmKOBEnOK3LNZI+mcEsp/qOdAVIvkyS2ryKktm
 ly/T3yt3Cvv+p/vVeur0CU7Qr/15nIPCHcPqFd+7hqNF/OWShVzgOYsF3
 xr4Y2ubXLE+kJoDh6PeeFr5i0MGWnC5qj9a6xZby2mbtSvVD5AcgOnV1m Q==;
X-CSE-ConnectionGUID: ExGN2K3WRweI0nKzClK1nA==
X-CSE-MsgGUID: 3I4bWjb9RbeN+hLCOvfJYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71516963"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71516963"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:49 -0800
X-CSE-ConnectionGUID: 45mYa7JjTpic/UjevN5Acw==
X-CSE-MsgGUID: 8vt8fEsmSTWBa0/M4iugaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210224779"
Received: from vverma7-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.159])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:48 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 06 Feb 2026 15:36:09 -0300
Subject: [PATCH v3 13/15] drm/xe/nvlp: Attach MOCS table for nvlp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-nvl-p-upstreaming-v3-13-636e1ad32688@intel.com>
References: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
In-Reply-To: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
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

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

