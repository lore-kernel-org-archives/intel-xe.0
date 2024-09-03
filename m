Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEE2CD342C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CF610E4A5;
	Tue,  3 Sep 2024 11:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cSp+r3tT";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EAD10E4A3
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2pSNCLSbIMoFviNER5g8TfLmLnq+IvKF9riHz/S803E=;
 b=cSp+r3tTtk0QuZtm01Wz7q09/WLciPMlK7J88G2YH/uNAkQrcydeBuU/GwJdSN6Diw6qTa
 x0WtTgObqCePLhyx7OU0KT32w3GRrkhMc02SpTMbxwoE72exl5Iii/T6M8e7kbFi26t7Sf
 jfBQYPBTmwy42TsUBQsFPQk8OIpzXbA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-w-QzsRN1OVu6wzkNJTrgxw-1; Tue, 03 Sep 2024 07:24:13 -0400
X-MC-Unique: w-QzsRN1OVu6wzkNJTrgxw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374b385b146so1948361f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362652; x=1725967452;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2pSNCLSbIMoFviNER5g8TfLmLnq+IvKF9riHz/S803E=;
 b=WrQdcEzN4Fthz/8kd2IZ0ct2wH4phyIg1ugqHetreQa9TicFPxCIyriVIjLjbK1RZr
 Fw16/OPa/WAZjUhAjixSC5Gjg8uZUFhBE3d6L0Zfj0h5Lmy8kMkx+l0RHQBc3cr/aEYR
 D3QupCwB7AZeSVCkEirC6SpIlsCal7yC5Xso17QEVbWMjaU7rktT0LafQrPushH5WSOS
 P1m3CzDLINZjEgbuEgGk7vRsi1BaRo45An7wunvebSUh1hckkTXczTrGYkdCQF+3tu2n
 0DmCozLlP3iet0cAQFX81VXvTVMGEMwfUkMKgmoGjcORe2S2X7epO8qQL8X7PhdaM7vA
 k+KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFMg1OSxyN2yTTAJ0hpnWcKV1ovmSYYjHuVdmUtfrGL1OfZW6e8qX+OvLLyqqVI/i2x9b/RC66sw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUb+5OpqPCyrBhhXJ3c9LRppsIMK9Z1RxDAaY+DdqW1pftJ1Gs
 /vWnOxdJhNXYZB1wTkG4vOdeBuvR6d8v1cbUkCGU8ufczP18TzfkVsUisxuPgWBM97ccKawgqZB
 m7Qk7C4g9QOP92mHsLG9zYUkcP9sdktZQPx60ajG/CbrF3Dwl3a+KBJd9w/XIl0F0
X-Received: by 2002:a5d:66ce:0:b0:374:b960:facf with SMTP id
 ffacd0b85a97d-376df005691mr261402f8f.58.1725362652530; 
 Tue, 03 Sep 2024 04:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfMTx0LxlS9Vbxx5qqNkZNnc83gbfH8tZBpkVQ/eip0g3zytayB3JyreNf5DmRURM4ZJWCVA==
X-Received: by 2002:a5d:66ce:0:b0:374:b960:facf with SMTP id
 ffacd0b85a97d-376df005691mr261378f8f.58.1725362652054; 
 Tue, 03 Sep 2024 04:24:12 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c554f0c2sm7431928f8f.43.2024.09.03.04.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:24:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH v3 18/81] drm/ili9486: Run DRM default client setup
In-Reply-To: <20240830084456.77630-19-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-19-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:24:10 +0200
Message-ID: <87ttexf09x.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
>  drivers/gpu/drm/tiny/ili9486.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

