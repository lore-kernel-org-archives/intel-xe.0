Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53ABCA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4CD10ECAA;
	Mon, 12 Oct 2026 05:19:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528FA10ECA0
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782377; x=1823318377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Jfx3ll6uaWkkM4/uuBSviquBppWJx/NOW8xHLviebA=;
 b=H/e6pIGj2yDBzl9HoSiPsB//Ggy32xF3/mzhM//wiHrBx7RG2DRZFY37
 9ACLvmR3AWnkJSsi5AmwbkWAVNFjXsBvNGYgemfHFBxuuN2bIL88Q4iM8
 DRQpRXeC3HWL1FBNNyMDnVybD8Wx4irOEZWh4n49dyQKWJMzqQbJLNqDO
 EU8tutU1yx5pG2IHjSjskFaz6v7nEFS3UJsgUFbSei2A49/Bgvw1C4hDs
 nPBnooPwiILfk8faezKgMl5BeGrZBi3b+U+Rnrvv1VeRfcPZQdBHM5uwa
 nXGUHVcDPDIbmHKW0A6yN6bp7jtjslqAxX4dY7LnEl7vfvo0ODSXGIssr g==;
X-CSE-ConnectionGUID: lsXCwovqS9eWGkAri8IbFw==
X-CSE-MsgGUID: Xadbzd7ATCSpYdXipGzlTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="390511"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="390511"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:18:41 -0700
X-CSE-ConnectionGUID: WqHlpi4OQ9WCnl4XkXwVgg==
X-CSE-MsgGUID: AZwg0olaQ8ehmbe01Pp2cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="735942"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 11 Oct 2026 22:18:40 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 09/12] drm/xe/pci: Report unknown GMDID versions using
 structured xe_log API
Date: Mon, 12 Oct 2026 10:48:20 +0530
Message-ID: <20261012051823.2201360-10-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
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

Replace drm_err() with xe_log_err() using the REGS component tag when
hardware reports unrecognized graphics or media IP versions during
GMDID handling.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e44b74b9aa27..9cc35433ec91 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -721,8 +721,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*graphics_ip = find_graphics_ip(ver);
 	if (!*graphics_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_log_err(xe, REGS, -EINVAL,
+			   "Hardware reports unknown graphics version %u.%02u\n",
+			   ver / 100, ver % 100);
 	}
 
 	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
@@ -735,8 +736,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*media_ip = find_media_ip(ver);
 	if (!*media_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_log_err(xe, REGS, -EINVAL,
+			   "Hardware reports unknown media version %u.%02u\n",
+			   ver / 100, ver % 100);
 	}
 
 	return 0;
-- 
2.54.0

