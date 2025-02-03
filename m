Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76EEC02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 10:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A376F10E47A;
	Mon,  3 Feb 2025 10:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kze+GGRy";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E08110E47A
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 10:58:21 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso32468015e9.0
 for <intel-xe@lists.freedesktop.org>; Mon, 03 Feb 2025 02:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738580299; x=1739185099; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XLcAmb5imXFvDRB/VGg4Mua1A1e4qvmBbsZyq6NVDp0=;
 b=Kze+GGRyITDqHixRawr+JeZ5csPm8PcxEGXIAryfXgc8GwsztkwiCTg68CWWOu556B
 d/s/GvG+YAiCZIS2fBCs/zknvsqMvWAxRKlQ5cbVSsolANZufPxGd3VxC4hY//6Kifj/
 Bk0v4azSzEsLovW4K//IuHNegfJvJjUkX0AFgx/hDcd9Y38zwFSAkMQZSV3HUCHYhyhD
 gjRwL9IsQt1EIqskF9v7X7Mn2UIhTKkExICAtndXjbyrkHznCs8+lQc+vmbldBtXcdKE
 2Nio7PySReDwz2IpXe2hjMx/CEwloe6I5gHhfLcMJi/LV4GVzWNyCME4a4Tcefqk0bDz
 UUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738580299; x=1739185099;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XLcAmb5imXFvDRB/VGg4Mua1A1e4qvmBbsZyq6NVDp0=;
 b=LbwdRGtieyScQA7ChcxCug2JUORdR24154QGsL37T72iZC6wNc454QZgfX7yz1Eb91
 if1WBq7RCRfzo5kxbyGettArE2aEBAahbiJj+5Sds7AEoQgZ7PZk5EnNxMRzcM0F6vff
 nLZ1WJUbkFYtsfDgNnJyLQfsiMTNqRFtQoyx+BNN40HLKPWZQh7a6XLTt6MEGMtGB3XD
 B1eX9ibuzY7ulqZVre1sTPIJ4KiZj3WCDcll+ny4+ep4CjQXBFs8OUzqqZ0bV/QnPmpC
 ihzGEdOfyxGD3z8GQQvZy5uagD05q4n7ZygJMbCnZBayMJu6mWSLh8NoumHlU/8l8o8h
 KxUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXqgmzZoYEQ4eihxLpz0gR2XjKcYYLLdc96j9uO0EW7+W4s/+KFF0iBSLac8T56tvN9UHJgF6DZA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya8jULw8rzUeTwBpZO+Y4aAcCwj9Uw9nkLZNcOgKAxVO7F7w7R
 GUf6fgiPuR5h3bXo4IKX3htXNdXqoyJALWX49V0VZyXoPixZU/A2LLtrAsKU40I=
X-Gm-Gg: ASbGncvqYOeR/hd3R1L/9l37uER6mwSjD4oLEjH0s2RbxJk/wmNNmbfEj5y9iu9j8rz
 P7IgkzZHveFEhfDtRv0a8YzhP4s5yaM9SQ+9hzcYfU8q3UtWOoAyL0WzM/mXpTdPUK2DZiKffMT
 soK0iLNaoxmS5ugm7KumC08uw7vXpz/CajPMiy0L9ra9tA8LTdViYyTOmJKLrE3PLbH1KFRYAT7
 FfnJts57/OSOQCZkd02I+D9pi/+XNSm99OqHFpH7ACz8F6AsO5YUWPsu7sqsG+75BY0fVMeamQy
 bH//4CxpJlKGRMg=
X-Google-Smtp-Source: AGHT+IHhr4klxCQY7Z9qoAXLzjjnoKLjWUAup4X7mSLv7b1sKOjwEc0f9wj6fXBkEb7M9qj8+FK/oA==
X-Received: by 2002:adf:ea90:0:b0:385:fa30:4f87 with SMTP id
 ffacd0b85a97d-38c5a86e2acmr11625798f8f.0.1738580299369; 
 Mon, 03 Feb 2025 02:58:19 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c13a0efsm12555083f8f.60.2025.02.03.02.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 02:58:18 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v5 0/4] drm/dp: Rework LTTPR transparent mode handling and
 add support to msm driver
Date: Mon, 03 Feb 2025 12:57:55 +0200
Message-Id: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADOhoGcC/53Oy2rDMBCF4VcJWneKrrbUVd+jZKHLKBHElpGEa
 Qh+9yqB0pas3OWZxffPjVQsCSt5O9xIwTXVlOc+1MuB+LOdTwgp9E045ZJRwSCUCcICU53AhgC
 X1pYCrdi5Lrbg3GDKAaFiAyYGH5SLAelIurcUjOnz0fo49n1OteVyfaRXdr/+p7IyoOBtdM5op
 aKk75c025JfczmRe2blPzRnu2je6aAMHTAI7bh+osU3rWh/ew8tOq28GMYoHR0H8UTL37TeQ8t
 OG6aNNM5zFPYPvW3bF+HbYEf0AQAA
