Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88259C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8301129CB;
	Tue,  5 Mar 2024 10:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aMAsn7sJ";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC64A1129CA
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 10:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709633699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bZreK67FpZILAeD49/V7f1eq0sfqv4ispNo3CtdsGzk=;
 b=aMAsn7sJYLqKwelxGgtJQQJ/RUhXISWOZ6mwBChPDQNua/TmufRxUVPZugqrDA+HrbNWfp
 u1qfDzReF71/8XI3RQixArdTPUm0QIkfW7fb4PU6c5vL1YjTBzhIWDRAGtW8d87juAMxMx
 sr/OH/8/EoFrmY8JvLPZD485D2QIejo=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-_hb3PxwePHqbkmNmGguO0g-1; Tue, 05 Mar 2024 05:14:58 -0500
X-MC-Unique: _hb3PxwePHqbkmNmGguO0g-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5131796a4b7so5224069e87.1
 for <intel-xe@lists.freedesktop.org>; Tue, 05 Mar 2024 02:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709633677; x=1710238477;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bZreK67FpZILAeD49/V7f1eq0sfqv4ispNo3CtdsGzk=;
 b=KrF51poiY7F0zidSDSuvdIrROxb3+KPCg4t0rqYJ045pWDPaEHIhCr1lKYJAkGciLh
 frBMEdC7EjYdRKeD/E21rAI57YDKsH4FdQ/L9K7WgpbdoZ8BspsI8somGOferfwBoBAb
 PcaNKtyYSYBB3fTNingUfcS4Ltn2D/fQNhUNqivljDLCyq+WsBUPywoQv6QiqJUJtYdQ
 qS8uKO/e9eNhJSMfY+OCJ1e1AiZOW8b9fYITl6AKR34ddSoLn7nbVHBjE4Uhx3/JpTTV
 33eNilQh22XImskxBOx+rhhDjzShxULlyM2JrPsOFurOHsfizp5xP7mUjxPD2FYVj20K
 9v7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn9OekXBp4A9ugW6KYlKO9Wxz115QPB3L3aZ5WWVGWI5TCWFYyJnbfwlx0sLgI2hV2Oqv12gT4m9K1PSC3isDrWn29u2SP81aynAAG7Vw=
X-Gm-Message-State: AOJu0YxZZW1j7QQoL3gpYSDUxVlGj9iH9VvNbJEhKhcE5tv0DxuYGS7Z
 cBlTIjA6Ds+C+DZcndSpFQlN/L5bb8PlYAX7r15zm/VQ6XAAHtuxmpI7HE5aBTbTamXANot0kzx
 wIj7OGQvZmSIWJTygeDrA3QdHEDes0R3eaHobQxK6S4k1bovH0nQ8fr2qZFIe+S6H
X-Received: by 2002:a19:a405:0:b0:513:4bf6:9710 with SMTP id
 q5-20020a19a405000000b005134bf69710mr940999lfc.26.1709633677490; 
 Tue, 05 Mar 2024 02:14:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK7AzSAVkRPe1TYpP1NDx4pLfScxk4rOzERyIg+Ds+MY3KzPk22v/8TjCM4JUUhHs/40ihrg==
X-Received: by 2002:a19:a405:0:b0:513:4bf6:9710 with SMTP id
 q5-20020a19a405000000b005134bf69710mr940959lfc.26.1709633676969; 
 Tue, 05 Mar 2024 02:14:36 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s6-20020a05600c45c600b004129e8af6absm17375630wmo.33.2024.03.05.02.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 02:14:36 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Rob
 Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Hamza
 Mahfooz <hamza.mahfooz@amd.com>, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [RESEND v3 2/2] drm: Add CONFIG_DRM_WERROR
In-Reply-To: <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
References: <cover.1709629403.git.jani.nikula@intel.com>
 <afe5ed943414f7ec3044c1547503b9941686a867.1709629403.git.jani.nikula@intel.com>
Date: Tue, 05 Mar 2024 11:14:35 +0100
Message-ID: <87bk7trnn8.fsf@minerva.mail-host-address-is-not-set>
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

Jani Nikula <jani.nikula@intel.com> writes:

Hello Jani,

> Add kconfig to enable -Werror subsystem wide. This is useful for
> development and CI to keep the subsystem warning free, while avoiding
> issues outside of the subsystem that kernel wide CONFIG_WERROR=y might
> hit.
>
> v2: Don't depend on COMPILE_TEST
>
> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com> # v1
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

