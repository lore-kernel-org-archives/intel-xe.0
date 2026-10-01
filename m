Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBD5CA5FE7
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 20:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF41F10E6C2;
	Fri,  2 Oct 2026 20:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I/atsHNg";
	dkim-atps=neutral
Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com
 [74.125.230.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138A910E3D0
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 19:30:11 +0000 (UTC)
Received: by mail-qv2-f42.google.com with SMTP id
 6a1803df08f44-917bcc8705fso3681616d6.2
 for <intel-xe@lists.freedesktop.org>; Thu, 01 Oct 2026 12:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790883010; cv=none;
 d=google.com; s=arc-20260327;
 b=Pv2M26x9eIqwPUSHrx1uZLlsWb7H4AdCl/5VP5PXj/ojv2B+tkFz7kgGmVgiSmFtJs
 STvxRoyU3o7yqTe+Y0SwrSChknoLu9xfA+zPfNlwts8WXerMl8Mmx+EDJTDd2+ze0RGv
 ktU5mNtw40E60Guo26CMe3IkrE2u8fIq8oIbYO+W0FMlPcLL/OEbDUpr4cacOpw9c82s
 nYQl2Ytq4Kd6hzaC/t1XPJALISmPh7xpL623fuoCu6fK9rKNYhTWeOvWK12TVT7+tiMK
 W9jGzDMTOw4mctH2Y0+4u+4fL1hM2lp/YfvBNYcHHA1qBnSI3o/9qL83Fy/4cSVb0sPR
 Lysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bE/ZpayYaMuQJ2cjUw/XMionGOYmv8DuAlly9njYYE8=;
 fh=hX10jCNvNgbrsgdo4IvBMsKfGnBMnmsK/XVbDLL+D1Y=;
 b=QSXxqrvNtNi97jHGbzTsSeT/67YDW+a0XBUvaAUGWfrDPh+mm/eV7WAyhTuAjt4ibZ
 97Z+31tgbRsYlsmh4zoj37gtf7ylKDsGTqMociUxXGK7T/xKeylOQD6E2le4Cpo59x3r
 LK6t8lXdOQLKw+2Cb45UfGDEDh0//N7Ei+5QO9yKTukdh/Di43uqTQDiixouT5gPW5cp
 Jn7MMoPb5wnME1jxg/l4/eRi2uelx9Nabg2Rvd1MVKr26uyuSFIUcmVuEHpttLeTGoGc
 fh1H+i43kdBitLX/EsGeovFR6UkoHFX9tTiBZwfXTdy4lt0WiYk/X6k2sGfTg1RZyUn7
 7WyQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790883010; x=1791487810; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bE/ZpayYaMuQJ2cjUw/XMionGOYmv8DuAlly9njYYE8=;
 b=I/atsHNg+8htBTg+w5pzrDB4AzXTGsXqw0YYMs+N9hzdUXwCXTKyBE/wU3Wml9Gwp5
 Idm7Jm+T5ZaYkjRkUHF59Avb5bj8gvj4m7GcE1uaZjJCN67u0KAQVWc1IPGPrFrkcO8R
 J8gM2MntBM/BFVXkK9zpHmvjXliRL0dj5TWmMY22/H4mnbZJp/Dv/uW3DGBQlYvIJQ0O
 jzS6e8lUemCD3vYDRUVg21SugqWhiP93x2NDvNoyyTnj5D93pJeHMW0oOqThn44f1rNJ
 VHuqBi8j+yxqiLbtx3ArUlYdDpDPtdZerOukcv8I4ogNmpJ63Y2uWNOdLUf/JwTGL8qW
 +spQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790883010; x=1791487810;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bE/ZpayYaMuQJ2cjUw/XMionGOYmv8DuAlly9njYYE8=;
 b=zZcEmLlQmy/mPncz7Ia4ArqZ4VmutLhqMZyDA9H/1XHZnv7UqSPNiDuZ8DdCHrnh0o
 F6Nq2TyQdwmMO8GJY29zHGKoIpMWa6oYLog/DYx/js8go1QJqt77ewg7AGflSgSf8gkF
 ihegA0skGB9lSLAeHv7GUKK74WzEIECuFvqRbdZIGcGPhIFWd4k7gr+OixoemIXhCEVv
 8x8N2FxDgume50Br5WmiPnL5kP8kL3GRkWegt95s53p2LHXQugvyQfMGGdQ1giT+rdRn
 Gd2j9CSkgoXO2C3QZDUFsbhrUjL+x9HP57qfa42XK/5gbuLgJZew8bvPJeMIz+8lIZ5Y
 rugA==
X-Forwarded-Encrypted: i=1;
 AKwUvBybanWFqZcXjmz+L7emfo8RfOD2533b6ajYqb5rSq/kMvIF+lhcCqpBSWNx5a06L3TcGF8lPPfFBw==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIkmQP03EvaPiHHfsBxNutIOF2pzJlOSKrPFTE8eNbOZz6ARHAU
 Fp+sbc+qYyzm7jFu/RagN0AvBYbMETAXbiUHdm1ENEVv1TlFTu/3ZmklpmJpzlRWgsenvC+i1Ql
 zgBoXfbMhOrgMUn1xyztGpRE/BVrpZW8=
X-Gm-Gg: AYBFou2bFEd27cwLNs0UTn2IQGwvc/8UkXiouPSzqFAPCY8cTtld0je8Gv4U9MaKfCn
 EAfqj+2ubLZoV4hqt01BZgYgF0WjwpvWxMEzefM7E2c51Wtk7peLqICnKGOToeQvAtibjTFCfHG
 ELkgPo00EEgyz4qzRpo9SHaDvg9xur/xxiw0nC3ST+uvEL/lP9An7RplkkqayUpA8x+xQlDQlS5
 8Cb4HqDzDbTdKrr/rFQjBNrOLoSvpeqKwsJrSJiPP0n+vAfZzMd6L9oftvE6VhrSca12Rf24/ua
 Zdhgmxg+iWJPxnxsYWv2WAyHLjTo1oK+iO64/+tAWaAUAWtWBlVD86b6
X-Received: by 2002:a05:6214:1301:b0:914:5471:e569 with SMTP id
 6a1803df08f44-917c011aa47mr9730326d6.18.1790883009819; Thu, 01 Oct 2026
 12:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260908044035.62093-1-mario.limonciello@amd.com>
 <20260908044035.62093-5-mario.limonciello@amd.com>
 <25c3dd77-bedc-4822-b687-0ea429db0dc7@amd.com>
In-Reply-To: <25c3dd77-bedc-4822-b687-0ea429db0dc7@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Thu, 1 Oct 2026 15:29:57 -0400
X-Gm-Features: AclHuK-bx6IInYg2xVtTEtZOke_ojMQyvMv_9lNx9GZqWxpIrzw65JUNJ9QqnL8
Message-ID: <CAFZQkGxz6Sn7AU2_ATt_kpwTf9g0Orc6tTOOsmOzkHJo94E+-Q@mail.gmail.com>
Subject: Re: [PATCH v8 04/14] drm: add connector backlight (LUMINANCE)
 infrastructure
To: Harry Wentland <harry.wentland@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 amd-gfx@lists.freedesktop.org, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>, 
 David Herrmann <dh.herrmann@gmail.com>, Mario Limonciello <superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Am Do., 1. Okt. 2026 um 15:12 Uhr schrieb Harry Wentland
<harry.wentland@amd.com>:
> Why not simply call it BACKLIGHT, which is what it is? Later, if we then
> add support for luminance (in absolute nits) we can use the LUMINANCE
> term for that. Otherwise it'll be lost to us and be apt to confuse
> people.
BACKLIGHT suggests there's a backlight, which isn't the case with OLED
panels for example.
I'd say luminance is the most technically correct term for this, even
if it doesn't come attached with a unit for now.

- Xaver
