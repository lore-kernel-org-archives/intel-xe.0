Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA8CEB64D9
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 08:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF70910E419;
	Wed, 14 Jun 2023 08:02:50 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D4510E419
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686729766; x=1718265766;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=LSYBQ20Np+YEljbo08pkBaRaHTPFOocakFmYwlVAAWU=;
 b=GzfJxp52BSkQnnT099MJw0seFAWhnZ21EcvyOosESW/V4zxWSrir7ttm
 LKTmXoEbAleKtYPA6W66027DIiD3nTTNgvMC7b+4jH+3Brcyxl0HyJTEj
 dxsD8v7ue5Ym8tz9lqnKOo7TegtTzHjfhKL8Szq+poHKjrqxL3HXVvVSo
 bdk/63O/oEWYzPxyVufBFcc2ur5QV8kQzuIgk+//KtbRnhrwIkf04e+kk
 qOQDAIVLXHVQqR8Ns2o2KPDeQfbzUNPQRbd3wQ4JN0nrmZ9OeC/7WdRcg
 03nFqZI5EcC8119xuRd6RfCqsOhK+BEn6pkaU+w9VKSRlvB8Ah3duZmJj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="348210804"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="348210804"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 01:02:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="824716816"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="824716816"
Received: from aryba-mobl.ger.corp.intel.com (HELO [10.249.254.20])
 ([10.249.254.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 01:02:42 -0700
Message-ID: <3e642092-a08d-183b-1f80-6a1c4595c498@linux.intel.com>
Date: Wed, 14 Jun 2023 10:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230608050333.37581-1-matthew.brost@intel.com>
 <20230608050333.37581-3-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230608050333.37581-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Move XE_PTE_FLAG_READ_ONLY to
 xe_vm_types.h
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


On 6/8/23 07:03, Matthew Brost wrote:
> XE_PTE_FLAG_READ_ONLY is specific to struct xe_vma, move it from xe_bo.h
> to xe_vm_types.h to reflect that.
>
> Signed-off-vy: Matthew Brost <matthew.brost@intel.com>

Typo: s/vy/by

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_bo.h       | 2 --
>   drivers/gpu/drm/xe/xe_vm_types.h | 1 +
>   2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 552fe073e9c5..dd3d448fee0b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -65,8 +65,6 @@
>   #define XE_PAGE_PRESENT			BIT_ULL(0)
>   #define XE_PAGE_RW			BIT_ULL(1)
>   
> -#define XE_PTE_FLAG_READ_ONLY		BIT(0)
> -
>   #define XE_PL_SYSTEM		TTM_PL_SYSTEM
>   #define XE_PL_TT		TTM_PL_TT
>   #define XE_PL_VRAM0		TTM_PL_VRAM
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 76af6ac0fa84..6daddd29d416 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -30,6 +30,7 @@ struct xe_vma {
>   	/** @end: end address of this VMA within its address domain */
>   	u64 end;
>   	/** @pte_flags: pte flags for this VMA */
> +#define XE_PTE_FLAG_READ_ONLY		BIT(0)
>   	u32 pte_flags;
>   
>   	/** @bo: BO if not a userptr, must be NULL is userptr */
