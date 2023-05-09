Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF023C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 13:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9118310E370;
	Tue,  9 May 2023 13:49:19 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0256810E235
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683640158; x=1715176158;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8Vm79hqKKLER0kdXNuY4geNdZOt5gQ9Vdh1/BUv2/pk=;
 b=QeDZ1jFl5DgEPvgxhdTko5CuzimvhOIijRQfRhP8yUjTHZaNygDnIm10
 IqrZKDlThB1PfKZ0xrhlpRb3inL4OmJPJaXRSxlgaf2MHh9SzPZqNUYrY
 FocgKiZv/xWhyTD8QCVDHE8y230bQzQ+CDr6i5T0WZfF3fWGG1pM2IKWK
 XfE3j7ZUrxaA7anFxV8iFeCSGYNpggqkg1n7Erf2KVjzKdDvWcvAiR5QH
 q8zN3ap+nsApl8NqbkvW2qPh7DNbM8hwo32FXnu9mO/i3Fd8wO6q5P+gI
 pon+sCrDrqKQg3VR4eo9BxdvZasaw/770G3Mwk6Km4JNtsai8kpnRBCtB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="339158232"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="339158232"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="701857305"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="701857305"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:49:14 -0700
Message-ID: <3387ce41-173d-c8c0-2610-1fbfd89193a4@linux.intel.com>
Date: Tue, 9 May 2023 15:49:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-16-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-16-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 15/31] drm: manager to keep track of GPUs
 VA mappings
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
Cc: Dave Airlie <airlied@redhat.com>, Danilo Krummrich <dakr@redhat.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/2/23 02:17, Matthew Brost wrote:
> From: Danilo Krummrich <dakr@redhat.com>
>
> Add infrastructure to keep track of GPU virtual address (VA) mappings
> with a decicated VA space manager implementation.
>
> New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> start implementing, allow userspace applications to request multiple and
> arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> intended to serve the following purposes in this context.
>
> 1) Provide infrastructure to track GPU VA allocations and mappings,
>     making use of the maple_tree.
>
> 2) Generically connect GPU VA mappings to their backing buffers, in
>     particular DRM GEM objects.
>
> 3) Provide a common implementation to perform more complex mapping
>     operations on the GPU VA space. In particular splitting and merging
>     of GPU VA mappings, e.g. for intersecting mapping requests or partial
>     unmap requests.
>
> Suggested-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Danilo, Matthew

Before embarking on a full review of this (saving this for last) I heard 
there might be plans to add userptr support, rebind_work interaction and 
such and resolve any driver differences using vfuncs.

Just wanted to raise a warning that helpers that attempt to "do it all" 
and depend on vfuncs are easy traps to start creating middle layers 
(like TTM) which are typically frowned upon. (See for example the 
discussion on the partly rejected patch series on the TTM shrinker).

So just as a recommendation to avoid redoing a lot of stuff, please be 
careful with additional helpers that require vfuncs and check if they 
can be implemented in another way by rethinking the layering.

Thanks,

Thomas


