Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ED2606A32D
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D0KnBisL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688A810EDA4;
	Mon,  2 Nov 2026 12:42:14 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FCD10E3C2
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 21:32:00 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-98febe968deso30573241.0
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 14:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793309519; x=1793914319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2fppUUj5HcejdeVjTMNfb4aywjhpz3Hjgzr44FiZzlE=;
 b=D0KnBisLfcEPF+TtxIwpvMMBj7Pr0Ju9stVwSkE6D+K+vMn8B6Ezt9XHOZ4+qK4S3C
 4ogp9j4oqUyPEops1aTtqGOG0CrDXLg39TK5TGwgbXZLsWLrhXAEyejJff4WNNirHQ0V
 LJ+IQDoCzH5Y72lMlA6vZMK4ixETGFwGRazS/owWytQa93qZnCfdv6zGJfsaAC/mde2b
 fd/Jd98aYirVX3v9i5oPxGPOtEwz1VJrH5ZrlTGPmpZuk7O6Sp+ZrmPXZR6b0olE6Ags
 /dWaRqe+ywmug/sZncZ3EUJMcg2p+9vYy7muFgm5m9NNlGBLHDy/i4jNHWc9I4Lmhlk/
 kNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793309519; x=1793914319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2fppUUj5HcejdeVjTMNfb4aywjhpz3Hjgzr44FiZzlE=;
 b=NgClH8jvoAP5OUH0t0X1+aXv4sI8VNVlMNL9gW0+l1OFDffA1XovjMUbvFIftQYqSr
 lT7QRnszQ8ZkyqS1ag/B63gkkB1ihGUcX4MqbFDMOVKge42oI/O+gBQ9m/IRGUG1fn6e
 yo1IifYTzh+VqXN37LNbrAxwRpRhFzJkU2FrFZBxzHa1Wg6+02FR072YyAYPPbt1HGeo
 BV7XvCcqzLZewOJCUOszxhLd8KabB/GxsIDDgs8whpr51XHQeIaYBEFyvTqdXdygSn4r
 4aAMFEZ9dwbNGcftlTtymbviONewoxVy7FAf8wXC314OEbAcrm2ppBgNtIYoO8Yh56mt
 SUCA==
X-Gm-Message-State: AFq9FYLtnTc50m6Domay9emHA9LRD1AfqM5FwygHAhvQQOQdTepGKs2l
 bJgucLs+0OdNzAG2lxf1dY93CeGF7479AvQtJvClSv3Olbl4varL7Bj0
X-Gm-Gg: AYBFou1WurZEvIn/MgfkG0gbTY/Yka5Xj78Lze2N/+ioSJ/MTy3j2yOA5HJRO154rMt
 lZO8WuCGBflXhU4Pu0SAegsUEKmCz+AFKr+WzsbdXmOG+bBzuQ0n7rZedFs0Ue995YlhWlNaC/y
 wymceJSAlUY+E5LxQp+WXw+JvbcoZAuEkt67zY3Ko5jr4ENJ35smAMiQ9L4GzvC5dshgGm1SZtC
 tiIzmYt8yHyVypN7n2GsjRQuJ5T1hCNG5eWFX2WVK6MtpKrZskfSl/PHygdZ//3yoX7RN4NvLKC
 Rou5oJgGhs5PSlhOzKkGTdwXydYvS9/rTsyH+Nf4EwlAY+KMMjw6DUMrzLvGLNN2hIn0hHp0Fjw
 UjU+lorrpHWohc8vYOKsgXFhXgrIu6dvY9c4NI27YpM8S/pYEoYVvs8oTdMPptU6BTLu0+S2mSJ
 bDgMsQU+XqbJyBOe1TICTT8V1TsUtsDaIt91hHX9p/rP5aTzO2K6SwSxYuo/cTBI5K9p+sNvIUG
 GiTlXc1XK0NywriCranTQKOP0Kr1IiA6iOst0SzYMOg0LBednGgsfPzKvtQlKDsZ9P9rdUxmpkZ
 xEm010AS0BN5P4pVz22eR2rUZck4Oj6Tnig/0xniJmO83b897lUligmBblPaFkmSbfkwIY8+Wnq
 51A==
X-Received: by 2002:a05:6102:f0b:b0:7d0:5688:f4fd with SMTP id
 ada2fe7eead31-7d0726c0897mr316589137.17.1793309518687; 
 Thu, 29 Oct 2026 14:31:58 -0700 (PDT)
Received: from localhost.localdomain ([190.13.90.101])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5ec69caeccdsm239589e0c.16.2026.10.29.14.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 14:31:58 -0700 (PDT)
From: Lucas Moreno <lucasgabmoreno@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, i915-ci-infra@lists.freedesktop.org,
 jani.nikula@linux.intel.com, ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/i915/bios: Fix reset sequence order on GLK VBTs with
 DEASSERT_RESET in INIT_OTP
Date: Thu, 29 Oct 2026 18:30:41 -0300
Message-ID: <20261029213041.6220-1-lucasgabmoreno@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013001245.12347-1-lucasgabmoreno@gmail.com>
References: <20261013001245.12347-1-lucasgabmoreno@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Nov 2026 12:42:13 +0000
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
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

A gentle ping on this one. CI has not run on the series because my
address is not on the allowlist (I also mailed i915-ci-infra about it
on Oct 26). Could someone with access to Patchwork please click
"retest" on series 176138, or let me know who I should ask?

I'm also happy to rework the patch, for example to limit it with a DMI
quirk for the D330 instead of applying it to all GLK, if that is the
preferred way. The issue it closes is
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13225

Thanks,
Lucas
