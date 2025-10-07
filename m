Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1F4CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 10:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDA810E5CA;
	Tue,  7 Oct 2025 10:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C4qLiMxk";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4366610E370
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759832028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=dtANHMhn4NYfEUWXTBrWybwxcyGV7aE9tri3mnTg9D0=;
 b=C4qLiMxkC8DPAdLrrrAvo9YXE+XyL9L9Mnx3Utc5BY3TaiyfkRbQ+10ecpM7sEeMFml2R9
 9Py+qnNHr1suKyp3E+doaRo1UhUUuO0MtNvZD4THXCZ/r2MfqLqtPPYmQqe4E2cqcyH8UG
 Dv3m2bly8+bHMqw6627MVAyOh6HT5qU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-fEuSxc4gPo6jR-ON4I_pLg-1; Tue, 07 Oct 2025 06:13:45 -0400
X-MC-Unique: fEuSxc4gPo6jR-ON4I_pLg-1
X-Mimecast-MFC-AGG-ID: fEuSxc4gPo6jR-ON4I_pLg_1759832024
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3f384f10762so3102911f8f.3
 for <intel-xe@lists.freedesktop.org>; Tue, 07 Oct 2025 03:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759832024; x=1760436824;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dtANHMhn4NYfEUWXTBrWybwxcyGV7aE9tri3mnTg9D0=;
 b=NVq9NQQayfbgc6ZM+gNcDIl4W6LMSQw5gR8NStnYNs7k6DNq5Y9j6H+NY5iTbGfn/Z
 BMgtIxWgp2XNhDMBN2i+t8zNm0lF8oD/zZ7Gxgkb9zKq/sd4KnlSFtU/Aarcu2Z92Vhq
 KuzIWbICPW9UcG9lMmht3zR4z7kdmZg+5YQ9Rxkyo0jopRm0GnIHDm4knNb13Uayf3/O
 GUE4wg7bltjFuRWeUz59ZjU0yt2tFOfJJ7JAYwpCLxKNHoxdDYmjrVI811iNmOjwNcCl
 j6qdCJ+ropWKwWJ0EjGE0rj/41DXm3IqgWNLbg91YyiCyjPnqexopu8gzeOdcWqs28ZT
 gsDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaTuN3ZLws8b36qmba/bD7ZLrbYO7Nat90QwC4ZE/0aTfGbDhpduUDTE6TsGzl13rpsvOlXN2c/Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySG6eaB0VmZApe9zs4N45gO7fIlnWrrysr5DKzPu0DfwD7KTcs
 C6pv9xZmkZiWtM8ksu3IOKmJHReW5ypKIv6q2kR1obZjEbGOy+utNiOIfun0ALgkWg1whiKnaBl
 wkLt/gKKhakHRr5YC04U+6VlUtYiY5pfknzmiGCsbsHnVn6WZ2spGI0FXLu8jr/Qb30wV
X-Gm-Gg: ASbGnctDjS3cizpebSS2N6oR6Py8h466a4WaqMxoE3gQKmioWG6uO/+dNcdFHQNsub3
 fQX2eTssHSmrTZ/5mIb8cBdCvHqF0KSv/chf/epRd1jI9B/8f6G10rQMd12IiqXncLTgJP0en9c
 Hvj/jRhIib7X4eM1YvKLkfBieU/FLPryKuySo+CXkHYBZGFu5YQfEKYuU75mrhY9Je3qUdNAY3F
 whJTEzB4bqmfN1CKRVl/7bKeLNLuu6Bw7YQb0JWYWdcLviwH0w1m4fX3pa36SGM7j8mai4dLVBa
 rPyYAfI5gsRwaa4alg/Kc/M26IX3alSqRv32/JPj9IjYOpAog3MjfZJj8WaLe8mdYP6tt51tIIk
 etfYQLAxB
