Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC607F34C4B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 12:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EE010E440;
	Mon, 13 Apr 2026 12:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SB+LKMgH";
	dkim-atps=neutral
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C8F10E11B
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Apr 2026 04:39:49 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-12c1a170a50so2998691c88.0
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 21:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775968789; x=1776573589; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kRdR1dc5/UfNuJsTk7iiKeGwmqYxW3GpWumyMvQ9lak=;
 b=SB+LKMgHXGkveG5Q1oEfx5JIj5q6ru45/+0WlJ66mtPjwbR7kUDyZ7R/+nnRnqVV1d
 ZhYtTjz4I3QjX4WCUE59KfcLKh+NRiH1oRw8QK1gONmsT4G8w4VIvIEzQDC4+kByLQkX
 YlX6zioCFWxifvuh9clQGNswBfnhTvFlY6SDMpKhUKvh4ifyYGGhTKWoQgI6W6VI77qY
 bnlOuFEq5SC2ACtmr6qCb3oFgdW2e6L7F37nUQhamZ34F7BHLCPu2WaNVQlV0kfPwG1F
 FmbRhHeQ8pOOXsBsnXTufjslh04mq+52USYkSGvsvJjyNY1+qaIbYHWoCo03hEGGmIt6
 hTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775968789; x=1776573589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kRdR1dc5/UfNuJsTk7iiKeGwmqYxW3GpWumyMvQ9lak=;
 b=F+EABr9wbW5RzsbZZQsAYmGsYsHROoYIw9JyALFFmI1hyj8m4Afdfcfja9V686hhD+
 fMunAWlYOzQU0NHqwTQGzmcUMwDgGZkdBKgVA7budrH3OTCJn0GkEzo+MHCZuvhCQ/WG
 pW1anWLUrEvgUK4+SGN5vOeYfsobP7zJm6PNofP7ejA8jpm5gE3mGTtUlYXI7aExhIpB
 S7Icq1qRgGPPs/KnHOpYT8cVBZAxHO9p01Ka4zY7FPe6AjgvOrO+r2LwArToMfBpDJor
 kIp8yAvYiAsrh7Zz5KREDNSmH99LHoOo1KauNq0IW0SDmZTGCDbFLVeGAGsE0LwIm61B
 5U/Q==
X-Gm-Message-State: AOJu0YzWB97TdpxtVWMskEfqlGDmAVOkFVF/axD65+spoRWWAVqtvkHd
 fHt/3euQs5xpbBYubSt3COnOmbSVMDMdnD91VtJHutaIhKaL90ICJimu
X-Gm-Gg: AeBDies5VclXt7FrJMoPj9UEUyYDPwiU/qZz1VnMOXns8M8mp0+gt+QmPbEZt+oqj1x
 unz0xaECVaizw0jkBML5BdC9DD7BEX5FiVeGpHF1T0NWtXcDOhP25c8MJmNE73JM2xd1M3h5geo
 csY8LKzILZxWh26BFCCFzeEEBFgrph1g6nNCvh9UCKpKy8NCbIgAYLMLjuEl8jdp1IK/et6t4Pi
 pL7osz+z6IYkYLgmhHH1VeC2GvDJzQD3+Qp6H4msz30ym7rNfQnRUovmPnwoeQIVPM1y/Cp+H2l
 RDtLgwhVZjN4KOq3IOFJnwaJrscmJSw9InbN0MpdFq1E2JU5/oG2N8NBA0Bi+lXdVjeV6UV9Tg8
 jlTziz5tyLD9WEb8mu9gOh4CySGUXxr9ES+TyGa0jbGZCtjb0qiGy1uCAfS/R0e7hK9izi28UcG
 pKjcsPFWCjLtTHMSohW1ORiNB0+hIHy8jOv3cN
X-Received: by 2002:a05:7022:517:b0:128:dab3:f528 with SMTP id
 a92af1059eb24-12c34e892c2mr5118834c88.8.1775968788704; 
 Sat, 11 Apr 2026 21:39:48 -0700 (PDT)
Received: from fedora ([2601:644:937c:6c90::f8b0])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2d561bde70csm13449412eec.15.2026.04.11.21.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2026 21:39:48 -0700 (PDT)
Date: Sat, 11 Apr 2026 21:39:45 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/zone_device: Do not touch device folio after calling
 ->folio_free()
