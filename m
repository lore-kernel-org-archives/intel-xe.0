Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD44BC6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 23:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A58610E41D;
	Wed, 22 Mar 2023 23:25:00 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2668F10E41D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 23:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679527495; x=1711063495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bnrEO4uOf47wkpxula1+IRc9dO1QgEE3F0q4aeeeIvE=;
 b=QwLCJYGcnsHYaoitJd0mTM2KdX/7Yrv7uZieHUz5pOQriBw2tIli6kE2
 iCaWJB1cHWTbUkdgwm2uNWCZqnTKQLIAXhTc4f2LmShWhuSFXX6E01MlK
 Z517OjUALcAi0Cc8t4meeQa8yFlB1PaL82AFSDeLUH6+NrGU1ygV5hmGT
 Qr+/7Vnbo7qVo3dsvbrib1lYG1+Vqj2jNaLwtTCPSG03/PD1zQQ+zNZwi
 d3T1/PMymZMYIqzgWCGAv+2DkVu8rRpaHpdkJ4G9ftQ9lZbOrFGucWc7n
 mkNDjfOi531fHppTK5TBxMQzgQi61cTEbVGUnypRtrdsTLQP4fmP0I1eC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="401922729"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="401922729"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 16:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632149533"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="632149533"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 16:24:54 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Mar 2023 16:28:12 -0700
Message-Id: <20230322232812.3624914-3-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322232812.3624914-1-anusha.srivatsa@intel.com>
References: <20230322232812.3624914-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Load HuC on Alderlake S
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Alderlake S uses TGL HuC.

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b8452c91c170..15f6cf5b2e49 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -51,6 +51,7 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
+	fw_def(ALDERLAKE_S,  0, huc_def(tgl)) \
 	fw_def(DG1,          0, huc_def(dg1)) \
 	fw_def(TIGERLAKE,    0, huc_def(tgl))
 
-- 
2.25.1

