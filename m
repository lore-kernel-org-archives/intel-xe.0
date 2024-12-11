Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E32EE77188
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 13:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C9610EDD1;
	Thu, 12 Dec 2024 13:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gr5UuMp6";
	dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C93310EC1A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 21:25:24 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa66ead88b3so814952666b.0
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 13:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733952322; x=1734557122; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NiFXx0VcxNc6mbyaX28E5l+Z+JD1Zr+bEvTPIoK/nX0=;
 b=Gr5UuMp6sEyxhvJ3NfynHOPS58hAkVR6wrzMqSBMlCuF2JHbd+DIQDF4EZo9zwUHvv
 x861GCwjPgmtf362XGg1P2Ck/xh84bUjxBI8lTDfU22AfWZ0+DP5FDwLoYCG8l+TN47C
 2SumEZgVf6Ecee2DnRkQOBHW5yhJTaG7YAn6cCUm5qtYMKHkCyfMT5E7x30D2S4It48M
 NXlOf2KU0lW7zWJI4ptqBvHajcmQI0NA3ML1pfleEJtBSwq4qfh0AgkXx+gkq0Om0FKt
 5Jc6/QZYW7xrGv4eEDvzclZEyx3D3M9xGoq8VbkYbm2tU4ANviYV5v3Zxe1d1YOgjnOc
 7DxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733952322; x=1734557122;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NiFXx0VcxNc6mbyaX28E5l+Z+JD1Zr+bEvTPIoK/nX0=;
 b=xQ8s4TxGmdSCEXuV0b4ahRJUAgtEo34Fkw67ZByv1vYdDffRvEeiddZB1FeGwTwqki
 MOyxw5edg5giQmBJpgcpmsm29p3akZ9kD69dfCtwRE+1Rw5+OGJu8cAtA4eutlZvl6G8
 mOzQGo9VkuKsr6VEnAbMQpVrWbiyUrrjiEjio/gNIXPhh1+onFblvSa7vpIsaXnTJtOY
 +Wn1HgHKzsJQLF8z6gtBBNG2aeJIzZl1i+zHY9hSFheT3WOyUFteKfqzfQcLi9Qb1uwa
 B858kD4USMUGXLnAL7msEqNh5ttE9qre14n9lAlVn8yj2twQ0ZEsfjw3c5bLxed5PKa5
 VDFw==
X-Gm-Message-State: AOJu0Yy1axwTTdifklHKiD1vMy2ghiZkxYNz2oK6vlVx2fmTJdBw2ZS1
 Z900Gb2JJvxFIpc70iOhyMhRpOeK9zishCCAI2qzN9iYYu+r6DMDIu1u7Q==
X-Gm-Gg: ASbGncv0ovRBy933v7tNQ3fyrljdO5ZomwcjeQ0JH8sHysmmYEvdLnx7gI7fxItuZvd
 gI/uSJBZW6K0a6r0z8+F/lmsU+3xnWTgAPxWqsonrhOFl5DdAYFpetb+a49kbHKKB9N5j/mDTl/
 W/xEcukheY/jpKyA01kkehU3M50LDsSVlBmk4NwQnGHCVHs/Y3SKasA9qgZ1gcu4oYrl6zTSXpn
 J00rpYr9VWswjtc5FhstXZBCWksbCIsLpLG+pPXxye4o/iVBNjgsslaTFtDFudx9tTyYS6FcH1c
 rEI=
X-Google-Smtp-Source: AGHT+IEZXjD2OBMbnIMn2i+NMY574iLFCjHHILg1s8JtKbih47YyDe6rHY2SadeFtdswJUtANSKA9Q==
X-Received: by 2002:a17:906:3cb1:b0:aa6:abe2:5cb8 with SMTP id
 a640c23a62f3a-aa6b13f942bmr352903866b.60.1733952322313; 
 Wed, 11 Dec 2024 13:25:22 -0800 (PST)
