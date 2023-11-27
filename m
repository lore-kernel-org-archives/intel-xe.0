Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F680C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6230A10E3F1;
	Mon, 27 Nov 2023 19:09:55 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0C610E3F1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:09:52 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507a5f2193bso4660688e87.1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 11:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701112190; x=1701716990; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xgd5079K3NaxLb2oMzj1ZpGT71pzRbKRSQxxwSca1rM=;
 b=iSIdJc1SQAATR7mmpmjHMtfHMLr8uVg6kK5Wd3Ic8494wgkrhdm2ZjP7hsFik0kJZE
 Evs8JvGo/7kZNVDv94Ibr6YurKK8Hk/F+36xKVZScfwVv4Rhpme7MYS0v51mccg9aaw3
 mbliNs9fZlM9nivAZHjDeid0gx8r9UxhKZOW+VHnmb2MrDhIX7WWj0i7RQP65SnwVv8t
 Wf6t/O9dq0pvSTtVyAv5U8OhZlhovQSHdZZjstUKiMw9blQAvS5Q1SBTSEDcVQTjsEqa
 4LCDIM5CZ4r3S2fqsBsWKVTH7rLpR2f7xLel4Az/tjyYx29ErTCsacmLZjZcT2iLAqc0
 b16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701112190; x=1701716990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xgd5079K3NaxLb2oMzj1ZpGT71pzRbKRSQxxwSca1rM=;
 b=FVVBt3RrkKk+ET0dtH95b9mAFSVc7qWtt5jxWIRwxErsnqv5xczIgSfKYXGU806Kpb
 3TcNk5jSsO23XqDehf3CA0kndgBcohOWp3A/Fm607lxqvdXL1tP7+v6QnsNsCzkod8OG
 ke8eGGFdUXY6SwrAV+EuosCRELc5wLjsXS/6dCP4K+Bvsm0d34ZdxAfyoEd7YlIC4V6K
 o3y9YkL/6yX0BAXUvD6AUXV6r+gjgfAK2ZB0YI3+UwQmZLL47mmhLk+SsX6SD3MSGz11
 vmIQzVZ3KLgIGACYwwV615K2PzG9gp4BB7pKTGcmFn6gFTZmZrpkPLIBxdJbptlBxM0l
 mZNw==
X-Gm-Message-State: AOJu0Yx9w8ieQzJYF4Ewocp0TEA8j622EI+EAjx6HNhUq7yMG3vQOAZ6
 gYHOi6UYensfZRgNwK3N4EFF4kMTITL8t82K
X-Google-Smtp-Source: AGHT+IFWX4QWn/pXaDG39yUE22RVTMT7+6sYYf07a/V6CcjX4SFQ2XtESaMdgfc3c0gtWxEcRsepGw==
X-Received: by 2002:a05:6512:401f:b0:4fe:8ba8:1a8b with SMTP id
 br31-20020a056512401f00b004fe8ba81a8bmr4973734lfb.7.1701112190087; 
 Mon, 27 Nov 2023 11:09:50 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 eo27-20020a056512481b00b00507a0098424sm1573810lfb.109.2023.11.27.11.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 11:09:49 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 21:09:34 +0200
Message-Id: <20231127190935.3150610-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
References: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/i915/display: in skl_surf_address check
 for dpt-vma
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

touch dpt_vma->node only if dpt-vma is not NULL

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231116150225.204233-2-juhapekka.heikkila@gmail.com
(cherry picked from commit 185b24883e278ba298c073164d1e1abacc986d9f)
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index a4c0a7a3523f..ae6bad4407eb 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1006,7 +1006,8 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * The DPT object contains only one vma, so the VMA's offset
 		 * within the DPT is always 0.
 		 */
-		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
+		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
+			    plane_state->dpt_vma->node.start);
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
-- 
2.25.1

