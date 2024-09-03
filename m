Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB427CD342C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B26210E482;
	Tue,  3 Sep 2024 11:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iTPC5yPL";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E6D10E47E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725361995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eNaLJCzc8McH6yKUfj3b0fV3lUF+xcAOFhE3bUUfh6Y=;
 b=iTPC5yPLkmUSOh+RjfDuy2ZYvMhO/TKt1+9kZgFBEiB7beCrTPosoTKTQPAAE4a1yvezPQ
 m9CnLViBY2zra2WdpWZ1Uy0rzHDyFSmy2IDsT99Vjm9i1iLzEPo9wbX8284e9c9QE5BSmS
 lXxSjGlr3n9hoZWJYzKmYsLP/sg0CZs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-lBpptUdsNECYfP2Wf6spHA-1; Tue, 03 Sep 2024 07:13:12 -0400
X-MC-Unique: lBpptUdsNECYfP2Wf6spHA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374c581ce35so1369226f8f.3
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725361991; x=1725966791;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eNaLJCzc8McH6yKUfj3b0fV3lUF+xcAOFhE3bUUfh6Y=;
 b=Fy9SIIvBqXRFOU3wcyAfuvCyEJKC4CTqfiuzvetCMACrDlknmR1DpV/cQpdVci4tdo
 weMVRFVLz5bbfBFjhl8nzb/QcCPFDnUBBEOXU9AWjzC4Du7fCEoXOE6oCMd8m3tw9b/S
 GY/TUyLBrpheVEaAiH0ipQ8xdcu5GmF1ePctsPx0yQ22Cds+5S9wptLAVVVMID4UgGtx
 X/VqIRAluOiPpytF2eMwTmd8Vhipzbf5R9RIxz1VGpvpkCpTOdqM29g/GFf32XWSueqp
 wKNh9ylNJwV4QHBeR00p5TO7Rz08rS13eupQavS05wYKTzWoGKvGoA1FNqbvdNhtgA3P
 PxrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7wRQQ2lQLLmKDF3qs6ubo468UJ8MfchI3xGsC/myu1mJe/th3ZVPxiedKJNAs+z6ILcNTPNHI/g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpjeZWyP7IFks5rkPbRs1p2nnkwQ2UlujSeF84B3ikNVyd71b1
 fcun+XdyasrnJuI1s61zFnrxgFqUS4PkIiRBAWm1WkCYrsYBFqbh67DeCzrRkBJHP43SxDNsfDo
 jegJoqn443d0vqHpJwCHUEqnTySeAfiiMc5ryqzRBz+sp0ru/kXAZe9n1fJVrBocY
X-Received: by 2002:adf:e042:0:b0:374:c8a0:ca8c with SMTP id
 ffacd0b85a97d-376dea47175mr311000f8f.43.1725361990985; 
 Tue, 03 Sep 2024 04:13:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErKuUaZwDVmhsR7doTbtSmBnmM7k053hpSErI0ylM4sAqourCJsbqDohSz+3dvc+wiabrelQ==
X-Received: by 2002:adf:e042:0:b0:374:c8a0:ca8c with SMTP id
 ffacd0b85a97d-376dea47175mr310977f8f.43.1725361990502; 
 Tue, 03 Sep 2024 04:13:10 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm167087945e9.18.2024.09.03.04.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:13:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alexey Brodkin <abrodkin@synopsys.com>
Subject: Re: [PATCH v3 06/81] drm/arcgpu: Run DRM default client setup
In-Reply-To: <20240830084456.77630-7-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-7-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:13:09 +0200
Message-ID: <87ed61gfcq.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup_with_fourcc() to run the kernel's default client
> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> v2:
> - use drm_client_setup_with_fourcc()
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

