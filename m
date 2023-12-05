Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBECC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 15:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C1A10E569;
	Tue,  5 Dec 2023 15:32:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9AD10E587
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701790350; x=1733326350;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OKJbIikNfr7mNqlR3rWpQNaq5cXJ71gW6feQ11vY6PI=;
 b=N/oRRUpSW/kLxtJECPxDcHpvK0Q26CJn81F03A66ELTVyrsh+GjuIbt/
 qtNuUnp8n2s57o1JqPYuk/aXWTD/KcO+KKLmHIPCesKSotgZPgHRO+tTZ
 oaE6tE9x9ZfWhX3Gy3Zy3KJMB1vYptAQ00zXFJXrplPcqXRT8ut7hG9Kv
 VesCR+w25dYwWOP2OkLhH0k5ePGh12JAOX5kCjoc4BktwrszGkfgU9N6L
 ckgHWTQ4Ee2CeutYCImwLW7upRsnszULnfQKLzqDvelAWetILqjbOtsey
 6NCp5/m/bZ1IZLhcZTIdmBb49gDundufvgnQzLNXfh8Ih+qrAlcvC6eFT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12627053"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="12627053"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="888978210"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="888978210"
Received: from mstribae-mobl.ger.corp.intel.com (HELO [10.249.254.119])
 ([10.249.254.119])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:32:28 -0800
Message-ID: <0058d067-84a4-775e-d345-379bce7d73c9@linux.intel.com>
Date: Tue, 5 Dec 2023 16:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231205150039.289135-1-mika.kuoppala@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231205150039.289135-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/vm: Avoid asid lookup if none
 allocated
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/5/23 16:00, Mika Kuoppala wrote:
> The destroy path can and will get called for incomplete
> vm objects on error paths, where the asid is not yet allocated.
> This leads to lookup fail and assert triggered.
>
> Fix this by not asserting of asid existence if vm never
> got assigned one.
>
> Cc: Ohad Sharabi <osharabi@habana.ai>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e09050f16f07..40ee256eb36a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1620,7 +1620,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>   	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
>   		xe_device_mem_access_put(xe);
>   
> -		if (xe->info.has_asid) {
> +		if (xe->info.has_asid && vm->usm.asid) {
>   			mutex_lock(&xe->usm.lock);
>   			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
>   			xe_assert(xe, lookup == vm);
