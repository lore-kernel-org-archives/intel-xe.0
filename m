Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA051EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 17:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9938710E047;
	Thu,  6 Jul 2023 17:54:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB5A10E047
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 17:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688666081; x=1720202081;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=zrxcn90Ruvo+9d9qT4GLZ3WXunkD1rzexK9QDxoVDHE=;
 b=lwIDLw9x5jPjibkycvSik3Z8QEJxYPgr7A0EqiPRiIOoDJR+PuXR7hyz
 5dGV8sC3ePBmUSffdtL1x7j1QXzVcTSoOUdNHcDCGDMy/6I76NiUxa+ow
 FU23Kl3v7Ur+WOHdpgwwKsDbezDPYnT/jrc20Ktp9zVB0MVxg2odoKMfV
 koKtEqvrSjR9pxmo1SPn4zLZZNSR4jDyPrmt7p4L70S1e2A0tgdMsjkfJ
 Of2tM8N5pBg7tmndkAqiSImlLacRnva4/d07FRyxinBX0QF/6wR84tZdM
 D5uRcDown/lsBtdLRzl5/paN82vtDty3DNW7vt/97mjT000CxHTYE05fa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="353514998"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="353514998"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 10:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="785021351"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="785021351"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.232])
 ([10.249.254.232])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 10:54:39 -0700
Message-ID: <afbba037-45c2-facf-7e03-4d5c12f0c599@linux.intel.com>
Date: Thu, 6 Jul 2023 19:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230630175804.1096370-1-matthew.brost@intel.com>
 <20230630175804.1096370-8-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230630175804.1096370-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4 7/9] drm/xe: Remove __xe_vm_bind forward
 declaration
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


On 6/30/23 19:58, Matthew Brost wrote:
> Not needed so remove it.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_vm.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7be4436272f7..3ea872857b9e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -694,11 +694,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   	trace_xe_vm_rebind_worker_exit(vm);
>   }
>   
> -struct async_op_fence;
> -static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> -			struct xe_engine *e, struct xe_sync_entry *syncs,
> -			u32 num_syncs, struct async_op_fence *afence);
> -
>   static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>   				   const struct mmu_notifier_range *range,
>   				   unsigned long cur_seq)
