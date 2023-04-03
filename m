Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02786C76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 16:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C911810E51D;
	Mon,  3 Apr 2023 16:47:06 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D7910E53A
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 16:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680540424; x=1712076424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IN0fKJIzIX3+gPNPoz0FwYbikde2z230+bttTiKN7XU=;
 b=WymwuVp8WEo6saootFUqcDeLbSqX+E+D3pN1l5XV7Hd/FfsDFLAG8RRr
 wDdxNWETT9/Kq4nj8r9QibFywrNNGyR6aOT9cyVpBC/QpbcYqj5zzq2qZ
 X4AVQg6lJuMy6GXoF4b5Kv9DwJK3aAjs+XtETW1bPnJPP3aVLxiju5xLg
 QeXpApWPX/xRvN6saJA2qXrq0a9b7A07lWlwIBcIGCfSEZBlwpMcE22e1
 K7dSoGh9cvI25q+4PnmJWizaRPvSVLwzf03xbejw3zjHB1X1GniWdJpNi
 dXnPQLmm/glT6YTeUGPc6Abxz+loVtjlkWB4sQ33UM+QjkHMfCMVQ9pje Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322350771"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="322350771"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="797132381"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="797132381"
Received: from unknown (HELO josouza-mobl2.fso.intel.com) ([10.230.18.148])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:46:31 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 09:46:15 -0700
Message-Id: <20230403164615.131633-5-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403164615.131633-1-jose.souza@intel.com>
References: <20230403164615.131633-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/5] drm/xe: Enable Raptorlake-P
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

Raptorlake-P was tested and it is working as the same as Alderlake-P.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91fed9d3105e7..e3ff17671203a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -291,6 +291,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
+	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
 	{ }
-- 
2.40.0

