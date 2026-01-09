Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF155D16810
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 11:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F2210E89F;
	Fri,  9 Jan 2026 11:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aKOO1ICD";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61ADE10E8A0
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767956963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WLh4YdMT4BQhhiGpX2c08r18nWKZ1SS4NAmL7UFi+k=;
 b=aKOO1ICDaLzOW/be1m+BMMUZTPefN/5RZwFT8Z3Rhslz6wNuuZ0TsgxyokgrHGQbdCGOPw
 uZKJBfsnUalWPlwOqQqnR621LD/7M+w368DBtFlh0TiENOpLrgm0Z1LJOJ9zaIKzkbE+85
 PPlYs46Ze8+DG7ZMGs2g59ywtq0I7fo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-haqPwinIOI-y9QpGSyE6dQ-1; Fri, 09 Jan 2026 06:09:20 -0500
X-MC-Unique: haqPwinIOI-y9QpGSyE6dQ-1
X-Mimecast-MFC-AGG-ID: haqPwinIOI-y9QpGSyE6dQ_1767956959
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-59b67b93cf5so3103618e87.0
 for <intel-xe@lists.freedesktop.org>; Fri, 09 Jan 2026 03:09:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767956959; x=1768561759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+WLh4YdMT4BQhhiGpX2c08r18nWKZ1SS4NAmL7UFi+k=;
 b=Gom4SslKyp/RDG+j/A2wZ6dGjnYy+s5bIEKZGQxa6p6XkPo1hyTbObVOPXRCTSYxTb
 /gOCa3eDCsQlrHC7fvYLxiTm/+ao2y5EmSG3GW0/U/u9Q/DSst3qBEJIf+iyh/DyIPRg
 4RzBalJ7G7H5H/CD1kbSU0vULIiyjU7FYCyfDhd0lwIGeWM1K4PFBbpApH4eO1QN/pLI
 G93M9/4Bv4XrVbPWMuLMryOo+COpxK+sNX6gNjmnqP8wmKDbTeiTKPK+5m/irc2F3T4V
 a2wfdi0hFnakVFwyjAl2MmXeIoFD4ACwFO5ouO4RAgt1Ei0WlYPDCY+YLIaMJRpytE7n
 iouQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo8AjlPI+tH+rvxP/qVI22Dw4oG1nJfdqmRmtW17s6NZ2tup6ClSqw5NxywwD8SSdeLLpF4b/MmQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO5DvRfzCXPcLaD5S7zmsAZMTYqEvQQ6eg+0mvdKi3fOIVEbU9
 a5KX4ds0b+OZ+GcKUWkn8kcI9JOu2kGzp8PIe8SvCDCZ/VXG8O/OhTUDOWiIC/vvJCX2crrRYka
 Dv2hNfTyKjhfK3auAprq5xp5UwFx6UyOYZSuS3gjonua9bYk082PNoBTm+XamNaaqwfo=
X-Gm-Gg: AY/fxX7qfColSnNKeOvXNxsDZ10GN1iXLCTAbyq4/yBJuOwRfMtl0ZZ2XvoHJFVJTSI
 8jLR4asB+WbRWlV9JbKJNOURFS/6Lf2uNTw3luSZtTm+w63DsVYBXwhqvHtMVHCslGMAhkf3r0/
 JaSjkKSfVaiVJVPKfyh8p+Jbp76j4o845VHHrnCfHca/ZpRvlObzuz2jCOaJjaqFRKdSiNtG4Xg
 KJWJdgP49yY4O0IU0cJ4JY2zoTwJRNeLZ6/YIn9Mnv5e5nhPgydmGxszySmnzM9NnYsUN7qkDiT
 LTVoZ6oqS5sDIc2jqrNjabZoLWNhRinDIQQIbkzVG6OVE1Wq8ZQOwGXgAVjQ3yzPTDWDWvtHt6A
 EYOszA6r5oZnM5FEhj+Vn0f/ZYf2HJ8JETmE=
X-Received: by 2002:a05:6512:138c:b0:595:840c:cdd0 with SMTP id
 2adb3069b0e04-59b6ef23821mr2942326e87.2.1767956958654; 
 Fri, 09 Jan 2026 03:09:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Kdn6xqqEz7oS8njPdOYi3SCUUHgKoVYObUp3Vur8XucGkM8H4lTSJgH2gDE+3acZOyL3Ug==
X-Received: by 2002:a05:6512:138c:b0:595:840c:cdd0 with SMTP id
 2adb3069b0e04-59b6ef23821mr2942314e87.2.1767956958199; 
 Fri, 09 Jan 2026 03:09:18 -0800 (PST)
Received: from [192.168.1.86] (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm2716455e87.42.2026.01.09.03.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 03:09:17 -0800 (PST)
Message-ID: <d1d80b81-678d-4d28-9ac2-95cb74824e73@redhat.com>
Date: Fri, 9 Jan 2026 13:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] mm: Split device-private and coherent folios
 before freeing
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Balbir Singh <balbirs@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Andrew Morton
 <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-4-francois.dugast@intel.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <20260109085605.443316-4-francois.dugast@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6DJK5X9bE8b_rTt3PV0aH1XOE00PpBCR1d1g4DTegq8_1767956959
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 1/9/26 10:54, Francois Dugast wrote:

> From: Matthew Brost <matthew.brost@intel.com>
>
> Split device-private and coherent folios into individual pages before
> freeing so that any order folio can be formed upon the next use of the
> pages.
>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-cxl@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  mm/memremap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 63c6ab4fdf08..7289cdd6862f 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *folio)
>  	case MEMORY_DEVICE_COHERENT:
>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>  			break;
> +
> +		folio_split_unref(folio);
>  		pgmap->ops->folio_free(folio);
>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
>  		break;

This breaks folio_free implementations like nouveau_dmem_folio_free
which checks the folio order and act upon that.
Maybe add an order parameter to folio_free or let the driver handle the split?

Thanks,
Mika

