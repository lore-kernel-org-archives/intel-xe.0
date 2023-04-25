Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1F8C77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC6710E5A3;
	Tue, 25 Apr 2023 19:26:58 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E56E10E50A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450816; x=1713986816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xMCyhu2/BbO/ccSNBe9E7lLQd/xKmhivK/FDMclapAk=;
 b=WlbnuX5inQCTyT+CsPCX2kUWwBY62t/KWsr/kjGbn2McNumztUSUqmyq
 57aDJZok0Ag7hQ6sStywXquRn2xa24vXTn9U3SCKN8iBT+FWz3wgi0QxY
 KOAaBtbKITHiL7CMdsjSJPTV9itE+MWkqbhgNFaKbBN80niiQuydHC8HQ
 B/YQA+uvuLuu54gm+JTVyKvgssUJ8ZRfTg8AyQSq7Mci5ehqrtiyhnFz1
 0jT8K0T0Dq507xN++/9FOTQM8lG/332hmFWUQiKQckV9DbHmfdGwdzCtV
 X463QXB7P9FfengWz29C+Ix86FW8k16ZEm//AV6ccDbBdDjfd5RsjfHh6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="331100928"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="331100928"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="782990516"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="782990516"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:52 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:26:24 -0700
Message-Id: <20230425192624.168640-16-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425192624.168640-1-jose.souza@intel.com>
References: <20230425192624.168640-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 15/15] drm/xe: Enable Raptorlake-P
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Raptorlake-P was tested and it is working as the same as Alderlake-P.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e512e8b69831b..b6e1ab1ead35c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -315,6 +315,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
+	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
-- 
2.40.0

