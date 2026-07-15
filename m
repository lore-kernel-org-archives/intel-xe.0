Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4BCC44501
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 12:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE9210F02C;
	Wed, 15 Jul 2026 12:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgWloTeB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F06C10F02C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784118529; x=1815654529;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6Hx0YLxUkeQK1xuuszHhTCiliocn0kC58NJbgxRopkg=;
 b=FgWloTeBAH7BNXSLNSzTI30UzXueCM1lQtaPBxf0PAC9O8L0QYFE6Uyi
 mG8ajI/BtLWDO76dhIuJvKbQh3B+nUfHoD6bHX3Co3r3Qy+um4PQKuhj4
 enarIX4lR4dzRaJv+r/6e05E1GwNuv3Vm3heL+XU96rOKMPiUp/k+NoA9
 Xn4uckk/YKzaKbVNRoCTILzySG5D7iCZllHaENmgLEK4A7V63Tr9ywpXS
 wb/k+zrXPy/QMZQeGR+U5ry8U3S/Tza0nc1McKXB7R7eaWKTbsHK+zcgX
 +a3+QbisuGdMo0t/k0WaceaiIgjAaf54jRG5I0D7Q+Ke9txlrMJuqH3Wy Q==;
X-CSE-ConnectionGUID: ow8a0tPpQ62j7Zk4uFI/4A==
X-CSE-MsgGUID: 6kj/V+GfT/SGUpPrc1rccQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84779622"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84779622"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:28:49 -0700
X-CSE-ConnectionGUID: 0VM6JB8hSXOD+A2d0Tsong==
X-CSE-MsgGUID: /Aw6YJpjQai34zxQ0/TRDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="260466416"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.131])
 ([10.245.244.131])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:28:48 -0700
Message-ID: <3c48aa92-6451-4b8e-a1b8-75cec4899296@intel.com>
Date: Wed, 15 Jul 2026 13:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove ifdef in DRM_GPUVA_OP_DRIVER svm subop
 checking
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260715103104.63954-1-mika.kuoppala@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260715103104.63954-1-mika.kuoppala@linux.intel.com>
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

On 15/07/2026 11:31, Mika Kuoppala wrote:
> Always emit the DRM_GPUVA_OP_DRIVER case so the previous break is
> effective and we never fall through to the default warning.
> This also allows adding more subops in the future without ifdef dancing.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Assuming it still builds,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pt.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 7111b5d0f6aa..d1b939dfaa13 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1547,7 +1547,6 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>   			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
>   		}
>   		break;
> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>   	case DRM_GPUVA_OP_DRIVER:
>   		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
>   			struct xe_svm_range *range = op->map_range.range;
> @@ -1562,7 +1561,6 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>   			}
>   		}
>   		break;
> -#endif
>   	default:
>   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>   	}

