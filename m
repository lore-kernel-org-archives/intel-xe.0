Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE944C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 14:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7029D10E822;
	Thu, 26 Oct 2023 14:21:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002C810E817
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698330059; x=1729866059;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=LZLeo3qjdQpUD/MoVn2Kx363q+2vVSb3DlHt1j9roBM=;
 b=QQNMCi2nfaH3pUdGTUnik1vh0mtIzOFFIpfSn8DV6xzF/RJSBO5fDhmY
 QIjwkR5YeVdtOsjhi7//QFC1OBSLkdBGYG7DTplRTzAik32WiIVKVa9Jt
 M/g4eS5ZVnIx+jsl1Lue2ePowJQuj/sUoyImtSagWtKe73huSCBnLLpFZ
 Jx3/mOVN0FkQ2IlRixRrWMIgoDhJGQKlyoKCJXdNfOR09rTQle9pPeB+e
 SaYwkjsCQMqzJBLTa5ZwhsGL4JJQ+ETpVO/PtJPyk82WtTpJqmnWwn8ZP
 yR7yQuHxJRJUC94R4Skj8LOBJuWJaILrWDMnKFGwVoN1tic93PEvHJ/QQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391434591"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="391434591"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 07:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="1090613780"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="1090613780"
Received: from tsanates-mobl1.ger.corp.intel.com (HELO [10.249.41.78])
 ([10.249.41.78])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 07:20:56 -0700
Message-ID: <42e06cd4-1e79-1a65-8e6b-09a34ffc9221@linux.intel.com>
Date: Thu, 26 Oct 2023 16:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org
References: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
 <87jzr97a8w.fsf@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87jzr97a8w.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 00/15] Destroy 'remaining changes to make xe
 compile'
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

On 2023-10-26 16:02, Jani Nikula wrote:
> On Thu, 26 Oct 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
>> From: Maarten Lankhorst <dev@lankhorst.se>
>>
>> Revert all pieces one by 1, and fixup the patch until only a small
>> amount of changes are left.
>>
>> Update compat headers for extra definitions, those patches should
>> probably be squashed too.
> 
> Yeah. Most of these need proper fixup! annotations. (git commit --amend
> --fixup=<sha1>)
> 
> A handful of patches need to be sent and merged upstream first and then
> backported?
> 

The fence->set_deadline stuff should be upstreamed, but might conflict 
with Jouni's stuff.

All reverts apply to the original patch, and compat headers should 
probably all be squashed.

I originally intended to do a rebase to grab all sound stuff too, so 
only drm/i915 and drm/xe patche would remain, and rest is just clear 
from review perspective.

Cheers,
~Maarten

>>
>> Maarten Lankhorst (15):
>>    revert fixme in intel_atomic_plane.c
>>    drm/atomic: Add drm_atomic_helper_set_fence_deadline() function
>>    drm/i915: Implement fence->set_deadline.
>>    FIXME drm/i915/display: Use fence->set_deadline to boost requests
>>    fixup xe i915_drv.h compat header
>>    revert intel_frontbuffer changes.
>>    Update compat headers.
>>    more reverts
>>    drm/i915/display: Use i915_gem_object_get_dma_address to get dma
>>      address
>>    revert more (fbc)
>>    drm/i915/display: Revert all before remaining changes to make xe
>>      compile
>>    drm/i915/display: Revert remaining changes to make xe compile
>>    drm/xe: Update headers to be more compatible with i915
>>    FIXME drm/i915/display: Minimal changes to fbdev to make xe work
>>    FIXME drm/i915/display: Make intel_fb.c code compatible with xe
>>
>>   drivers/gpu/drm/drm_atomic_helper.c           |  15 ++-
>>   .../gpu/drm/i915/display/intel_atomic_plane.c |  70 +++---------
>>   drivers/gpu/drm/i915/display/intel_cursor.c   |  12 +--
>>   drivers/gpu/drm/i915/display/intel_display.c  |  37 +------
>>   .../drm/i915/display/intel_display_types.h    |   4 -
>>   drivers/gpu/drm/i915/display/intel_fb.c       |  89 ++++++----------
>>   drivers/gpu/drm/i915/display/intel_fbc.c      |  13 ++-
>>   drivers/gpu/drm/i915/display/intel_fbdev.c    | 100 ++++++------------
>>   .../gpu/drm/i915/display/intel_frontbuffer.c  |   7 +-
>>   .../gpu/drm/i915/display/intel_frontbuffer.h  |   4 -
>>   .../drm/i915/display/skl_universal_plane.c    |   4 -
>>   drivers/gpu/drm/i915/i915_request.c           |   9 ++
>>   .../compat-i915-headers/gem/i915_gem_lmem.h   |   2 +
>>   .../compat-i915-headers/gem/i915_gem_mman.h   |  17 +++
>>   .../compat-i915-headers/gem/i915_gem_object.h |  76 +++++++++++++
>>   .../gem/i915_gem_object_frontbuffer.h         |   4 +-
>>   .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 +
>>   .../xe/compat-i915-headers/i915_gem_stolen.h  |  13 ++-
>>   .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   6 ++
>>   include/drm/drm_atomic_helper.h               |   3 +-
>>   20 files changed, 234 insertions(+), 252 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
>>   create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
>>   create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
> 
