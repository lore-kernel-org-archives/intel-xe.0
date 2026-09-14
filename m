Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC84C88E73
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 19:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3815010F1BA;
	Mon, 14 Sep 2026 19:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhUIBwmu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC31510EFB1;
 Mon, 14 Sep 2026 19:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789415275; x=1820951275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FNR+676gEeO6V24t+qsAJuyOoug/IY8CQ90mSQUvpls=;
 b=KhUIBwmuG+QCpwsVjbumFi8DAT5HJf4Vqxl5E1TatM0e92nB1d1GyR3I
 vmp/BEO3WmKkcMa1yOobEiAw2wYxlkuuFiwYuH3E2OmFkB3B6TKrIws5x
 I7Bp1T85yeHbyzOQWTfoeHxw94hDFgJk1/8Pjzpq3GQK8ksrWpYzPLHci
 vTiJHZkeKLkj4VlIzmS1/J95xMg6PitZUJLAlVF4Ax6b/dQcGmhrHVJRo
 KDxppqpYixGGxwnZKytNGGHGdG5E33CmkFSLFV4ut+HRuZaSZyya5ykt1
 lXy73aMO3rAYiBpIFomEJKDrzKxqDYM9Gk7Kj9MBDV533ywK/Hy2VpuvL Q==;
X-CSE-ConnectionGUID: TEoRLYJBSzGZpEg+iR3VYA==
X-CSE-MsgGUID: To44xa62RyeUH8pIXlLx1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92284844"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92284844"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 12:47:54 -0700
X-CSE-ConnectionGUID: VyCraiVQTbyTQOf2smcqwA==
X-CSE-MsgGUID: 0EFTc7c2Sb+r6+qk1ki3sQ==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 12:47:53 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH v6 1/7] drm/xe/pm: initialize the device's system wakeup
 capabilities
Date: Mon, 14 Sep 2026 22:47:31 +0300
Message-ID: <20260914194737.272679-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914194737.272679-1-vinod.govindapillai@intel.com>
References: <20260914194737.272679-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

NVL+ XE devices are capable of generating PME from HPDs. Enable
the device as a wakeup device so the display hotplugs can
generate PM PME events and can invoke pm runtime resume routine.

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ab4da1d9a9f1..f8e16aefd2f8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1217,6 +1217,10 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 
 	pci_set_master(pdev);
 
+	err = devm_device_init_wakeup(&pdev->dev);
+	if (err)
+		return err;
+
 	err = xe_probe_info_early(xe, desc, &probed_info);
 	if (err)
 		return err;
-- 
2.43.0

