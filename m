Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EE4CA9ED2
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 13:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D532410E83B;
	Tue, 13 Oct 2026 13:15:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7426710E356
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 13:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791897344; x=1823433344;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TfhqUqed2BvZD3iCnT9GDrKb/7amFmjNz/CLZUa2nC0=;
 b=mIlC09z66W76d3ioqjwkQy1PGFIXGuQxaOX7iXcPwKh+SP3Pn4Qohxid
 0y9xulz3BewDxXp1m8gouPu/KntFdCnK4e3xWfkQxNmr3e79hDUuD7tWO
 ylftsq4qyqmR3Ud90Z+mBCRnxHctVovlsB0+NBUy3WGEL2KXhwC5xeCRy
 EZ1AczeOvOQjJzEdYnCZ2vHRPexbTvmSAolLGwesov5o41S+Vs+7a69UR
 6qCiteW0bH+TN6rwpjhVN1aoaxVR6xC9ftC6t1VvQPe0gZ36sE//8EKVr
 6D6i9vQm8Ah+LhlJqgdtIAEb+Ml6hZXAE1tA0VcMuxQwVyuLfsqoq6tRF A==;
X-CSE-ConnectionGUID: eLFHVs7lSgenZrfWriDQJg==
X-CSE-MsgGUID: l0iLDxljQ+KbnBgArDiM8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="608187"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="608187"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 06:15:43 -0700
X-CSE-ConnectionGUID: bsRRX6jHSCSOzRG5c48lrg==
X-CSE-MsgGUID: h9xT3ZzzRpKznFjfL/lnHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1085927"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.245.122])
 ([10.245.245.122])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 06:15:41 -0700
Message-ID: <d2331912-6788-43d5-9390-8619eb6623b6@intel.com>
Date: Tue, 13 Oct 2026 14:15:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe: skip p2p for suspected display buffers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20261007153605.1743626-5-matthew.auld@intel.com>
 <20261007153605.1743626-8-matthew.auld@intel.com>
 <2c6a97ac21c5ef161dbac279f9b971f383b6b944.camel@linux.intel.com>
 <dbabed4e-468d-4ecf-b295-f5d8c9c4b263@intel.com>
 <bc2f4d82-5a8e-4d1b-a921-ee819ca5cac2@amd.com>
 <992d57f0-7327-4c36-adf7-6dd72137fe73@intel.com>
 <31f7eb68-6dfa-4ea7-93a4-d4897fbe6a74@intel.com>
 <3579864a-0283-4f92-b895-5cf399c2ee69@amd.com>
 <16cfde6b-8881-4ffe-8068-9530286da72a@intel.com>
 <1a852df2-c2a4-48bb-84de-cdd4b98b95bb@amd.com>
 <d493d4d1-96d5-4194-bbae-5c1e5d54d91a@intel.com>
 <5545db90-3365-4d75-9fc0-77dda42b7000@intel.com>
 <2fcd10d5-c1f9-47be-9a68-422f9bbd6837@amd.com>
 <eaa812b3-d576-4d63-a9cb-c7c0ec24f19f@intel.com>
 <9facad8e-6866-493e-99d4-71a491efb630@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <9facad8e-6866-493e-99d4-71a491efb630@amd.com>
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

On 13/10/2026 12:50, Christian König wrote:
> On 10/13/26 11:40, Matthew Auld wrote:
> ...>>
>>> It could be that this check doesn't work and because of low resolution and/or not busy PCIe it somehow works, but that would then clearly not be intended behavior.
>>>
>>> What could also be is that the frame is pulled over the PCIe bus using the SDMA multiple times, but that would then be a bug in userspace somewhere.
>>>
>>>>> Expectation is that buffer rather gets moved from VRAM to system memory when mapping the buffer with dma-buf, where it stays, and never negotiated to use p2p in the first place. I don't think p2p is really valid here.
>>>
>>> No, that is incorrect. When P2P is available it should be used, it's just that AMDs APUs can't scanout over P2P.
>>>
>>>>> What happened is that user updated their kernel and due to the MOVE_NOTIFY config getting removed and enabled by default on newer kernels this suddenly started negotiating p2p for things like the window buffer AFAICT, instead of moving it to system memory and keeping it there. On previous kernel versions the buffer would just get moved and pinned in system memory. From user pov this is a kernel regression, given the perf they are now getting.
>>>>>
>>>>> On AMD CPUs you allow p2p for everything. On Intel iGPUs we currently ban p2p. Maybe there is bigger question here for what is the story for p2p and iGPU? Should it really be blanket allowed like this? Should it not be opt-in with some userspace hints or something?
>>>
>>> Again no, P2P is mandatory for APUs. We have basically tons of customers using that with AMD dGPU and AMD iGPU and that works fine.
>>>
>>>>>
>>>>> The other important part is that even when you move to system memory, it's no longer pinned (MOVE_NOTIFY) so can you now can also get violent ping-ponging, which is addressed in the first patch in this series.
>>>
>>> Yeah that is something which we have seen before as well. That should definately be prevented by the kernel.
>>>
>>> Does that patch help with the performance?
>>
>> Mostly it's p2p that is the big killer. Series gives much as 10x FPS jump, if we stop negotiating p2p for the window buffer and prevent ping-ponging.
>>
>> For example, in GravityMark,  we go from ~18 FPS -> ~180 FPS, which matches the previous performance the user was getting. The ping-ponging hurts, but from the reports it looked like it was only in some games and not as severe as p2p. User confirmed this with CONFIG_PCI_P2PDMA=n, and that fixed most of the workloads. Adding the ping-pong fix then fixes everything.
> 
> In that case I have not the slightest idea what going wrong here.
> 
> The only difference with P2P enabled I can see is that the buffer is pulled over the PCIe bus by the iGPU instead of pushed by the dGPU.

As Thomas way saying, reads can be very slow, but writes are much 
faster, at least for pcie on this hw?

> 
> As I wrote in Thomas reply as well AMD uses exactly that setup with an dGPU and iGPU in the infotainment system found in Teslas and that works rather well as far as I know.

So do you use p2p for stuff like window buffers, where you constantly 
read over pcie every frame? And is it just on this setup, or is this 
more generally with any amd igpu + amd dgpu combo with upstream? Like 
with DRI_PRIME=1 with a game on the dgpu? There is no perf concern if 
you use p2p for this on your hw? If not, then I guess this is specific 
to our hw.

> 
> Regards,
> Christian.

