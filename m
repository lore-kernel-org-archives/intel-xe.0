Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCE6CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:22:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F70A10EF04;
	Mon,  8 Jun 2026 08:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZCDejV/x";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7403C10EF04
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780906959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9STVIInTtPaSxierXXSltgKQhrdbFwvIMh0XKlqV+RA=;
 b=ZCDejV/x4QvsCFxs6z/NRbmN4WU3+fe+0k7RiTV4DruBMFBZhZg7OJqBjaLCds+A8DKkZ6
 yqK5gkgH4AnWyTawcS3lGnZbiVz5iiYy2yiaXD35y3MZdvo6Dncmw2ZJCR4OW8qOkd/IbZ
 /lQ8O9eO5IU6mqUZ+qeW+CFavTpsDR4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-2F715o06OiaHoQCGiEqBEQ-1; Mon, 08 Jun 2026 04:22:37 -0400
X-MC-Unique: 2F715o06OiaHoQCGiEqBEQ-1
X-Mimecast-MFC-AGG-ID: 2F715o06OiaHoQCGiEqBEQ_1780906957
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4908af8d7f9so23093815e9.1
 for <intel-xe@lists.freedesktop.org>; Mon, 08 Jun 2026 01:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780906956; x=1781511756;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9STVIInTtPaSxierXXSltgKQhrdbFwvIMh0XKlqV+RA=;
 b=bGZ2kbaWauyu8lLNYHz+BdV0ORMVPzqX7o+C/139RFiypgnFEWNXV9xbDyzcY1jU/9
 rQqTyYkkVsz6V+6UgGi23WcGVI4uvsBX8cxn/5GB1hRu6UAOKNAoHPLucJp/dbvAkPTw
 69lVBES+GxRIc657kmkvKMH//4Bga6RF2zZUJH94lympQcqRNuujZCQLdqzHSpiMzwE7
 FJtX+Dh1jSYvwoiD+MaE/LoBjUziBKnHDZjI+KENS+SeORQUaH6m6dC92EB8EkjYnNAJ
 nWVzDzr9Di+UlkPdLqN9aY8XpjRCNznQ5O8XyOcMqeCQOT+mBv14elQ5KtP+WrdFE+Gf
 nYow==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ImQ6jQz9P+DBYZjtLyrPnZZzlvreP+iO+BFHKski3xPjHwtdnxejCGp4goO+M9LsACR+eDhxROQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkENKSyxUw6/TvXOtBj4jFvdx20IeCWHIyVvOkIL60wOFA2YyQ
 XCV+BmVL1P6OVFgGf7HJfSyICHYsP0DZo8nVVbFfqxO5DemYJvtCiHHGmVEEu4hb5ftMr3DRAQM
 l8y4cuC/veAUJAhVapjl7VflrZAsLiNCX+RkKQvoLTaFfi2eVR27QDbv2gdhglnLL19Dv
X-Gm-Gg: Acq92OF7aRy10Shs2qTGsPAaghlZ+zGA3bPRpjpBziaX9iUuCAAbc8DrOCfeW0+v0Hw
 H2IAg26L9K+M1GWh4pYkbjECm+d2ERE209NNK7B61rF/rMhGNIBGROjfYckaF9OmJFP4gONzuG6
 6yi2hQethFO0vCG4Kf4CAyIriHXze709JlopJq4Ew0lvtYwkLpsIwsp7Au+SEuEjAI7f+pXrbTE
 ziWlplRQ53S3yhK0NRvlIzNgO67YXtW1NUzw4VzW5ng2SR/B5uNqLLd0HY3ZXHOFl1pq6OrmDFd
 FQ8hoOVDT0hKfDlj2B3sT1w+Lp8HOp+UJsE2rwz6KVkTJr2YKGCpkUMkt3SQCKQqFXtYZUU0Dl1
 JbyrzNUGwOTsKFqNOoQw5mJHLqOMnCfEzVPZwSpFSDJrkoZoQXWg7lljrOUgFH+Ag4pYhrsws
X-Received: by 2002:a05:600c:81ca:b0:490:484b:bf41 with SMTP id
 5b1f17b1804b1-490c2560445mr212703395e9.6.1780906956603; 
 Mon, 08 Jun 2026 01:22:36 -0700 (PDT)
X-Received: by 2002:a05:600c:81ca:b0:490:484b:bf41 with SMTP id
 5b1f17b1804b1-490c2560445mr212703095e9.6.1780906956287; 
 Mon, 08 Jun 2026 01:22:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ec71:10ae:399e:d3c8?
 ([2a01:e0a:c:37e0:ec71:10ae:399e:d3c8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3b5b82sm405595075e9.1.2026.06.08.01.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 01:22:35 -0700 (PDT)
Message-ID: <77726619-47a8-4d3f-b8fd-14b885805be4@redhat.com>
Date: Mon, 8 Jun 2026 10:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/xe/panic: store fb bo in struct intel_panic
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <cover.1780394867.git.jani.nikula@intel.com>
 <735c3f18212207db63d71364d6a8569480c81b42.1780394867.git.jani.nikula@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <735c3f18212207db63d71364d6a8569480c81b42.1780394867.git.jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Zmgqi03dIusyiTwRIMvej821M3pzx_gKFO6C6kuDi0_1780906957
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 02/06/2026 12:09, Jani Nikula wrote:
> Drop the dependency on intel_fb_bo() and intel_fb.h by storing the fb bo
> passed in the setup hook to struct intel_panic.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_panic.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
> index d7f456eec597..4b86760ec00a 100644
> --- a/drivers/gpu/drm/xe/display/xe_panic.c
> +++ b/drivers/gpu/drm/xe/display/xe_panic.c
> @@ -6,7 +6,6 @@
>   #include <drm/intel/display_parent_interface.h>
>   
>   #include "intel_display_types.h"
> -#include "intel_fb.h"
>   #include "xe_bo.h"
>   #include "xe_panic.h"
>   #include "xe_res_cursor.h"
> @@ -16,6 +15,8 @@ struct intel_panic {
>   	struct iosys_map vmap;
>   
>   	int page;
> +
> +	struct xe_bo *bo;
>   };
>   
>   static void xe_panic_kunmap(struct intel_panic *panic)
> @@ -38,7 +39,7 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
>   {
>   	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
>   	struct intel_panic *panic = fb->panic;
> -	struct xe_bo *bo = gem_to_xe_bo(intel_fb_bo(&fb->base));
> +	struct xe_bo *bo = panic->bo;
>   	unsigned int new_page;
>   	unsigned int offset;
>   
> @@ -93,6 +94,8 @@ static int xe_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *
>   		return -ENODEV;
>   
>   	panic->page = -1;
> +	panic->bo = bo;
> +
>   	sb->set_pixel = xe_panic_page_set_pixel;
>   	return 0;
>   }

