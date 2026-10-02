Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F84CA5FE8
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 20:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F1410E6CC;
	Fri,  2 Oct 2026 20:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.b="j43R8RGX";
	dkim-atps=neutral
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com
 [74.125.229.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2566110E6A2
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 19:40:36 +0000 (UTC)
Received: by mail-dl2-f42.google.com with SMTP id
 a92af1059eb24-144f47a9b57so7822099c88.2
 for <intel-xe@lists.freedesktop.org>; Fri, 02 Oct 2026 12:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1790970035; x=1791574835;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/6OS7kHnRAUFDH89g48qhMuuszS5BgPSQDnnJTJS0d4=;
 b=j43R8RGXPCtuTLg6uZoXrx4LmV5X6J07MtjEEy1sGQOz+lVd98U8GzXzKXrQhSgE2N
 5zbGJSPZOj8TGyhrtxJ6lb0bkRorXxOI1W6P2FKO8jBGFy3dDKu3qJtWoIAAwl7Qtdb5
 bJGYsZfNXOVrc8rdt9gx61Jgum04mBdQdlwYT7HYhJLKR3XUwUp8gidBTXLEwAQJjaFU
 sLnp8vKtyariFTaNrPF+1O6BxN3tt0Y5BtuS134wJbAgx+DeGk7vAqCdDvBDwu41eb8L
 zXA/W70FaLKP0+E56PgWEhJSsfNMqgbk+LGsDw2E1Nr/s/PADQov4KOsT6HapvQKN645
 uycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790970035; x=1791574835;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/6OS7kHnRAUFDH89g48qhMuuszS5BgPSQDnnJTJS0d4=;
 b=ypWRmKDMhRE4OSH0FCnanNUS7oNAvVelzQqYJiAI/Eb+xMiumia+hOV7GHFxDrV/dA
 FSnkS0/L9qrn1TPCN59SdqI1C+7FjserEGj1LybWDfSg8HgM/VttaOflV93BwcAaLfbL
 JrunT9EGwxzCqwzqzTQ/8PNE2LzDs6W0tZH8nTovXVlfiUvYnu9itw9fgpFgGhI1pJ7s
 USvWbU9G0Qfo1wgmhm006vK/n8eSkK44mA5h5UtM0Zb0tDVxQ1SOGn6rKt+6VQT33CpV
 0uqkIPBU96PB6Ku4POcm71Xh6D0d+YzbpAB9sP/64TlOWkLXZpoXraEmafWTWfQMVJeO
 9yMg==
X-Forwarded-Encrypted: i=1;
 AKwUvByqlX79bdf88z6yd/pea4bkv+KFsAunaboxTYPUw6ZocqDlq0mghNZwq+oK2J48ftOnrem4jPNagA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kcByj7PgVr5PERq97sbttQ2VZBPsNyMm0yGyMKkJ6IwmrKPTUA
 mKNviY2Cs4MxQhRhzI3KsNoEbIku3m1aTQQZCd9JqPTaojAfzPWB2K3FyBSouTknNlg=
X-Gm-Gg: AYBFou11HHebNRON8bsM6yC90pldR0E+EqucYRvwZlhGX4csArWeS6ZnI9NC+DjXaFC
 XVvlb1oTeJAgOeZltWb1yGtkBr2V48HqNrMuPHcJeupVaezNruEPIxShvgCnZSGxhxOIL3PukNq
 Wm061/xwYVwnptHoW+b4Ki/zZfowiD+v5Tcqww2k//FovbNXM4B2rmyQZ7fQJiSiVQBiazRVFeg
 H3GcuPwHTK8ZhSAK8NP8IAvtH1PZCzvkh7horBiHdbA1Ql0LhROJS+yUcsHiNXaayvXHXaH6xaR
 AxsQUSXaJWf0+bNTSPVO+3/wKKEUTi1Y130wuhyNSaLo95vF0eFWDTjb/jFdGzeFi6k8f4K6Cb/
 AEY8PU2bICzddO2ilaPv9x9VvJGIa3isrdJs2dOi5Wes823XDNXuOdDyXwpmpFWi6c7sd/sFXhP
 RvLyxI9sAkLZaoRJFaSCBp8jnnN40KqOWXxYdug62OVzjOe0z+9f6+YcC1nERt56r32sTVA2WCe
 F/VUNucO7dSdOtgGMt50ADCFc4YrW18rJAYNB45S88/h1Urc5Ebs6yR0U/sC01HegPFRd3gDv2j
 rY5iEA==
X-Received: by 2002:a05:701b:2610:b0:147:a685:9125 with SMTP id
 a92af1059eb24-14f58fd2a97mr3391373c88.2.1790970035055; 
 Fri, 02 Oct 2026 12:40:35 -0700 (PDT)
Received: from localhost.localdomain
 ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14f47a57592sm7450113c88.17.2026.10.02.12.40.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 02 Oct 2026 12:40:34 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org
Subject: [PATCH 6.1.y 0/2] drm/i915/hdcp: guard both capability checks
Date: Fri,  2 Oct 2026 15:40:25 -0400
Message-ID: <20261002194030.20489-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Oct 2026 20:44:45 +0000
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

Hi Greg, Sasha, and i915 maintainers,

Patch 1 alone is not enough on 6.1.y: intel_hdcp_info() calls
intel_hdcp_capable() and then intel_hdcp2_capable(), so the debugfs NULL
dereference moves to the second call. Patch 2 is the companion fix that
path needs, a backport of upstream commit d34f4f058edf ("drm/i915/hdcp:
Add encoder check in hdcp2_get_capability") with the guard in the common
intel_hdcp2_capable() helper, where 6.1.y still does the lookup. This
mirrors the 2-patch series picked up for 6.6.y, and both fixes are
already present in 6.12.y, 6.18.y, and 7.2.y. Could you please queue both
patches for 6.1.y?

AI assistance: An LLM helped adapt and validate both patches; I reviewed
the resulting code and validation evidence.

Thanks,
Artem Dinaburg

Series:
  1. drm/i915/hdcp: Add encoder check in intel_hdcp_get_capability
  2. drm/i915/hdcp: Add encoder check in hdcp2_get_capability
