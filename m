Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28864E7718F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 13:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E901310E8A3;
	Fri,  3 Jan 2025 13:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NsX4f+Uc";
	dkim-atps=neutral
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F037E10E8A5
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 13:06:09 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso10430854e87.3
 for <intel-xe@lists.freedesktop.org>; Fri, 03 Jan 2025 05:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735909508; x=1736514308; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OKAq3a0q8ySBqrMfqf9zRs6QOpHzCqi3UnYgQ6KB45c=;
 b=NsX4f+UcoJeUQdMLeuAAkL+wKqf0+PtVVnXdYCgNVMYC7wCQ0GSkomYREhkaoogPmA
 gqbLxiuID2dUkqYyCNiYavih6KTUSJiVjTv+Vf4irnd8dwOc6JVLYpE42hF9txAhwtVh
 L9pgT6O8DFXdptjwRVTRA0h3VXQmhvWbk7ITfBPalp+nqAznb1ZISCbS32fF3pZmSHF7
 Rgmt0fnCTvfNUeoX1Yh/HdV+vgbOww0wdodMeLVBITeUWPxrHqgwpgdYso12Hu+OG1W6
 H2M4x4BMchffWt/kERETNRmvr0yYQhDJR1e1RKoeP5WzOlOKx54/GfA+4ZIe+p5P4D0b
 tmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735909508; x=1736514308;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OKAq3a0q8ySBqrMfqf9zRs6QOpHzCqi3UnYgQ6KB45c=;
 b=NJcmK8Z7gMONyM6HnK0CxCp9LTrs0e5pEtz0fcnjiV9TYhiJ15CHkgByJ1skSVd7II
 /bWpOQBm6R+UfUfab8C3b8AxSLe6KiMe/3M6TIB1HgLfjwQi/3D+h6/qg4KpsZFxTSa9
 gcIPSUMvuB547VIFjcKv7XQGeaBismgTrdgZ1dfFFE7Lx8t+db+4wt3Kl1enPecd6Xcc
 sVvBxhCQHjTKjyHOfhiRjyCfmdiklA9HubCq1BpLOP9AKePWa52UZIgbJtfh9vTWxNxq
 xfaCGjktu+d/22i2v0YRShHu5i+qc2u3h9zjOxeN1AA+XUVCRb39fFI+vbxdfp7h225r
 9eNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh6JHUywqo7RmTYOF+mQRVBVJZNekaK5n26SiDK8fLtuNAn2OnH73zCOFUYjGETfr0w43Y2otz/A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzktVOiwYjElFAR47v3pw/8LQ4LCO3oO14ZPTLyFYi2bmc4NCFO
 2muKA4gXv8IcDNNGnMvw7EZNB4jlXisUcj3ovF8cip3rqq3NvLZ3ksBlyWSaUPj5fgGZpg5jbcf
 k
X-Gm-Gg: ASbGncusi5pUcVAGem5Ws9ck2P+ICxgOSj4qSqvQisAaycroCLh0l7SipOLqtEE08gS
 NfXviDTPC1RFxiuTjSTQENzJD8u7r3pXkNZJRGO93A+RaeY0LetkfPta6YIvmJHrsDAQG5WDGd5
 igACiMerQ/CL4aenW8SpvTaR4DVykh9wz1PPr9w1pFONj5UZomVFH9JvNWiiugxnMs3q22823wq
 n2p3JiMNae+ycLp23HrwCbSI3V35GtWCXHV5TC7SwON6y+lRZucPC0p
X-Google-Smtp-Source: AGHT+IHD8YK70XCWsS7Q8xW846WSlCt8IGnNQia/YfnRwEzKk1+3N50SwVA3xTK+T6w7X+CkkhvEfw==
X-Received: by 2002:adf:b30c:0:b0:38a:4b8b:1ba with SMTP id
 ffacd0b85a97d-38a4b8b01d1mr16138981f8f.14.1735909129150; 
 Fri, 03 Jan 2025 04:58:49 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 04:58:48 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:15 +0200
