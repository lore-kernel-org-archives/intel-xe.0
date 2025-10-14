Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BBBCCD190
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 07:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50DE10E566;
	Tue, 14 Oct 2025 07:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OilukKMS";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5274510E565
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760427235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2f+TEVmNHcIZWSH2C31Ng9eliwbtMBD5xTQThZ/PZk=;
 b=OilukKMSu42pV46NBFqbnT70tAnBSPt39yYIoREjDrDjti0kgBDOh0yIV/nOnfvaMkI0Uh
 ajmf39v7pWsGLFvz51N1b/n0KAF1fHu23RMdqf6Y4/uN25JS5dU9AieDfJV9B7EwGtce8L
 Bhuwi0MSeep25QnW19JUqRvEGOeF3IQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-JSAn7THyNXicKmW-QG5sag-1; Tue, 14 Oct 2025 03:33:54 -0400
X-MC-Unique: JSAn7THyNXicKmW-QG5sag-1
X-Mimecast-MFC-AGG-ID: JSAn7THyNXicKmW-QG5sag_1760427233
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e3ed6540fso33512125e9.0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 00:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760427233; x=1761032033;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G2f+TEVmNHcIZWSH2C31Ng9eliwbtMBD5xTQThZ/PZk=;
 b=bNXNUvjueEOdsGp1gkkHGlI7PtTLfrrrWjSqCKXIA4YCRKQOiB+rhnSR0j/yBNn1qU
 YuTpKJ+3Xcwt7txYQMEwepIK+NL7/xAfttqNYfFeUU+2NAwKlEzEsd53oQ0qoZDxg+u3
 36IevmHymQcLJT3qhQW7KtZL3nSsBbN/k3zRRifiKM5U3iRdjDgw2aFRubHsP6aO4H9C
 zWHnge3Z/9CQm3/e8UuuaSsVm0dQfF4jZjxOvdo1x3i9C69UesLu++K9bvQQWEnjrK/s
 leV79etKiMc3I6upAOGSQLzbAuVGfrCuSDS3e+CSXPIe5EUBfxzvKadmJPYx6HpVFIJ9
 jFqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv1IbyuTiN9jDC0JFpZTm3TanBiRwjGmRlZ36tulpZnYNuo9ylI7+on9eHwxl1HtgMz7O39gwhmQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIKfvY9hgvTXorI8BGQu3woaIBvE6CkxEAv+dT8XBZE4eoeKJ5
 N/bVLhFhWgcZP7RQaPQOEYxUvyCQnSGSERiQsS7Hn/Uv0WTPBAaiUB+cpJfv9U8bMlrZ64WjFMg
 nccyanCnwAZykcChT2xtkyS//HlhUtQFGoWsrOk3R4KAx+OOdj/vEkqHF53xYbQvgmpm0
X-Gm-Gg: ASbGnctGRS205ELJl4xnnpIKdg+TXmch7ImRUeSJlYyjBKT8NlmSYpOgZ+4WSvwpdni
 97NpxknCpgAyXK0LeiMi0Usly4DbnzYJTNIvOezvfb/rgyi7I4zeEf4uEjoMRHhp0sebHSutRTc
 1DZ0h6MR1HUZ359w1/L/y+H2ofKaDtnGK9JbaCMomZ2X0bPYBsDrAzPrptv8vZpxEk2Pe8C9z0e
 2mRJkaPe/OcnprEJnc6zgnupuvNdLtZ36bYWhKR+BubioVa0AVDTz7yfaLaHUQYoe7GeZXbMOy/
 naHzRMLt983eKsGc+jCSqJzMKbZe4mN5MCdEZVhT6LRDEv9dByEl2Ji1ZvDPyzwdCHIYRtU9E+N
 M1Dr+
X-Received: by 2002:a05:600c:1277:b0:46c:adf8:cd82 with SMTP id
 5b1f17b1804b1-46fa2952c02mr135681055e9.3.1760427232807; 
 Tue, 14 Oct 2025 00:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBeNo7ZlnJvZO+4tdhdDmG+vIUKT7nCznXOA5q9opUrokbPvd9TwG1AFWjfUcvv1KmWXVDOA==
X-Received: by 2002:a05:600c:1277:b0:46c:adf8:cd82 with SMTP id
 5b1f17b1804b1-46fa2952c02mr135680875e9.3.1760427232370; 
 Tue, 14 Oct 2025 00:33:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489ac60sm230694605e9.16.2025.10.14.00.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 00:33:51 -0700 (PDT)
Message-ID: <335fdb74-6d43-41e0-9774-eb57f425313d@redhat.com>
Date: Tue, 14 Oct 2025 09:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/client: Remove holds_console_lock parameter from
 suspend/resume
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, lyude@redhat.com, dakr@kernel.org,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20251001143709.419736-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251001143709.419736-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aoD5sT0CU_PsgjDp-14Kh8IgKubfB0UAqxPn8_lukcA_1760427233
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

On 01/10/2025 16:37, Thomas Zimmermann wrote:
> No caller of the client resume/suspend helpers holds the console
> lock. The last such cases were removed from radeon in the patch
> series at [1]. Now remove the related parameter and the TODO items.
> 
> v2:
> - update placeholders for CONFIG_DRM_CLIENT=n
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://patchwork.freedesktop.org/series/151624/ # [1]

For drm_log:
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

