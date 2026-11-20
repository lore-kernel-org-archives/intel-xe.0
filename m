Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D3360A2601
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ABN3X9bO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D40110E26E;
	Fri, 20 Nov 2026 14:53:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB7C10E26E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 14:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795186380; x=1826722380;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TT/13CTyFXsuqlMerIxRbn9FbD+oe54mqDJdH9KIuu4=;
 b=ABN3X9bOyhGrudn8S//3urff9SiKJ5YFuhSESq9vHjWmdCaycjIrOCqW
 +A0XjGfAvWoclbjHdhL3+/N6UfRoorhy0HLTfEGMMyy+jzX0/Jl67Hq2l
 eE63yodKQmGMqBJCXKFEs737cP/SLyG6taQcYglZa++SFMTyVrxT2UJZK
 ZO4C4FumP0860Vp6WEjM2cpjPUiHLn70RqtAbCjPHfzfKzbznWnsjgmtp
 AVUSq+NIVrQiwDo0EE1D3Dow9mrWktbmEvVO9mPS6gZS/jNuGPnOtm9X3
 P1wxWJBDqk2G+9nhkCAVYeHbEnviUCuzs9e5Embk+PgrgCTFCyrd5Yo/y w==;
X-CSE-ConnectionGUID: necqOEZ8QEuGO3NOpE1hgg==
X-CSE-MsgGUID: lDydUqT0SJOBqZedJowRSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4079936"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4079936"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:53:00 -0800
X-CSE-ConnectionGUID: TJcXCGJJQG2daIzDefhKow==
X-CSE-MsgGUID: 3quqqe0tSq2kuewS3WoQhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12716134"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.23])
 ([10.245.244.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:52:59 -0800
Message-ID: <94d7ba30-8c3a-41a6-893f-f45d03a91e9e@intel.com>
Date: Fri, 20 Nov 2026 14:52:57 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/xe/userptr: Make the repin retry loop non-fatal
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
 <20261120-userptr-repin-v2-5-65e1f6e582ef@intel.com>
 <sashiko-outbox-225315@kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <sashiko-outbox-225315@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 14:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe/userptr: stale uvma->userptr.repin causes premature
>    timeout after retry abort
> --
> 
> commit 90fc6239c153f6d32105ac91a7723de6506c06a9
> Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> drm/xe/userptr: Make the repin retry loop non-fatal
> 
> This commit converts -EBUSY from drm_gpusvm_get_pages() during userptr repin
> into -EAGAIN until an overall repin timeout expires, discounting idle gaps
> between retry attempts.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
>> index 2a3cd1b5efbb0..179f2aca26a39 100644
>> --- a/drivers/gpu/drm/xe/xe_userptr.h
>> +++ b/drivers/gpu/drm/xe/xe_userptr.h
> 
> [ ... ]
> 
>> +static inline void xe_userptr_repin_begin(struct xe_userptr_repin *repin)
>> +{
>> +	unsigned long now = jiffies;
>> +
>> +	if (!repin->start) {
>> +		repin->start = now ?: 1;
>> +		return;
>> +	}
>> +
>> +	if (repin->last &&
>> +	    time_after(now, repin->last +
>> +		       msecs_to_jiffies(XE_USERPTR_REPIN_IDLE_MS)))
>> +		repin->start = (repin->start + (now - repin->last)) ?: 1;
>> +	repin->last = 0;
>> +}
> 
> [Severity: Medium]
> Can an aborted retry sequence leave stale timestamps in
> uvma->userptr.repin and cause a later repin to time out early?
> 
> xe_vma_userptr_pin_pages() only zeroes uvma->userptr.repin when the repin
> completes or its timeout expires.  If the caller's retry loop aborts after
> receiving -EAGAIN, such as when xe_exec_ioctl() returns -ERESTARTSYS on a
> pending signal or DRM_XE_VM_BIND_OP_PREFETCH hits its outer repin timeout
> in xe_vm_bind_ioctl(), uvma->userptr.repin keeps its non-zero start and
> last timestamps.
> 
> On a separate repin of that VMA after XE_USERPTR_REPIN_IDLE_MS,
> xe_userptr_repin_begin() treats the elapsed time as an idle pause in the
> earlier loop and advances repin->start only by (now - repin->last).  That
> deducts the prior attempt's accrued duration (repin->last - repin->start)
> from the new attempt's timeout budget, which can make the next repin fail
> with -EBUSY after a single drm_gpusvm_get_pages() call and kill the VM in
> the rebind worker.

Yeah, I saw something like this already locally, and did play with some 
different solutions but threw them away. IMO this is kind of by design. 
We shouldn't just keep resetting and retrying forever on a troublesome 
userptr, and the 30 seconds is already pretty extreme if we start 
approaching that.

> 

