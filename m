Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5E2C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 09:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A4A10E030;
	Mon, 19 May 2025 09:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHGbZSxP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9C610E030
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 09:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747648727; x=1779184727;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S2q6wHtDA7ljv2N80yKGG4QnhxixXvA7CfDcRL4+1GU=;
 b=MHGbZSxP4pGqxI5ttkSowb8To6JOxIBfJv1/C8Dl4OFak9NUs5pajt1/
 EfJoGLlm11tUmX47xveQQxjYdRmPteNGs0HO+f9wf8F1b8m02rdL5i1WC
 PjzHxzHCushEvXIQ56cBWcKzt8rqXAGc6CfKjNtaASifU93kgaEJG969g
 jagbI/70ZFn6BsxihFaaL9+JeCxb0eYvYp1ruICQOxWom9ktQGBZcISFa
 ufTQgbpsmbwM4KB9fFG/JlEFex1hEGchzr7Eo6tLnlLS+L0BDeDmtKzu9
 Jtf19Y9KN7h2L1mlwutHhoqT4Za2Aq7IATsg3cMAd6g25SWCRBapgw4yo Q==;
X-CSE-ConnectionGUID: 9vmFYDWnRxSqIgq6yhycaA==
X-CSE-MsgGUID: Wq21YgX1T8OAZ6X8qCNFjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60882993"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="60882993"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 02:58:46 -0700
X-CSE-ConnectionGUID: 7vvf49krStaRvBn/dYMWBA==
X-CSE-MsgGUID: 9uvOhf5ISDiGrfkTUnpmsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="170230561"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.244.240])
 ([10.245.244.240])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 02:58:45 -0700
Message-ID: <4c095ae6-f449-469a-9472-87002695572d@intel.com>
Date: Mon, 19 May 2025 10:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/bo: optimise CCS case for WB pages
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, "Souza, Jose" <jose.souza@intel.com>
References: <20250516153810.223530-2-matthew.auld@intel.com>
 <20250516191203.GN5080@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250516191203.GN5080@mdroper-desk1.amr.corp.intel.com>
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

On 16/05/2025 20:12, Matt Roper wrote:
> On Fri, May 16, 2025 at 04:38:11PM +0100, Matthew Auld wrote:
>> Dealing with CCS state is significant on LNL+, where we end up clearing
>> the compression state on every page alloc using the blitter for user
>> buffers, including also saving and restoring it when moving between
>> domains, plus we need to alloc extra pages to hold the raw CCS state for
>> the save step.
>>
>> However all compression PAT modes, on platforms like LNL, also require
>> coh_none, meaning that only WC memory can use compression in the first
> 
> On PTL/Xe3 there's a new PAT entry 16 that has CCS compression + 1-way
> coherency (according to bspec page 71582).  It looks like we don't have
> that in the driver yet today, but we probably need to add it since
> userspace is expected to be able to use it.

Right, for that we are also missing userptr handling, if we can't just 
reject it (it will also currently throw a build error IIRC), and also 
need to figure out what to do with external imported dma-buf, I assume 
we just reject at bind time? Using compression with external dma-buf I 
assume is not going to work.

Jose had the idea of maybe adding a bo_create ioctl flag to opt of using 
compression, which we could use a hint for when to apply this 
optimisation more generally. Also would benefit SRIOV VF case where we 
can skip needing to deal with potential CCS state on PTL.

> 
> 
> Matt
> 
>> place. With this we can be sneaky and completely ignore CCS for WB
>> buffers, which is likely the common case anyway. This would then skip
>> all blitter moves/clears between sys <-> tt and then also means we can
>> drop the extra CCS pages.
>>
>> This should be safe since there is no way to interact with the
>> compression state (potentially uncleared) without using a PAT enabled
>> index (which is rejected at bind), including if trying to be malicious
>> and copy the raw CCS state from userpace, which should give back all
>> zeroes if the src surface (indirect) is lacking compressed PAT index.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c  | 8 ++++++++
>>   drivers/gpu/drm/xe/xe_pat.c | 3 ++-
>>   2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index d99d91fe8aa9..3fafdcb8d95b 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -2982,6 +2982,14 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>>   	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
>>   		return false;
>>   
>> +	/*
>> +	 * Compression implies coh_none, therefore we know for sure that WB
>> +	 * memory can't currently use compression, which is likely one of the
>> +	 * common cases.
>> +	 */
>> +	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)
>> +		return false;
>> +
>>   	return true;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 30fdbdb9341e..38a6a49c1b2a 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -103,7 +103,8 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
>>    *
>>    * Note: There is an implicit assumption in the driver that compression and
>>    * coh_1way+ are mutually exclusive. If this is ever not true then userptr
>> - * and imported dma-buf from external device will have uncleared ccs state.
>> + * and imported dma-buf from external device will have uncleared ccs state. See
>> + * also xe_bo_needs_ccs_pages().
>>    */
>>   #define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
>>   	{ \
>> -- 
>> 2.49.0
>>
> 

