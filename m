Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DC1CD6E60
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0591810E75A;
	Mon,  1 Jun 2026 10:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JHA1kqDv";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2FB113155
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780309349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UYSWdrjn4aqQxQd0Cf2jKHSTVgv+zTIrZalUlPmgVOc=;
 b=JHA1kqDvAphyub391mJ3rxaYpdSzwIn+04KfRcyzlWz5wXXW6pSNMJ4vj83E3uTatCvXA2
 Ww05f0Jbw3q0ZPoYox1Ts3E90NKI0VoEdpeNTaEHhXFLcZ0ECYI2hzlBn6cMT1HdmwDI/x
 qt38PHDCTYIy+83yiiimchMw7E12pps=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-bBik_PqyOmmfvON0nlimCQ-1; Mon, 01 Jun 2026 06:22:27 -0400
X-MC-Unique: bBik_PqyOmmfvON0nlimCQ-1
X-Mimecast-MFC-AGG-ID: bBik_PqyOmmfvON0nlimCQ_1780309347
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490af284fd8so1141645e9.3
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Jun 2026 03:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780309346; x=1780914146;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UYSWdrjn4aqQxQd0Cf2jKHSTVgv+zTIrZalUlPmgVOc=;
 b=oS3B7N+No86db9mkK7sHIr/lo76qhZLo8pJvHqQ+FtYAbodq4beMr1vLsSpozEkRcg
 zAid2trE2tAop0Tw9LoKA90IpoK6V3o2+kymj9Ed2N5BGbDqZGCW0cP+lYUMmQlByIjh
 f88kZpkyxEgJ+sua39lM4rSiJueaaPwHDsiEAEzlk1DEmkfrL0/wU+fMwlhzW8JVxpcs
 D2hgL+KHoRlYATV76AU9Eut6F+IMYuFgeyDg841VufopqobQnL0R4+YjSZnejVcMe3tA
 nlMp8WbgFWJWjH+k469gwsu+Lm1mUB0LMA1GW5+KNCg2SHh/LmrTsnznBQ4mbZQuZ5HB
 IrBg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Vx0f9fI8JfqhwID9iwjAEVPsWURiDii4lhglPcGzjQWbkFzMTrpaa5GgEInRT9ICWoEDQKaGglg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrFEC1i/NQUyJwwcnrv7JnKLzTFHxpQ1ri0KKu/P/Tpv0GvFoJ
 nbiwZeThasTFlIPkwn6W9BU7e1qBU/PkuDFxC9wnNSywJX5gkH6mMM+VJi7I/3fVhFLLkMwj3T6
 i6ge9MogGLvL37lGp53bZvFUvFKRG5nu29zyAyL7KJsIa4iuv/LrElEitD+niKEGbRKbc
X-Gm-Gg: Acq92OGo43DVe5/7+vEBq0cldh/mOO50CGYMNKMj1nUCeKnuhvIygWWSJEftMYEKRIQ
 /YS+ReUxqk3c8kIFN0aNROx3JuRKusvJtoUm2Whbt0Ffaco00HYBjQpMS5H8kjubFe3ZCuO/Kem
 3GFghD8rd/Qr2GamYfaz6XoxO7ECVRLhO7cYj92UUv6qJBdrKYUcKTM2vdw0Yyi8wVIdxWVbJto
 +EgmJxuWg7NftGNxwT0DKdXeyu1lAHezEP/4p5tzeo/lNQul5r3FX/mzv+TvsGaxFoyMZl8tnLA
 064ygUhLJe2tik6oMhVS/Tce/P9kD1loJA1iDfyznEMlNRvFEiU6lTPdukXCWowArATFX6xwY2T
 dbp6M9BQ3YYScIrfUVhfxmI71Nico7nlv5p1lJuz184vFw4f/dIdXDve/3js0tyPtbSXERbjG3+
 kg4mkLohwlbqz9lRg=
X-Received: by 2002:a05:600d:848c:10b0:490:a1a9:4ffe with SMTP id
 5b1f17b1804b1-490a291197bmr137427795e9.12.1780309346513; 
 Mon, 01 Jun 2026 03:22:26 -0700 (PDT)
X-Received: by 2002:a05:600d:848c:10b0:490:a1a9:4ffe with SMTP id
 5b1f17b1804b1-490a291197bmr137427265e9.12.1780309346037; 
 Mon, 01 Jun 2026 03:22:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490aaebf4f1sm74962075e9.12.2026.06.01.03.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 03:22:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklinux@outlook.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 05/10] drm/atomic_helper: Do not evaluate plane
 damage before atomic_check
In-Reply-To: <20260530185716.65688-6-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-6-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:22:24 +0200
Message-ID: <87mrxelfvj.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TEXDboseTOcp2OaT5Fh8q01aiYpopcf6jk1PBJHb7nE_1780309347
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Remove the call to drm_atomic_helper_check_plane_damage() from before
> calling the atomic_check helpers. The call has no longer any purpose,
> as the actual evaluation happens after running atomic_check.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

