Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD59CC6B19
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C454F10F9C5;
	Tue, 13 Oct 2026 20:47:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB4C10EA42;
 Tue, 13 Oct 2026 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791924471; x=1823460471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y5ffrKfdQK78nFPFBQunbk6Z3forxJ8IFVOzLrCvx2M=;
 b=RUqIDXGazsHAzLLDArSBxHa1he4ExOtjUS5LvuMSpKLA5YxZEne2okTL
 0e+quYjY5pYkbj/8VhZSq5bJIBl0cmuxQ+N/Ooefp5eLcmGZBqsJHc6nq
 8plBZfgeuGlNJpGGbJ8VvLR+Kb/ML71f9QetWoIw7bnAX8tAR4qG7wu7/
 c9TKohlFfKyiN5gE64uzHBqFNx5fxOkQDir2PK2QpBOuCzKN+B/tges7Y
 n/0GwpkuqIL9Y/tjg7K3zly1yh+rtOYryJRbvmr6l2H3Zy9mOW8TEPmlM
 olKL9OPiO3pwbc69fOZo0Y66AyTe0hJgm5fvT7+khr6pvS/qkb6zxRQ3A g==;
X-CSE-ConnectionGUID: ZyXpQTZORKWUiq4N85YTgQ==
X-CSE-MsgGUID: q/loHbH3TjyST7j43cKdUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="539297"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="539297"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:47:49 -0700
X-CSE-ConnectionGUID: DifsZQXGRA2COSw0Hd+E7A==
X-CSE-MsgGUID: RUoUC13cQ8yJJD7h+pKZRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1189045"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:47:48 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH v4 3/5] drm/i915/3dlut: log 3D LUT's status
Date: Tue, 13 Oct 2026 22:47:02 +0200
Message-ID: <20261013204705.1574475-4-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
References: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Print .has_3dlut runtime info flag in intel_display_device_info_print().

Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 4c09f35644ba..a2bea5ac59cf 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -2001,6 +2001,7 @@ void intel_display_device_info_print(const struct intel_display_device_info *inf
 	DEV_INFO_DISPLAY_FOR_EACH_FLAG(PRINT_FLAG);
 #undef PRINT_FLAG
 
+	drm_printf(p, "has_3dlut: %s\n", str_yes_no(runtime->has_3dlut));
 	drm_printf(p, "has_hdcp: %s\n", str_yes_no(runtime->has_hdcp));
 	drm_printf(p, "has_dmc: %s\n", str_yes_no(runtime->has_dmc));
 	drm_printf(p, "has_dsc: %s\n", str_yes_no(runtime->has_dsc));
-- 
2.45.2

