Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEB6CE7B08
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 07:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709D810E5DE;
	Thu, 28 Sep 2023 07:53:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B65410E5DE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 07:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695887590; x=1727423590;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=h0reG76rxGa/4EyrLNFskzt9marTRfDP8frZwYXFkGU=;
 b=XEgofVWhSPvXTiVN/R/buEvyfasPSB3lb+2rCA1cJuqTa1HBQ8rb/xK8
 4CQKPHDDpag6sazSszylD3VsdXv+e/P935PTKlqY9oFDU3K0fXjFRTlU+
 M5KHfKzEVaJ4KbkADIgG7RQdCEkmsN2sk++qth7vUo1v6jf5PB98+dV+l
 iOnfoSldDwWq+at1MIrd6Y/EB5d//zfkUFQAyWYNIgVkLzTwqgry1JNfO
 6H7o3Kp0XhzrRR9JVhhZ2Et2ljgt5Bdcc5GczmjF6flN0dnIbto4QVoXs
 Je6RlGbGuTfkPjZyWCi+cDk8b7SmiPYiCRmgVX9NTHRgA5JIKBhPMb3Uo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="468290954"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="468290954"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 00:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752878779"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="752878779"
Received: from nlesniak-mobl.ger.corp.intel.com (HELO [10.252.28.108])
 ([10.252.28.108])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 00:53:08 -0700
Message-ID: <99cdfaf9-6a30-d7a1-b2b9-7ffae732f9a3@intel.com>
Date: Thu, 28 Sep 2023 08:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-GB
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230927110005.291917-7-matthew.auld@intel.com>
 <e4ae875f6f17b911d873abf449ecdc7b45cdf303.camel@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <e4ae875f6f17b911d873abf449ecdc7b45cdf303.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v4 0/5] PAT and cache coherency support
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

On 27/09/2023 17:21, Souza, Jose wrote:
> On Wed, 2023-09-27 at 12:00 +0100, Matthew Auld wrote:
>> Branch available here:
>> https://gitlab.freedesktop.org/mwa/kernel/-/tree/xe-pat-index?ref_type=heads
>>
>> Series directly depends on the patches here:
>> https://patchwork.freedesktop.org/series/124225/
>>
>> Goal here is to allow userspace to directly control the pat_index when mapping
>> memory via the ppGTT, in addtion to the CPU caching mode. This is very much
>> needed on newer igpu platforms which allow incoherent GT access, where the
>> choice over the cache level and expected coherency is best left to userspace
>> depending on their usecase.  In the future there may also be other stuff encoded
>> in the pat_index, so giving userspace direct control will also be needed there.
>>
>> To support this we added new gem_create uAPI for selecting the CPU cache
>> mode to use for system memory, including the expected GPU coherency mode. There
>> are various restrictions here for the selected coherency mode and compatible CPU
>> cache modes.  With that in place the actual pat_index can now be provided as
>> part of vm_bind. The only restriction is that the coherency mode of the
>> pat_index must be at least as coherent as the gem_create coherency mode. There
>> are also some special cases like with userptr and dma-buf.
>>
>> v2:
>>    - Loads of improvements/tweaks. Main changes are to now allow
>>      gem_create.coh_mode <= coh_mode(pat_index), rather than it needing to match
>>      exactly. This simplifies the dma-buf policy from userspace pov. Also we now
>>      only consider COH_NONE and COH_AT_LEAST_1WAY.
>> v3:
>>    - Rebase. Split the pte_encode() refactoring, plus various smaller tweaks and
>>      fixes.
>> v4:
>>    - Rebase on Lucas' new series.
>>    - Drop UC cache mode.
>>    - s/smem_cpu_caching/cpu_caching/. Idea is to make VRAM WC explicit in the
>>      uapi, plus make it more future proof.
>>
> 
> Thanks for the smem_cpu_caching to cpu_caching change.
> 
> This latest version is causing a GuC fw load failure in MTL, I have bisected and it is caused by "drm/xe: directly use pat_index for pte_encode".

Ok, there are some fixes in the latest version around that patch, 
perhaps that resolves it.

> 
> [  173.995308] xe 0000:00:02.0: [drm:xe_guc_init [xe]] GuC param[12] = 0x00000000
> [  173.995388] xe 0000:00:02.0: [drm:xe_guc_init [xe]] GuC param[13] = 0x00000000
> [  173.995467] xe 0000:00:02.0: [drm:xe_wopcm_init [xe]] WOPCM: 4096K
> [  173.995609] xe 0000:00:02.0: [drm:xe_wopcm_init [xe]] GuC WOPCM is already locked [2048K, 832K)
> [  174.234667] xe 0000:00:02.0: [drm] GuC load failed: status = 0x80007134
> [  174.234681] xe 0000:00:02.0: [drm] GuC load failed: status: Reset = 0, BootROM = 0x1A, UKernel = 0x71, MIA = 0x00, Auth = 0x02
> [  174.234690] xe 0000:00:02.0: [drm] 0xcabba9e6 0xdeadfeed 0x00000000 0x00000078
> [  174.234697] xe 0000:00:02.0: [drm] 0x00010000 0x00000000 0x0000fff0 0x00000000
> [  174.234703] xe 0000:00:02.0: [drm] 0x00000002 0xcabba9e6 0x8086dead 0x00000000
> [  174.234709] xe 0000:00:02.0: [drm] 0x00000000 0x00002000 0x00000000 0x00002000
> [  174.234714] xe 0000:00:02.0: [drm] 0x00000000 0x00000002 0xcabba9f6 0xbeeffeed
> [  174.234719] xe 0000:00:02.0: [drm] 0x00000000 0x00000000 0x00004000 0x00000000
> [  174.234724] xe 0000:00:02.0: [drm] 0x00004000 0x00000000 0x00000002 0x8086900d
> [  174.234730] xe 0000:00:02.0: [drm] 0x00010000 0x00000006 0x00010001 0x00460606
> [  174.234735] xe 0000:00:02.0: [drm] 0x00020001 0x00004050 0x00030001 0x00004b00
> [  174.234741] xe 0000:00:02.0: [drm] 0x00000000 0x00000000 0x00000000 0x00000000
> 
> 
> uAPI wise it need some renames to follow with the uAPI alignment series(https://patchwork.freedesktop.org/series/124271/) take a look at
> https://patchwork.freedesktop.org/patch/559576/?series=124271&rev=1

Ok, will align with that.

> https://patchwork.freedesktop.org/patch/559577/?series=124271&rev=1

I think we are only dealing with adding properties and not so much 
flags. i.e you can't apply them like flags: cpu_mapping = WC | WB.

> 
> 
