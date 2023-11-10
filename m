Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29C8C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 14:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE0610E0C9;
	Fri, 10 Nov 2023 14:45:48 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F1110E0C5
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 14:45:45 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507962561adso3069525e87.0
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 06:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699627543; x=1700232343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4jaF0TzmJVBumej0nYWwaYSlrW84muOjaWsX60CSbs=;
 b=g+B38x/8M3x3XkbxUcZLUOOTF0KqKxcqFeYdOC5amS9vzMqRa1Eo7gy1dmF/es4N4O
 YkToucy5/fJL6k3H0zjB+OdZWJKGwYLVQ2m9keYkIV3eaqm70ONqPVRPoc3mOcAReuhU
 BXfXgeNjj4YwKl8cc90+QbUXuwhWJhI2YFEIiwyZ3I/e7Ep5bLJ+JgKNukt4XNiAerA9
 7OooFqgkVl7/16R6rEJYlqVpY8E0KnaPFftfXcXafRa6Gq+a1VlJo5clOliAYzrfDVoE
 0J1PdaTSEZjwYwNBNKon8ITN2jWJyScu11dELVbeZkRvt3hlIlrmxROx2byx/e2JHpHU
 Q9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699627543; x=1700232343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4jaF0TzmJVBumej0nYWwaYSlrW84muOjaWsX60CSbs=;
 b=kcUQwX1FikJp6swiUHH8lDVu+B2g2y+gDYMYaPoJWBXKxDQ4PbFKVVHKuRzSgP2ML3
 hZJdEOUbs2AiQXtMXG2mAE2XnExhWHF+VH+B8KwR+cD7pzxQvCHeuagWTAJJh3sVj//L
 +AQujTx9qLHaf3GTP4qVCbdNvwb78Gp2WtDqtOdr4EOlZmEtynmaX33MDniJdnlX5jlV
 sOXmlHp/hG/Bdj1HRyJgBvPdTzo+51n6Y9ql1hpc5erCHCVMwz9A2paCVLVhMUcNScJ6
 mQQuQnU53RSiIJg782iUXewmBIKm2rlXRu54F3DomBcFq9KsN4L1n7hdPQYnxrAYN4JN
 o5Ow==
X-Gm-Message-State: AOJu0YzOtQiBOnrQiv0MWTvGF4QuHrItJ/4EEfTA59pfTTSrrsMSKDYm
 JDhtkgKOCh6pgYDhVndy3DXgzRSKoh44LA==
X-Google-Smtp-Source: AGHT+IEPwf6MzrNXvdgEk/Q5l9nf/2hwol40B7zJAwTynM7Q8jnBbt6n5oF6Ujv7XOv/RZstXfgmGg==
X-Received: by 2002:ac2:44af:0:b0:509:4424:2e13 with SMTP id
 c15-20020ac244af000000b0050944242e13mr3979732lfm.65.1699627542901; 
 Fri, 10 Nov 2023 06:45:42 -0800 (PST)
Received: from jheikkil-mobl1.. ([2001:998:22:0:c7cb:24:1577:4029])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a195f55000000b005095614210dsm1441547lfj.241.2023.11.10.06.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 06:45:42 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 16:45:33 +0200
Message-Id: <20231110144536.76914-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110144536.76914-1-juhapekka.heikkila@gmail.com>
References: <20231110144536.76914-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 3/6] drm/i915/display: in skl_surf_address
 check for dpt-vma
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

touch dpt_vma->node only if dpt-vma is not NULL

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 4553dd6bfbbd..1ed9d5a6283e 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1010,7 +1010,8 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
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

