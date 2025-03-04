Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79469C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 21:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEF010E6BD;
	Tue,  4 Mar 2025 21:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XH2/ztvF";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD67210E6B8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 21:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741124340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XPWOo20A/TNlKmMNu2g+KBDtR4C82uP2s4+Ztzk3PJo=;
 b=XH2/ztvFLiNb7yYGfNHPiXFkS2lZ9SurBCszoXc8g+5gio0lwgA1odMM6hAuqew3LnHEI/
 TKV4MVlpJV4qjPDF5ai6q75gsvhMTiqpLD4kCVG3YgAOi33Kjq1M8GQtuFRDYEXpezEm4G
 ZHaBiPJpGwKS+qCdy7TUSQuZrXmhXQo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-tNRhX_kjOuOkLTYKZDDlQQ-1; Tue, 04 Mar 2025 16:38:58 -0500
X-MC-Unique: tNRhX_kjOuOkLTYKZDDlQQ-1
X-Mimecast-MFC-AGG-ID: tNRhX_kjOuOkLTYKZDDlQQ_1741124337
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43bcb061704so6561695e9.0
 for <intel-xe@lists.freedesktop.org>; Tue, 04 Mar 2025 13:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741124337; x=1741729137;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XPWOo20A/TNlKmMNu2g+KBDtR4C82uP2s4+Ztzk3PJo=;
 b=wmWu1GFSruEbEOzd1R52pmeYa+6TJ2C+9x6zz6TGlayoWIMOs5q7tVca+fzzrBS1uG
 R555K0Sk/13zEi3Xu9oTh5fm9eL5OL2jRlWl9Bf9kclxXZlytup26fzEkj/GrJ6eQDId
 q6JWNfc4nHMWT3yw7nXYoSOiXQz1yIm5hXIP+EW95F3RHY+5qh3QtrkosvDSEnkMD6yV
 KKfeohE9+UXTV36Roi0QAP3jlbJcD7Og5HYmJr4IEc4/KTeKQNUYE/2A34/JVsPN9ZNh
 0aOpzU4N6tUJ8/B/tYvxHfjaHPP2TLHbGdrqaI4RlUqxZm+FymPY54pbM3o6cAqCNkkf
 9kig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI3OInvqr8+eN0R1qdoWlxVy2LxvsE/FbxTM63ZtZs8u5x66kPIRn4F42bZW8J/KTjj8ce7fHgOA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye1cvPdmnWbnHn6rCUf37dneMVW9TUpatCc7Ade009uYWBeV9i
 hrriMB24v69ee85IQYBS7bMYdxzMWTajFkOZg8SnJAzn7J4oa6JjOn1qTIWY8qxGQ0GglE/Tm8b
 um4tuG60RA/5v10nM261CiSeRaaqQiAXd6X7ldptw7sgUPRkEOcL+kh92gB4tb4D0
X-Gm-Gg: ASbGncsJ8Kk7XlxeuaE36zMZCEwxolzqrpvKaZaT4K/QFgGySnkA76HygU8bwtL2xRr
 7T5Bf5Am6MvTLoMsVrsnAZWMj1Y/afafLkfmOmren0cEdBFIDQ7MuyiBx+xAvvTzmYzf1ONNw1N
 6WDjE4TYWTCII4w+QC8Ua0ezKFQ0i9/AAtPygOyC3ZhTBY5LCvCAGOQ2SFIMaowhnnPvf6Lls40
 4elKwh4RTrn/BrQifq4s6Cbt56p4Jei2QDXdvFOkP3qILNEdyCt4NE1nYKcO2NAxGh7rO2SPqHq
 Ezq97WkZa89BMOVDKlWqLh50x0ERxrCAEJT7BfXWNfFqaNB4Nylcr7A=
X-Received: by 2002:a05:600c:3b17:b0:439:8a62:db42 with SMTP id
 5b1f17b1804b1-43bd29404eemr3185555e9.8.1741124337364; 
 Tue, 04 Mar 2025 13:38:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErZIgNQ7dxy87GX5JZluyg2tAe6QV0DeyMYaH13GUGrIhPllBBZ3ZaKJ2S30irYIqGcbgztw==
X-Received: by 2002:a05:600c:3b17:b0:439:8a62:db42 with SMTP id
 5b1f17b1804b1-43bd29404eemr3185365e9.8.1741124336980; 
 Tue, 04 Mar 2025 13:38:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc9c0fb1esm52916565e9.20.2025.03.04.13.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 13:38:56 -0800 (PST)
Message-ID: <6cfb66cb-fe2a-4934-9cac-982315583382@redhat.com>
Date: Tue, 4 Mar 2025 22:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] drm/{i915,xe}: Convert to DRM client setup
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20241212170913.185939-1-tzimmermann@suse.de>
 <de8325a9-49b2-48ec-ba56-4349140564b1@suse.de>
 <7ca7be00-f6d9-43b7-b3d0-0984306ac302@linux.intel.com>
 <084ab2f7-240c-45c5-8bde-7c551546d1ca@suse.de>
 <d85b9017-bf18-444e-8d94-8ff66a0d06d2@linux.intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <d85b9017-bf18-444e-8d94-8ff66a0d06d2@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PZeIsVvv_Nr-4RiGAk6w8qwOHDbQ0Iqj5dr2KiI1Lo4_1741124337
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

On 04/03/2025 20:40, Maarten Lankhorst wrote:
> Hey,
> 
> On 2025-02-28 09:49, Thomas Zimmermann wrote:
>> Hi Maarten
>>
>> Am 12.02.25 um 08:28 schrieb Maarten Lankhorst:
>>> Hey,
>>>
>>> I'll give it a spin on xe today. It seems someone already tried on i915,
>>> so I expect no issues.
>>
>> Did you get to test the series?
>> Sorry, should have gotten back to you sooner. Xe was working with the 
> series applied. :)

Hi,

Is it possible to also review and merge i915 vmap support?
https://patchwork.freedesktop.org/series/135554/

This is required to have drm_log working on i915

Best regards,

-- 

Jocelyn


> 
> Cheers,
> ~Maarten
> 

