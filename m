Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3E4D39404
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 09:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B4610F1E2;
	Thu,  2 Apr 2026 09:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUErAqnl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B9F10F1FD
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775122075; x=1806658075;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=klwNKV48BjDQnzhLT0czwxW1UGoTMOPzQeGUWvNL5Uo=;
 b=dUErAqnlTcTaeEpPEq6CVyaCclSiIyKG1XBADYbGtSHFu+25OjgK+7Eb
 HkLQ4tHLB1e7v5MZ/KXJczONY59Zaw9bwJcyy8XXPx+4IYH1ex49lv533
 8ZpWw/hN1SiwXqj9VKL9LPcRW0QDU3v2utFstErwlvU4/wGOrX4Djlj0L
 IWh08wtAM3kOJMEBGGXqZg39jwf0/XvvDM+m7Kqp6VglwxxWsuj8zlPqh
 MCPfz1B/Co3UFXZwHJiLmicRJ1Gk4q4/iwFs84xXDOamfHHo1kPMPUb3D
 /oPRaDG0+r5sFDxnHWJqZJUFNi6rPelSxiBYjatspcq0AHIujuXU1n1lR g==;
X-CSE-ConnectionGUID: 3eXtqNdbRM+9KhacMcWYtg==
X-CSE-MsgGUID: pITmEKSUTaWKRdnm7BGmWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="98790132"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="98790132"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 02:27:54 -0700
X-CSE-ConnectionGUID: XS3ZfqYPQxS9ySkaxOMlpg==
X-CSE-MsgGUID: F9nwgGqtQ1+SDOAO7gAAZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="257411207"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.52])
 ([10.245.245.52])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 02:27:54 -0700
Message-ID: <9a7b9651-c818-457c-b52d-7fc2544e0b56@intel.com>
Date: Thu, 2 Apr 2026 10:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix slab-out-of-bounds on PT update ops retry
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
References: <20260402091539.4114-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260402091539.4114-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 02/04/2026 10:15, Thomas Hellström wrote:
> xe_pt_update_ops_prepare() calls xe_pt_update_ops_init() at the start of
> each invocation to reset per-attempt state, but current_op was not
> included in that reset. When vm_bind_ioctl_ops_execute() retries due to
> ww-mutex contention (drm_exec_retry_on_contention), ops_execute() calls
> xe_pt_update_ops_prepare() again. The second call walks the same op list
> and fills ops[] starting from current_op, which still holds the value
> from the first attempt. This indexes past the end of the ops array
> allocated by xe_vma_ops_alloc(), whose size was computed for a single
> pass.
> 
> KASAN reported:
>    BUG: KASAN: slab-out-of-bounds in bind_op_prepare+0x89c/0xae0 [xe]
>    Write of size 8 at addr ffff88812e72bae8 by task xe_evict/2848
>    [...]
>    bind_op_prepare+0x89c/0xae0 [xe]
>    xe_pt_update_ops_prepare+0xbd0/0x1570 [xe]
>    ops_execute+0x3ae/0x2030 [xe]
>    vm_bind_ioctl_ops_execute+0x4d5/0xed0 [xe]
> 
> The write lands at ops[1].vma (offset 360 into the second element of a
> one-element 384-byte allocation) because entries[] is exactly 360 bytes
> and current_op was 1 at the start of the retried prepare pass.
> 
> Fix by resetting current_op to 0 in xe_pt_update_ops_init().
> 
> Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.12+
> Assisted-by: GitHub Copilot:claude-sonnet-4.6

Out of curiosity, was it able to suggest the fix given the KASAN splat?

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 8e5f4f0dea3f..3607cd57fc4c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2291,6 +2291,7 @@ xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
>   	init_llist_head(&pt_update_ops->deferred);
>   	pt_update_ops->start = ~0x0ull;
>   	pt_update_ops->last = 0x0ull;
> +	pt_update_ops->current_op = 0;
>   	xe_page_reclaim_list_init(&pt_update_ops->prl);
>   }
>   

