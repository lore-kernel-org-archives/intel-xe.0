Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA60C55179
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 13:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8D310E6B5;
	Mon,  3 Aug 2026 13:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.srl header.i=@kernel.srl header.b="jYflg1Y/";
	dkim-atps=neutral
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A56610E42E
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Aug 2026 17:06:55 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47fdd674e17so359092f8f.1
 for <intel-xe@lists.freedesktop.org>; Sun, 02 Aug 2026 10:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel.srl; s=google; t=1785690414; x=1786295214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lHAtSD2vdw7vGnmR70Y4vTxd424et6OwpRuM3OOoWnc=;
 b=jYflg1Y/f86FgDMvfTWPGiD5gyKizi08FxVB6GMrOF+19HlY9eqE2A1CPFHjfmpDTe
 UMF3a9l+8KGiz7TCWb9LeV1T94ofJktJu46FpXCza/ZqYpOg/QG1lIxz4iI628lCKSxU
 XOW5lNsWku1XPw4z/5FkT8iHYZEcAx1D/6RCZcSPv++LjQy7KRP4yhf9c2HFx2DSMuqL
 8idP3lzaibyU8I/iRpiBWldkJx8eiAGYm2kGsMM3FsIqevtl/kC+OblPjbe4h+4Uc8GU
 1GvJq+aUWm2W1gmXTAb2DHldOL4RSCdpcvtu4FMeJTvAq5rkVm8JIfv8g+3YUdYIJ+Ft
 u9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785690414; x=1786295214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lHAtSD2vdw7vGnmR70Y4vTxd424et6OwpRuM3OOoWnc=;
 b=me0boCFB8vR77PeK7uViJ02aPfhDoOlG7C9C1BMrYZTH+M40BC1dO/2mYmVrP6pGpK
 KTXAOkX3dQ2ibjuYS70GHyf7A3kp16Xm6Eqf//rb69ALvQj7XjIBMnEirAV2rr4nQRsu
 cEZjT4uPQemAh7w2fDl72UgC5rMub9e+ewq23qsdw3N/2bzIjmD5zj2FzL4ICGO0IaH4
 w+Ux1IEF1xWmkg6FGa0hGUml6sOBn6KFbcopQZ/3lGsC/mtHwjNRrNYizjHlk2ZgO6yo
 yRoJLLZslmMR11FOrNGDcMiptSQ+Ug+V+PKRI2HYXUwqr0Jg62vO6cWoU2iFxsfiWLGd
 J+Zw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqyxUqpfuhifGIimTapvIsvYh1MESHTFK0FVnPQZeQdjk5AlGn72fUaohbju4bgijgBot9T4VjD7A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRrXVwmDglw4jsU8yEyI0n7MlwWxsbU+RCpby01vc+BlALo9YQ
 5pFdxVM+gbSBEa8vBvyp3J5R6YjzN6mUGQYUE2tix7m0640j/+fuEBPR5errVi6aoJg=
X-Gm-Gg: AR+sD13C0ezQWJ8Fn+zV9aZw29WqtQfmW8/ygIiTEHnnyW/aK1Y0jX25bteM5NyBH59
 iJ6PmRzvpdDYq0/j1gRgfpGWLGbktV9OVmy22N8oZ/sW7zYinwmKP9wRDV+Ly+JZ51Yn3ffbcp2
 jb7nVAPO7Ic9uVObqBaViwv8IrEEYeoweEJ2cbHdlvBojHGRHXHBXDkqYUTNF516FPDTco4/qVf
 P5A7jQ/a2UHeoOhM9D2Bowm9HUEV+2l+nyNQvZO9Ls57W8+cWzf2kOc3DS+zOYooNVnP0jMyoJG
 iA3jhrwjGDgVIH5iz8E3Qb7g4MV0Y5HqwLY3JjOhl1KHqjhMky6GanEPbt+QCZJNx63dvsSXVga
 cTC+4rio6C92O+XgIVlYqPomrZQ5ZoVVSuaUrl1buI20IZvEDwu9v2tLK9SEzbsCDba9dgQ+E+1
 D9JAeMLpVSq7oHLE0oOWV2rKc48c7aiv3HA7jMLPxKZfuifRnrO1QGcY60Hq3wdvxlgt6yYj05d
 x9FbQV6qa9+W7WTxC0kcl7qEXuU32oZg3Hrpf2NWFktIfMNHxFgfFRxjvP6PP0xTC9RvlQIjXkb
 kGlGXg+uMgup2+cF9s9jEXdpNLRJfdVXjdvMuGLASgyBvrNiH6Nnnk2aFjbZT+Aj8eYaibMo8eb
 q28Zz2BTF+IlHeacgqIg0mTKJU6S6cPUkhlvyOVA41Or/SWEwBg==
X-Received: by 2002:a05:600d:8492:b0:496:c2fd:1731 with SMTP id
 5b1f17b1804b1-4980c64b96dmr102723465e9.1.1785690413324; 
 Sun, 02 Aug 2026 10:06:53 -0700 (PDT)
Received: from KITT.minareto (host-95-230-187-130.business.telecomitalia.it.
 [95.230.187.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b6745csm161687225e9.7.2026.08.02.10.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 10:06:52 -0700 (PDT)
From: Cristian La Spina <cristian.laspina@kernel.srl>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Cristian La Spina <cristian.laspina@kernel.srl>
Subject: [PATCH 0/2] drm: luminance range from DisplayID 2.0
Date: Sun,  2 Aug 2026 19:06:45 +0200
Message-ID: <20260802170647.206880-1-cristian.laspina@kernel.srl>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Aug 2026 13:11:38 +0000
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

The eDP panel in the Lenovo Yoga 9 2-in-1 14IPH11 declares its luminance
range only in the DisplayID 2.0 Display Parameters block, with no CTA
extension at all. The core ignores those fields, so i915 refuses the
Intel HDR backlight interface and falls back to PWM, which drives
nothing on this OLED panel: brightness cannot be changed at all.

Patch 1 reads the range in the core, patch 2 lets i915 use it whatever
its source. Patch 2 depends on patch 1, so the series should go through
one tree.

Based on drm-misc-next.

Cristian La Spina (2):
  drm/edid: read the luminance range from DisplayID 2.0
  drm/i915/display: accept a luminance range from any source

 drivers/gpu/drm/drm_edid.c                    | 47 +++++++++++++++++++
 .../drm/i915/display/intel_dp_aux_backlight.c | 17 ++++---
 include/drm/drm_connector.h                   |  3 +-
 3 files changed, 57 insertions(+), 10 deletions(-)

-- 
2.52.0

