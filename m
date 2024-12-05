Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072C9E7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 18:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AAD10EF68;
	Thu,  5 Dec 2024 18:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JhipAOjz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A5010EF68
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733423830; x=1764959830;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gBJMXmNbJv9uy1eJeh5BuHtjMmhoYnWt+fHP4aUik84=;
 b=JhipAOjzrATIoGP+TW7SI+8dtfdcuyKujpeh4hrYqYn2h938ZBfHXL8P
 xp/bHmb/fG3AzPbAzcOGHQYawRlGPCL3+n5cEbrg0aWCmN0yHmVXLsu88
 Katms+KWLsD354M/I+mMv7+cV3oYXvxwZ6lOQUuLIYHN0qP2m05h9qngs
 UcTAa1HNScEm/8s/P5eiByQw9uJ/BP3GBPEHF19K1MnxgWzaIcySCBf5K
 AGdkKZeFx+5SjiM5bOCschyV9aajGnHgBE60vSQ4GMgCAcY2okIYyj2Ne
 p4uec8fDNZXQvVLZLT4vjS/Cw7ugyWP1Aknoi4p9Xd+LY/2Ifxb2yRaZo Q==;
X-CSE-ConnectionGUID: lBHViDOkSPucM1WpFXGBww==
X-CSE-MsgGUID: pIxGtYk/QjWNyrJ4+B1kFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45146590"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="45146590"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:37:01 -0800
X-CSE-ConnectionGUID: wFYW79EbRoSdYh6k6s8d/w==
X-CSE-MsgGUID: yPpqI1kxSFK86VeD4Irw+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94541191"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:36:59 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH] drm/xe/vsec: Address static checker issue
Date: Thu,  5 Dec 2024 13:36:49 -0500
Message-ID: <20241205183649.3120032-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
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

The callback structure should be static.

Add static attribute.

NOTE: the fixes tag in the drm-tip context

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412050418.8ecQxYXj-lkp@intel.com/
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 17ebc3ffb573..edaec262ed0a 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -180,7 +180,7 @@ static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t u
 	return count;
 }
 
-struct pmt_callbacks xe_pmt_cb = {
+static struct pmt_callbacks xe_pmt_cb = {
 	.read_telem = xe_pmt_telem_read,
 };
 
-- 
2.44.0

