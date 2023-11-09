Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354CEC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 16:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D856710E8E3;
	Thu,  9 Nov 2023 16:08:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9614610E8EE
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699546111; x=1731082111;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=emGPJwAcsTIGutwPOwK2THtu84cdoqpac1M5GQJmyB0=;
 b=ZJQQUCrrpii2FvoRXE5RoftONcJ7IcTrpMrbafFDte+6rLW7wMWlECjT
 V2HsroGFkERn3QweOK+wQq6K+tW0Z8Urzf7+yDTBDLspmSKjBhnDgOfOu
 XeoqkqgS+0tzazPUXiMOiz012xPrBS+djsybp0oUij3hI3yJzIaf3ki+c
 PyK/H2GxDdBYnhiIknwy89fPq4EN5kxWS6D2ouLoDtOOQ9r81ckylpmed
 zR2d7m2CpbaT023S7BKsTvjrhCTJOGcK7i401x3+xmaLi4Vev7ZjN+Y/G
 zjXQ7go+sEzXO49kRz1MlCKecW+4jzp3ObLts83LyI3bZi4T88jHx12RJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="392883609"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="392883609"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:08:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="739882882"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="739882882"
Received: from bbegley-mobl1.ger.corp.intel.com (HELO [10.252.4.12])
 ([10.252.4.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:08:26 -0800
Message-ID: <9268ebca-3d21-c702-bce0-458f411e3234@intel.com>
Date: Thu, 9 Nov 2023 16:08:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-GB
To: "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Milczarek, Slawomir" <slawomir.milczarek@intel.com>,
 Tomasz Mistat <tomasz.mistat@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Arteaga Molina, Jaime A" <jaime.a.arteaga.molina@intel.com>,
 "Cetnerowski, Adam" <adam.cetnerowski@intel.com>,
 "Chodor, Jaroslaw" <jaroslaw.chodor@intel.com>,
 "Dunajski, Bartosz" <bartosz.dunajski@intel.com>,
 "Harasimiuk, Artur" <artur.harasimiuk@intel.com>,
 "Hoppe, Mateusz" <mateusz.hoppe@intel.com>,
 "Jablonski, Mateusz" <mateusz.jablonski@intel.com>,
 "Jobczyk, Lukasz" <lukasz.jobczyk@intel.com>,
 "Kasper, Kacper K" <kacper.k.kasper@intel.com>,
 "Rozenfeld, Piotr" <piotr.rozenfeld@intel.com>,
 "Wilma, Pawel" <pawel.wilma@intel.com>,
 "Wolny, Bartlomiej" <bartlomiej.wolny@intel.com>,
 "Yates, Brandon" <brandon.yates@intel.com>,
 "Zdanowicz, Zbigniew" <zbigniew.zdanowicz@intel.com>
References: <ZUtv1eH5uiHl3j9N@tmistat-desk>
 <0c8104df-3c51-95a4-aec1-392b4b92efb9@intel.com>
 <CH3PR11MB8494CC467BA08CA3D00B7EE59DAFA@CH3PR11MB8494.namprd11.prod.outlook.com>
 <d71fbd17-72ae-796c-7c7c-964f7926ea26@intel.com>
 <BN9PR11MB527557220C41FFD53AE7A425E7AFA@BN9PR11MB5275.namprd11.prod.outlook.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <BN9PR11MB527557220C41FFD53AE7A425E7AFA@BN9PR11MB5275.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] FW:  [PATCH v9 0/3] PAT and cache coherency support
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

On 09/11/2023 15:24, Mrozek, Michal wrote:
> Will KMD fail the mmap call if we provide incorrect mapping ?

With Xe there are no mmap flags or anything like that, so you can't 
really provide an incorrect mapping. Ignoring this series, the previous 
behaviour was for the KMD to implicitly select the cpu caching mode when 
allocating the memory, where roughly you would get WC for VRAM and then 
WB for system memory, unless it's used for scanout in which case you get 
WC. With this series userspace must now explicitly request the cpu 
caching mode at allocation via gem_create, which will be used for all 
CPU access, including KMD internal stuff as well as userspace mmap().

> I.e. WB mmap on non-coherent GPU resource?

Right, if you allocate WB memory (cpu_caching=wb), then you can't 
currently use an incoherent PAT index if accessing it from the GPU. KMD 
will reject it at vm_bind.

> 
> Michal
> 
> -----Original Message-----
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: Thursday, November 9, 2023 4:05 PM
> To: Milczarek, Slawomir <slawomir.milczarek@intel.com>; Tomasz Mistat <tomasz.mistat@linux.intel.com>; intel-xe@lists.freedesktop.org; Arteaga Molina, Jaime A <jaime.a.arteaga.molina@intel.com>; Cetnerowski, Adam <adam.cetnerowski@intel.com>; Chodor, Jaroslaw <jaroslaw.chodor@intel.com>; Dunajski, Bartosz <bartosz.dunajski@intel.com>; Harasimiuk, Artur <artur.harasimiuk@intel.com>; Hoppe, Mateusz <mateusz.hoppe@intel.com>; Jablonski, Mateusz <mateusz.jablonski@intel.com>; Jobczyk, Lukasz <lukasz.jobczyk@intel.com>; Kasper, Kacper K <kacper.k.kasper@intel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Rozenfeld, Piotr <piotr.rozenfeld@intel.com>; Wilma, Pawel <pawel.wilma@intel.com>; Wolny, Bartlomiej <bartlomiej.wolny@intel.com>; Yates, Brandon <brandon.yates@intel.com>; Zdanowicz, Zbigniew <zbigniew.zdanowicz@intel.com>
> Subject: Re: FW: [Intel-xe] [PATCH v9 0/3] PAT and cache coherency support
> 
> On 09/11/2023 14:58, Milczarek, Slawomir wrote:
>> Hi Matthew,
>>
>> In the compute driver we call GEM_MMAP_OFFSET with flags to specify cpu cache mode (wb/wc):
>> GEM_CREATE_EXT() and mmap() + GEM_MMAP_OFFSET(flags=wb/wc)
>>
>> Starting from Xe KMD we should be able to achieve the same CPU caching policies with GEM_CREATE_EXT:
>> GEM_CREATE_EXT(flags=wb/wc) and mmap() + GEM_MMAP_OFFSET(flags=0) Am I
>> correct?
> 
> Yes, that's correct.
> 
>>
>> Thanks,
>> Slawek
>>
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Wednesday, November 8, 2023 1:04 PM
>> To: Tomasz Mistat <tomasz.mistat@linux.intel.com>;
>> intel-xe@lists.freedesktop.org; Arteaga Molina, Jaime A
>> <Jaime.A.Arteaga.Molina@intel.com>; Cetnerowski, Adam
>> <adam.cetnerowski@intel.com>; Chodor, Jaroslaw
>> <jaroslaw.chodor@intel.com>; Dunajski, Bartosz
>> <bartosz.dunajski@intel.com>; Harasimiuk, Artur
>> <artur.harasimiuk@intel.com>; Hoppe, Mateusz
>> <mateusz.hoppe@intel.com>; Jablonski, Mateusz
>> <Mateusz.Jablonski@intel.com>; Jobczyk, Lukasz
>> <lukasz.jobczyk@intel.com>; Kasper, Kacper K
>> <kacper.k.kasper@intel.com>; Milczarek, Slawomir
>> <slawomir.milczarek@intel.com>; Mrozek, Michal
>> <michal.mrozek@intel.com>; Rozenfeld, Piotr
>> <piotr.rozenfeld@intel.com>; Wilma, Pawel <pawel.wilma@intel.com>;
>> Wolny, Bartlomiej <bartlomiej.wolny@intel.com>; Yates, Brandon
>> <brandon.yates@intel.com>; Zdanowicz, Zbigniew
>> <zbigniew.zdanowicz@intel.com>; Dunajski, Bartosz
>> <bartosz.dunajski@intel.com>
>> Subject: Re: FW: [Intel-xe] [PATCH v9 0/3] PAT and cache coherency
>> support
>>
>> On 08/11/2023 11:30, Tomasz Mistat wrote:
>>> compute-umd_uapi_review_team@intel.com,bartosz.dunajski@intel.com,sau
>>> r
>>> abhg.gupta@intel.com,ulisses.furquim@intel.com,michal.mrozek@intel.co
>>> m
>>> ,tomasz.mistat@intel.com,piotr.rozenfeld@intel.com,ayaz.siddiqui@inte
>>> l
>>> .com,luis.strano@intel.com,filip.hazubski@intel.com,filip.hazubski@in
>>> t el.com,mateusz.naklicki@intel.com,kamil.kopryk@intel.com
>>> Bcc:
>>> Subject: Re: [Intel-xe] [PATCH v9 0/3] PAT and cache coherency
>>> support
>>> Reply-To:
>>> In-Reply-To: <20231103154309.402159-5-matthew.auld@intel.com>
>>>
>>> On 2023-11-03 at 15:43:10 +0000, Matthew Auld wrote:
>>>> Branch available here:
>>>> https://gitlab.freedesktop.org/mwa/kernel/-/tree/xe-pat-index?ref_ty
>>>> p
>>>> e=heads
>>>>
>>>> IGT changes:
>>>> https://patchwork.freedesktop.org/series/124667/
>>>>
>>>> Mesa:
>>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25462
>>>>
>>>> Goal here is to allow userspace to directly control the pat_index
>>>> when mapping memory via the ppGTT, in addtion to the CPU caching
>>>> mode. This is very much needed on newer igpu platforms which allow
>>>> incoherent GT access, where the choice over the cache level and
>>>> expected coherency is best left to userspace depending on their
>>>> usecase.  In the future there may also be other stuff encoded in the pat_index, so giving userspace direct control will also be needed there.
>>>>
>>>> To support this we added new gem_create uAPI for selecting the CPU
>>>> cache mode to use for system memory, including the expected GPU
>>>> coherency mode. There are various restrictions here for the selected
>>>> coherency mode and compatible CPU cache modes.  With that in place
>>>> the actual pat_index can now be provided as part of vm_bind. The
>>>> only restriction is that the coherency mode of the pat_index must be
>>>> at least as coherent as the gem_create coherency mode. There are also some special cases like with userptr and dma-buf.
>>>>
>>>> v2:
>>>>      - Loads of improvements/tweaks. Main changes are to now allow
>>>>        gem_create.coh_mode <= coh_mode(pat_index), rather than it needing to match
>>>>        exactly. This simplifies the dma-buf policy from userspace pov. Also we now
>>>>        only consider COH_NONE and COH_AT_LEAST_1WAY.
>>>> v3:
>>>>      - Rebase. Split the pte_encode() refactoring, plus various smaller tweaks and
>>>>        fixes.
>>>> v4:
>>>>      - Rebase on Lucas' new series.
>>>>      - Drop UC cache mode.
>>>>      - s/smem_cpu_caching/cpu_caching/. Idea is to make VRAM WC explicit in the
>>>>        uapi, plus make it more future proof.
>>>> v5:
>>>>      - Rebase, plus some small tweaks and fixes.
>>>> v6:
>>>>      - CI hooks fixes + checkpatch.
>>>> v7:
>>>>      - Some small tweaks
>>>> v8:
>>>>      - Rebase on Xe2 PAT table additions.
>>>> v9:
>>>>      - Drop coh_mode.
>>>>
>>>> --
>>>> 2.41.0
>>>>
>>>
>>> I'm sharing down here questions passed by bartosz.dunajski@intel.com
>>> lets continue review here at respective ML
>>>
>>> Sent: Wednesday, November 8, 2023 09:05
>>> Subject: RE: [Intel-xe] [PATCH v9 0/3] PAT and cache coherency
>>> support
>>>
>>> Just to confirm my understanding. We will have 2 separate APIs?
>>> 1.	For gem_create to explicitly set coherency/caching according to API enums
>>
>> Yeah, you just need to provide the cpu_caching mode (wc or wb). If you later mmap() the object this same caching mode is used. Also any KMD internal things like swap-in will also respect this caching mode. The coh_mode is now removed.
>>
>>> 2.	For vm_bind to set PAT index that is aligned with Bspec and controls more than #1. It can also override coherency/caching that was previously set?
>>
>> Right, as part of vm_bind you provide whatever PAT index control (as
>> per
>> Bspec) you want for each mapping of the object (you could map it multiple times).
>>
>> When choosing a PAT index the cpu_caching only matters if you choose an incoherent PAT index (coh_none in Bspec), since we don't want to allow cpu_caching=wb and coh_none, since that leads to some complications in the KMD.
>>
>>>
>>>
