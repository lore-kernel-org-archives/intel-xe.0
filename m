Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C8EC531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 11:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1F410E03C;
	Fri, 24 Jul 2026 11:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gA08DKoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4CF10E046
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784894021; x=1816430021;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oX6JHShf+A4wt5UT1G/S4uiehydQF5BapdOdffR4Lok=;
 b=gA08DKoE2BZIAAjhlL3xRS9KFd30HzigKbggkMKAJ2/dbwlnKms2Jgd7
 tsmscbPvQ1BfZppTufNrKhK519p6CX7BIv5EWtPYZOwacVd9JitBaP6cG
 PM90XaLifP31+mzfIxn/YI8SVW1O0eWahBA1jdEZz0lEutV/rDnLIKZDq
 IWqn355ipEavkPMIp5Uw1Yu1Tjre1b2+twICAXxdoKGjtJNhmGA8CEegW
 C27RI0BnZ4ZPfk2N4kZ9abKCMugMmLSfPBdJgwVeEfnT2lYH2bWaa3uTB
 xDb3eNO7mPZQ7KatDZwsot4+CMUTIZoytknRJYzk9Pv1egQ9z07aok2Bf w==;
X-CSE-ConnectionGUID: FSGppJizRuSOhA0fwMtyWw==
X-CSE-MsgGUID: ERdLZPf3R5S4oMk8Q9UjGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85574329"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="85574329"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 04:53:41 -0700
X-CSE-ConnectionGUID: IQFYNb41RSOkT3mZR6t4hg==
X-CSE-MsgGUID: SP9cpHtLSNKXXBtv7tTp7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="259351205"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.7])
 ([10.245.245.7])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 04:53:39 -0700
Message-ID: <b877896a-188d-4183-8543-5460cf9290f0@intel.com>
Date: Fri, 24 Jul 2026 12:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add memory barrier before H2G tail write on wrap
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20260724003108.1561414-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260724003108.1561414-1-matthew.brost@intel.com>
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

On 24/07/2026 01:31, Matthew Brost wrote:
> When the H2G buffer wraps, it is padded with NOPs before updating the
> H2G descriptor tail. However, the tail update is performed without a
> memory barrier, allowing the GuC to observe the new tail value before
> the NOP writes become visible.
>   
> This can result in the GuC reading stale H2G commands, potentially
> causing a variety of failures. Fix this by inserting a memory barrier
> before updating the H2G descriptor tail.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
