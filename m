Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7966FEB64D9
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 11:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277D910E139;
	Wed, 14 Jun 2023 11:46:10 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDE410E139
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686743167; x=1718279167;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4XLTaTj0pJm0jRAU2Tcol/2UeiuxebyHfQlHH5aryX0=;
 b=T/i8521CoWB4I5c6TmP3D+HUBpJVAcx6Y0hG+9LcSOvAhNJfysiOYgrb
 mv7BxBSnd1i92gD7JCUk0PNlhgnQBFs4tWrnlfeFN0MpGqKZ1Jzr3pPiT
 DIc4dyiMe52wnxaQ6Imhst5tYer6bnW96ZaoXk9FB7nRTbicAtzpamAob
 ZVn+NAaZkqainq3MhdanprmlTPwY8wGrI2HVF0Ycgp2ahtpFs7D3Tzzhn
 PJzqEQjQ50PdB70FUtkmBSL10vwKQTmppWmjm6/XDWEpvpQaa+mvLhxeZ
 JaIMWPsXB10Yu2m5Yto9mh6yd6I4PCfpGudni3gYhSo6EBpg8YkqOI2EE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="356081948"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="356081948"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 04:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="741811780"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="741811780"
Received: from aryba-mobl.ger.corp.intel.com (HELO [10.249.254.20])
 ([10.249.254.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 04:46:04 -0700
Message-ID: <57760038-b6aa-b872-4036-fb944bafacf3@linux.intel.com>
Date: Wed, 14 Jun 2023 13:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230607160334.4111289-1-matthew.brost@intel.com>
 <20230607160334.4111289-8-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230607160334.4111289-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3 7/8] drm/xe: Only try to lock external BOs
 in VM bind
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 6/7/23 18:03, Matthew Brost wrote:
> We only need to try to lock a BO if it's external as non-external BOs
> share the dma-resv with the already locked VM. Trying to lock
> non-external BOs caused an issue (list corruption) in an uncoming patch
s/uncoming/upcoming/ ?
> which adds bulk LRU move. Since this code isn't needed, remove it.

I'm still curious as to why the list corruption happens. But since this 
patch shouldn't introduce any regressions and the code will probably 
change with drm_exec,

with the above typo fixed,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

>
> v2: New commit message, s/mattthew/matthew/
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d1c380ad7f6b..2780f350ed33 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2146,9 +2146,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
>   		 */
>   		xe_bo_get(vbo);
>   
> -		tv_bo.bo = &vbo->ttm;
> -		tv_bo.num_shared = 1;
> -		list_add(&tv_bo.head, &objs);
> +		if (!vbo->vm) {
> +			tv_bo.bo = &vbo->ttm;
> +			tv_bo.num_shared = 1;
> +			list_add(&tv_bo.head, &objs);
> +		}
>   	}
>   
>   again:
