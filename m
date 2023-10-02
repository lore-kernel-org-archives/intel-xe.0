Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD60EE7849A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 14:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9306E10E05A;
	Mon,  2 Oct 2023 14:02:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAD310E05A
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696255348; x=1727791348;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6KdUCpQtIaogzT2n/595rNTUzhA9KxhObm9GOdr/qo8=;
 b=BidTxbnZ2ki0lpbIKgdKkExswOnqKRTn1MCFWxMAOPNpOBZPtPxt2e06
 n5BY1HCIh+mdZCA8IWE9611xOv07K6tU5dj3Qcwiqk1LLy69TE54qsTjZ
 vhVTrKQc4hgVVZHql123tHPVis/lzzfu9QCSk+F+482Wdk0RZuGtUxvYg
 rYu6EMsJ5ln9YT3tcydrAF1rvE3HBQKG9zUPm7pVRkfKSz81KZN3MjUbJ
 K2kYHoSYAVwLqR0iHMDamLfH4qVxpyWYhTwnoX1qQ5idvC6+cJ4zpW9Vt
 tsifcWlkl/AfP/8pPAt0h+WXWHqpbI8axxnkQWpzvhJNOTM6Kk5tWkPwB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="4222480"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="4222480"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:02:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="744120422"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="744120422"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:02:26 -0700
Message-ID: <dbcc19c6-868f-b2df-fa0b-9c6ffe1501c9@linux.intel.com>
Date: Mon, 2 Oct 2023 16:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230929204637.1202492-1-rodrigo.vivi@intel.com>
 <20230929204637.1202492-4-rodrigo.vivi@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230929204637.1202492-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 3/4] fixup! drm/xe: Fix array of binds
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

On 9/29/23 22:44, Rodrigo Vivi wrote:
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 3a761608bb68..e90f59d6da55 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3179,7 +3179,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>   					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
>   		}
>   
> -		drm_gpuva_ops_free(&vm->mgr, __ops);
> +		drm_gpuva_ops_free(&vm->gpuvm, __ops);
>   	}
>   }
>   