Subject: [PATCH v3 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4243; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=IAGUczkW072b8mGGChIWkavp4t+w24yTtaDV/z14qGY=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98AKCbN6HYV2+NFqGW7h5ppSXp32Xa6J/RTD
 a0btqWjPhuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAAAKCRAbX0TJAJUV
 VggyD/4r5JoRIbCRjEq+MPJyTb4GwkaPFIb5NyhhsBjJZXXCUuYCS09PW1MGmb4pKaO5I1vX+fW
 a+a3Vh8RMMU0dR7yFgi/LATU68/SniAxsC3OBbPDECwT6XdIusMV77aoFVKyipSJ9gflsiBUN7U
 huB+z6rK663s0CGIOVrFtCSTuuB+ibyRD2VHWDx8ZyPBAdM6yv15S6u7MrLCGvcRZfX2/jMeJl1
 3D70KtIzVXqXNy/CYN7H6DMWbu99oXMANZCHdYTQWGtxb6ODdhhXCl7n5iSUBSbX9gfX8/KEph+
 v/tENqZ7PBV49JJ8WSrn2J4HZUePGn4He0aRdoKFbsRU1GfAnrpxDwSqlC2FAl/wp/eCVcRN7ZI
 PFbEKVvndTc2HUkKxUVOw74s63TDSBInqXXqjBH2/oUKNz4uB/NywN1Hg5IL8WBWtLiBjJG1Cmb
 DdTSbvbSkS1sTEFE8H1SM5bGxv2RBEPUoKOlJiYarux3+clnIZrJLhOicKyhLCA0E9C96Q+93CW
 pVnYkyYFN/aI/d06XbqYzEaONTNjir8o1GVo7O4WCjmKEk1LCPoso7V9sJ77ZVwdI3wLcqrWS4o
 t2k0YpThtHc0CkG2sXGtKyZXmYUEgDS2aromcAXcu/wjaguuahZIYnGMNUkERlL4ZT3ZnIsBa8o
 ZSsvi4Ypj24qAAw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

According to the DisplayPort standard, LTTPRs have two operating
modes:
 - non-transparent - it replies to DPCD LTTPR field specific AUX
   requests, while passes through all other AUX requests
 - transparent - it passes through all AUX requests.

Switching between this two modes is done by the DPTX by issuing
an AUX write to the DPCD PHY_REPEATER_MODE register.

Add a generic helper that allows switching between these modes.

Also add a generic wrapper for the helper that handles the explicit
disabling of non-transparent mode and its disable->enable sequence
mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
to move this handling out of the vendor specific driver implementation
into the generic framework.

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 61 +++++++++++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..0f665d9adf02cfd16f0c250eb7ae8fe0461f8fdd 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2817,6 +2817,67 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
 }
 EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
 
+/**
+ * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable or disable transparent mode
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
+{
+	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
+			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
+	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
+
+	if (ret < 0)
+		return ret;
+
+	return (ret == 1) ? 0 : -EIO;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
+
+/**
+ * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
+ *
+ * @aux: DisplayPort AUX channel
+ * @lttpr_count: Number of LTTPRs. Between 0 and 8, according to DP standard.
+ *               Negative error code for any non-valid number.
+ *               See drm_dp_lttpr_count().
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
+{
+	int ret;
+
+	if (!lttpr_count)
+		return 0;
+
+	/*
+	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
+	 * non-transparent mode and the disable->enable non-transparent mode
+	 * sequence.
+	 */
+	ret = drm_dp_lttpr_set_transparent_mode(aux, true);
+	if (ret)
+		return ret;
+
+	if (lttpr_count < 0)
+		return -ENODEV;
+
+	/*
+	 * Roll-back to tranparent mode if setting non-tranparent mode failed
+	 */
+	if (drm_dp_lttpr_set_transparent_mode(aux, false)) {
+		drm_dp_lttpr_set_transparent_mode(aux, true);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_init);
+
 /**
  * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
  * @caps: LTTPR common capabilities
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8f4054a560396a43750570a8c2e95624039ab8ad..3311df3b58255cf0620391d0948ccf6b569a8a34 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -630,6 +630,8 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
 			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
 int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
+int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count);
 int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
 bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);

-- 
2.34.1

