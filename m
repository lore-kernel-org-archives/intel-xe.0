Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5883606A327
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=B4+A7EAC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943D410EF27;
	Mon, 23 Nov 2026 15:18:10 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A41810E9A4
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 12:25:58 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-93f22a8515eso165113185a.2
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 04:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795263957; x=1795868757;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=V3cP60bp82hBpHH77pogbJL154XE0k6A+8yKLVtyUiY=;
 b=B4+A7EACuVRri/L2M5AdXC+cP9ARBukG5XwquRhadjtxdhJGdJ8BNJ3aFkFAbQW8yx
 ODABHN5m18t+qFvX4JyQyGSAB3JPm9U6YfZXSyNgs+Bo6ImfQEIAUU/fsC0eVp5LlsWd
 qXqSeykXsm6N45yffTn3GZ2MedjeAEuUyeAplLlD9LA1f5+kbI1pgdoJq7PqMG8J/owa
 gaMSedFnXPyhGOhD0VF0boUlTxDLPJhT4hoxVioYRMRsRB/KvuDKCMMvnET7w04yJclT
 AYXjTcQ/thc3c4G1EQcXcXn69IugtLcA0Kwd07wtZlN+FHuBZqj4tkcxNsCupmN4havw
 nOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795263957; x=1795868757;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V3cP60bp82hBpHH77pogbJL154XE0k6A+8yKLVtyUiY=;
 b=PDNcb5kC97G4Cx+YpWWVrHWUh15+WRr23QuWidFxXmV6u15ntdM111oM4/kaIwszbQ
 W68izOL+6E9hFtlQpTiV+RFjGD7Ub4oxt3KUbtRDgOcJne4nU6AVqUaHfqLbL+NQ9RRY
 dY4aQ28VaqukljIHH8JyECb8RbnHM539ADKYfbZ3vjGjA6jKNENozcDz2julruAIp21t
 og78buKxw6G1hT8ifGsnkUBoWS4gIsF31pGDxZ0t0NxJsPUt1PM/bGvtGXJiKv10khEh
 7oD3OZqqvgUzvLSZCYhgc157aYOWvEfx07A1cvXiJFibW/iaiGE2Lm48g9WydcXzSZxb
 +fuQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGW0Ed+U+cZbEJUZxRRwj7sxMqqDUt2X2X837/K1SXB9QR/Am6T1W13WBsOWUAV4nqvgOSOHz27PA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z86xEa203Y+XpBQCvhbx/Gyjzfc1w8kZ8zR2WHYacifzcd/5z66
 EKcqVqX8cyrFNBzYmuc61Tb2VLfhjgtBO+ad2D0B6Bn04dv046bpEk1VkD06s6mw33I=
X-Gm-Gg: AZFdTZeoRnr8ZQVpvl0oGxINqZZkqNHnFGevhcjlnK8cNWvV4lf2X4nKQQKyBYhGmIo
 Zswd/Faok9Ig/m4F+e3mll4QUpNm47D1B0fHulroKMJ2iWGSS7j5eQ+IXjpbzholM81DvLm1d3l
 RR2vnbZbxGDMsErlECPC2iAYeJ0gWoUuGlZrIjDek3svsWmJiRJSh8tNyr0icIcmgGyeOMiVWlx
 EW8cjWEgQU1UfbjSE3VyY1Kh16nqPAPNhFRgQdOV1sb0tWXYjEbpGk/WMY3QHCQu9AzcGMZ2xBo
 MEAbmhjE5eRrJ9m3ntJ9BEz2Q8BNS8ikIfQiPQ6d8oeKxecWdSMTsplS8d6RgvXJbiINmvJbVa5
 Rl+9LnDXCfHNpkS0MK2k2tBNIaumedVs7KfgromBslcj4ME9Db7p4S3FCaF/RAuz1Cd7Tx9MYdN
 bLOOwCS+M5HZXgGWFkRuJc+qxxhwkySAFEoeArInVjfCyRbB0z9pDruL1RnyK1M9WWzRTUP/Yss
 3EVCl1HCazc17IzMoEh4yFtyVb74Itnkexu5+oGi2/9SsgOrQatxte2Mc5IhCy9aYZPvNyg6+ZN
 lyljeqjm8r8KBZ30SfNkdSNHJL+KUft6dhk9ztv57U1qfwSCLGUD5mHLldr3d/l6//HEKmuGled
 eM85TWYHhVj2AlB0wpu/6TAqDRYuddISLId4F1uKgdhLap/0DFYDwjJUoSp8hZ3jAbayMKS2jY9
 MGLzrc9m5xdBxBpndTtIIURkVmmz4uxL0mqL2SA49NwhTy2U0FPtuaKud3jT3QDjCgkvmX9Z71m
 oJ7eiuE55kVICNnajQUBbwIuwtKOQ==
X-Received: by 2002:a05:620a:6602:b0:949:74d8:4706 with SMTP id
 af79cd13be357-949bab2a981mr952734985a.72.1795263957341; 
 Sat, 21 Nov 2026 04:25:57 -0800 (PST)
Received: from jake-laptop ([153.67.1.15]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb4004e8sm407029185a.33.2026.11.21.04.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 04:25:57 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v2 3/4] drm/i915/alpm: Leave AS SDP Transmission in Active
 Disable to PSR code
Date: Sat, 21 Nov 2026 07:25:49 -0500
Message-ID: <7b1c4022b174d3806130f5814142760a8693e340.1795263689.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795263689.git.j@metarealtyinc.ca>
References: <awCCGeCxHToY8tsI@intel.com>
 <cover.1795263689.git.j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:28 +0000
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PSR code now sets and clears PR_ALPM_CTL[AS SDP Transmission in Active
Disable] around frame updates. Stop setting it in
intel_alpm_configure_pr_as_sdp() and keep its current value instead, so
that a seamless VRR toggle no longer suspends the AS SDP while frames are
being updated.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 910067d27..6f2beb4a4 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -467,8 +467,12 @@ static void intel_alpm_configure_pr_as_sdp(struct intel_dp *intel_dp,
 	} else {
 		pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
 
-		if (crtc_state->disable_as_sdp_when_pr_active)
-			pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
+		/*
+		 * AS SDP Transmission in Active Disable follows frame updates
+		 * and is owned by PSR code, keep its current value.
+		 */
+		pr_alpm_ctl |= intel_de_read(display, PR_ALPM_CTL(display, cpu_transcoder)) &
+			PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
 
 		if (intel_display_power_dc3co_allowed(display))
 			pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
-- 
2.56.1

