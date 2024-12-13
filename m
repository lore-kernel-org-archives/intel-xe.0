Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF774E77180
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 14:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC4510F05D;
	Fri, 13 Dec 2024 14:53:17 +0000 (UTC)
X-Greylist: delayed 2387 seconds by postgrey-1.36 at gabe;
 Fri, 13 Dec 2024 14:53:15 UTC
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B4010F049;
 Fri, 13 Dec 2024 14:53:15 +0000 (UTC)
Message-ID: <80c49a80-d49c-4ca5-9568-9f7950618275@lankhorst.se>
Date: Fri, 13 Dec 2024 15:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241213-proud-kind-uakari-df3a70@houat>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20241213-proud-kind-uakari-df3a70@houat>
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



Den 2024-12-13 kl. 14:03, skrev Maxime Ripard:
> Hi,
> 
> Thanks for the new update!
> 
> On Wed, Dec 04, 2024 at 02:44:00PM +0100, Maarten Lankhorst wrote:
>> New update. Instead of calling it the 'dev' cgroup, it's now the
>> 'dmem' cgroup.
>>
>> Because it only deals with memory regions, the UAPI has been updated
>> to use dmem.min/low/max/current, and to make the API cleaner, the
>> names are changed too.
> 
> The API is much nicer, and fits much better into other frameworks too.
> 
>> dmem.current could contain a line like:
>> "drm/0000:03:00.0/vram0 1073741824"
>>
>> But I think using "drm/card0/vram0" instead of PCIID would perhaps be
>> good too. I'm open to changing it to that based on feedback.
> 
> Do we have any sort of guarantee over the name card0 being stable across
> reboots?
> 
> I also wonder if we should have a "total" device that limits the amount
> of memory we can allocate from any region?
I don't think it is useful. Say your app can use 1 GB of main memory or 
2 GB of VRAM, it wouldn't make sense to limit the total of those. In a 
lot of cases there is only 1 region, so the total of that would still be 
the same.

On top, we just separated the management of each region, adding a 
'total' would require unseparating it again. :-)

I'm happy with this version I think. I don't think more changes for the
base are needed.

Cheers,
~Maarten
