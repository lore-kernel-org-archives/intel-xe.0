Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5AFC001B0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 16:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D805510E392;
	Wed, 16 Aug 2023 16:44:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F46E10E3A5
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 16:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692204280; x=1723740280;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0pYu300ZRQxMDHrLZf1qw+qnfd0Emq1PUSSQsgpapKw=;
 b=Spfulm64IPD8pV/ZwkDkErwRMJ2d+hbg1+AcFixxZevp4k/DMDR4geWM
 n2IYT9nPliE6m7kVIZ9mC8eVqSrV10c4LP4EQthBwNfdn+CA24uTfdQiZ
 HZI846A5W+jVpODoVB+/sTk+3MkcwYNYpBb7+pMu5xRQzogLfawzhgcMk
 YIDooJQ1AHGE71VMg1syC3hnCwmibpysTmX+imc/AVd8Dm9TY4aLfsUNK
 4KqcX/EgJPyPe9uehHcTRZ67qan0GZhPFzq0rqRBgZG26w5CrCsQvd6iw
 sY959VnRnxI3SjfOBNToPJYHPhNuW1Bdxrnmcia4EUI/QqgDbh0MlaiV+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352905719"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="352905719"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 09:44:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799679359"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="799679359"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 09:44:39 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 16 Aug 2023 09:44:31 -0700
Message-Id: <20230816164431.6680-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
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

Remove unwanted documentation

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.profile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
index a3655ee6978e..4bc080547d5f 100644
--- a/drivers/gpu/drm/xe/Kconfig.profile
+++ b/drivers/gpu/drm/xe/Kconfig.profile
@@ -30,9 +30,6 @@ config DRM_XE_PREEMPT_TIMEOUT
 	  when submitting a new context. If the current context does not hit
 	  an arbitration point and yield to HW before the timer expires, the
 	  HW will be reset to allow the more important context to execute.
-
-	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
-	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
 config DRM_XE_PREEMPT_TIMEOUT_MAX
 	int "Default max  preempt timeout (us)"
 	default 10000000 # microseconds
-- 
2.21.0.rc0.32.g243a4c7e27