Message-ID: <adsiEY671D8mFZao@fedora>
References: <20260410230346.4009855-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410230346.4009855-1-matthew.brost@intel.com>
X-Mailman-Approved-At: Mon, 13 Apr 2026 12:26:28 +0000
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

On Fri, Apr 10, 2026 at 04:03:46PM -0700, Matthew Brost wrote:
> The contents of a device folio can immediately change after calling
> ->folio_free(), as the folio may be reallocated by a driver with a
> different order. Instead of touching the folio again to extract the
> pgmap, use the local stack variable when calling percpu_ref_put_many().
> 
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: linux-mm@kvack.org
> Cc: linux-cxl@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

With the cc-stable:

Reviewed-by: Vishal Moola <vishal.moola@gmail.com>

> ---
> Stack trace:
> 
> [  631.875165] [IGT] xe_exec_system_allocator: starting subtest threads-many-new-prefetch
> [  632.282992] Oops: general protection fault, probably for non-canonical address 0x900000000000000: 0000 [#1] SMP NOPTI
> [  632.293469] CPU: 8 UID: 0 PID: 59267 Comm: xe_exec_system_ Not tainted 7.0.0-rc7-xe+ #281 PREEMPT(full)
> [  632.316023] RIP: 0010:free_zone_device_folio+0x149/0x240
> [  632.339782] RSP: 0000:ffffc90023d1fd00 EFLAGS: 00010206
> [  632.344947] RAX: 0900000000000000 RBX: 0000000000000001 RCX: 0000000094472d4d
> [  632.351991] RDX: ffffffff8155c76f RSI: 000000006f2213bf RDI: 000000008e84943a
> [  632.359042] RBP: ffffea0ff4030001 R08: 0000000000000000 R09: 0000000000000001
> [  632.366094] R10: 0000000000000028 R11: 0000000000000000 R12: ffff88811828e400
> [  632.373145] R13: 0000000000000000 R14: 000fffffc0000000 R15: 0000000000100073
> [  632.380194] FS:  00007f2f0fdfe6c0(0000) GS:ffff88890a7e7000(0000) knlGS:0000000000000000
> [  632.388186] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  632.393870] CR2: 00007f2f002e90f8 CR3: 0000000106708002 CR4: 0000000000f70ef0
> [  632.400919] PKRU: 55555554
> [  632.403605] Call Trace:
> [  632.406039]  <TASK>
> [  632.408131]  do_swap_page+0x146d/0x18c0
> [  632.411938]  ? __pte_offset_map+0x3e/0x190
> [  632.415994]  __handle_mm_fault+0x6e8/0x8d0
> [  632.420053]  handle_mm_fault+0xbf/0x250
> [  632.423855]  ? lock_mm_and_find_vma+0x41/0x6f0
> [  632.428256]  do_user_addr_fault+0x168/0x690
> [  632.432399]  exc_page_fault+0x74/0x200
> [  632.436117]  asm_exc_page_fault+0x26/0x30
> [  632.440092] RIP: 0033:0x5587554ff70d
> [  632.462142] RSP: 002b:00007f2f0fdfc970 EFLAGS: 00010246
> [  632.467308] RAX: 0000000000003fc0 RBX: 00007f2f082e1fc0 RCX: 00007f2f12b3287d
> [  632.474355] RDX: 0000000000000000 RSI: 00000000c048644a RDI: 0000000000000003
> [  632.481404] RBP: 00007f2f082e1fc0 R08: 00007f2f0fdfc958 R09: 0000000000000066
> [  632.488450] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
> [  632.495495] R13: 00007f2f082de000 R14: 0000000000c00002 R15: 00007f2f1319e000
> [  632.502547]  </TASK>
> ---
>  mm/memremap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memremap.c b/mm/memremap.c
> index ac7be07e3361..053842d45cb1 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -454,7 +454,7 @@ void free_zone_device_folio(struct folio *folio)
>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>  			break;
>  		pgmap->ops->folio_free(folio);
> -		percpu_ref_put_many(&folio->pgmap->ref, nr);
> +		percpu_ref_put_many(&pgmap->ref, nr);
>  		break;
>  
>  	case MEMORY_DEVICE_GENERIC:
> -- 
> 2.34.1
> 
