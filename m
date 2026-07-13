Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F6AC43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 13:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6321610E5D6;
	Mon, 13 Jul 2026 13:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIERZ9mu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A76B10E5D9
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783948771; x=1815484771;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=FQg2yqt5LWMneSObOfyUaKWGcdsJioKN/h5xLZxjBXM=;
 b=MIERZ9muwGeVA75dAGuC8vDhZofPcyEYYXfZPmewEiyJXqoSemZH3nAG
 4WQrePomHwbF/3KxVT8C615j/w+lIyV6hfovKUuOTySAYvNjBKjpDdTxk
 x485qetyc2riSQavrlh1EEcgtzH+RSOBCAlBZfuhpZGvEWDOZIPdAl67q
 Sx79DZgO1H97v3hCSYfRULk9pInB8/sOMHIXjd234OdM7lfVTs0PycKz5
 5EQEWoMk1x1ecmGePkY3torfpQqVEP/dWVWy+lRRsZdvuVmUcg14+0CMa
 +ODJ/JOZu4GUQS4LcyRLPhkZPHkv0EY9BE+4ybRGHBSQuxzZj0KfyqKDZ Q==;
X-CSE-ConnectionGUID: VzRniJj+ReuiOpSZoJ6a8A==
X-CSE-MsgGUID: kU+pBJW7SCanPsf0j4aU5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84412975"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84412975"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 06:19:31 -0700
X-CSE-ConnectionGUID: TEut+R71TX+cQedd7puc7g==
X-CSE-MsgGUID: RPBSztmYRUqAowRfKaVPAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253813865"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.248.138])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 06:19:29 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Don't fall through on DRM_GPUVA_OP_DRIVER in
 op_check_svm_userptr
In-Reply-To: <74396ae4-3503-466a-8c3e-02bc56a55628@intel.com>
References: <20260710141259.1512070-1-mika.kuoppala@linux.intel.com>
 <74396ae4-3503-466a-8c3e-02bc56a55628@intel.com>
Date: Mon, 13 Jul 2026 16:19:25 +0300
Message-ID: <87y0ffhvs2.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
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

Matthew Auld <matthew.auld@intel.com> writes:

> Hi,
>
> On 10/07/2026 15:12, Mika Kuoppala wrote:
>> The DRM_GPUVA_OP_DRIVER operation is used by eudebug (and potentially
>> other driver ops). Because the break was inside the #if GPUSVM block,
>> we fell through and printed the "NOT POSSIBLE" warning.
>
> I think throwing a warn with "NOT POSSIBLE" was maybe not the wrong 
> thing wrt SVM and the current driver code, in the sense that there would 
> be a bug somewhere if we reach here without GPUSVM support?
>
> Are you triggering this only with upcoming eudebug? i.e there is a new 
> DRM_GPUVA_OP_DRIVER user, which is not SVM?

Yes, thats the case.

>
>> 
>> Fixes: 7477c4bd20dc ("drm/xe/pt: unify xe_pt_svm_pre_commit with userptr")
>
> I think maybe drop the fixes, and tweak the commit to make it clear that 
> this is just prep work for a new user?

Will drop. This is not triggerable without an another OP_DRIVER (which
eudebug introduces)

-Mika

>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 7111b5d0f6aa..f5ce1fcf484c 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -1547,8 +1547,8 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>>   			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
>>   		}
>>   		break;
>> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>>   	case DRM_GPUVA_OP_DRIVER:
>> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>>   		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
>>   			struct xe_svm_range *range = op->map_range.range;
>>   
>> @@ -1561,8 +1561,8 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>>   				return -EAGAIN;
>>   			}
>>   		}
>> -		break;
>>   #endif
>> +		break;
>>   	default:
>>   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>>   	}