Received: from [192.168.178.20] (dh207-42-21.xnet.hr. [88.207.42.21])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa62601b54dsm1033639466b.94.2024.12.11.13.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 13:25:21 -0800 (PST)
Message-ID: <823a1ecc-58ca-4c4a-b973-b41682be8f2a@gmail.com>
Date: Wed, 11 Dec 2024 22:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe: fix the ERR_PTR() returned on failure to
 allocate tiny pt
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241121212057.1526634-2-mtodorovac69@gmail.com>
 <Z1cfti-AJCku7BWS@intel.com>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <Z1cfti-AJCku7BWS@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 12 Dec 2024 13:11:48 +0000
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

On 12/9/24 17:49, Rodrigo Vivi wrote:
> On Thu, Nov 21, 2024 at 10:20:58PM +0100, Mirsad Todorovac wrote:
>> Running coccinelle spatch gave the following warning:
>>
>> ./drivers/gpu/drm/xe/tests/xe_migrate.c:226:5-11: inconsistent IS_ERR and PTR_ERR on line 228.
>>
>> The code reports PTR_ERR(pt) when IS_ERR(tiny) is checked:
>>
>> → 211         pt = xe_bo_create_pin_map(xe, tile, m->q->vm, XE_PAGE_SIZE,
>>   212                                   ttm_bo_type_kernel,
>>   213                                   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>   214                                   XE_BO_FLAG_PINNED);
>>   215         if (IS_ERR(pt)) {
>>   216                 KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
>>   217                            PTR_ERR(pt));
>>   218                 goto free_big;
>>   219         }
>>   220
>>   221         tiny = xe_bo_create_pin_map(xe, tile, m->q->vm,
>> → 222                                     2 * SZ_4K,
>>   223                                     ttm_bo_type_kernel,
>>   224                                     XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>   225                                     XE_BO_FLAG_PINNED);
>> → 226         if (IS_ERR(tiny)) {
>> → 227                 KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
>> → 228                            PTR_ERR(pt));
>>   229                 goto free_pt;
>>   230         }
>>
>> Now, the IS_ERR(tiny) and the corresponding PTR_ERR(pt) do not match.
>>
>> Returning PTR_ERR(tiny), as the last failed function call, seems logical.
>>
>> Fixes: dd08ebf6c3525 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Philippe Lecluse <philippe.lecluse@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> Cc: David Kershner <david.kershner@intel.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
> 
> I clean up this cc list. no reason for this simple patch to have this huge list.

Indeed, Sir.

Please proceed as it seems fit to you. I think I used the get_maintainer.pl script,
blame and the Cc: list from the fixed commit.

I thought that "more eyes see more", but this is indeed a very small patch (+2/-2 lines).

However, the bug finding tools make me find bugs in widely spread range of drivers,
and I do not expect to understand +30 million lines of code any time soon :-)

> I also fixed the checkpatch complains in the commit message.

I am sorry for the trouble caused.

> And pushed to drm-xe-next
> 
> Thanks for the patch.

Not at all.

I understood that patching drivers must go through rigorous scrutiny.

God bless and I hope you'll have great advent holidays.

Best regards,
Mirsad Todorovac

>> Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
>> ---
>>  v1:
>> 	There is also the logical problem which this patch developer is not qualified to fix:
>> 	first the fake pt tries to allocate size of (1 << (XE_PT_SHIFT=12)) = 4096 bytes,
>> 	then "tiny pt" tries to allocate 2 * SZ_4K, twice as much. Is this what was meant
>> 	to accomplish?
>>
>> 	drivers/gpu/drm/xe/xe_bo.h#L46:
>> 	#define XE_PTE_SHIFT			12
>> 	#define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
>>
>> 	include/linux/sizes.h#L23:
>> 	#define SZ_4K				0x00001000
>>
>>  drivers/gpu/drm/xe/tests/xe_migrate.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> index 1a192a2a941b..3bbdb362d6f0 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>> @@ -224,8 +224,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>>  				    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>  				    XE_BO_FLAG_PINNED);
>>  	if (IS_ERR(tiny)) {
>> -		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
>> -			   PTR_ERR(pt));
>> +		KUNIT_FAIL(test, "Failed to allocate tiny fake pt: %li\n",
>> +			   PTR_ERR(tiny));
>>  		goto free_pt;
>>  	}
>>  
>> -- 
>> 2.43.0
>>

