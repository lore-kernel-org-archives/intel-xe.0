Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4D0E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 14:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BC310F029;
	Fri, 13 Dec 2024 14:13:31 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B50B10F029;
 Fri, 13 Dec 2024 14:13:30 +0000 (UTC)
Message-ID: <789d78c1-d16a-4cb3-b4ad-ba5f0ddcacaf@lankhorst.se>
Date: Fri, 13 Dec 2024 15:13:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
To: Maxime Ripard <mripard@kernel.org>, Friedrich Vock <friedrich.vock@gmx.de>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <29a71119-04de-4c76-a98a-d0fcb906390f@gmx.de>
 <20241213-sceptical-maize-gazelle-fadc34@houat>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20241213-sceptical-maize-gazelle-fadc34@houat>
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

Hey,

Den 2024-12-13 kl. 14:07, skrev Maxime Ripard:
> On Sun, Dec 08, 2024 at 01:15:34PM +0100, Friedrich Vock wrote:
>> Hi,
>>
>> On 04.12.24 14:44, Maarten Lankhorst wrote:
>>
>>> Because it only deals with memory regions, the UAPI has been updated
>>> to use dmem.min/low/max/current, and to make the API cleaner, the
>>> names are changed too.
>>>
>>> dmem.current could contain a line like:
>>> "drm/0000:03:00.0/vram0 1073741824"
>>>
>>> But I think using "drm/card0/vram0" instead of PCIID would perhaps
>>> be good too. I'm open to changing it to that based on feedback.
>>
>> Agree, allowing userspace to reference DRM devices via "cardN" syntax
>> sounds good.
>>
>> What about other subsystems potentially using dmem cgroups?
>> I'm not familiar with the media subsystem, but I imagine we might be
>> dealing with things like USB devices there? Is something like a
>> "deviceN" possible there as well, or would device IDs look completely
>> different?
I'd just take what makes sense for each driver. dev_name() would be a 
good approximation.

I agree that cardN is not stable.

> > I have some patches to enable the cgroup in GEM-based drivers, media
> ones and dma-buf heaps. The dma-buf heaps are simple enough since the
> heaps names are supposed to be stable.

I've used your patch as a base enable cgroup in drivers that use the 
VRAM manager. I didn't want to enable it for all of GEM, because it 
would conflict with drivers using TTM. Some more discussion is needed first.

For DMA-BUF heaps, I think it's fine and there is a lot less need of 
discussion. I just felt it should be sent separately from the initial 
enablement.

> I don't think using card0 vs card1 (or v4l0 vs v4l1 for example) will
> work because I don't think we have any sort of guarantee that these
> names will always point to the same devices across reboots or updates.
> 
> If the module is loaded later than it used to for example, we could very
> well end up in a situation where card0 and card1 are swapped, while the
> constraints apply to the previous situation.
I agree, just put it out there for discussion. I don't think the 
benefits weigh up against the downsides :-)

Cheers,
~Maarten
