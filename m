Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E365D1CDBD
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 08:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4954E10E30A;
	Tue, 22 Oct 2024 08:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBDX6qb5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122ED10E304;
 Tue, 22 Oct 2024 08:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729587296; x=1761123296;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ffcRa1krHhnJolyc+BKYr9fc9kF/uH79IeZz7m/BLfs=;
 b=aBDX6qb5plYqduO8j5Dgv1QO9PUiik+MDZaaXvozWCxE+44//GdDPC9T
 JM/Q3f+/ZcfVAc1hFwmxT8jQFWtWAPRQtNNQtZ8AyXXLch6CPYiBh7wkq
 LA947HefLc7szWrwbBnCWY39kFXPF3slJw7z5sNIguPW81KuycCIeqJ2r
 Iv29N/1Z0+gbbfChL9v+RyUdIITOU7t89ZynC4HP0vtE87IKsLSGn6lGn
 KRjxxa4NcJlNWnhvJwY5h+NeWFoBCDzOOsNibP45o1ay3mtvuMwrSOq8e
 +4rCiN5MGevHWIsIM6zL8KFa6zOJkfb+X00gOI9nYuysolNvq4D0J65xf Q==;
X-CSE-ConnectionGUID: Be4vl4gbQ6yi/2lGYbk6KQ==
X-CSE-MsgGUID: DR9mHVi9QRK1Y+cVhvo9sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="32917679"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="32917679"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 01:54:54 -0700
X-CSE-ConnectionGUID: VGnime6OQfungFKN9tnLCg==
X-CSE-MsgGUID: bDs0ej/zTKSarzPB33IHSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="84393527"
Received: from sosterlu-desk.ger.corp.intel.com (HELO [10.245.244.157])
 ([10.245.244.157])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 01:54:52 -0700
Message-ID: <d11143a6-e0a4-4c12-8d5a-12663ac6b66d@intel.com>
Date: Tue, 22 Oct 2024 09:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] drm/xe: Use ttm_bo_access in
 xe_vm_snapshot_capture_delayed
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, thomas.hellstrom@linux.intel.com
References: <20241021211835.1675640-1-matthew.brost@intel.com>
 <20241021211835.1675640-8-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241021211835.1675640-8-matthew.brost@intel.com>
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

On 21/10/2024 22:18, Matthew Brost wrote:
> Non-contiguous mapping of BO in VRAM doesn't work, use ttm_bo_access
> instead.
> 
> v2:
>   - Fix error handling
> 
> Fixes: 0eb2a18a8fad ("drm/xe: Implement VM snapshot support for BO's and userptr")
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

