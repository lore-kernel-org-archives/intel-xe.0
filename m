Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41C3C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 15:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDCD10E0E7;
	Fri, 10 Jul 2026 15:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPBUqZHQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC14310E0E7
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783697304; x=1815233304;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=z6DpNVxZx9OTM+JevSaeW1z71YZ4kXhpiCUI2cl50Cw=;
 b=LPBUqZHQO/k9hc/hJuNTYaAlVMNqQzLprfZbqsWCwYJSPx/5pH1HjE9K
 ZMax3DzlM/9oJmoji5AC7/6I3DbGSsJ9x65T5MUoVS+1l/PMdBSzRTpr4
 daRNhq/6rrK5We28FKcq3HfjNp7xXnBJL/Sb1U9sl1clTt8qtK5y9LtxJ
 EiVxV0t83JvG6TdnvfGvz1hK7UP+EaafwyzVcBs4cvpwB356JG2vYcqOC
 YWjUBLhfvyKqnD2XlFbhJMRRhI3PgKaJHgA9Jft28H/3ZBKf/e0RrmgLL
 a0t4JjxZUaW5OGrNzS5oXuA61tcWl1TitpLHrPLeVMkfsZvF2XmLzDXm+ Q==;
X-CSE-ConnectionGUID: wpZXKrrjQsWI2epAsXygbw==
X-CSE-MsgGUID: mSMVvhlmTqqeZytshF8QJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107194401"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="107194401"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 08:28:23 -0700
X-CSE-ConnectionGUID: X1YocGVPR0aquxk2mzxkjw==
X-CSE-MsgGUID: yvj3lkk6RpS38isCtv+tKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255007909"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.203])
 ([10.245.244.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 08:28:22 -0700
Message-ID: <b196614f-25ef-4424-bbdd-7f16c5b00f53@intel.com>
Date: Fri, 10 Jul 2026 16:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't fall through on DRM_GPUVA_OP_DRIVER in
 op_check_svm_userptr
From: Matthew Auld <matthew.auld@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260710141259.1512070-1-mika.kuoppala@linux.intel.com>
 <74396ae4-3503-466a-8c3e-02bc56a55628@intel.com>
Content-Language: en-GB
In-Reply-To: <74396ae4-3503-466a-8c3e-02bc56a55628@intel.com>
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

On 10/07/2026 16:14, Matthew Auld wrote:
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
> 
>>
>> Fixes: 7477c4bd20dc ("drm/xe/pt: unify xe_pt_svm_pre_commit with 
>> userptr")
> 
> I think maybe drop the fixes, and tweak the commit to make it clear that 
> this is just prep work for a new user?

Also, if this does build without CONFIG_DRM_XE_GPUSVM, maybe we should 
just drop the ifdef completely? There are other places checking SVM 
related ops and those have no ifdef, so maybe this is just overkill? I 
think the original code had some ifdef which I just tried to keep 
somewhat intact, without thinking too much about it.
> 
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 7111b5d0f6aa..f5ce1fcf484c 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -1547,8 +1547,8 @@ static int op_check_svm_userptr(struct xe_vm 
>> *vm, struct xe_vma_op *op,
>>               err = vma_check_userptr(vm, gpuva_to_vma(op- 
>> >base.prefetch.va), pt_update);
>>           }
>>           break;
>> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>>       case DRM_GPUVA_OP_DRIVER:
>> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>>           if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
>>               struct xe_svm_range *range = op->map_range.range;
>> @@ -1561,8 +1561,8 @@ static int op_check_svm_userptr(struct xe_vm 
>> *vm, struct xe_vma_op *op,
>>                   return -EAGAIN;
>>               }
>>           }
>> -        break;
>>   #endif
>> +        break;
>>       default:
>>           drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>>       }
> 

