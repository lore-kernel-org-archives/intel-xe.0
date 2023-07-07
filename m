Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AE0C001B0
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 07:22:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A360810E516;
	Fri,  7 Jul 2023 07:22:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CF710E516
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 07:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688714567; x=1720250567;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z7i3RAClVkVBHv1aKHH043CTwvgRTgbaRt8OBoCuJLg=;
 b=EhTVxTu2D9/D8uPfn3woH00/jq47sDRlSCq5FG3yJkJ+V4L8lXrgkmCm
 NsX/vJV1ZWgQdfzkZPuOeNFUAZEt7j5MeViIDOvwpzNfIBY2MPUC6yXOr
 ha41tTeiUhkHytIDbon2yYN9Z3OAtmFnN3sgx2NJx3XmplANjrVRLk8ox
 CHdlkb9Bijc2m4cQhdfSAW6cvBb/Rkowxfnad8RFK0z8n0RacLv1DHevO
 iy8+1MvhMU2UFD/rdnL7LElHjFYb+uui0SCDbWa8MhkcEyiu/tZ3bt3Zn
 7Hh6OhW/epTwEVln9DcaWhB5oLLzzd4sLAHuEIOILZXA5BM3NkCxtP0/G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="344157166"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="344157166"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 00:22:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="755055756"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="755055756"
Received: from asparren-mobl2.ger.corp.intel.com (HELO [10.249.254.247])
 ([10.249.254.247])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 00:22:36 -0700
Message-ID: <b43148e9-3faf-6c88-bdb6-e297abf2b2df@linux.intel.com>
Date: Fri, 7 Jul 2023 09:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230630100059.122881-1-thomas.hellstrom@linux.intel.com>
 <20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com>
 <de824fda-e72c-3fbf-6be1-e42ce05b916b@linux.intel.com>
 <20230706223024.GF5433@mdroper-desk1.amr.corp.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230706223024.GF5433@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH DONTMERGE] drm/xe: uapi review submission
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Matt,

On 7/7/23 00:30, Matt Roper wrote:
> On Thu, Jul 06, 2023 at 08:14:52AM +0200, Thomas Hellström wrote:
>> Hi, Matt,
>>
>> Thanks for taking a look into this. Some comments below. I think we need to
>> set up tasks for the various review concerns and assign people to have them
>> resolved:
> ...
>>>> +struct drm_xe_vm_bind {
>>> Should there be a field in here to allow userspace to specify which PAT
>>> index corresponds to the behavior (caching, coherency, CLOS, etc.) they
>>> want on this binding?  The PAT should be a characteristic of the bind
>>> rather than of the underlying object, right?
>> Yes, given certain immutable restrictions given at buffer-object create
>> time; For example the CPU caching mode will restrict the coherency mode used
>> in PAT, and CPU caching mode needs to be specified at bo create time. The
>> current suggestion is therefore that coherency mode also needs to be
>> specified at bo create time, a slightly stricter limitation on the available
>> PAT indices at VM_BIND time. Whether we want to include PAT in the main
>> struct or as an extension hasn't been decided yet.
> I'm not sure I fully understand this one; I thought CPU caching to be
> mostly orthogonal to GPU coherency mode.  Do you mean we'd step in and
> prevent combinations like CPU:WB + GPU:non-coherent since then the GPU
> might not see updates done by the CPU that are still stuck in the CPU
> cache and/or the CPU might read stale data from its cache after the GPU
> has updated the buffer?  It seems like there are so many ways userspace
> could already shoot itself in the foot if it picked nonsense settings
> that I'm surprised we'd try to stop it here.  Even for the example given
> there might be some cases where it still winds up being fine (e.g., the
> CPU side always does clflushes at the necessary times and the GPU never
> does any writes that would need to invalidate the CPU cache).
>
> Am I overlooking something, or are the combinations that will get
> restricted based on something else entirely?

The reason we try to stop the GPU bypassing the CPU cache by choosing 
non-coherent GPU mappings with WB system memory is so that user-space 
doesn't find a way to bypass the page-wiping done by the kernel and can 
access previous sensitive page-contents. The intention is not really to 
stop user-space shooting itself in the foot. It's still free to do that.

There are three ways we can do this:

1) Kernel clflushes, like i915. (Works only for integrated, since it 
requires a guarantee that the processor never writes-back a clean 
(prefetched) cache-line). We only have that guarantee for Intel 
processors. Linus has made it clear that we should avoid relying on 
something arch- or processor dependent like this, but we might get away 
with it on integrated).

2) Write-combined system memory mappings, making the memory appear 
coherent anyway,  (Probably only works for x86) This actually moves the 
clflush to the WB->WC transition in the x86 arch layer of the kernel. I 
think amdgpu is using this.

3) We've been discussing GPU flushing of cpu-cache using a read with a 
suitable PAT setting  (The only way we can do this generically on 
discrete, I think, if discrete ever decides to implement non-coherent 
system page mappings. For now, we've been told no current or planned 
PCIe discrete will implement the PCIe no-snoop hint. Not sure what 
happens with CXL).

For uAPI purposes, we landed in 2)  (That would also allow us to base 
implementation on 1-3 if it turns out to be needed). WC system memory 
can only be choosen at backing store creation, which is a TTM restriction.

These were all part of the PAT presentations on Xe weekly sync.

Ofc if you think there are reasons we should reconsider, these are not 
fully set in stone yet

/Thomas


>
>
> Matt
>
