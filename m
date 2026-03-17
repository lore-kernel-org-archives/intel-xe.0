Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C90F483C1
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FC810E563;
	Mon, 23 Mar 2026 16:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bIb4mQhX";
	dkim-atps=neutral
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5C310E22C
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 19:16:28 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-c70bfef17a4so4069107a12.2
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773774988; x=1774379788; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNksHD/Ia/lI3PwtOgNwKe8s7JojbqFZYiYVCtaCE+Q=;
 b=bIb4mQhXFuOVjZrjCLwVvP6ANdAaqS2OKEvWIWKYeyovIk5/Bdpr/tc75eZR52c9pJ
 /ClrGzD8Qmy0uW10uTz2e1wxjphpH+kmeeHfDsxUPFsar2vjexC0z9n4LV3sxQRCA4eu
 TnUDN1b490j6zqqzrApPa7SWoHsJ9hXqQ/2DB9W7KiHhoXbtGfu2HEAntFH4iI0ykI1r
 /C4ESMXNzHcos9I250TETpdxeui3tEqCXRokKPcO1DuJT9vodXtWke4MTbUOCptQOV3X
 V/EJ9GJDCpNONiAzJDc7r7Am3hV2NET80zz0239aKPMPWamakm8DqTHvVPETHGUCvb0M
 Na3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773774988; x=1774379788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xNksHD/Ia/lI3PwtOgNwKe8s7JojbqFZYiYVCtaCE+Q=;
 b=G6VRqnDlX3JDa0CDdvzdPDKMPeKsxk0adhYZTGs2/FlvwFtXeEypdT4XOwo61yunuP
 JJSobgvivqXD/o/Zpj1YYfbKpIcYcdCdI05JY3OOnOBYUz36UwguxHmQ0B1N3yKR40/R
 YGV7Ud6omoUu19THwqBOOxo2Q8eYaraLpSAyei7bqnNk+dvlCxtdJ8bA4QmIUHlsZi9c
 0mYBbZpJqvxLpVCpZlPzCtt0x+Z53WlVI2jivYz7W94QtYwq+H9fanv3fLXRzkoT+3lr
 uRGH/YUkCAfx8EZWoKEMqNasEzkPLHpQcjOLd8eq2+uzEl7JMulhw91kKVFKUgTV15iC
 OpZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEZ2xvuxs1jVukmyx7jvk3mnaYwgqO2/DPAT0ccuqEFGX+Of3rvRZWulk8iPCJnb8+Xi2Ya+QhHQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgJI0ugk7mKEFfRmODljggtU7LzT3du5LTTVor2bt06bjR69BN
 NgRJOJN4Fel8KTvTelf8keNfFH3lO4JJsQbelffFxtv2o2KTCuWgkSd9
X-Gm-Gg: ATEYQzzwu6iDhV2qz7wbKL6K8cVUqqgNu0fq9Tcm8+TcmOaGNikc46kz2DNpgqGYnj0
 kdbVYE9cCWfeTvWgZQqqd+giCZjtKlT8+XLek+ghXwDCG1mMZEYwOLfVPucmd/qIjnf1d1LycKl
 OB/38OGByvFYnjDOTOpaACqa17Visq41FownJQiFbcLpiAPCG06JHHERJ7Y5DcSQhbz00G/bWWA
 SPMzhffRPFQREqMvsvUL0DafVbYL8H/0HTHXqHUoNxgrTpXNHjFhuQSxucEeJKd/+xrAS0LWJeN
 kZa3i2z4KvfUm4vGGcFip/IefD/xta/tYKALA1v5ua5XvmiglZHbaClW+emQ5BTxsMAkoZ/cnYB
 leG/xJxEdAFvN4m5vcAOnqQD5n1PXLSFy+z1cTgsfteERCmM2bNecAwuS9tr3DKz8n6NmJYswxZ
 XthYcmFBADKnF3TAgTEYLjaok6H3S5X5/ohjHwH6dGx3sLQqJ+miZiJ+sDYkp6sjnFIabR2yqtO
 D9MRhgbfgdOsV0HWfMboYQbvfLeDXpN7zMsg0YYtywGisFh2CNmHbzOVFBhgEDguBS7+yBCsRpk
 TEwq
X-Received: by 2002:a05:6a21:398d:b0:39b:7f5f:d591 with SMTP id
 adf61e73a8af0-39b9a0c86ddmr341476637.63.1773774988182; 
 Tue, 17 Mar 2026 12:16:28 -0700 (PDT)
Received: from 2045D.localdomain (76.sub-72-110-123.myvzw.com. [72.110.123.76])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c741e546b01sm334350a12.21.2026.03.17.12.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 12:16:27 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org, dakr@kernel.org, rafael@kernel.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: gustavo.sousa@intel.com, demarchi@kernel.org, jouni.hogander@intel.com,
 luciano.coelho@intel.com, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, akaieurus@gmail.com, me@ziyao.cc,
 Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 4/4] drm/i915/display: initialize string params to empty
 strings
Date: Wed, 18 Mar 2026 03:15:38 +0800
Message-ID: <20260317191538.43535-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317185920.43387-1-hanguidong02@gmail.com>
References: <20260317185920.43387-1-hanguidong02@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:04:08 +0000
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

Passing NULL to debugfs_create_str() causes a NULL pointer dereference
upon reading, and is no longer permitted. Change the default values of
dmc_firmware_path and vbt_firmware to empty strings ("").

Existing code that consumes these parameters already verifies both
pointer validity and string length, so empty strings are handled
correctly. Furthermore, heap allocation is not required here: these
debugfs parameters are created with strictly read-only permissions
(0400). As a result, the debugfs write operation is never invoked,
meaning the static empty string will not be erroneously freed by
kfree().

Fixes: e9913f0bd2e1 ("drm/i915/display: move dmc_firmware_path to display params")
Fixes: 29292bc6cc37 ("drm/i915/display: Move vbt_firmware module parameter under display")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index b95ecf728daa..0a8cad98d480 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -23,8 +23,8 @@ struct drm_printer;
  *       debugfs file
  */
 #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
-	param(char *, dmc_firmware_path, NULL, 0400) \
-	param(char *, vbt_firmware, NULL, 0400) \
+	param(char *, dmc_firmware_path, "", 0400) \
+	param(char *, vbt_firmware, "", 0400) \
 	param(int, lvds_channel_mode, 0, 0400) \
 	param(int, panel_use_ssc, -1, 0600) \
 	param(int, vbt_sdvo_panel_type, -1, 0400) \
-- 
2.43.0

