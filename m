Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B729CD6E60
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAFB11314C;
	Mon,  1 Jun 2026 10:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h14RMu/y";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5701D11314C
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 10:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780309261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PtraVy72eIuUfdejQSU7WTEFINXM3tMuzrGKzIN4pEs=;
 b=h14RMu/yjv2gPdqpZr8vIoS715XR2o8uXdC9OZ5yXtm/EH5vhgqD9EF5PL/IGimn2Hx0Y7
 xNwzUXQY7o700I0A4oJZg1KTd2adWoMeR5Mj4MxSRVmK4bpE19xobbDwOLoNALUA0C3i0X
 Y0S5KStyDx3yhJe+82SZgFtCucpiurs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-EbTx1k25PTK0kMJgEvbYOw-1; Mon, 01 Jun 2026 06:21:00 -0400
X-MC-Unique: EbTx1k25PTK0kMJgEvbYOw-1
X-Mimecast-MFC-AGG-ID: EbTx1k25PTK0kMJgEvbYOw_1780309259
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490a762e646so11692725e9.0
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Jun 2026 03:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780309259; x=1780914059;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PtraVy72eIuUfdejQSU7WTEFINXM3tMuzrGKzIN4pEs=;
 b=H3jMlYjV81Nqdwdfzi+8Js/iZUSSty3im3LCsMLXsku2Hp3+Jg/ya/vqnBGl8D+RvM
 FM7KElyKQsqsxc2yKYT/a/3wDCtyeHRZlPgIrHmMOhIUG9aYdzY36FNixbajWwYjF6w1
 xl9hwS+4UjaO6+QL4XL0IDK5KL2S/VOTBb1+BqBe3csvmDM6zOb2noX9gHgMGKipKkS4
 0k4GdVxFbygLz+ZESuL30HqKhpjqvO6WNQpt94TMn6Ds5dTuAUZCx3WFRFxQ4sby/WMo
 VxTqEJ9roWigg68OzZlfNPbaEz7+YBRqLvligWAIm2i1QVPCN3UM+vuligB/XSaPwuQP
 RP9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+CxbJ5N6KJHRpC0P6RkEoir4Jh/IwYC0avD/hv5m/MoZ0ggl6hBfW3YZUA+9w9gCmT6oocJDl+Yw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxePFnk3ETOe0jbbE4SL6SBr0JtFI+WguUN+T433z/tER5Lz+Kj
 U2fxeASpi2pawTyMYotwl2QpxNFB79K3xzsKSV96xfYy+1707aQieVBC76ID4pGYg3S4Q+Av1FB
 EueoHIYjx0WhdmVtAfoOeQ84rTbn78hxJTRkpUBm5R2qN81Se++Aho17rbK+DLQNUkYaF
X-Gm-Gg: Acq92OG3h9UL2RqYJrGspUIK4BxggqLlgfUrIxLrBCz2yEODf/FH6T1kijYAfIsnSbH
 Iliulq/Ort0OKVj70MYdNt+StalJ6tlDMrLg4sROKAaVB6trUEcige87isInRD4ZMjAMEdzDLVT
 C1tmUe3OxztEuCn2GUnQo3ZyBIuH71+vNc1Eb5kmVR7Gk7uMoM+sNm+U7JOnU4J4+38lZJ3Xf/X
 GiZBBRMIesRxcE6c2glhe6AOgNeLADp+/fRvAjhymes4Z5wxy+8X0ZhM9KaFPvQ5FjSayJPWx5j
 HVKKnDeDD4HILaddIr+5kkv6ZlokS6o1pFdYgEzyMT/QyyHbKhk1Zj02Zsv3NeZRUSnDz70pGEP
 nYLpfkubmh2NYdklBcwmz1MmaceMZQH+JSEp9SU6STWJcFXsno/W1yvq/6sCluM/VV7HtgOeBZV
 LMhNpYGe2khhcGXMw=
X-Received: by 2002:a05:600c:1992:b0:490:adb6:793d with SMTP id
 5b1f17b1804b1-490adb67fc0mr29782785e9.26.1780309258857; 
 Mon, 01 Jun 2026 03:20:58 -0700 (PDT)
X-Received: by 2002:a05:600c:1992:b0:490:adb6:793d with SMTP id
 5b1f17b1804b1-490adb67fc0mr29781855e9.26.1780309258391; 
 Mon, 01 Jun 2026 03:20:58 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490aeacecfasm19237985e9.4.2026.06.01.03.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 03:20:57 -0700 (PDT)
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
Subject: Re: [PATCH v4 03/10] drm/ingenic: Remove calls to
 drm_atomic_helper_check_plane_damage()
In-Reply-To: <20260530185716.65688-4-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-4-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:20:56 +0200
Message-ID: <87se76lfxz.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QVMVeoOv9flJFj3rflceRFan4eS98Y1vqciFFdxNmes_1780309259
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

> Atomic helpers call drm_atomic_helper_check_plane_damage() after the
> atomic_check anyway. See atomic_helper_check_planes(). Remove the calls
> from the planes' atomic_check.
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

