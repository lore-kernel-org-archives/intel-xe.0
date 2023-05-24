Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04449C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 20:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DD310E60B;
	Wed, 24 May 2023 20:13:24 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0269510E60B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 20:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684959203; x=1716495203;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZExkdNBDDgvUbsoZXTo5vbF4c1xL8Oq7tiRyY9uV3g4=;
 b=EY+S/95M1SD786tKwTuDAvW7XY4iBdfGrUzqcZvu8s7J/My84oklZlxs
 8pmsGenoxyv6mm80hG83aSbI1dV6mXyfEyCjP+2lqXPe26dl7VKE2baAN
 41NCEWsAvijq1t/4mdZ4hyjDzUaPiYfz2hVVD9RjFWwtQgwjNJZ3Pw+AS
 EEwWAAHUukaMuILgFGnPiBKV7hSfO3SHMApADJKPb5j/Tz9m2Wb3bIzPL
 cRPMZIIyGYjsKhfVMHpcx6GsjbUI8pOUEVXXDCdfkSCJYgroCuDB5h2TP
 rKukElzknMZlMz9nysXqUTKpi9Uql9ym2U1iHa7vcJJ1FnNdcivZeB7jL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356912044"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="356912044"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 13:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="707694079"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="707694079"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.39.193])
 ([10.249.39.193])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 13:12:47 -0700
Message-ID: <673b857b-412d-152f-eede-e62fe9454060@linux.intel.com>
Date: Wed, 24 May 2023 22:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
References: <20230524123648.29955-1-nirmoy.das@intel.com>
 <ZG5Xx1R2xh/tf0f8@DUT025-TGLU.fm.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZG5Xx1R2xh/tf0f8@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC PATCH 0/2] Implement vma madvise ioctl
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


On 5/24/2023 8:30 PM, Matthew Brost wrote:
> On Wed, May 24, 2023 at 02:36:46PM +0200, Nirmoy Das wrote:
>> Sending this initial RFC patch series for vma madvise ioctl
>> to gether feedback if this the correct way to do that.
>>
>> I am adding two expected options for userspace to pass
>>
>> DRM_XE_VMA_MADVISE_WILLNEED:
>> 	* Set ttm priority to normal/high(if cap permits)
>> 	* Make sure VMAs are in allowed placement and bound.
>>
>> DRM_XE_VMA_MADVISE_DONTNEED:
>> 	* Set ttm priority to low so the BO belong to the vma
>> 	become early target for eviction.
>> 	* Make sure VMAs are not bound.
>>
>> Questions:
>> Should this be part of DRM_IOCTL_XE_VM_MADVISE rather than creating new ioctl?
>>
> Def not a new IOCTL. Let's take a step back, what are you trying to
> implement that the current DRM_IOCTL_XE_VM_MADVISE IOCTL / VM bind IOCTL
> does not support?

AFAIU at this moment:

MADVISE_WILLNEED  ==  XE_VM_BIND_OP_PREFETCH + DRM_XE_VM_MADVISE_PRIORITY
MADVISE_DONTNEED  ==  XE_VM_BIND_OP_UNMAP + DRM_XE_VM_MADVISE_PRIORITY

So unless we need explicit madvise ioctl or vm_madvise ioctl options for UMD,
I think we can have madvise equivalent with above vm bind and vm madvise ioctl.

Hi Thomas, Joonas,

What do you think ?


Regards,

Nirmoy

>
> Matt
>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>>
>> Nirmoy Das (2):
>>    drm/xe: Expose vma bind-unbind functions
>>    drm/xe: Implement madvise ioctl for vma
>>
>>   drivers/gpu/drm/xe/Makefile         |   1 +
>>   drivers/gpu/drm/xe/xe_device.c      |   2 +
>>   drivers/gpu/drm/xe/xe_vm.c          |  52 +++----
>>   drivers/gpu/drm/xe/xe_vm.h          |   3 +
>>   drivers/gpu/drm/xe/xe_vma_madvise.c | 223 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vma_madvise.h |  15 ++
>>   include/uapi/drm/xe_drm.h           |  28 ++++
>>   7 files changed, 296 insertions(+), 28 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.h
>>
>> -- 
>> 2.39.0
>>
