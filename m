Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AF0C7EE32
	for <intel-xe@archiver.kernel.org>; Wed,  1 Mar 2023 09:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447D310E0B7;
	Wed,  1 Mar 2023 09:31:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F30C10E09E
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Mar 2023 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677663107; x=1709199107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BuxPrOKM7qxQUwgpmDJFFhZwBcfqk+rM66tL1qJkR/Y=;
 b=ASzPJPd3cr4Iauab2XJeAwoXPGopt7glm9SCEW+GsnhQi4QShSC7PY2p
 M/tL2VC7SY+sIn4kpkSmAFKz2X8kt14c/R6plDtn6lZipLkBtOZ/NDb4P
 VlsCJwEI07604OwU0v11fClygRkGxOBGzKQi8n5REVcQaN6wlZxeK+MU9
 Nhvr5tDIajJWMsdbon4AKaknO8p8PNVs1hcvuX9Cm01mj6DAmrL1ozZja
 TkT96bRgH0vHxX/XNGldGDRHVSh2O1IHus4Af7/I6+M+2gHETjLgzMVoM
 /4/6ouHc9pXHATeAAkYZTeSkF31bN0Qp6lezAwYH6hO51hBaT5PBSgUzx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="333091756"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="333091756"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="1003600487"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="1003600487"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:31:46 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 01:31:09 -0800
Message-Id: <20230301093112.2893689-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301093112.2893689-1-lucas.demarchi@intel.com>
References: <20230301093112.2893689-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/7] drm/xe: Name LRC wa after the engine it
 belongs
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This makes it easier when printing the register-save-restore values
to know what is the engine.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 343370b44506..daa433d0f2f5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -318,7 +318,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		if (gt->default_lrc[hwe->class])
 			continue;
 
-		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
+		xe_reg_sr_init(&hwe->reg_lrc, hwe->name, xe);
 		xe_wa_process_lrc(hwe);
 		xe_tuning_process_lrc(hwe);
 
-- 
2.39.0

