Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81882606A329
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EMITteBu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F1A10E117;
	Mon, 16 Nov 2026 09:16:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E72410EE51
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1794820607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oRP30ct8ql2mTXDmxPgRrEvZM+dzcMrlEdSg9+eoSP4=;
 b=EMITteBu+Zq8r2lIitF9xBTTKbkSgXU4IffsBkd4BZFKpcgITbCd7jZEUSnebvtB2Q1W6d
 PH35SJqECAscrYKbWMwb5wWggcBbMPV98Z82Erc6SmcAfUQrQ+UmiqSowFcYnMHNmbUBtL
 /2QOZwEK8sHfcBqS3vJlpjRRNyFyp5s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-NdvJE5fiMVmHqIJtO_cehQ-1; Mon, 16 Nov 2026 04:16:41 -0500
X-MC-Unique: NdvJE5fiMVmHqIJtO_cehQ-1
X-Mimecast-MFC-AGG-ID: NdvJE5fiMVmHqIJtO_cehQ_1794820601
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4901562b819so2970971f8f.3
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 01:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794820601; x=1795425401;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=oRP30ct8ql2mTXDmxPgRrEvZM+dzcMrlEdSg9+eoSP4=;
 b=TI5/VPnKb6q+PJ+4EAA/abvbffaL2qOA7cp9JVVrdMozYmBqbiRoY6+hX7MmQVN5j2
 EEVcgqZlWym791MZKzjipxMtCHrjGJeXTPXA0a44rZLqd+iY688yBRzdatCF9McrtW0l
 lKKzCIJoZGVgV6c9Q95V7Bc3BajUaNMpVqDOkP9TDvwFsBv+5a1EyNeGCN8x94Yswrxe
 Ta0er71JiAUDceGW4n0AWRxJhhDXXYQruB7AgDiK/dc/gXchj/NP+IDQStk9KY8v8+9P
 nWy/YgOAk9WFbFcqgyLKImEkExcjyHtg1qn6R7EJXXt799rPcFqMRCmzdyRGOjuAM+Z5
 xjpg==
X-Forwarded-Encrypted: i=1;
 AL+hErGtkOODq7eF9wTGrVKGLJep8tVN96NJ49WodlgeSOJMJHOXedDAJKXbVZUO7A556c7KlZsHSXt+4g==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/xymRP4Njp9yjO5oyqOoBiagSmAiFaESmoJVJ41iBVs0rbhCBE
 3XJ/Vc8KPy9XJ66ojSVoRr4YfuW/b8a1IZJt1e7esZV2hPkjnlzG2Jn8lPNj6PbDAwr1lHE55im
 1EqzitskvpsZ2DJRKZYd4BZ2wCGhQHJIJ3GHQMZAnQfV1CA/D+qMW+FGhqVzN05k9RkOo
X-Gm-Gg: AZFdTZdXvYGRbiNQ1BtcMWpDFZUrsLQ+uT3rt0rPFkuud3tZATU43h9W5imftFUd947
 UVTlwRiOiR9WMB2sMYqgp6QA9zYQF4H0XlmYpn43CG9cPzs77Gy0CruwDpu6rjZLnqNLxxGmFKK
 xO9ice/KwPQEIVtaBFjgCJkG2Wo9tLjfVeoz6bc+LHH6jG06mw+kbjWbfrX1b0bij6wrf04FMDW
 k8zvWyzE1yfYaBsms9b/u+Gft0Vo23MFP1ZZ2b8xGdzquWrHo1Lcj/liAl8gdFTE2zgg+9s6ZGW
 J28jFUmc0sA5r0eIZ5xeP7bkegeBwleaQ4McLrg4ZudbA6MxrUtpKTD/4zPqUFsrrbBsyaq9Yky
 DABwhPSD71fbvGYu1DODxneGrtmGE4yJ+RIgUneIwKnNTtCQNKK1klGQfYXJQR4mK3IIQu+WYB1
 jORgUthsnJdqu6VFYF5zolj/1keNhsyPxlkHcdEb8=
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id
 ffacd0b85a97d-49c6d453058mr20772420f8f.5.1794820600445; 
 Mon, 16 Nov 2026 01:16:40 -0800 (PST)
X-Received: by 2002:a05:6000:4907:b0:48e:b62:d133 with SMTP id
 ffacd0b85a97d-49c6d453058mr20772359f8f.5.1794820599837; 
 Mon, 16 Nov 2026 01:16:39 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49dc430fa15sm14802191f8f.13.2026.11.16.01.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 01:16:39 -0800 (PST)
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
Subject: Re: [PATCH v11 06/12] drm/bridge: add connector luminance operations
In-Reply-To: <20261103-superm1-backlight-property-v11-6-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-6-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:16:38 +0100
Message-ID: <xlv1tslhrv9l.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wadq2CncCPuqW6rtXdjJnLoI1osaPMSJDS_yUUA-8KI_1794820601
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

Hello Mario,

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Allow bridges that own brightness control to advertise a luminance
> operation and its supported relative range.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

I'm not a bridge expert but this make sense to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

