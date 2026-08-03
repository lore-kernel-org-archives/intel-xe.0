Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A69EC55843
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 21:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEA810E092;
	Mon,  3 Aug 2026 21:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jw5Wa6n8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E96C10E0A1;
 Mon,  3 Aug 2026 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785793833; x=1817329833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5FTrOTUQ8qAsSFx+vApxgzaLheHlmd6LiMawZTpIpvo=;
 b=Jw5Wa6n8HlMsedui34ejp4riS+XNmySvyXn8Kg1fqvf9/z/rfbZ49DQr
 ZKeb/5Zgc+Nbu4DoywLNO8OlW9KKdc8TrswEkfxtFned0Q6NssDdyXgdD
 /OrurHv3cdB8SQjR1G8ECZIuzZ9vcJC4d4QHppf/+G0gK4yYIeStAhqDP
 AI2wst/RmSxfunxZ6izlc77enpofCv0thQmtEcK4rYXTbSmEQa/37tdsg
 ABpHR3ZSbc/711AT+sfdX+SaH63T/ZWMWyqmo/Y3y8flfzllsf7gY2PFr
 7Z4VCQIGzuqJxJgEsP0MNyA36KJXZMQHHyZ+8Ybohr2OSH2+5K3p/XRQI A==;
X-CSE-ConnectionGUID: vGrRITj1RmOKg3IN1yodUQ==
X-CSE-MsgGUID: gUEbwpmGTD6WBneepr2scQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97849150"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="97849150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 14:50:33 -0700
X-CSE-ConnectionGUID: 20S9uESpTQiEsyFmCwKv8w==
X-CSE-MsgGUID: sDdC7PhpQQeHBJbLDPICug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="291272088"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 14:50:32 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH v2 3/4] drm/i915/3dlut: log 3D LUT's status
Date: Mon,  3 Aug 2026 23:49:08 +0200
Message-ID: <20260803214909.3076716-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260803214909.3076716-1-michal.grzelak@intel.com>
References: <20260803214909.3076716-1-michal.grzelak@intel.com>
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
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
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

