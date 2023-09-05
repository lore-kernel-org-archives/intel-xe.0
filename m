Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07066C83F3E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 09:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6F810E189;
	Tue,  5 Sep 2023 09:16:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E7A10E189
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693905391; x=1725441391;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kTw4xyY63WqBe8kbr3RksxpYryilU8mqrJzEalgd/tw=;
 b=GMABrqCzD9tw4NO0PXB0suzaJBeI/lmi9y3krN1JTPSSzSaefDKYXF4s
 wKYQuQZ4/zd5WFnr3Oah9bJ/LnAmiR+kmP0u/jVddCVK6Om1aSAZIl4kt
 F86L8bwTm6ePavdxNHrV2NsekPbqSj04tdpzAwpJ65wF7dNVlcUygSykq
 bJybN92A3kKX/bvI01JuY/vIyMnNReKKWPsU26bMUnRZyrS6xTPFTwC4j
 buepwKC/CWosxz3jiA2zOYTe6WgBnuKKbSYNbA7rZxSVgdYL10Q8iD8VL
 Iu9HN1RtqWMUaVW6A9D8mZM8zitj2xc3XDnM63nte/RXSL0s5YqHQzMW9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="443148645"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="443148645"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 02:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="987753745"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="987753745"
Received: from dmansoco-mobl.ger.corp.intel.com (HELO [10.252.23.188])
 ([10.252.23.188])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 02:16:30 -0700
Message-ID: <eaab58ad-03a9-7685-d67a-8422314b853c@intel.com>
Date: Tue, 5 Sep 2023 10:16:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-GB
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <d1518a22903a9275558861d0ccb7d269aa134148.camel@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <d1518a22903a9275558861d0ccb7d269aa134148.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [RFC 0/5] PAT and cache coherency support
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

On 04/09/2023 21:25, Souza, Jose wrote:
> On Tue, 2023-08-29 at 17:28 +0100, Matthew Auld wrote:
>> Series still needs bunch of testing, but sending as RFC to get early feedback
>> while the IGT bits are being worked on. Note that the series also directly
>> depends on the WIP series here: https://patchwork.freedesktop.org/series/122708/
> 
> Left some comments in the patches but can't start experimenting because https://patchwork.freedesktop.org/series/122708/ breaks driver load.
> xe_pte_encode() calls __pte_encode() with a NULL vma.

Thanks for the comments.

Yeah, mostly just build tested so far. Once it makes it out of RFC and 
the uAPI is mostly stable we will share a branch.

> 
>>
>> Goal here is to allow userspace to directly control the pat_index when mapping
>> memory via the ppGTT, in addtion to the CPU caching mode for system memory. This
>> is very much needed on newer igpu platforms which allow incoherent GT access,
>> where the choice over the cache level and expected coherency is best left to
>> userspace depending on their usecase.  In the future there may also be other
>> stuff encoded in the pat_index, so giving userspace direct control will also be
>> needed there.
>>
>> To support this we added new gem_create uAPI for selecting the CPU cache
>> mode to use for system memory, including the expected GPU coherency mode. There
>> are various restrictions here for the selected coherency mode and compatible CPU
>> cache modes.  With that in place the actual pat_index can now be provided as
>> part of vm_bind. The only restriction is that the coherency mode of the
>> pat_index must match the gem_create coherency mode. There are also some special
>> cases like with userptr and dma-buf.
>>
> 
