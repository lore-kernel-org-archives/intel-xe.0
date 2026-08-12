Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ABBC5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 14:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A503010E415;
	Wed, 12 Aug 2026 14:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MeFkZ9PF";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E331F10E415
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 14:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786543643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gRtbmuUIT2xEHaBBjzuNZpDsU3g31gki1lemtjtVM+g=;
 b=MeFkZ9PFkUhB1zSOtXoX5g732bdd0AYQmZifOziyueaG2rS781IebS5tkc1evW53a7bw+p
 vFAamxzg+W8g5oZH3TgtKVGi5+QtOrIvtJGqv3FbRtgTNh7SUeKajjR4PLsZEFwwlmLx3Q
 qHav0njpnzU8x6DEceLISSiHuk/opZU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-MhDJL44oMBeBLhhDTayI1w-1; Wed, 12 Aug 2026 10:07:19 -0400
X-MC-Unique: MhDJL44oMBeBLhhDTayI1w-1
X-Mimecast-MFC-AGG-ID: MhDJL44oMBeBLhhDTayI1w_1786543638
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4997d718093so4108575e9.0
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 07:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786543638; x=1787148438;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gRtbmuUIT2xEHaBBjzuNZpDsU3g31gki1lemtjtVM+g=;
 b=UNEog8ROKFqTWSlymiJLccfcYM4B85ykrmdE5y8Qcm6bVf2GYlodQQ+3LVNP+U5tSw
 7jrvHIUFroEzYeLpuYvsJ6mD8z5cn3vYXna1PGJp1zSMN05+5NjutNqqr7vpiRQXz4Cl
 xMpmLZGymzwKzo7LhKEuIBkykF19lc/CUIh3jc9Wi7HY6XGoteEQJwo2sEHUyWN9MRiP
 awaXY6Ejq36FiIN3m3GMaCTBxVvNh/USbdASjduaNKdKzkX+FRecJ2fSfc/e1f+lgNhw
 HWbwWOE3wUd3qI6bKArT4WgpHYHDARLqT5N1fFlP/1HaELTEr9Itlwr2RB+iSPocZoNM
 QIoQ==
X-Gm-Message-State: AOJu0Yy7JJwfQ3Tie3rD9OwrHF079hG3wTJE4mkbjVeMeWDi3UA1RD7I
 x1QvrZBsnQ8CKVPsRF2pBQqh4GtZvTFyr/iLoPuGootdCSNrpdw2PZMnJ8UAdIhEgKVF6uEdiUt
 oFoXWyI4gMfC7mwj6MK3nbEOvmGLxYCfWB0qdo9BZGMTfdNLNnsGLoAgGpvaL4Y5sh9UT
X-Gm-Gg: AR+sD13xOY7Cwk0UsUyaqlkGfsMlcSe/Zr8dxntRsesUphZySTU4E/OXKQjhmKU8F9C
 W9+AHmAjQttz39H0iymI1iA/QD6zBtCjbOvZl8U0TXekY/KVBbyt9KlkCfaPlpHD1xXPqMFQoUr
 dSkp4xAHnD8MJe4jd83EZsDqd1tDzBFYr+VDF+xWCsLAw0P5InSrKSg7efPqIdcBIJ93pSZQrQE
 /LKs7Dj3PfCGlAHhqRHQzmgT3tEFNm7NAwRFIH4yAQgzuXbzin+XJic6Rj/IVJm+Qnv1oitERyI
 mIE/uEzjQ30X62GVJxOmLenwQIHnqNEqdLd5CDeM+JPAKGw0wOrfX42VYa6lPuar9AeFn+kq
X-Received: by 2002:a05:600c:468f:b0:499:4892:e84e with SMTP id
 5b1f17b1804b1-4997c14569amr57082785e9.11.1786543638291; 
 Wed, 12 Aug 2026 07:07:18 -0700 (PDT)
X-Received: by 2002:a05:600c:468f:b0:499:4892:e84e with SMTP id
 5b1f17b1804b1-4997c14569amr57081675e9.11.1786543637673; 
 Wed, 12 Aug 2026 07:07:17 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.115.27]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997b34afe3sm61862125e9.2.2026.08.12.07.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 07:07:16 -0700 (PDT)
Message-ID: <ffebbb7b-a4f9-488e-8834-199da3073b96@redhat.com>
Date: Wed, 12 Aug 2026 16:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Fix invalid kfree() call via __cleanup on
 pointer
To: Wentao Liang <vulab@iscas.ac.cn>, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ella Ma <alansnape3058@gmail.com>
References: <20260617142632.3298984-1-vulab@iscas.ac.cn>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <20260617142632.3298984-1-vulab@iscas.ac.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3SG3BzQjaQj5KueneFXJOn1xqMLemFvL-I6BSMopj_E_1786543638
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

On 17/06/2026 16.26, Wentao Liang wrote:
> The variable `buf` in `fast_req_dump()` is declared with
> `__cleanup(kfree)`, which passes `&buf` (the stack address of the
> pointer variable) to kfree() rather than the heap address stored
> in `buf`.  This would cause an invalid free of a stack address,
> leading to memory corruption or a crash.
> 
> `__cleanup(func)` is designed for value-typed variables where the
> cleanup function should receive a pointer to the variable.  For
> heap-allocated pointers, `__free(kfree)` must be used instead,
> since DEFINE_FREE creates a wrapper that correctly dereferences
> the pointer before passing it to kfree().
> 
> This is the same class of bug recorded in CVE-2026-45959 and fixed by
> commit d5abcc33ee76 ("crypto: ccp - Fix a crash due to incorrect
> cleanup usage of kfree").
> 
> Fixes: ea944d57eac7 ("drm/xe/guc_ct: Cleanup ifdef'ry")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index a11cff7a20be..73867a5cbe3a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -116,7 +116,7 @@ static void fast_req_dump(struct xe_guc_ct *ct, u16 fence, unsigned int slot)
>   {
>   	struct xe_gt *gt = ct_to_gt(ct);
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> -	char *buf __cleanup(kfree) = kmalloc(SZ_4K, GFP_NOWAIT);
> +	char *buf __free(kfree) = kmalloc(SZ_4K, GFP_NOWAIT);
>   
>   	if (buf && stack_depot_snprint(ct->fast_req[slot].stack, buf, SZ_4K, 0))
>   		xe_gt_err(gt, "Fence 0x%x was used by action %#04x sent at:\n%s\n",

Reviewed-by: Thomas Huth <thuth@redhat.com>

