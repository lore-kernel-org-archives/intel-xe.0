Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACA0C76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 14:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D807D10EC09;
	Thu,  6 Apr 2023 14:34:18 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B0710EC12
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680791655; x=1712327655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rmbUdlR4/t8JP4AQecp9gbtj4fmYHNDWdjg2G0FKUn4=;
 b=Pic7fmScZdRR8hB7rtFmZEwrHH2lI3MA/c1fz0PZlGM4p7NrmxWSk3EC
 U2KpRPEbn/fRCKThhcDM5s66TGiH9zCNSVbPTFRdG/TTVmnJpf3gB7rzL
 yYdAavSbp+Oa9h2B3+zOaplU484o9XBvvdzmhv4ABKNigXHyocXsJVoJv
 wuznwlgflQkwQJdnARj4GetvlnqlLTnFX9Nb8XzEr92QNrR61SDq4pGIO
 KLtZb0JVH6d7Hj1BIVFBlz+S3uvQc7InoX7HYo310hX0nXpPoajCNDtk3
 8cmlncIVkooqLL8xCPsVhM6FC4qLeYkpXfsX7+n7TJ16Wvtl3DPKXDYy2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331384605"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="331384605"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 07:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664488505"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="664488505"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 07:31:47 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 07:31:33 -0700
Message-Id: <20230406143133.29474-6-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406143133.29474-1-jose.souza@intel.com>
References: <20230406143133.29474-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 rebased 6/6] drm/xe: Enable Raptorlake-P
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
index 20be113544fac..d5e1c8f7d02a5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -288,6 +288,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
+	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
-- 
2.40.0

