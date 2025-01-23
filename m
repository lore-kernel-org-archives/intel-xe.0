Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACB0C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 14:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881C310E206;
	Thu, 23 Jan 2025 14:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RzRa2e53";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF04E10E206
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 14:55:29 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso6996575e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737644128; x=1738248928; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=upW0o11czM3rq1xyIyTJu9A6ZGTiL/ktJa+3JV8KCvY=;
 b=RzRa2e537o1ucY5AFR5e/9ROfT5Gkv9HKT7on/WCVH12ABHpyoL+n+Rcu+fpt3mYF6
 EGe/n5sUqXrYKaHWw8h9euh0m8JvczuEABk/RA9PQYnAn/IOT5zETcU5dv+eQve4USmo
 6andFBkvCVLujH3G5ScpLABSIRvAnpzES/BBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737644128; x=1738248928;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=upW0o11czM3rq1xyIyTJu9A6ZGTiL/ktJa+3JV8KCvY=;
 b=mHFAcfhC8vEv2LDoibZh/DmtgsdgOd4x1UdxT8JMpivHVy0vC5lgRakQUjyM0JyAgo
 zIZTSGiDVM3x/rhstdQx/3YXRb3ejdlG8rRXtIRkbKdXGPS1BZhHfO+1hpINMVZ+50Td
 g7M6et/6SnQCBskbOcL7l+wirhe75OSDM/gBkeJZKoCko4DJ8+gXwnzNGKZ+aaIq0pO7
 7r7nahOx94iSZ5TjHa0Vpj1O30DC0RujYgJPYAExzunkMdayBwgdDtd9WpessFFtbT/w
 gp44iJ8wo1LhpcYfT9zjluLQGHGarPrjFeGsb1GPgE5hxXz/jYEk/PYJ19JWfNNJfzb/
 0GDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSInRDzix5HDm+CQfB5ayj7c2GkGTRxgsjgoEsqLTdGljSxTik9bA/Nr/FcHmH9lKSOSCwbCId/Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywLOXvGHzBxnWQJGc7euH9ICPE7lpyxQsLJboxX3ro4HOBM8IB
 94oEb2+3x1ZGb+xmiLclP7810SfL7UhlbClUhfdrLxIx5v8W6dIGdAiZ4azNw5s=
X-Gm-Gg: ASbGncukXufAXIFP5iXxP//G0aL0RHwh/9vmrCdv/l14ps509XhGTF+zOagKCqWas1g
 m3Z7N+9kY5N2hoBPrCfdaHQS0ONRFmAGOpylgw+xI7bg67MPQlKdrLXwm1HqhA75rxEq02EKW9L
 ZQCMiEJ8KyvaG2cXhzCCyJHsnTv1L8iJV6tPf2zmnIuOvGCCMLE+CnALEreG2HaRbCnw7N11hds
 BAXJTs/wfx/6sQ5L9UagIkBnfE7Re0KX3bxse1k+DtTDm27pMy0ylr54wzT6X69S+Ttuvkah31n
 4ndFBG0I7FHdE8HQ
X-Google-Smtp-Source: AGHT+IE7BhkUFF2qHI0G/tCUqF6t2iGENyy5rwl62Zw7BY/QQn9skwrSBU8Fm+gu4mBqm2ES4RoHjw==
X-Received: by 2002:a05:600c:5110:b0:42c:b8c9:16c8 with SMTP id
 5b1f17b1804b1-438b885b8c1mr34261125e9.10.1737644128137; 
 Thu, 23 Jan 2025 06:55:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b318aae1sm67298595e9.1.2025.01.23.06.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 06:55:27 -0800 (PST)
Date: Thu, 23 Jan 2025 15:55:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: Re: [PATCH 0/2] drm: add header tests
Message-ID: <Z5JYXICinxvDXN2J@phenom.ffwll.local>
References: <cover.1737556766.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1737556766.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Wed, Jan 22, 2025 at 04:41:32PM +0200, Jani Nikula wrote:
> Add CONFIG_DRM_HEADER_TEST to ensure drm headers are self-contained and
> pass kernel-doc. And for starters, fix one header that this catches.
> 
> Jani Nikula (2):
>   drm/client: include types.h to make drm_client_event.h self-contained
>   drm: ensure drm headers are self-contained and pass kernel-doc

I guess we should give this another shot. On the series:

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>


> 
>  Kbuild                         |  1 +
>  drivers/gpu/drm/Kconfig        | 11 +++++++++++
>  drivers/gpu/drm/Makefile       | 18 ++++++++++++++++++
>  include/Kbuild                 |  1 +
>  include/drm/Makefile           | 18 ++++++++++++++++++
>  include/drm/drm_client_event.h |  2 ++
>  6 files changed, 51 insertions(+)
>  create mode 100644 include/Kbuild
>  create mode 100644 include/drm/Makefile
> 
> -- 
> 2.39.5
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
