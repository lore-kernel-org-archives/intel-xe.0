Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351DD606A321
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vVINHjUc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AB111229F;
	Thu, 29 Oct 2026 13:14:27 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0667C1120F7
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 09:09:45 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3ae1d0caaedso919529a91.2
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 02:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793264984; x=1793869784; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xUj6TVOjgwc5QvLbDmyVtO9DIkzDrZhSpW5tg4WgAh8=;
 b=vVINHjUc8CfCj+3bXO3bG/jl+0GWDNQ/xg2c7uj9tiXmjyKPy5gQJasB4czRLCl0OD
 Jm3rn10/67LLh0K+3Yp5xI5Ub87rPWSEfihprGeXmKruo0PH9HhgSDKxq/zdJC0q51vY
 7DcukbYM0IaWHyHa96maKnlN97Km+Xn1YNHkmI6UZTUEjJDgdnnyipU6ksPSflU/2Yj+
 6ueAxZZcpUghqNwcFTWXyA8AzWead23hCV2EvhPblBR7l+DhwYH+prbUWUN/onaXhcbb
 Uh7saLynHrTOYFe0T5QsVNvaQtTEqTLG4ywtrmIi0UV5LAUtqRbKGQ2tg6isV2eykT5o
 uHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793264984; x=1793869784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xUj6TVOjgwc5QvLbDmyVtO9DIkzDrZhSpW5tg4WgAh8=;
 b=QKjxzMGbvmOrM/AeEh4Xnybnv0LIdCKmaCX4lVbO6aUeZ1gtTh6Z3Jg0ETPZYkGji/
 n8/frhLv2CZ5pCK88hzqSFwROoTQHn0uq9uZSoFiUG3fvBJPti/Q7ZH7QEaKQQqSkU/w
 vF0qq8jwAtGvKbLho6iA0asO5ZL+t7i9f+k0jjeJ/zXvfF61MvkkkuUE4V4XnteETkBs
 BVMhd1PaHiIs82pafPfudwQfjePbD+GstmVgowGCEcGMq+RsNivTJqWMzivjisk+I82D
 JqJWauqJpt5i4GIug7FqKokizUp9DLcQ5yrKpqSR1+NWc4cVNav1B8jlhX4b1zA0oBad
 B/Mg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzK2B7lgZ/0meeK/rGxQxqV6276lIXBiV5JggxgiGlEIMpT0hgJDvnUN6KMbubN1nwYcg1SIB4jEg==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIigHxpy7nHIpjy2OfNZfs8Pu1D0x5wS8PJKmswKq+vpaoJS6k0
 qBrETB+KCc6y58ZAtOZoePEkSqM0jt3WZ4rCZGwzF5Wvd4r7QiK/x7g=
X-Gm-Gg: AYBFou09MDP3Pk4xMsejjf4DC/i87gE+SrG12KptEx/FmJWjiG7EwVNWvyrGxYUfcNA
 IsuZqLvoB8AFJaxyrmlb6XJZWcn5+YS4VMS45b8rwcQKWENPw/CdhLHMz5DeEG9lGcZ3Z5gIYbx
 oCYM1uahC8T0zMvY5yMuh2nhSTkJNAxmNob9hB8PMpEL8+eTN5THQWzImg/QfE4mm6uHbCVAHDT
 IO6Fy5GhXvRVIzDi+XYWr+kb3drviAPCCfQyy4c3bP2AoRR4lT24jtCGhdr30Ww5OsoYAgt410r
 s8wTAHXJBhpodHxW8oQd/02n9gxMbY+N5YjaC7pHVdQpwsEnZ5egvGcf3Xv1pJh7mmsGQbChO97
 li4AYw+7qW1IiOpj8aj16Cfb8n3ESAsX/D65iisXquOiIvRCOa3RaAHyGUNeoggpi4pD+XEh27P
 JQK5mPJlYElVlXYB2omMeBC9GFMoz6V5K7YOZoE4xlnxlyEs7hFOVrGAk98EA7Xg+6cSGl04hyU
 FW6L7rsg1K4yUfor+qcWEr44vPQsMvHliT11/fRGled1Cs87qV+Qb0zl24hp5FZYqwFn3VVKnqF
 FXL5agzZziluQ9c08EMYQwXDea44TMuf9zkFtyOVrQpE+DAl9fQg0xYJ/ThlAA==
