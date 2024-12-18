Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B81E77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 19:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A8B10E253;
	Wed, 18 Dec 2024 19:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNCXCOtL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0D510E253
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734550960; x=1766086960;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MJnMsziYrmgQ3bV5YpjRbZN4ugcpeXgWT4pRdNSJ81s=;
 b=MNCXCOtL3YCe+yAuTYPvg9pJXNOKBOjE7+GQgTeIsgfqnwi2AoZACEB8
 JE+EvtHdIlmHxBx2758tYbwNAVMC0J82uceThJ5PFrGoySZZbAudA5U0E
 1lISdZawaQrlFWtAFO4NQkmiiWbNnY57LRt79O+rVpubm4FWUBKF8ikwO
 I6vJJUpEzvalNiuOhFAYvM9vVxM09eMHU7AINdDlHEKPTADuP+kuYYYyU
 HP95YI7F+QivoTaq88Ck7NsH/AM+rpLB1ZGV1StcEXntJXKIbvhfBCgmd
 3wsQzsDCP8AkBui2YXemilUDmdv4TfBzQoCaksyvmMK4pYYMBLkX31XL9 Q==;
X-CSE-ConnectionGUID: PcjTXFKnQE60irCG4bBr2Q==
X-CSE-MsgGUID: cbcrwY4vS5mMjL+cJrQU1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38827469"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="38827469"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 11:42:40 -0800
X-CSE-ConnectionGUID: WH/ZqqKWS56TcwVWGw2OVg==
X-CSE-MsgGUID: D1v4gnvEQyawZdcDs/vIsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="98022571"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 18 Dec 2024 11:42:38 -0800
Received: from [10.246.0.69] (mwajdecz-MOBL.ger.corp.intel.com [10.246.0.69])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E5DCD2FC5F;
 Wed, 18 Dec 2024 19:42:36 +0000 (GMT)
Message-ID: <825e40ab-54ad-4849-bf7a-0f85b4307cdc@intel.com>
Date: Wed, 18 Dec 2024 20:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/sa: Drop hardcoded 4K guard in sub-allocator
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
References: <20241217222246.863-1-michal.wajdeczko@intel.com>
 <Z2H9sADDJOvFG6j+@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Z2H9sADDJOvFG6j+@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 17.12.2024 23:39, Matthew Brost wrote:
> On Tue, Dec 17, 2024 at 11:22:46PM +0100, Michal Wajdeczko wrote:
>> Any required prefetch guards are added during batch buffer
>> allocations anyway.
>>
> 
> This should work but I think we actually want to do the opposite of
> this - drop the prefetch pad in BB allocation. This would enable a more

but this will make the SA even more bound to usages specific to engines,
while the goal was to make the allocator more agnostic

> optimial usage of each suballocation. I think that would work unless we
> have an odd caching issue - if caching is a problem then maybe the BB is
> a cacheline.
> 
> I haven't had time to try to out yet but I think we explore the above
> option first. If I'm missing something and the above does not work, then
> agree with this patch.
> 
> Matt
> 
