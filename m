Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2858EC77B71
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 18:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9586410E2BA;
	Mon, 10 Apr 2023 18:32:32 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E28510E220
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 18:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681151551; x=1712687551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ge9McK88g0vp3SKch51bs4oZlVzqX1Qlq9B83TZEaqM=;
 b=Q/PU35lsqxnjgFaLmuiQNdKAFjxNSyfNH6FPxCYFqSxJm8HR5rgZt7Zm
 2MBpIU+tSzbuXAEZLwrayWTiUJMZ4csUyarjMSI4HhikWyg0pfcrj0FfU
 /QG1l54CTxWn/fzHSy2lq4VQwoafo72mpQiK3IBdxBs1GANE1zEeD+h3E
 4MQkrObZv7B3Tqt0VT0YLjfr5kESc7+fH390H28sRUBeWI+cp/iR3iplb
 FmMikpCoS+iv7SUxEFgN2NOB68AKcbLWctvm+yqYr8T6LvHNnNV2EiKf/
 wZZI0gVjFSA7cZ9X5JU81qEf/CGuMSPZWuCxUHmGob1x98WjJ7l7/llao g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="408563426"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="408563426"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="681801018"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="681801018"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:32:29 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Apr 2023 11:32:19 -0700
Message-Id: <20230410183219.191543-6-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410183219.191543-1-jose.souza@intel.com>
References: <20230410183219.191543-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 6/6] drm/xe: Enable Raptorlake-P
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Raptorlake-P was tested and it is working as the same as Alderlake-P.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b92d8b5a391e3..8d23558c3e9d0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -303,6 +303,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
+	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
-- 
2.40.0