X-Received: by 2002:a17:90b:5908:b0:3a6:fc30:ce16 with SMTP id
 98e67ed59e1d1-3ae581e1948mr3437116a91.51.1793264984432; 
 Thu, 29 Oct 2026 02:09:44 -0700 (PDT)
Received: from deepin-PC ([2409:8a4d:d28:eeb4:5bcd:9360:26aa:4f88])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae6e9db612sm3484362a91.17.2026.10.29.02.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 02:09:43 -0700 (PDT)
From: liuwenhuan <liuwenhuan@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, Wenhuan Liu <liuwenhuan@gmail.com>,
 stable@vger.kernel.org, Suraj Kandpal <suraj.kandpal@intel.com>,
 Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH] drm/i915/display: Add DPCD backlight quirk for ASUS GU605CW
Date: Thu, 29 Oct 2026 17:09:27 +0800
Message-ID: <20261029090927.2318434-1-liuwenhuan@gmail.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2026 13:14:13 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wenhuan Liu <liuwenhuan@gmail.com>

The Samsung ATNA60DL01 OLED panel of the ASUS ROG Zephyrus G16 GU605CW
(Arrow Lake, 8086:7d51, subsystem 1043:3778) has no PWM brightness
input: its DP_EDP_BACKLIGHT_ADJUSTMENT_CAP (DPCD 0x702) is 0x86, i.e. no
PWM pin brightness, no AUX x PWM product mode and no PWM frequency
pass-through, but brightness over AUX. The VBT still says
INTEL_BACKLIGHT_DISPLAY_DDI, so with the default enable_dpcd_backlight
only the Intel interface is probed. It is not used because the panel has
no HDR static metadata, and i915 falls back to the PWM, which the panel
ignores: writes to intel_backlight change nothing on screen.

With enable_dpcd_backlight=2 the VESA interface is used and the
backlight works. Apply the VESA fallback by default with the quirk added
for the TUXEDO devices. The entry matches the sink OUI and device ID of
the panel ("60DL01"), so other panels in this model are not affected.

Tested on the GU605CW with 7.2.11 and a change that sets the same
try_intel_interface/try_vesa_interface flags for this panel: without any
i915 option the VESA interface is selected, the brightness registers
(0x721..0x723) match the enable_dpcd_backlight=2 case, the whole range
works, the lowest step is not black, and brightness survives S4 resume
and an NVIDIA MUX round trip.

Fixes: f30fddb44023 ("Revert "drm/i915/backlight: Remove try_vesa_interface"")
Cc: stable@vger.kernel.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Wenhuan Liu <liuwenhuan@gmail.com>
---
Based on drm-tip 9daba28e785e. Depends on 9499c3fca1c7 ("drm/i915/display:
Add quirk to force backlight type on some TUXEDO devices"), which adds
QUIRK_ENABLE_DPCD_BACKLIGHT.

 drivers/gpu/drm/i915/display/intel_quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 96eb9a4..0d44d31 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -313,6 +313,15 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
 		.sink_oui = SINK_OUI(0x38, 0xec, 0x11),
 		.hook = quirk_enable_dpcd_backlight,
 	},
+	/* ASUS ROG Zephyrus G16 GU605CW, Samsung ATNA60DL01 OLED */
+	{
+		.device = 0x7d51,
+		.subsystem_vendor = 0x1043,
+		.subsystem_device = 0x3778,
+		.sink_oui = SINK_OUI(0xba, 0x41, 0x59),
+		.sink_device_id = SINK_DEVICE_ID('6', '0', 'D', 'L', '0', '1'),
+		.hook = quirk_enable_dpcd_backlight,
+	},
 };
 
 void intel_init_quirks(struct intel_display *display)
-- 
2.47.3

