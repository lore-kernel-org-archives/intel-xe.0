Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB110606A334
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O8yOG7EC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C89E10E9B3;
	Mon, 16 Nov 2026 09:27:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8218610EE45
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794821256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UeghsTiOb4ju5n7zGZ1nHsTM034u6BwVxNZLSRJoYfw=;
 b=O8yOG7ECcm43MInd7H6L/X28k91eZ2Rd3+TGYWtLGMufYSscasJ7HrvM5gEEtfbQ5mDBH7
 uW7S+SG8Vc3T2cB75fu/m8+qpwQOLEsxNSHE3m3hsqXNoO3R8YAgzSvpwfvcDCYZGIiAgn
 /4aiUiZ4S71FmbYBdzaGVtSCbsXto0Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-FCpCxaqxObyH-z-r10ltyg-1; Mon, 16 Nov 2026 04:27:35 -0500
X-MC-Unique: FCpCxaqxObyH-z-r10ltyg-1
X-Mimecast-MFC-AGG-ID: FCpCxaqxObyH-z-r10ltyg_1794821254
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4a009f82bedso18378605e9.0
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 01:27:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794821254; x=1795426054;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UeghsTiOb4ju5n7zGZ1nHsTM034u6BwVxNZLSRJoYfw=;
 b=tG5BuAhnTdDvKbS4mJRcS5q3DJHrAkyY0WYOKdtL11pnyahoRxOlk6OsXrOpaDT+Gs
 4xQy7Zi+fjb8O/lwp/kTGtieWXqyodXD7e7AERddb/mO9ZKNUDyWXv5XbDXrkPEKQgZL
 b6GbKBwn1UQsHLjW/2DhOwx/wmqv57GnU69W3qAcCaU/i+Ywu+OQcg5QaR6sYKyGbhN9
 F8KgW8W4PUJQzg9lfITUPIPRnv5uwBCCgvQKg+uGx+AiH9xtRpX4UM7HmZvxNUCOKVYi
 zkb7DWBnAiczh8y3GZeWMXR3vhBUD5PL8bqM5ryWoTxwMPvJA9F56xwurrXfWR4mX3vR
 ebhw==
X-Forwarded-Encrypted: i=1;
 AL+hErG8z6aimy4Dptq98rcLM63E5klV6vJ9PM4ErGfnfDI4nuS5lbZFkzPVsdSy5j0Xy8dAnjYBKSjcJg==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/JWiVrkud+5IopHQzY4m/Ccg8yCLVlWgCoNO8yX9PVMLQXz1LL
 AHdjh0iDG1ZW8rxinNVIrccG7XouFaBBwMM/NBoX6OhBp1ft5EfsfKkbkTg+UpbhbvnHzT5FxL7
 Boj7zHCqBtXv3U41H54iLjQKsgvK/FvbSIeeUa6Iex72Ztimt+f1qH7VYVVH3alXZ/NF3
X-Gm-Gg: AYBFou2MIxNUhMLpzLEYsQKj/X9gnJheEfi411M0Dbvf/n4W1Kj0d9X+UCq0mkk6QA4
 WsAmapBKdYcLxL0W+TT4PeYOOQQgQgUEcQT+XvVxWN5/NIoTCmIUTd5nbnjbx0Q+vrbScG5NR0c
 2YKPrYS30tkD2FxkcB+vp0Iee9drsx88QMbuYzxPtOlcj7CQCrobEARZVy6AMvjvBvLGRdZOVet
 w1W7Zl3OmYGX8Hbeia9zbEFm87rcDf4VrV7YuR/bZYU50MVVUjt5tiVc4xh5GUWSC8IFXDsXrWN
 QceEhHaJ0WUSHDj0QTl/vdkSRz23G4NaiuqXdX12Q4iMdD26GaUDoObQV4xCvX3OzESkk6M85Cz
 mWwl6IJ0AiuUlel+NM/oW+CYRfIHIXUrs0f3XRpw7icBsRl+EhHzHv2EbvCQh3e0LFU0rbqYhbG
 Q1UFwb5LWR+aRcvu/vxyYck3GCnwJm/M9PHKXdCRQ=
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id
 5b1f17b1804b1-4bb55a5de41mr207754105e9.21.1794821253844; 
 Mon, 16 Nov 2026 01:27:33 -0800 (PST)
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id
 5b1f17b1804b1-4bb55a5de41mr207753235e9.21.1794821253228; 
 Mon, 16 Nov 2026 01:27:33 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb52bab8bbsm280128335e9.13.2026.11.16.01.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 01:27:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Cc: Mario Limonciello <superm1@kernel.org>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v11 07/12] drm/panel: add connector luminance forwarding
In-Reply-To: <20261103-superm1-backlight-property-v11-7-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-7-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:27:31 +0100
Message-ID: <xlv1qzglrurg.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eFc_7yRw2KWxOCb9Mwuaf6cW6ftCUeKd2RJamKChpu8_1794821254
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Mario Limonciello (AMD)" <superm1@kernel.org> writes:

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Add helpers that expose a panel backlight through the connector
> LUMINANCE property and forward connector updates to the backlight
> backend.
>
> Hook the helpers into panel bridges that create their own connector.
> Panels consumed directly, or by a panel bridge attached with
> DRM_BRIDGE_ATTACH_NO_CONNECTOR, remain unchanged. Turning the backlight
> on and off is left to drm_panel_enable() and drm_panel_disable(), which
> already honour self refresh.
>
> The panel backlight remains the hardware backend and keeps its
> /sys/class/backlight device, which is owned by the backlight driver.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

