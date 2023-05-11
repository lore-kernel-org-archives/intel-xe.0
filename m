Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EEAC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 10:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E11B10E220;
	Thu, 11 May 2023 10:04:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D44D10E220
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 10:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683799497; x=1715335497;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HkMPuD3HACVTcZnVIPKK8R26vq1ntGocXGN6aSt44sY=;
 b=ZFvRT4uwPU4j+mOFJ4gcPdlErMPbveW1T2OQp0MpoaL8FfFu3fzkvYYU
 hLlLu1rzz+XSTNmjPWlRq62nR7VM7Qdk+gybPZ9H9q0fC0cF0dJ+KTe4W
 Jx0ZFE6NmH1V07gRJAQVJxcPonTDrJ89ggoqGTVwoBcqrkyx3mFVl0nqk
 CrvSUb+F4WwZk14uyHOKQO1wbKbBbDyLpyEQhsD8TAyV/aom944NU57CD
 cN6NVcQauKq0weRekcWYLCsM4DeVBQ8DbwdEllHy+9sLCrAR+bhsIqJNB
 Ji0S2Mwep1vMoyNw4X8McupEjqHtSh6PPP/CdsH9NIJZ+2YLFUY+fZQM8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="330078695"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="330078695"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 03:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650100978"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="650100978"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 03:04:55 -0700
Message-ID: <b0bb9bfb-8ca7-b95f-afcf-461432864898@linux.intel.com>
Date: Thu, 11 May 2023 12:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-30-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-30-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 29/31] drm/xe: Allow compute VMs to output
 dma-fences on binds
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


On 5/2/23 02:17, Matthew Brost wrote:
> Binds are not long running jobs thus we can export dma-fences even if a
> VM is in compute mode.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 55cced8870e6..07023506ce6b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3047,7 +3047,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
>   		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
>   					  &syncs_user[num_syncs], false,
> -					  xe_vm_no_dma_fences(vm));
> +					  xe_vm_in_fault_mode(vm));
>   		if (err)
>   			goto free_syncs;
>   	}
