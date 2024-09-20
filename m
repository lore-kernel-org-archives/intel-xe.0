Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B10ACF9C68
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 21:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC3C10E868;
	Fri, 20 Sep 2024 21:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHP9mKMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6717810E865
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 21:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726866912; x=1758402912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tq1fz24FuHt+AdR+Ypajp2WXyRDS6aYaKBUqTAHXaCg=;
 b=NHP9mKMuRrmd1SOg9BQvhEvbX1JxOCX7roQ2VdG7mXacYsDIddyME7WW
 KclKYUNgm5Ow8qMcSFzKNPNgaqKD7NivTUOVWt6N05+kKo0a2aEFX3k80
 QRG3dpdFmo2QtTDcrlXz6zARooFUwgq89wDYgMKebViyJcphyvfqyha0X
 egtnNb+lqYkjufJqfTI1wCiFV44Kbm7nyRoQDYTJ0CmXG0s9znl2kLRU6
 a49rNCe5c11I/kQV2rF+84M0BjUHmt8TpwNfiVBGepoINVRFdA6NdHlJD
 s1BOMphjz5VSKFPFXqNTStS0k7Z/Gl6/iF9AYKeo4Z0sFx+GsM/BNI2Kh A==;
X-CSE-ConnectionGUID: uo5NUb/sTMyBsnB/zgn6dQ==
X-CSE-MsgGUID: z9WIlbTuT9KqdmHq7cr6iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="28786493"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="28786493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 14:15:12 -0700
X-CSE-ConnectionGUID: IzdKrumiRU69QQREZESS4A==
X-CSE-MsgGUID: 1pFlYLj4QQ+aKVGLlFug/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="93761633"
Received: from iweiny-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.110.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 14:15:10 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 1/4] drm/xe/mcr: Use Xe2_LPM steering tables for Xe2_HPM
Date: Fri, 20 Sep 2024 18:13:15 -0300
Message-ID: <20240920211459.255181-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240920211459.255181-1-gustavo.sousa@intel.com>
References: <20240920211459.255181-1-gustavo.sousa@intel.com>
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

According to Bspec, Xe2 steering tables must be used for Xe2_HPM, just
as it is with Xe2_LPM. Update our driver to reflect that.

Bspec: 71186
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 2671ce6b1a76..4c0767403881 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -441,7 +441,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
 
-		if (MEDIA_VER(xe) >= 20) {
+		if (MEDIA_VERx100(xe) >= 1301) {
 			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
 			gt->steering[INSTANCE0].ranges = xe2lpm_instance0_steering_table;
 		} else {
-- 
2.46.1

