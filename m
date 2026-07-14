Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CA4C4450F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 18:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11BE10E666;
	Tue, 14 Jul 2026 18:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hf/Pp8sy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1161E10E578
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784053763; x=1815589763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8qrIJhNCT8eiokyzYBNraoNaMz2FQHbKvwY58TwPi6M=;
 b=Hf/Pp8syEkrzmFxQS0xSQdXNaxgZfflKWhwz+ir8vSu9AQsXqawYcoQ+
 AAJqCnDT1CaevDHr8QxAOyb0j7T5Q8SmzTJkPINeY1BVM7DrecjZ/tV5p
 sySNSWEHsaZ9M95uHQVir7yFmv7wy9ATHCT/IRd/b580x7ujHpaH12SiJ
 ogN6tkB+2GVWN3oOAE6hRSzKGNC1FlLHO/4ahSd130vmih0v1cNn/rqzq
 2Lk0zeuPrKkWk5BpWjiYP7e4kOViDJ5Wz/xmyy0tBpSbx9fcJl6rv6/bG
 lg+vs0Qo1Fv9A/eW26p+y7tZv9oXfA5y7pFoBbAA0kfoPUuVw8YL6Gfzh Q==;
X-CSE-ConnectionGUID: q5BFeThORRCR/vZIhLRvnw==
X-CSE-MsgGUID: krgRZgg2S36Rc79nm6aqPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84880827"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84880827"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 11:29:22 -0700
X-CSE-ConnectionGUID: K20YmbucTamDfhX6RVvhMw==
X-CSE-MsgGUID: XxrnnSPPQYujJ+Q/JAYRXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="260838267"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 11:29:22 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 5/5] topic/xe-for-CI: Define GuC firmware for NVL-P
Date: Tue, 14 Jul 2026 11:28:43 -0700
Message-ID: <20260714182904.620871-12-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260714182904.620871-7-julia.filipchuk@intel.com>
References: <20260714182904.620871-7-julia.filipchuk@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: John Harrison <John.C.Harrison@Intel.com>

Novalake P has different IP on each GT and requires a different GuC
for each. So add separate graphics and media GT entries or NVL-P.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7235
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patch.msgid.link/20260202-nvl-p-upstreaming-v1-16-653e4ff105dc@intel.com
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Link: https://patch.msgid.link/20260529193558.185436-14-daniele.ceraolospurio@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patch.msgid.link/20260618222536.3351750-14-julia.filipchuk@intel.com
Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6c9af46f55f6..9c33a6200b51 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,8 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 70, 0))	\
+	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 70, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 70, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 65, 0))	\
-- 
2.51.0

