Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847ACC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 16:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2CC10E206;
	Mon, 19 Aug 2024 16:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZOeDxYeG";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D697210E204
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 16:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724085636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6aiAlEMlkVSgDq4kg8Uhoyt8PHhKwhvjGwHD+aR8CT0=;
 b=ZOeDxYeG6gr8BfdrJbbwyomlt/qTDDfqljxql+zF7fAwPe2x6qVTLDGCCfKG843dU61l1a
 g+mM1qCnqpWFWpTIj1m2KEtkAANLGJeArqI8SzkHyiO55jFu9lhDkAsQmnKLkeQPqg9W0f
 JG3x9Nsr+n6JZh1YVDNjQA8C2lY2Ii4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-fdJX_ULTMtyFy3-whSGtIg-1; Mon, 19 Aug 2024 12:40:35 -0400
X-MC-Unique: fdJX_ULTMtyFy3-whSGtIg-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2d3d45c308fso3906339a91.1
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 09:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724085634; x=1724690434;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6aiAlEMlkVSgDq4kg8Uhoyt8PHhKwhvjGwHD+aR8CT0=;
 b=MhMhi1L3WtJhl/7X1doOcJeNioFftdex7Payh0RAt2ehCZzpwpgdlbC6J7skAP/1jk
 7Z46gHTb0uA/KzO7Tr+lTmRfm9jq5qGdOWd3ox3JrDIcKz6wvv+7PDanoYtEcxRnxpgF
 roo3BKhpLA8bSi8O9gHDkKAJ+zyuF82F6hS+NIJH688LWl77NgtQDmcu5HDWe4We/6jn
 tni4UaxWGMNtHvcFCuiLF1XQ+WYgxWrrKo50whbkOI63NHzl0ExEHduL/0Dza182miVh
 Bkbd+410MoJnltMH1Ms92mi/dhbixVI4jc9DJU0T7kig20WrEu0hYdKLkWSxX8lYBTXQ
 86Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZv1YcI1C8d3nWyiQWOhmouSU7RBPB12VNXGnNIsdEVpuX0hYM5vZ74Y+xd8XxsEFMiMH3g879PTjqlOxwdaxHZC0cMHa+GRYLFbu94rQ=
X-Gm-Message-State: AOJu0Yz48Dw6bKZJhmpQKQEGpizLb3Ex8oDvp4lRVzkJA/wDvn7G3o2W
 YvRsGzgvjqLhzis3hQZqtmYoxBYi7LMB3bN3M2neLHWmU2QMdlfy/lis8pTN2KpOp93ysgU7b33
 Lohse6pSTA8/U7P5QTvhkQsZwlu5RPJrBBC27Gbf+vYtHbJYr8prkereqf20RvNtgIdsQcYOI2P
 s=
X-Received: by 2002:a17:90a:bb86:b0:2ca:8a93:a40b with SMTP id
 98e67ed59e1d1-2d4063e87e6mr8810667a91.31.1724085633793; 
 Mon, 19 Aug 2024 09:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr6UwLRtlBXjaOWivmxZxfUPO4m8tw0lWZ8JSfXwSkB6KBvIXRvb1qTy/OQw15401HlQn4nw==
X-Received: by 2002:a17:90a:bb86:b0:2ca:8a93:a40b with SMTP id
 98e67ed59e1d1-2d4063e87e6mr8810646a91.31.1724085633478; 
 Mon, 19 Aug 2024 09:40:33 -0700 (PDT)
Received: from localhost ([2803:2a00:8:776f:3d96:6be:69c7:46c2])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d427efec73sm3604053a91.48.2024.08.19.09.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:40:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 57/86] drm/ofdrm: Use DRM default client setup
In-Reply-To: <20240816125408.310253-58-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-58-tzimmermann@suse.de>
Date: Mon, 19 Aug 2024 18:40:27 +0200
Message-ID: <87o75oa2kk.fsf@minerva.mail-host-address-is-not-set>
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

Hello Thomas,

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/tiny/ofdrm.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

