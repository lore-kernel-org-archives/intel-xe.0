Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C345E743F3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 08:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B87E10E6C9;
	Fri, 29 Sep 2023 08:22:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD4810E6CC
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 08:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695975725; x=1727511725;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=QPemkiXKIcjgfLABpkqJOPfiD8dNy409RbAJ/SYhOGk=;
 b=l2T2n0gxYOGSHtHD5lc86QxpEnDvLhOEV+6TmTZE1/iWBHrhDdM9m9VG
 FPr2pki30aTsT9mXAvjmpoq5DokuLaEW7m8fNj9sK/ErP2Rpo5tVmEs0q
 krjlA4LkehzR20+gdLwy5KF/y7rx+qVHobrAWcQ2Wuq2VfFUfbq/iwGO+
 jUPw5aDrzDiMwR81g4CPwfVAftmG+1SRyhrujD1dgUeXN1tlWLTKypur0
 vO0QDgU2YOhNhHZdA58VCJNKIVy7JvDBTXQ6ggcpdHGfOVxKtlFsk8xuz
 ZFZ4SoCtpO4DEJg679qgrr5t69RQ8QF17Rl1rwe66jsAMHDgLC4hNIFuk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="382152108"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="382152108"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 00:29:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753286837"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="753286837"
Received: from knomani-mobl.ger.corp.intel.com (HELO [10.252.28.231])
 ([10.252.28.231])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 00:29:28 -0700
Message-ID: <922f6301-13cd-8e46-60ae-1c6be3953ce7@intel.com>
Date: Fri, 29 Sep 2023 08:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-GB
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230928100537.392675-7-matthew.auld@intel.com>
 <b70464b0c79eb96f4dea3b7dcd232feffd48804f.camel@intel.com>
 <884909b490ab1d6e170a3a9a33cc65a7326411b2.camel@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <884909b490ab1d6e170a3a9a33cc65a7326411b2.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v6 0/5] PAT and cache coherency support
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

On 28/09/2023 21:02, Souza, Jose wrote:
> On Thu, 2023-09-28 at 12:40 -0700, José Roberto de Souza wrote:
>> On Thu, 2023-09-28 at 11:05 +0100, Matthew Auld wrote:
>>> Branch available here:
>>> https://gitlab.freedesktop.org/mwa/kernel/-/tree/xe-pat-index?ref_type=heads
>>>
>>> Goal here is to allow userspace to directly control the pat_index when mapping
>>> memory via the ppGTT, in addtion to the CPU caching mode. This is very much
>>> needed on newer igpu platforms which allow incoherent GT access, where the
>>> choice over the cache level and expected coherency is best left to userspace
>>> depending on their usecase.  In the future there may also be other stuff encoded
>>> in the pat_index, so giving userspace direct control will also be needed there.
>>>
>>> To support this we added new gem_create uAPI for selecting the CPU cache
>>> mode to use for system memory, including the expected GPU coherency mode. There
>>> are various restrictions here for the selected coherency mode and compatible CPU
>>> cache modes.  With that in place the actual pat_index can now be provided as
>>> part of vm_bind. The only restriction is that the coherency mode of the
>>> pat_index must be at least as coherent as the gem_create coherency mode. There
>>> are also some special cases like with userptr and dma-buf.
>>>
>>> v2:
>>>    - Loads of improvements/tweaks. Main changes are to now allow
>>>      gem_create.coh_mode <= coh_mode(pat_index), rather than it needing to match
>>>      exactly. This simplifies the dma-buf policy from userspace pov. Also we now
>>>      only consider COH_NONE and COH_AT_LEAST_1WAY.
>>> v3:
>>>    - Rebase. Split the pte_encode() refactoring, plus various smaller tweaks and
>>>      fixes.
>>> v4:
>>>    - Rebase on Lucas' new series.
>>>    - Drop UC cache mode.
>>>    - s/smem_cpu_caching/cpu_caching/. Idea is to make VRAM WC explicit in the
>>>      uapi, plus make it more future proof.
>>> v5:
>>>    - Rebase, plus some small tweaks and fixes.
>>> v6:
>>>    - CI hooks fixes + checkpatch.
>>>
>>
>> With comment in patch 3/6 fixed this series is:
>> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
>> Tested-by: José Roberto de Souza <jose.souza@intel.com>
> 
> Here the Mesa implementation: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25462

Thanks.

> 
>>
>> Thank you
> 
