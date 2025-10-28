Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C45ACCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 13:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A45610E3D5;
	Tue, 28 Oct 2025 13:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KelRkPq0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CC310E3D5
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761656575; x=1793192575;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a/27me1DW9rW5dUZUQBrnKFvkdma7sH4ksbi+oHXZFM=;
 b=KelRkPq0de0yCz5h9tRWOpX/iA7jVS2u40UNGFLgq9nVUyerEzFzm/Ok
 Sxv3716zfPDbsUydzQWcuPB1AS+KhNPLQ7qrTd8HteVrl8FUWJrVAkz6z
 wmcn4VAblS7fcbhosPuEpuhg7vghBn5/sCUBkhD2Ex4B5qyyMJktmOKkI
 W3VyoXOP8rAUSZRveYEGEWiFHFqcjir2C8C0hchJKLg+1y6J+mL+Y7SvN
 eWdMCyensD5/X/PoqJTiAnpagKrffnw5bi8cwZAiGqtNj4S8CzME+a/NF
 yjc9VVYOa8zZI6xAAR5S2J42w/0GKdrQT8raJYt4BA4J/c6JEIgxI+wSR Q==;
X-CSE-ConnectionGUID: 436SQ4S3QWe3CeIPJlJ4oA==
X-CSE-MsgGUID: kw62yajdSMK1fiRhmGqNqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74040726"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74040726"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:02:55 -0700
X-CSE-ConnectionGUID: YpKzejcBQ3GWYyZvSOXhTA==
X-CSE-MsgGUID: IDSdy/R7Qc2fx2CzhpEHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184520063"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.159])
 ([10.245.244.159])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 06:02:53 -0700
Message-ID: <dda281c6-5b38-47aa-b8fe-b515f4c9f0d4@intel.com>
Date: Tue, 28 Oct 2025 13:02:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/9] drm/xe/madvise: Add support for purgeable buffer
 objects
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
 <d2b6819e31d1bcfc032ee1be2e75204d5549f583.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <d2b6819e31d1bcfc032ee1be2e75204d5549f583.camel@linux.intel.com>
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

On 28/10/2025 12:37, Thomas Hellström wrote:
> On Tue, 2025-10-28 at 17:54 +0530, Arvind Yadav wrote:
>> This patch series introduces support for purgeable buffer objects
>> (BOs) in the Xe driver.
>> This feature allows userspace applications to provide memory usage
>> hints to the kernel,
>> enabling more effective memory management, especially under system
>> memory pressure.
>>
>> When an application no longer needs the contents of a buffer, it can
>> mark it as DONTNEED
>> via the DRM_XE_MADVISE ioctl. This makes the BO a candidate for
>> purging. If the kernel
>> experiences memory pressure, it can reclaim the backing store of
>> these BOs,
>> freeing up GPU memory and helping to prevent Out-Of-Memory (OOM)
>> situations.
>>
>> The lifecycle of a purgeable BO is as follows:
>>
>> A BO starts in the default WILLNEED state.
>> Userspace marks it as DONTNEED when its contents are discardable.
>> Under memory pressure, the kernel may purge the BO, transitioning it
>> to the PURGED state.
>> Any attempt to use a purged BO (e.g., binding, mapping, or CPU
>> access) will result in an error,
>> signaling to the application that the contents are gone. The
>> application can then re-validate
>> the BO by marking it WILLNEED, at which point new backing store is
>> allocated. To prevent data corruption,
>> a critical safety check ensures that only non-shared buffers can be
>> marked as purgeable.
> 
> What happens if the bo is bound to multiple address ranges? Do we
> require all of them to be marked purged?
> 
> Also with i915, when someone called WILLNEED on a purged bo, there was
> an error rather than an attempt to rebind. What's the reasoning behind
> re-allocating backing store here? Doesn't that mean we need to keep
> vmas around even if we purge?

Yeah, IIRC in Mesa/iris it used some kind of BO pool, marking stuff as 
DONTNEED when "freeing" to the pool, and then when something was 
allocated again from the pool it's first marked as WILLNEED, but if it 
was purged they would simply discard the BO and try the next available 
BO in the pool, which is hopefully not purged. So sounds like 
re-allocating could potentially end up with undesired behaviour where it 
now just always re-allocates instead of trying to re-use an existing 
non-purged BO which might already have pages ready to go.

> 
> /Thomas
> 
>>
>> Arvind Yadav (7):
>>    drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
>>    drm/xe/madvise: Implement purgeable buffer object support
>>    drm/xe/bo: Prevent purging of shared buffer objects
>>    drm/xe/bo: Handle CPU faults on purged buffer objects
>>    drm/xe/bo: Prevent mmap of purged buffer objects
>>    drm/xe/vm: Prevent binding of purged buffer objects
>>    drm/xe: Add support for querying purgeable BO states
>>
>> Himal Prasad Ghimiray (2):
>>    drm/xe/uapi: Add UAPI support for purgeable buffer objects
>>    drm/xe/uapi: Add UAPI for purgeable bo state to madvise query
>> response
>>
>>   drivers/gpu/drm/xe/xe_bo.c         | 91 ++++++++++++++++++++++++++--
>> --
>>   drivers/gpu/drm/xe/xe_bo.h         | 51 +++++++++++++++++
>>   drivers/gpu/drm/xe/xe_bo_types.h   |  3 +
>>   drivers/gpu/drm/xe/xe_vm.c         | 11 ++++
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 67 ++++++++++++++++++++++
>>   include/uapi/drm/xe_drm.h          | 34 +++++++++++
>>   6 files changed, 245 insertions(+), 12 deletions(-)
>>
> 

