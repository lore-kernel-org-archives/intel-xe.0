Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFC3CD6E60
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868C11130E1;
	Mon,  1 Jun 2026 10:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ToH9l7a0";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D7610E78C
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780308965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ec/J4tNvrAMdwkOq5RTOf80WrT+IRWDMG7cFT7/0gaw=;
 b=ToH9l7a0IhB9KM+rSPP904xfKZl+Khts3OGD3pXqViouDI/wHi6S6n5smCLvp3GUhBjTBT
 Ne4jJ/U/YtoE+sA51Iloq3XwDjT9gwBfiCoiPEObNQrpo4IRr8J9Zucg0xBwm+VWE0r1+H
 6VqLnIM4vo9IsFs6YnL1PED6ohBCzpk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-IxOtvCoRNbiKaqfC0Kne-w-1; Mon, 01 Jun 2026 06:16:03 -0400
X-MC-Unique: IxOtvCoRNbiKaqfC0Kne-w-1
X-Mimecast-MFC-AGG-ID: IxOtvCoRNbiKaqfC0Kne-w_1780308962
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-45eed49ee63so2755136f8f.3
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Jun 2026 03:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780308962; x=1780913762;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ec/J4tNvrAMdwkOq5RTOf80WrT+IRWDMG7cFT7/0gaw=;
 b=SfkAbxfOFWwrSSrI2vB92Ow8g+8D1/whORYEzqiilOdSkuDPYc+ZgtoCGAtSXaSp8Y
 VY1uqT0qDU1eRtnQ6dVTgH9Vx940fHTUKIfJjbTxCl2gv8dh6h2V78btg1sJsFJvIJJE
 J73veo4eUgyZqnLj/HbNIskuA4bGFZfonNn3nszGucbxBWgCI3nt7e3SG8aEXZWowD2A
 Y71AC3acELQ3cnRLsUQi+tF/sXyCSDAWTFyWnoL0apx9jBBUd/dj9sChFdIsAiqydD69
 jFAy7FLOTpps9VKWn4/1xrBnVYC5thD2/2tuI/gqEd9mg9b52ZEewhBMjRNJEyGYU8bQ
 MHdg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+v+NrK1iCMVfjHRbEBvISC8gmiFp8Smu7hXYWz+p4dCX6VoNDcFaAbTeCW45A/QJ9eomx32XY01Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS621pI6rr+Us24GigPXl2+Ftqzxd4DjD7x70njVDytKN2lPn+
 w894VpQK1uzEgcMkLoFEUsNxM7fVVESg1GCCAJyBUURRQ4jCEZpUp0aXoNEUNbjDdZ7+dUAmgpL
 zdIc3HWvqArNCpSd1K86hvYxwcPGNd/J6x/EVVblWrb8bPE3mTRFzeb/ZahNXO8wuMbpz
X-Gm-Gg: Acq92OHpAAScok5Xqvoju8pRWAtccfmHVTf0C9blCkIFwqib/FmH7UVLC8cXLC4Y4zf
 HCd4pdgJt8FzwURfLZqumtacoH4ABLfo6e1YxwZYTuOqC+n3ZO1+ddRhqN9gOBQNaD4JyNtcgua
 7nwGJz0Kvbsb18g8cAZPZGjpbZGSwZHQATPpL0MklXwrWpxOSYhtQl6T+r95kos68VQ+qyq/kNb
 5FlVW401JtDYmoPMHsFhIkKzUq0zSqEE1963r7KI+e0nq3NZOZ5TF324VnDbjrmJKXP/VCu6g7o
 WQ8NNw7IqzRTPc8v2W0W/qe3l/DENAko4ItYFpenMMPp7Z33arUChJNfGoVk5xmcpryDyj6Ti5y
 Drw27lDCxgJ1Prm2nZcbZbO5kHvBl3GNAMQkOovxzdVwTi36r4k2vQfvAmDTDsd3lUlw6ynNLX6
 bq2TLv+pERehc62UM=
X-Received: by 2002:a05:600c:1c06:b0:490:a298:3859 with SMTP id
 5b1f17b1804b1-490a29838b6mr211911495e9.24.1780308962204; 
 Mon, 01 Jun 2026 03:16:02 -0700 (PDT)
X-Received: by 2002:a05:600c:1c06:b0:490:a298:3859 with SMTP id
 5b1f17b1804b1-490a29838b6mr211910935e9.24.1780308961705; 
 Mon, 01 Jun 2026 03:16:01 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef32fabcasm23621879f8f.0.2026.06.01.03.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 03:16:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, admin@kodeit.net, gargaditya08@proton.me,
 paul@crapouillou.net, jani.nikula@linux.intel.com, mhklinux@outlook.com,
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mips@vger.kernel.org, virtualization@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Subject: Re: [PATCH v4 01/10] drm/damage-helper: Do not alter damage clips
 on modeset, but ignore them
In-Reply-To: <20260530185716.65688-2-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-2-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:16:00 +0200
Message-ID: <87y0gylg67.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YYukDsl2zNRUfFhIB74Ep4p-wUQO05QgDB6L0x8xXyo_1780308962
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

Hello Thomas,

> User space supplies rectangles for damage clipping in a plane property.
> For full mode sets, drivers still require a full plane update. In this
> case, leave the information as-is and set the ignore_damage_clips flag
> instead. The damage iterator will later ignore any damage information.
>
> Also fixes a bug where ignore_damage_clips was not cleared across plane-
> state duplications.
>
> Leaving the damage information as-is might be helpful to drivers that
> benefit from this information even on full modesets (e.g., for cache
> management). It will also help with consolidating the damage-handling
> logic.
>
> Also add a new unit test that evaluates the ignore_damage_clips flag. It
> sets two damage clips plus the flag and tests if the reported damage
> covers the entire framebuffer.
>
> v4:
> - slightly reword the commit description
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to ignore damage clips")
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.10+
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c     |  1 +
>  drivers/gpu/drm/drm_damage_helper.c           |  6 ++--
>  .../gpu/drm/tests/drm_damage_helper_test.c    | 28 +++++++++++++++++++
>  3 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index cc70508d4fdb..84d5231ccac1 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -359,6 +359,7 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
>  	state->fence = NULL;
>  	state->commit = NULL;
>  	state->fb_damage_clips = NULL;
> +	state->ignore_damage_clips = false;
>  	state->color_mgmt_changed = false;
>  }

I would split this as a separate patch since is the bug you are fixing for
commit 35ed38d58257 ("drm: Allow drivers to indicate the damage helpers to
ignore damage clips").

>  EXPORT_SYMBOL(__drm_atomic_helper_plane_duplicate_state);
> diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
> index 74a7f4252ecf..945fac8dc27b 100644
> --- a/drivers/gpu/drm/drm_damage_helper.c
> +++ b/drivers/gpu/drm/drm_damage_helper.c
> @@ -78,10 +78,8 @@ void drm_atomic_helper_check_plane_damage(struct drm_atomic_commit *state,
>  		if (WARN_ON(!crtc_state))
>  			return;
>  
> -		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -			drm_property_blob_put(plane_state->fb_damage_clips);
> -			plane_state->fb_damage_clips = NULL;
> -		}
> +		if (drm_atomic_crtc_needs_modeset(crtc_state))
> +			plane_state->ignore_damage_clips = true;
>  	}
>  }

This makes sense to me as well and I agree that re-using the flag for this
is better than making plane_state->fb_damage_clips == NULL the condition.

As mentioned though, I would make it a separate patch. Both changes look
good to me:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

