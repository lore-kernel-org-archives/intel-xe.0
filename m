Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D8BD41C3E
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 12:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B8A10E6E8;
	Wed, 13 Nov 2024 12:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uruw4Fca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94AD10E6E8
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 12:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731502540; x=1763038540;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5Clwtc8uD3gIWQyaMzjtwUTmcKVVrqwKMgly+lGIXDI=;
 b=Uruw4FcaPOyNc3X0A6SzBFfHQizrDNWTwEvhC7tVXi2Sy9VnnQYOyZHT
 KesVHTLf/dNd+QAxMtzrsl9FwSDl+D0iwYbd+gDAZKdh2nf5tVbShtcLK
 1yYiuBn6Jzbilq7zYCArxTDbc44ZI0NgBxQFF708QptNrLdiLA6gkh9lv
 Uwjlr6w3tne76wffD0jjtzLekmWRkAdLUM1BUHUwYZLY/plQtiqnCLNTk
 fSmq2qFifwCA4UiyXfEJZh/rIsTLHJpKYxfv9b6Fe5NkvqX3GTFZ5wB9j
 lw6CF17LVLitiiYQRcb2zzlsh0wRnIxYfM2Ccd8aL9lvdU72k6QIs6LWi g==;
X-CSE-ConnectionGUID: ApxpJtoKQeK7H4JpCoHC9A==
X-CSE-MsgGUID: JOQpJB9qR6avnOpNWT19/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35101817"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35101817"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 04:55:39 -0800
X-CSE-ConnectionGUID: cNyohD2ZTk6rsyH749ds2w==
X-CSE-MsgGUID: VVi5+qvOSDy4OJJwPDdxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="92944321"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.133])
 ([10.245.245.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 04:55:38 -0800
Message-ID: <3c2203a0-2731-4f5b-bf58-ecec21662002@intel.com>
Date: Wed, 13 Nov 2024 12:55:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Clear GGTT in xe_bo_restore_kernel
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com
References: <20241106183514.4174086-1-matthew.brost@intel.com>
 <20241106183514.4174086-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241106183514.4174086-2-matthew.brost@intel.com>
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

On 06/11/2024 18:35, Matthew Brost wrote:
> Part of what xe_bo_restore_kernel does, is restore BO's GGTT mappings
> which may have been lost during a power state change. Missing is
> restoring the GGTT entries without BO mappings to a known state (e.g.,
> scratch pages). Update xe_bo_restore_kernel to clear the entire GGTT
> before restoring BO's GGTT mappings.
> 
> v2:
>   - Include missing local change of tile and id variable (CI)
> v3:
>   - Fixed kernel doc (CI)
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