X-Received: by 2002:a05:6000:43c5:10b0:3e4:64b0:a776 with SMTP id
 ffacd0b85a97d-425671b26cbmr8332531f8f.52.1759832023880; 
 Tue, 07 Oct 2025 03:13:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0WEYQCR6DFeiJ0wRMWYGtCd1TfooQstoN/GViL2/1Ggzolv2CmH4LWn2geZLc+8nvNyFrpA==
X-Received: by 2002:a05:6000:43c5:10b0:3e4:64b0:a776 with SMTP id
 ffacd0b85a97d-425671b26cbmr8332514f8f.52.1759832023401; 
 Tue, 07 Oct 2025 03:13:43 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-110.customers.d1-online.com.
 [80.187.83.110]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f4ab0sm24803534f8f.52.2025.10.07.03.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 03:13:42 -0700 (PDT)
Message-ID: <4c3b148e-9019-40db-8ca8-2166ef011c75@redhat.com>
Date: Tue, 7 Oct 2025 12:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] bad error return in walk_hugetlb_range()
To: Dan Carpenter <dan.carpenter@linaro.org>, intel-xe@lists.freedesktop.org, 
 linux-mm@kvack.org
References: <aOC9HP6nB0C45QnS@stanley.mountain>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aOC9HP6nB0C45QnS@stanley.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zDmymr1YUATUZGL-Cx55CqOVWaMnP7nZeONsPnAx2Tw_1759832024
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 04.10.25 08:22, Dan Carpenter wrote:
> This is really old code.  I think it's a bug in hugetlb.
> 
> 	drivers/gpu/drm/xe/xe_gt_pagefault.c:353 pf_queue_work_func()
> 	warn: passing positive error code 's32min-(-12),(-10)-(-1),1' to 'ERR_PTR'
> 
> mm/pagewalk.c
>     319  static int walk_hugetlb_range(unsigned long addr, unsigned long end,
>     320                                struct mm_walk *walk)
>     321  {
>     322          struct vm_area_struct *vma = walk->vma;
>     323          struct hstate *h = hstate_vma(vma);
>     324          unsigned long next;
>     325          unsigned long hmask = huge_page_mask(h);
>     326          unsigned long sz = huge_page_size(h);
>     327          pte_t *pte;
>     328          const struct mm_walk_ops *ops = walk->ops;
>     329          int err = 0;
>     330
>     331          hugetlb_vma_lock_read(vma);
>     332          do {
>     333                  next = hugetlb_entry_end(h, addr, end);
>     334                  pte = hugetlb_walk(vma, addr & hmask, sz);
>     335                  if (pte)
>     336                          err = ops->hugetlb_entry(pte, hmask, addr, next, walk);
> 
> The ->hugetlb_entry() is implemented by two functions which return
> true/false instead of error codes.  Smatch thinks this 1 value gets
> propagated back to pf_queue_work_func() and results an an Oops.
> 
> The two problem functions are hwpoison_hugetlb_range() and
> pagemap_hugetlb_range() which returns PM_END_OF_BUFFER from
> add_to_pagemap().

hwpoison_hugetlb_range() seems to behave just like hwpoison_pte_range(), 
returning "1" if check_hwpoisoned_entry() returned "1" -- if we found 
the entry with the problematic PFN and can just abort.

Staring at kill_accessing_process() that ends up calling these 
walk-functions, that seems to be correct. The value is converted to 
0/-EHWPOISON, all good.


pagemap_hugetlb_range() can indeed return either 0 or PM_END_OF_BUFFER 
obtained from add_to_pagemap().

But that's the same behavior as pagemap_pte_hole()/pagemap_pmd_range(), 
so that's nothing hugetlb-specific.

pagemap_read() does the
	ret = walk_page_range(mm, start_vaddr, end, &pagemap_ops, &pm);

After the loop, it does

if (!ret || ret == PM_END_OF_BUFFER)
	ret = copied;

So I don't immediately seeing anything wrong with that?

-- 
Cheers

David / dhildenb

