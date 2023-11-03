Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6EEC4167D
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 09:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEE110E4F9;
	Fri,  3 Nov 2023 09:05:56 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A8610E4F9
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 09:05:54 +0000 (UTC)
Message-ID: <e8c2d93d-3a3d-4c48-bb5e-498461991bbb@lankhorst.se>
Date: Fri, 3 Nov 2023 10:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
References: <20231027113453.117020-1-maarten.lankhorst@linux.intel.com>
 <122156991261aa88cc360d0e11e2e6ed2f79aefa.camel@intel.com>
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <122156991261aa88cc360d0e11e2e6ed2f79aefa.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 0/9] Cleaned up revert of remaining changes.
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

On 2023-11-01 12:45, Hogander, Jouni wrote:
> On Fri, 2023-10-27 at 13:34 +0200, Maarten Lankhorst wrote:
>> From: Maarten Lankhorst <dev@lankhorst.se>
>>
>> All reverts are made simpler, and the header updates are squashed to
>> a
>> single commit.
>>
>> This makes reviewing a lot easier.
> 
> I took overview of patches 4, 5 and 6. It seems your approach will take
> care of i915_gem_fence_wait_priority. These three patches should be
> sent to dri-devel@lists.freedesktop.org (at least patch 4) and
> intel-gfx@lists.freedesktop.org. I think we could use them in drm-xe-
> next while waiting for review to complete. I will soon start
> backporting this from drm-intel-next:
> 
> https://patchwork.freedesktop.org/series/125160/
Noticed this patch. You really only want to wait for USAGE_KERNEL if 
state->fence is set.

See drm_gem_plane_helper_prepare_fb.

Can you fix this up? Else I send a patch on monday.

Cheers,
~Maarten

> Still waiting for CI results there before merging into drm-intel-next.
> I was originally planning to use i915_compat headers for
> i915_gem_fence_wait_priority. I think your approach is better. So if
> it's ok to you I could sent these three patches together with my
> backport (https://patchwork.freedesktop.org/series/125160/) into intel-
> xe mailing list. what do you think?
> 
> Generally speaking I found this patch set being hard to follow and
> review. I would expect
> 
> 1. "fixup! FIXME: drm/i915/display: Remaining changes to make xe
> compile"
> 
> 2. FIXME: <name for changes split out>
> 
> where:
> 
> 1. removing changes from FIXME: drm/i915/display: Remaining changes to
> make xe compile" and 2. introducing same changes as a separate FIXME
> patch.
> 
> BR,
> 
> Jouni Högander
> 
> 
>> Maarten Lankhorst (9):
>>    drm/i915/display: Revert all before remaining changes to make xe
>>      compile
>>    drm/i915/display: Revert remaining changes to make xe compile
>>    drm/xe: Update headers to be more compatible with i915
>>    drm/atomic: Add drm_atomic_helper_set_fence_deadline() function
>>    drm/i915: Implement fence->set_deadline.
>>    FIXME drm/i915/display: Use fence->set_deadline to boost requests
>>    drm/i915/display: Use i915_gem_object_get_dma_address to get dma
>>      address
>>    FIXME drm/i915/display: Minimal changes to fbdev to make xe work
>>    FIXME drm/i915/display: Make intel_fb.c code compatible with xe
>>
>>   drivers/gpu/drm/drm_atomic_helper.c           |  15 ++-
>>   .../gpu/drm/i915/display/intel_atomic_plane.c |  70 +++---------
>>   drivers/gpu/drm/i915/display/intel_cursor.c   |  12 +--
>>   drivers/gpu/drm/i915/display/intel_display.c  |  37 +------
>>   .../drm/i915/display/intel_display_types.h    |   4 -
>>   drivers/gpu/drm/i915/display/intel_fb.c       |  89 ++++++----------
>>   drivers/gpu/drm/i915/display/intel_fbc.c      |  13 ++-
>>   drivers/gpu/drm/i915/display/intel_fbdev.c    | 100 ++++++----------
>> --
>>   .../gpu/drm/i915/display/intel_frontbuffer.c  |   7 +-
>>   .../gpu/drm/i915/display/intel_frontbuffer.h  |   4 -
>>   .../drm/i915/display/skl_universal_plane.c    |   4 -
>>   drivers/gpu/drm/i915/i915_request.c           |   9 ++
>>   .../compat-i915-headers/gem/i915_gem_lmem.h   |   2 +
>>   .../compat-i915-headers/gem/i915_gem_mman.h   |  17 +++
>>   .../compat-i915-headers/gem/i915_gem_object.h |  76 +++++++++++++
>>   .../gem/i915_gem_object_frontbuffer.h         |   4 +-
>>   .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 +
>>   .../xe/compat-i915-headers/i915_gem_stolen.h  |  13 ++-
>>   .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   6 ++
>>   include/drm/drm_atomic_helper.h               |   3 +-
>>   20 files changed, 234 insertions(+), 252 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/compat-i915-
>> headers/gem/i915_gem_lmem.h
>>   create mode 100644 drivers/gpu/drm/xe/compat-i915-
>> headers/gem/i915_gem_mman.h
>>   create mode 100644 drivers/gpu/drm/xe/compat-i915-
>> headers/gem/i915_gem_object.h
>>
> 