X-Change-ID: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07
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
 Johan Hovold <johan+linaro@kernel.org>, Imre Deak <imre.deak@intel.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4677; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=cYlnnHTHnfX5A4NpE+h+NMGvTQWwaK7jU/pGGIU9lZs=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnoKE/zDksHClkVHYccPshbzGhJ7fQegd+I76Dq
 r6Yy+puSEWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6ChPwAKCRAbX0TJAJUV
 VuBlD/9R3tniupZZRrrer07wVKnvqgs/DdiuT5gbx9NQtLkOQN54JRBFuse+PIyT0brughjVUES
 lg+urfITYCZbkfpJbY7AGnIABKvI/AeQWMDEwQYPNoAZuTlr29AQ6wlv75z2h+jcvHUGwjYQrfN
 XFWQW+ihQY97nLaWgs5SRuduxxNY3cH/QszKlbdsRZDHDfrYhnQpbRYyQQZbksfMtTM/TmBvZ9u
 wJi+LAtZ2tZM7GRTF3bivkLgjs+xMT2YiPu0ID9joTDTOyxCbHQ4DNza8FWEgsb5FOCKjjEYFEZ
 i/uJU9RJsxq48wMUMtr3LWkoIwwb+GVPuecGlrUZfG1MLDPCv9kLx5rlDKBpbzT/EsOdDODP+Rw
 ize5zfxK7CeIc3VcVDjiAvs+2yopgTRPI3XwV0CSWnkTeFoYEKUwFXMe4ksg5MZCabigdq7yW12
 hBYI5XYzywPC7qUzqo/M3sZ3bLVRprdYMWT7LbJ8iaBo8EkCWmALJSjNYukPRgoyE3k1Tlzy/NP
 td35ZlzWBHvrYW9bMWzYjSrMlrmON+LjZ048uYmcV7YZgwn1SZuuMvFLHKNt1wSg8ufHv685KDd
 vosvx3m1JZCrgOgXBd2CnNYOQ4JOw+qx8O6LKqwWAMoleQQtjMLDGPdkcg6HbH998ZpH2fGP4o4
 p9kEREBVeZGFyyw==
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

Looking at both i915 and nouveau DP drivers, both are setting the first
LTTPR (if found) in transparent mode first and then in non-transparent
mode, just like the DP v2.0 specification mentions in section 3.6.6.1.

Being part of the standard, setting the LTTPR in a specific operation mode
can be easily moved in the generic framework. So do that by adding a new
helper.

Then, the msm DP driver is lacking any kind of support for LTTPR handling,
so add it by reading the LTTPR caps for figuring out the number of LTTPRs
found on plug detect and then do exactly what the i915 and nouveau drivers
do with respect to toggling through operating modes, just like the
up-mentioned section from DP spec describes.

At some point, link training per sub-segment will probably be needed, but
for now, toggling the operating modes seems to be enough at least for the
X Elite-based platforms that this patchset has been tested on.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v5:
- Added kernel-doc () suffix and semicolon after "Return" for
  drm_dp_lttpr_set_transparent_mode, and dropped the extra blank
  line from kernel-doc of drm_dp_lttpr_init, like Bjorn suggested
- Picked up Abhinav's R-b tag.
- Moved the lttpr_caps on stack, as suggested by Bjorn and Abhinav in
  the msm implementation.
- Moved the msm_dp_display_lttpr_init call after msm_dp_panel_read_sink_caps,
  as Abhinav suggested.
- Link to v4: https://lore.kernel.org/r/20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org

Changes in v4:
- Picked up Dmitry's and Johan's R-b tags for the drm generic and drm
  msm patches.
- Moved the comment about the roll-back to transparent mode inside the
  if statement and fixed the typos, like Johan suggested.
- Added more details in the commit message for the i915 changes. Details
  about the update that the lttpr_common_caps need w.r.t. rollback to
  transparent mode in case of failure.
- Link to v3: https://lore.kernel.org/r/20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org

Changes in v3:
- Picked-up T-b tag from Johan for the drm/dp transparent mode set helper
  patch
- Re-worked the return value of the drm/dp transparet mode set helper
- Added some more details about what the values of the lttpr_count arg
  is expected to be for the drm_dp_lttpr_init(), like Johan suggested.
- Re-worked the non-transparent mode disable->enable so that the rollback
  doesn't happen unless enable failed.
- Picked-up Lyude's R-b tag for the nouveau patch.
- Dropped extra parantesis at the end of the drm_dp_lttpr_init() call in
  i915 patch.
- Picked-up Johan's T-b tag for the drm/msm/dp patch.
- Added some error handling and an error message in the
  msm_dp_display_lttpr_init(), while dropping the unnecessary lttpr_count
  local variable.
- Link to v2: https://lore.kernel.org/r/20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org

Changes in v2:
- Added new wrapper over the set_transparent new helper in order to
  move the non-transparent disable and the its enable->disable sequence
  mentioned in the DP standard section 3.6.6.1 entirely in the generic
  implemetation.
- Switch all 3 drivers to use the new wrapper.
- Fixed the return value of the helper to return 0 on success and
  negative value on error.
- Added explanation about the transparent/non-transparent modes into the
  msm dp commit message.
- Dropped the condition for non-eDP in msm DP driver since it is allowed
  to try to get the number of LTTPRs even on eDP and it will be always
  0 anyway.
- Dropped the RFC prefix
- Link to v1: https://lore.kernel.org/r/20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org

---
Abel Vesa (4):
      drm/dp: Add helper to set LTTPRs in transparent mode
      drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
      drm/i915/dp: Use the generic helper to control LTTPR transparent mode
      drm/msm/dp: Add support for LTTPR handling

 drivers/gpu/drm/display/drm_dp_helper.c            | 61 ++++++++++++++++++++++
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 ++-------
 drivers/gpu/drm/msm/dp/dp_display.c                | 15 ++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c               | 17 +-----
 include/drm/display/drm_dp_helper.h                |  2 +
 5 files changed, 85 insertions(+), 34 deletions(-)
---
base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

