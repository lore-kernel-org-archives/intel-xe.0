Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AEED41C17
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 08:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D040F10E6AB;
	Wed, 13 Nov 2024 08:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GKoZMvtg";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CEF10E69D
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 08:39:26 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20cdda5cfb6so64906265ad.3
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 00:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1731487166; x=1732091966;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rCh54mJ7akDtjRQEtrxBL2HcuujeMrTCRb2aEAuUOGg=;
 b=GKoZMvtgmfn0G0nnOsTnuJm/BWj9Wq2DXcGOORSU1P4McR2IYMrk9sShJCJiQ2LXG/
 wk0dPDdOJ5mx5S05CYt9yM3tXt1aAazCIh+7Zy1xeENrjRdI6MOvog1Cn9H/F2brvxll
 RkY7vmiDzyvzl29lKEOuqjnO6BuTijk1JhOCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731487166; x=1732091966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rCh54mJ7akDtjRQEtrxBL2HcuujeMrTCRb2aEAuUOGg=;
 b=PSB9EdmyY5ATJFAYta3eCxsnp7kFQ6tPdqCQuaGcph1bx+4rYGnTZU7m63HMkkDEPN
 NJKDzqO04WwoNor7i51juoUWtwhZFLZZWp/n6zwPMKioeS9X6E1EZGYW5TTDCs7ZJSzK
 zB/XK2d1QxB9KMtvWkK+uJI/n2beQ1uioDmSDavq/WXw0mO7FKMOx3DDPsE8qDffqsZ7
 eENJbWEUsHSUj8fvvcwPgre6NQyE5hzRIxLAm2G+UFkeXesOUgCOxKEoziGET0zFkJ6f
 gYumlUjxPUVsMWYTXHK1yc7/2k64TRfeEUS+5zAoh7meWSgiizzubysmT5zVoRqHiygT
 GK0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCOq9D3gPgRJOTbpRKpVEO0CJ6f5fRXsbmjh9yUUN5jFEFpxEn4kjfITrX7NohFjRWsYSMp4ltrQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVYvCVdCeLFGKcmKYq6e07mLB6ozNT+ULBcQHJn+ljNTARbbFy
 2uTIH1FMOidxLJEBmTZm52ARkAJI0+7AKBLybi+nn1eNFGsezzHBK+7Svlnzzw==
X-Google-Smtp-Source: AGHT+IGofwp7EUeDXY7jIEE+cvpp5/5zwkzHjXcN1QEH+3rUbiVmbD0XfKX42r84LsLTqCr/8CqElQ==
X-Received: by 2002:a17:903:2ac6:b0:20c:e169:eb75 with SMTP id
 d9443c01a7336-211b65d93c4mr20172145ad.2.1731487165765; 
 Wed, 13 Nov 2024 00:39:25 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:50c:65db:bb29:3cca])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e41890sm106064175ad.147.2024.11.13.00.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 00:39:25 -0800 (PST)
Date: Wed, 13 Nov 2024 17:39:20 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] drm: i915: do not NULL deref hdmi attached_connector
Message-ID: <20241113083920.GH1458936@google.com>
References: <20241031105145.2140590-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031105145.2140590-1-senozhatsky@chromium.org>
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

On (24/10/31 19:51), Sergey Senozhatsky wrote:
> intel_ddi_init() may skip connector initialization, for instance,
> both intel_ddi_init_dp_connector() and intel_ddi_init_hdmi_connector()
> are optional.  This leads to situation that ->attached_connector may
> be NULL for some connectors.  For instance, on my setup 'DDI A/PHY A'
> and 'DDI TC1/PHY TC1' are not initialized.
> 
> However, functions like intel_dp_dual_mode_set_tmds_output() and
> friends don't take this into consideration.  This leads to NULL
> ptr-derefs:
> 
> KASAN: null-ptr-deref in range [0x0000000000000848-0x000000000000084f]
> RIP: 0010:intel_hdmi_encoder_shutdown+0x105/0x230
> Call Trace:
> <TASK>
> i915_driver_shutdown+0x2d8/0x490
> pci_device_shutdown+0x83/0x150
> device_shutdown+0x4ad/0x660
> __se_sys_reboot+0x29c/0x4d0
> do_syscall_64+0x60/0x90
> 
> Add a new helper to avoid NULL ->attached_connector derefs and
> switch some intel_hdmi function to it.  I'm not sure if we need
> to switch all or just intel_dp_dual_mode_set_tmds_output() (I
> have only seen this one doing NULL derefs so far).

Folks, any more comments / opinions on this?
What should be the way forward?
