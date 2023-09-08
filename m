Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC773EE7FE3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 13:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8348E10E8AD;
	Fri,  8 Sep 2023 13:06:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5247110E8A5
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694178383; x=1725714383;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=X22mompC1qfHIcsglRX3IBDdcssZA2QuRK7BeooyMv4=;
 b=DHmCzgIis0hqL/SwW26vjXTvluqwsVDy2GoIZjFgp9a0qAuoRbikaA00
 +yzBzmGnEqpGeBQUhu8yyQKJS9n/ISMsno3M02N/GUA8iH7ONH2s4DUj4
 RmyrvioY9s8HorsA5fGLbldJ65QwPZxab1xP4Ru349AVrgNySsJI0asEi
 G4Ubz4lzZb0rlRxEKt3N12pu8uXK9/IIgfGAkC3UZBFhAsgo611+AtcDJ
 H8bYt3FM03Z1tU5APwFeuoP36aMzQRZcJJkTgJNPt7mE4NKGy7IF0vW5o
 Ir1zL7N47mpZ8zf/dndvKKGumIGb6rcDe+lA7pNls5A9y+DovYHqoBr2s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="381455908"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="381455908"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 06:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="832660629"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="832660629"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO [10.249.254.172])
 ([10.249.254.172])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 06:06:16 -0700
Message-ID: <dc1a8b55-14b2-c801-fced-ee22e9158434@linux.intel.com>
Date: Fri, 8 Sep 2023 15:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "mika.kuoppala@linux.intel.com" <mika.kuoppala@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "faith@gfxstrand.net" <faith@gfxstrand.net>
References: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
 <20230904144644.3259148-1-mika.kuoppala@linux.intel.com>
 <ZPi0gnYZlMk6mD2d@intel.com> <87zg1yay7a.fsf@mkuoppal-desk>
 <ZPpEkR47cLTO9NH0@intel.com>
 <169416105435.18944.2863510374468750259@jlahtine-mobl.ger.corp.intel.com>
 <920ec9b8e8aa475b749d03b7df295d8402ddcff4.camel@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <920ec9b8e8aa475b749d03b7df295d8402ddcff4.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend drm_xe_vm_bind_op
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
Cc: "paulo.zanoni@intel.com" <paulo.zanoni@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

On 9/8/23 14:47, Vivi, Rodrigo wrote:
> On Fri, 2023-09-08 at 11:17 +0300, Joonas Lahtinen wrote:
>> (+ Thomas who this was discussed with and Faith for original
>> reasoning for op[])
>>
>> Top-posting to discuss the alternative of having a single VM_BIND per
>> operation instead of array of operations.
>>
>> Thomas is working on the feature of returning an error from the
>> middle
>> of the op[] array to the userspace and unrolling the operations plus
>> -EINTR
>> handling became under discussion.

Well our team is working  on it. We haven't started implementing yet.

>>
>> With the addition of debug metadata per op (aka. per vma) the
>> unrolling and
>> -EINTR handling will become further complex.
>>
>> Would there be a measurable performance issue if we would simplify
>> and
>> just to do VM_BIND(op)[] instead of VM_BIND(op[])?
>>
>> Unrolling would be much easier and there would be no need for complex
>> error
>> returning scheme. The GPUVA operation may still split into maximum 3
>> separate
>> ops but the rest of the unrolling like metadata would need to be only
>> dealt with once.
> Cc: Paulo and Jose
>
>> Regards, Joonas

Personally I don't have much against a single op per ioctl, and then to 
extend it if necessary. Matthew Brost pointed out that the array of ops 
ligns with the Vulkan API and what the other drivers are doing.

I wonder,  the EU debug changes that are hard to unroll, is it possible 
to perform that in a commit phase when we are sure the resource 
allocation won't error anymore?

/Thomas

>>
>> Quoting Rodrigo Vivi (2023-09-08 00:45:53)
>>> On Thu, Sep 07, 2023 at 04:51:21PM +0300, Mika Kuoppala wrote:
>>>> Rodrigo Vivi <rodrigo.vivi@intel.com> writes:
>>>>
>>>>> On Mon, Sep 04, 2023 at 05:46:44PM +0300, Mika Kuoppala wrote:
>>>>>> The bind api is extensible but for a single bind op, there
>>>>>> is not a mechanism to extend. Add extensions field to
>>>>>> struct drm_xe_vm_bind_op.
>>>>> But why would you want to extend the operation?
>>>>> Except for the destroy ones, every ioctl itself is extensible.
>>>>>
>>>>> So, DRM_IOCTL_XE_VM_BIND is extensible. Why would we need to
>>>>> get
>>>>> prepared to extend the operations themselves? And if we extend
>>>>> the operation, what to do with the extension at the ioctl
>>>>> level?
>>>>> which one has precedence? how to organize that?
>>>>>
>>>> The intent is to pass debugger metadata as part of particular
>>>> vm bind operation. For example on MAP, we could associate
>>>> ELF/ISA (relevant parts) as metadata for this bind range.
>>>>
>>>> So in vector of binds, we want to tag specific one map (in
>>>> between)
>>>> with debugger metadata.
>>>>
>>>> With extending the XE_VM_BIND itself, this could be possible too
>>>> but would then need to deliver index into the vector instead
>>>> of carrying the metadata as part of per operation.
>>>> As atleast in this example, the extension is heavily tied
>>>> into particular OP (map).
>>>>
>>>> I take that you mean precedence of VM_BIND vs bind op?
>>>> Excellent question and I dont know all the use cases the
>>>> vm_bind have to cater. So I can only refer to example above,
>>>> VM_BIND extensions would be only in scope to all operations
>>>> and vm_bind_op extensions would be tightly coupled to per
>>>> operation only.
>>> So, maybe we should do the same union that we do with the
>>> ops themselves and make the extension also an array of num_binds ?
>>>
>>>> Thanks for feedback!
>>>> -Mika
>>>>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>>>> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>>>>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>>>>>> ---
>>>>>>   include/uapi/drm/xe_drm.h | 3 +++
>>>>>>   1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/include/uapi/drm/xe_drm.h
>>>>>> b/include/uapi/drm/xe_drm.h
>>>>>> index 86f16d50e9cc..5c6c86f5e5fc 100644
>>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>>> @@ -552,6 +552,9 @@ struct drm_xe_vm_destroy {
>>>>>>   };
>>>>>>   
>>>>>>   struct drm_xe_vm_bind_op {
>>>>>> +  /** @extensions: Pointer to the first extension struct, if
>>>>>> any */
>>>>>> +  __u64 extensions;
>>>>>> +
>>>>>>     /**
>>>>>>      * @obj: GEM object to operate on, MBZ for MAP_USERPTR,
>>>>>> MBZ for UNMAP
>>>>>>      */
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
