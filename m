Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A11EC43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 15:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4656510E1E9;
	Fri, 10 Jul 2026 15:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJieYKpC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A3910E1E9
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 15:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783696477; x=1815232477;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=EMM65rhM6dkeXBw7nZUAd4RQkERGQjDlJeUgMvScY4w=;
 b=eJieYKpC8i/heR2x6TZwkwk3IEJgk16m3p97YlV8zT2JKjDeqQnNCiWQ
 clh+xOg4Ev4UOyslGKG7PNKEdA/v1ElUJEph5TKaIA4YbYKO3A6aIoYBs
 xMsKMosu+gIEGPDPrfSZemJg5q2fxdcLtYNLIuRiDPcPAlGjnoSENNcyC
 yfKBaClYo6iL4pBu4D9R3yVJU6y5DnH3DOMq6W1dZORN8iWkNjl6xThJ0
 CvsZl6AQp5G5twlhy/6dAcPIQAhKK5EWlTsUp5K84VcPZRMfNv9RPr5iM
 636e8hCu4tL6Nqx6jiIafQAPZ9CnSYE3R5bJdEc39Pddhmf4PyaYuuhwt A==;
X-CSE-ConnectionGUID: 2mgOLBJBRfO7g0trItqgDw==
X-CSE-MsgGUID: Y7Rot9L1Tzy6XUM4rzYkRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84589386"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84589386"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 08:14:37 -0700
X-CSE-ConnectionGUID: K63PHow6QQO13QOwC2BOyQ==
X-CSE-MsgGUID: mEIjbmtsT9eTFK2YpE7o1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255004116"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.203])
 ([10.245.244.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 08:14:37 -0700
Message-ID: <74396ae4-3503-466a-8c3e-02bc56a55628@intel.com>
Date: Fri, 10 Jul 2026 16:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't fall through on DRM_GPUVA_OP_DRIVER in
 op_check_svm_userptr
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260710141259.1512070-1-mika.kuoppala@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260710141259.1512070-1-mika.kuoppala@linux.intel.com>
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

Hi,

On 10/07/2026 15:12, Mika Kuoppala wrote:
> The DRM_GPUVA_OP_DRIVER operation is used by eudebug (and potentially
> other driver ops). Because the break was inside the #if GPUSVM block,
> we fell through and printed the "NOT POSSIBLE" warning.

I think throwing a warn with "NOT POSSIBLE" was maybe not the wrong 
thing wrt SVM and the current driver code, in the sense that there would 
be a bug somewhere if we reach here without GPUSVM support?

Are you triggering this only with upcoming eudebug? i.e there is a new 
DRM_GPUVA_OP_DRIVER user, which is not SVM?

> 
> Fixes: 7477c4bd20dc ("drm/xe/pt: unify xe_pt_svm_pre_commit with userptr")

I think maybe drop the fixes, and tweak the commit to make it clear that 
this is just prep work for a new user?

> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 7111b5d0f6aa..f5ce1fcf484c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1547,8 +1547,8 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>   			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
>   		}
>   		break;
> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>   	case DRM_GPUVA_OP_DRIVER:
> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>   		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
>   			struct xe_svm_range *range = op->map_range.range;
>   
> @@ -1561,8 +1561,8 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>   				return -EAGAIN;
>   			}
>   		}
> -		break;
>   #endif
> +		break;
>   	default:
>   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>   	}

