Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB81CC44512
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 15:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702E310E0F7;
	Thu, 16 Jul 2026 15:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRwpVeCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B016310E0F7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784217326; x=1815753326;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PYiJnDZfZgAz/PTp6HvKjCyOO3Y6elICnjcj8mGN5As=;
 b=iRwpVeCvlH/pMDAxYiLRrkTlBsCi5eAo3c8Jj/I/IGrhn+hX84JBmlfl
 mG9BVwF/Lx6OHlrKCRs+CHfhjN+/SJbEQUr1JJymSL11NOP4VmThHJQsd
 B0kx0pgmmumMNLYoK3DW+M8mR0A+0sNre3VkDw0s4nfU4Fu3mUzdfoOS+
 SRc2FRRNYQDuu/wSSfS4ybqe7/3Ji4wLBePiGO5CyAIE1mO0D0uxKZsPZ
 UbnsjODPouqQVZ9qaPMXSIYImdD5szJgUF6/sT1IitxGwxxx7j3DwXzEu
 V9sv9XvKX5WMxotTlk7QDlHhQVLyrRq3n3eZ2BPdDdcWNMrG+WNc1gQm1 w==;
X-CSE-ConnectionGUID: iJMFS6kdS0KirT/oG8PLYA==
X-CSE-MsgGUID: 0jiwYv3bSqqgCELgy1SCmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="87427760"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="87427760"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:55:26 -0700
X-CSE-ConnectionGUID: vVoaH/o7SmKwRnUow+gijA==
X-CSE-MsgGUID: EVp+SyUQQkCXTw49zgGoMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="258516682"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.245.35])
 ([10.245.245.35])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:55:24 -0700
Message-ID: <db871d6a-1010-476e-91b7-7fb680f3a1e0@intel.com>
Date: Thu, 16 Jul 2026 16:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm/xe/mmio_gem: fix fault handler and destroy path
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: koby.elbaz@intel.com, shuicheng.lin@intel.com, thomas.hellstrom@intel.com
References: <20260526125106.2806522-7-ilia.levi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260526125106.2806522-7-ilia.levi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26/05/2026 13:51, Ilia Levi wrote:
> This series fixes several issues in xe_mmio_gem, introduced by
> 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions"):
> split VMA fault handling, a rb-tree leak on destroy, dummy page
> accumulation, and use-after-free / MMIO access after destroy.

I think other consideration, is how this component should interact with 
RPM? Did you already have a plan for this? I think accessing the mmio 
mapping when in d3 likely yields rubbish, but in some cases like for 
PCI_BARRIER (once we convert), I think it's acceptable. If we track all 
mmio_gem instances we should be able to force a refault on RPM suspend, 
and then in the fault handler grab an RPM ref. I think should be pretty 
similar to VRAM mappings. Perhaps would also want mmio_gem.need_rpm.

> 
> v2:
> - New patch 1/5: fix dummy page WB/UC aliasing (Sashiko)
> - Patch 2/5: no longer modifies xe_mmio_gem_vm_fault_dummy_page() (handled by 1/5)
> - Patch 3/5: unchanged
> - Patch 4/5: compute pfn inside scoped_guard
> - Patch 5/5: adapt to xe_mmio_gem_vm_fault_dummy_page() signature change, fix "objecthas" typo
> 
> Ilia Levi (4):
>    drm/xe/mmio_gem: use write-back mapping for dummy page
>    drm/xe/mmio_gem: fix fault handling for split VMA
>    drm/xe/mmio_gem: cache the dummy page per object
>    drm/xe/mmio_gem: fix destroy flow
> 
> Shuicheng Lin (1):
>    drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem destroy
> 
>   drivers/gpu/drm/xe/xe_mmio_gem.c | 97 +++++++++++++++++++-------------
>   drivers/gpu/drm/xe/xe_mmio_gem.h |  2 +-
>   2 files changed, 60 insertions(+), 39 deletions(-)
> 

