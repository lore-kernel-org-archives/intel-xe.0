Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528B7C88E4C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C7D10F54C;
	Fri, 11 Sep 2026 08:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MsVWrYSO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F5A10F54B;
 Fri, 11 Sep 2026 08:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789113913; x=1820649913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FNR+676gEeO6V24t+qsAJuyOoug/IY8CQ90mSQUvpls=;
 b=MsVWrYSOuI7r9CgMffdLsAaYZL7OWjIOs6F/ranUeKuzcO6ttAvjl7IB
 7CRAPAciDF8LyVu6Y9gsPphIp1do+yp4HGlwE1sSiq2aiNDpGE3341tI0
 M/j0VsYMnfWQgnoFYcz3tYU/Cxsaxrv2nWu5znwQakYabYRHBYE/h/96r
 bNkkPxM312WWPgEjslRpwBN9BHpswU8zcSzQlfQGAFSYYjC+P83Dt09zi
 ePy5E1kbX3M1qzPPRbnMGwdbnuOBiueV5aEX6BmmFphkfiG5hdH8EoJWe
 RoKJ0iBL8gQoHaeiUm8xLiKZIZ0AWmK/S1SR/JTKuWNxNy3jWX6upHgf1 A==;
X-CSE-ConnectionGUID: qRBiojBSTXy0OkxC++zEuA==
X-CSE-MsgGUID: RnBP/wqbQtOyo0Z/i1ljKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101094731"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="101094731"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:12 -0700
X-CSE-ConnectionGUID: UnCVC7ZdRgWvlKf/zpj7Xw==
X-CSE-MsgGUID: tCLNYw0YTROxzxPuRjgGXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="295333454"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.249])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:09 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v5 01/10] drm/xe/pm: initialize the device's system wakeup
 capabilities
Date: Fri, 11 Sep 2026 11:04:39 +0300
Message-ID: <20260911080448.778316-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911080448.778316-1-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
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

