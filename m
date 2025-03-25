Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A352FC3600B
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 10:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683B710E392;
	Tue, 25 Mar 2025 10:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMIwxbq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7548410E392
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742897289; x=1774433289;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1nG/eA4CawrJI9SR7Rm0hQCYDAZ8hqC/1RDfFEa6iNg=;
 b=HMIwxbq/2y0cB/8W8rPQ4FWSRnfoFbQ1QE1YP1R9n5QJKO/UwHMZsiue
 XnXiiW51ztV4H9EKOTBxnOxe6jnxO3ah5uUMPr2PeTwZSislr0Ij+1j2B
 MiqwPniI9o+xGHCHFJ0G7q2aLqHMz0y5tFGYdc0wn16hcRc9OoJWOIUdO
 r7/0UvMH8/vyLxt4d/mMlcmKD+YwAc60P7Wqmc1Z+ged9vyMC847q6a59
 TsBIbUfngYyGlZoVnEsynz5/xqrJ3xQLK/gA4jxW9paN5tteHhi/kbXce
 5hI3Cqupa8hyb3DETKKBRG3G5xkg42KqBYGmY5Ral7YWNAeOf496+4CkX g==;
X-CSE-ConnectionGUID: EYHVNJGwQjKO155tfydrKA==
X-CSE-MsgGUID: YKfvxJ6IT3qJnpVap7k9Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44150563"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="44150563"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:08:09 -0700
X-CSE-ConnectionGUID: Zud0gAe4T+6djsjkheXq+g==
X-CSE-MsgGUID: VMboHHYNS8SwJpm4PVpU+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124853425"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO [10.245.244.125])
 ([10.245.244.125])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:08:09 -0700
Message-ID: <ed599ccb-2027-4936-acc1-e01ef5f6c42d@intel.com>
Date: Tue, 25 Mar 2025 10:08:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/xe/bo: Add a bo remove callback
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>
References: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
 <20250324165500.20680-4-thomas.hellstrom@linux.intel.com>
 <8be75eef-2baf-4606-a8cc-1b392db6d918@intel.com>
 <4edfc75d575412439efd6dcad15d875eb1c557f5.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <4edfc75d575412439efd6dcad15d875eb1c557f5.camel@linux.intel.com>
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

On 25/03/2025 09:07, Thomas Hellström wrote:
> On Tue, 2025-03-25 at 09:02 +0000, Matthew Auld wrote:
>> On 24/03/2025 16:54, Thomas Hellström wrote:
>>> On device unbind, migrate exported bos, including pagemap bos to
>>> system. This allows importers to take proper action without
>>> disruption. In particular, SVM clients on remote devices may
>>> continue as if nothing happened, and can chose a different
>>> placement.
>>>
>>> The evict_flags() placement is chosen in such a way that bos that
>>> aren't exported are purged.
>>>
>>> For pinned bos, we unmap DMA, but their pages are not freed yet
>>> since we can't be 100% sure they are not accessed.
>>>
>>> All pinned external bos (not just the VRAM ones) are put on the
>>> pinned.external list with this patch. But this only affects the
>>> xe_bo_pci_dev_remove_pinned() function since !VRAM bos are
>>> ignored by the suspend / resume functionality. As a follow-up we
>>> could look at removing the suspend / resume iteration over
>>> pinned external bos since we currently don't allow pinning
>>> external bos in VRAM, and other external bos don't need any
>>> special treatment at suspend / resume.
>>>
>>> v2:
>>> - Address review comments. (Matthew Auld).
>>> v3:
>>> - Don't introduce an external_evicted list (Matthew Auld)
>>> - Add a discussion around suspend / resume behaviour to the
>>>     commit message.
>>> - Formatting fixes.
>>>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
> 
> Actually, there is a CI failure on LNL indicating that the pinned
> kernel-bo dma-maps are actually needed at devm-managed release.

Hmm, do you have a link? The failure I see looks to be more probe 
related? Once we do unplug(), outside the special evict all we do here 
we should pretty much not need dma-maps?

What about moving the evict_all into a well placed devm action during 
probe? Basically at the point at which we think it is reasonable to get 
rid of the dma-maps? Or is that what you mean below?

> 
> I'm in the process on testing this out on LNL, and if so I'll drop
> these dma-unmaps and we'd continue down the route of ensuring that
> these subsystems are indeed devm_ managed and not drmm_ managed.
> 
> Thanks,
> Thomas
> 
> 
> 

