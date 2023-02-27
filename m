Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D203C6FD1B
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 14:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D27910E25E;
	Mon,  6 Mar 2023 14:41:04 +0000 (UTC)
X-Greylist: delayed 559 seconds by postgrey-1.36 at gabe;
 Mon, 27 Feb 2023 09:04:36 UTC
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CED10E37D;
 Mon, 27 Feb 2023 09:04:36 +0000 (UTC)
Message-ID: <6f0b5231-a9c2-e31e-f2d6-61f403d2f94d@lankhorst.se>
Date: Mon, 27 Feb 2023 09:55:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
References: <20230224095152.30134-1-thomas.hellstrom@linux.intel.com>
 <6cddb602-31dd-8854-25dc-11afe9b1a275@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <6cddb602-31dd-8854-25dc-11afe9b1a275@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Mar 2023 14:41:02 +0000
Subject: Re: [Intel-xe] [PATCH v4 0/3] drm/helpers: Make the suballocation
 manager drm generic
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
Cc: intel-gfx@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey,

I can push this to drm-misc-next, I don't think a drm maintainer ack is 
needed, as long as we have the acks from the amd folk for merging 
through drm-misc-next.

~Maarten

On 2023-02-27 09:11, Thomas Hellström wrote:
> Daniel, Dave
>
> Ack to merge this to drm through drm-misc-next?
>
> /Thomas
>
>
> On 2/24/23 10:51, Thomas Hellström wrote:
>> This series (or at least the suballocator helper) is a prerequisite
>> for the new Xe driver.
>>
>> There was an unresolved issue when the series was last up for review,
>> and that was the per allocation aligment. Last message was from
>> Maarten Lankhorst arguing that the larger per-driver alignment used
>> would only incur a small memory cost. This new variant resolves that.
>>
>> The generic suballocator has been tested with the Xe driver, and a
>> kunit test is under development.
>> The amd- and radeon adaptations are only compile-tested.
>>
>> v3:
>> - Remove stale author information (Christian König)
>> - Update Radeon Kconfig (Thomas Hellström)
>>
>> v4:
>> - Avoid 64-bit integer divisions (kernel test robot <lkp@intel.com>)
>> - Use size_t rather than u64 for the managed range. (Thomas)
>>
>>
>> Maarten Lankhorst (3):
>>    drm/suballoc: Extract amdgpu_sa.c as generic suballocation helper
>>    drm/amd: Convert amdgpu to use suballocation helper.
>>    drm/radeon: Use the drm suballocation manager implementation.
>>
>>   drivers/gpu/drm/Kconfig                    |   4 +
>>   drivers/gpu/drm/Makefile                   |   3 +
>>   drivers/gpu/drm/amd/amdgpu/Kconfig         |   1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  26 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  23 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 324 +--------------
>>   drivers/gpu/drm/drm_suballoc.c             | 457 +++++++++++++++++++++
>>   drivers/gpu/drm/radeon/Kconfig             |   1 +
>>   drivers/gpu/drm/radeon/radeon.h            |  55 +--
>>   drivers/gpu/drm/radeon/radeon_ib.c         |  12 +-
>>   drivers/gpu/drm/radeon/radeon_object.h     |  25 +-
>>   drivers/gpu/drm/radeon/radeon_sa.c         | 316 ++------------
>>   drivers/gpu/drm/radeon/radeon_semaphore.c  |   4 +-
>>   include/drm/drm_suballoc.h                 | 108 +++++
>>   16 files changed, 674 insertions(+), 693 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_suballoc.c
>>   create mode 100644 include/drm/drm_suballoc.h
>>
