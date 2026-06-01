Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA10FCD6E56
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B83113169;
	Mon,  1 Jun 2026 10:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bkvFyqP6";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE8C113169
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 10:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780309669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hD1h4dJE66yskCwSbjuaF026xxijLvV5fH5oqPl0EUY=;
 b=bkvFyqP64A7n9sXJfArZ7i8OGrLfKXxra9KhXKMyfpmWJ7xxVn5sTqFRrpye7PI9IeKvpm
 0VmnIhtndI/P35aPmJXQMKCohP0M1fdwhHP3TZA015VWaVMHy1JUAM9ssoWIbhZlZyPuVd
 DQ8lw9fAaga3E6dgu1bey4L7XuzyI2E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-pl-TdhkCNoyYH1vus7w39g-1; Mon, 01 Jun 2026 06:27:48 -0400
X-MC-Unique: pl-TdhkCNoyYH1vus7w39g-1
X-Mimecast-MFC-AGG-ID: pl-TdhkCNoyYH1vus7w39g_1780309667
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-45ef0af9517so2560024f8f.3
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Jun 2026 03:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780309667; x=1780914467;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hD1h4dJE66yskCwSbjuaF026xxijLvV5fH5oqPl0EUY=;
 b=lxvHmAIwTOw6foi+S6zFqmFgXM4S1/G6Ufi/y4EjDRdnDEc9lo9TLwarr+aZdL7tdt
 wqntDnm/JGrcimjKFf3/c2UDxHlwJNcjLjiQ4hnLZIIQHAQ9pwtRZpiGEX3iT6nD/4P0
 pJcEwFEPaExdRf/Ec130wc0MfE4ttyXmcZqp4d76pka/bnRsa5E0H3kgGWFZKNIbxzvq
 gTXwWMCDyiMsVYubnFn6l3qnkEE11/sm/M8+dGjIrFZ44B6MgzTkZqVLZ9fQQePszO6r
 zpBJRu6xbKVoTznBagKhDh2x4tvwSzL6TuJ2CpEoMsT3LN2xmb3e6OsOjMHGzWzY3Y0e
 RAZQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ96QhWLRQhn34HYAASfWaJ5ECTd2YkooZcFbnLMrAQ2TJd20DildLiAkF+sFTy9xZ/Nr0Fphspv0w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztkvZHSrnJL3UCSN70prudCV3AZ6xrkcYu3Lj/gg/HIoUr5lcb
 OYWPqrUTwdI7XNf437WMXpE84xTO09B4gY+pEKtfY1SN4aGbsUI8T5ciSEPH1kH0MWSnvKR0hTj
 NHKG673XZWGOX6V0fqfqLvJhzohqf7RvGCginuswrTwQYOgIBQFe7kzyAyVzTd0CUCjaR
X-Gm-Gg: Acq92OH0pX16Kyp8q3PARwrP39eG14wFVoSOWmuYkxTqdL0aPBgjpsobTrAfaL3f8xP
 uCs7lAJzTZ38z7T25Den37CUgLcItVmRpSA2rYbd+05jbXOQKxnytpAcHPXdLQdfv6QPtrk//XW
 /6YXT5VaYpCCb9uw8pY0/bKiRFyWD0nghgM2R7MUj8xJFS7+PYgmngWdk/GWT0EJg6pq2VAiZNr
 LNGikDn/+HV7U8lrH3Tmzm9KvPqUOB0l2IuZ3ieM5RX9pIqldIa6pb0eqbcEWsaNa7UF78LbyKb
 x3Y/SB1scAauRjip5ttLpWPuqVvKQruxUF6Z8ZZS3lLxSqb2bfuzsZeqMbcCTeGE9ziQ+rtnNh9
 D0OFOGlr270Mry/Ul69C7N2xrwk6h8taHTSeUdQFrFJa+ex1PxB0yfkJLd1C9oQYV9bYmkJt1vG
 Pk4X8BSbziPXlhsY8=
X-Received: by 2002:a05:600c:a111:b0:490:469c:556b with SMTP id
 5b1f17b1804b1-490a2933355mr153783265e9.12.1780309666752; 
 Mon, 01 Jun 2026 03:27:46 -0700 (PDT)
X-Received: by 2002:a05:600c:a111:b0:490:469c:556b with SMTP id
 5b1f17b1804b1-490a2933355mr153782735e9.12.1780309666314; 
 Mon, 01 Jun 2026 03:27:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef32fabcasm23690022f8f.0.2026.06.01.03.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 03:27:45 -0700 (PDT)
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
Subject: Re: [PATCH v4 06/10] drm/damage-helper: Test src coord in
 drm_atomic_helper_check_plane_damage()
In-Reply-To: <20260530185716.65688-7-tzimmermann@suse.de>
References: <20260530185716.65688-1-tzimmermann@suse.de>
 <20260530185716.65688-7-tzimmermann@suse.de>
Date: Mon, 01 Jun 2026 12:27:44 +0200
Message-ID: <87jysilfmn.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4crYAAk_V1sVwg3DeSeyf7Zjs7JPAQYIGNLttU9ohqQ_1780309667
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

> Planes require a full update if the source coordinates change across
> atomic commits. Evaluate this during the atomic-check and set the flag
> ignore_damage_clips in the plane state, if so. Remove the check from
> drm_atomic_helper_damage_iter_init().
>
> This will help with removing the old state from the atomic-commit phase
> and simplify atomic_update helpers a bit.
>
> Several unit tests check against the change of the src coordinate. Drop
> them as they do no longer serve a purpose. If the src coordinate changes
> across commits, atomic helpers will set the plane state's
> ignore_damage_clips flag, for which a separate unit test exists.
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

