Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAA5C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 06:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109F010E004;
	Tue,  4 Mar 2025 06:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y54tPS18";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFA110E004
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 06:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741069060; x=1772605060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j1vfVHG2Wuc4obR7c8e5EMZ/EleK1JoOI6AXJ6RH0gk=;
 b=Y54tPS18MGUkN8IOqSbOCN/PfUtKlf5HvJ/L/kd0meiltCCZ+gCaymDd
 QfYPY28WBr/fMtIHN1F207TnZgIlZ7D/LxdsFVXPsTHPonSV2F5l3X0Ih
 f2F3Lki5VWwBj0T2vUgF2YSm9bqkNgSLLONMYJeg0LlWY3/nkQLbvoqmp
 MRTY+dZRsr2ZeiAhaAcKe76bPTGT7td1aSftAtCta6nH0ZVoE8ZM2WUHR
 5ZpUMrTPJmFa+IOwqG8LXc6+X8RJuQ/XKKTTA/9vcjO/3TKxr3u1Uro0e
 uB4nabApVhJ4ZCZLqCXut50Zuhp3Uds5vlGGc7I+9owvOv5Em8Ax8Ft7a Q==;
X-CSE-ConnectionGUID: BxfSMx8bSsuyn03pFbJtOA==
X-CSE-MsgGUID: 0c0OXVZgS0yrtc/JX5zt1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42164404"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="42164404"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 22:17:38 -0800
X-CSE-ConnectionGUID: cxrYxL5uSKKwRXFwxKHJzA==
X-CSE-MsgGUID: EzA+a9unQcyPG85VbzDHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118259634"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 03 Mar 2025 22:17:35 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, rodrigo.vivi@intel.com, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com
Cc: intel-xe@lists.freedesktop.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/pcode: stop logging mailbox status as error
Date: Tue,  4 Mar 2025 11:47:27 +0530
Message-Id: <20250304061727.452100-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

Since we're expecting many platform specific mailbox commands that
might not be widely supported, stop logging them as errors. With this
we can avoid unnecessary platform checks and use the return value of
mailbox without enraging CI.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 9333ce776a6e..280f69119ff1 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -46,7 +46,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
 
 	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
 	if (err) {
-		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
+		drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
 			err_decode[err].str ?: "Unknown");
 		return err_decode[err].errno ?: -EPROTO;
 	}
-- 
2.34.1

