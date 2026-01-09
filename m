Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80B1D167EC
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 09:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7244010E857;
	Fri,  9 Jan 2026 09:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LzmLOiXt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1089710E857
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 09:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767951282; x=1799487282;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qTBH7kHpoJqZru0p3w7H8qWGXsJoT2Uj7uihDP+Fqyc=;
 b=LzmLOiXtbOwr1u3bA6Isn5zTLxSAOUBO68e4AzQXItPZyJ5Sl8S2GegF
 m16IwYaNrEinPm1KP0CYNVD14AO1y/CwtGg83Zc0s0F2lV1BQ0D5KouKw
 LfvANFgHwKnj4H9kgxtxGqcagUNCxCqThM2qVk0BJg3zMc/u6YkLapZOm
 I1G5QxgPkTcS/ADllSI7gn3ZddDd9gE9n+gCtUwUNnrZJomS3hu3dfE/Z
 pS2NfKvfyvF4mzsQ+iQ5BPDlZtD+Q9H+T4Hrg/AYSGQ9uuzUyYp7uZoz1
 gFsZScsT10FlRAkuP3JZ6sB7Yp0AxOqt0YmTlUuPaEqvzZCd0EFWCl52h w==;
X-CSE-ConnectionGUID: u1yu71N7QBimPm+c2fcBzg==
X-CSE-MsgGUID: kr+UvI2uRlCkFe+fGHUxcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80783613"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="80783613"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 01:34:41 -0800
X-CSE-ConnectionGUID: JzXaJxMYQPqzl4m8aaJXYw==
X-CSE-MsgGUID: 1J5gqrVGR7u0g5NMKUHcUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="234138468"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.142])
 ([10.245.244.142])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 01:34:40 -0800
Message-ID: <4a7d4dd2-8c3d-4f1e-946f-c3ecc5c9f4a7@intel.com>
Date: Fri, 9 Jan 2026 09:34:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe: Allow compressible surfaces to be 1-way
 coherent
To: Xin Wang <x.wang@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
References: <20260109093007.546784-1-x.wang@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260109093007.546784-1-x.wang@intel.com>
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

On 09/01/2026 09:30, Xin Wang wrote:
> Previously, compressible surfaces were required to be non-coherent (allocated
> as WC) because compression and coherency were mutually exclusive. Starting
> with Xe3, hardware supports combining compression with 1-way coherency,
> allowing compressible surfaces to be allocated as WB memory. This provides
> applications with more efficient memory allocation by avoiding WC allocation
> overhead that can cause system stuttering and memory management challenges.
> 
> The implementation adds support for compressed+coherent PAT entry for the
> xe3_lpg devices and updates the driver logic to handle the new compression
> capabilities.
> 
> v2: (Matthew Auld)
>   - Improved error handling with XE_IOCTL_DBG()
>   - Enhanced documentation and comments
>   - Fixed xe_bo_needs_ccs_pages() outdated compression assumptions
> 
> v3:
>   - Improve WB compression support detection by checking PAT table instead
> of version check
> 
> v4:
>   - Add XE_CACHE_WB_COMPRESSION, which simplifies the logic.
> 
> v5:
>   - Use U16_MAX for the invalid PAT index. (Matthew Auld)
> 
> Bspec: 71582, 59361, 59399
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

