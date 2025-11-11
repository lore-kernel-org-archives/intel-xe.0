Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11974CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 09:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C807210E2C3;
	Tue, 11 Nov 2025 09:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgOu5MFZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1E910E2C3
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 09:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762854050; x=1794390050;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z3p2JML0kDJenqSb9xiHiC1Xuhs6kALwvIhZD+VjJGw=;
 b=QgOu5MFZCzYGpQuRcbb2gA5rMdEcvnBuHHi/jgSkO0d+th1LCxUO691X
 /BOa1jfVxPEuJnNE+IyRHn77LYbE1+KPYY5WZiB1Av+Ryw+sXknW1Es4H
 abM4DAurfsak1B+Vps9WwAHOK7Ge6PMVf5jpMLBh6cu4rmwQj4QV7fUlK
 p6Nl3o2BWw1cK8g5pdBe4GxjaS3d/3wJA7PXA4Nm49tBeiNmqsAegMxi6
 Qt00KjX95ViaFK6vl2HxjbUB7zK2cbUCNVrqBg6iloQSwbee5XENePbRM
 xgY9ZRML4tXL02JfkeFMTiCA+BtQN5OEQWriL29wPLAZUAY+mkyEE5Ozy A==;
X-CSE-ConnectionGUID: kSQRIn2rRY6j4HIB8aKw/g==
X-CSE-MsgGUID: 98ieYeykTeOSofJzXmyuvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="65069599"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="65069599"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 01:40:50 -0800
X-CSE-ConnectionGUID: OXrExYkwQ+O+1jcXnYdGqA==
X-CSE-MsgGUID: 1cnkwkNnTCmg+GafYEzG2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188756521"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.123])
 ([10.245.244.123])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 01:40:48 -0800
Message-ID: <c2fd04e5-5d34-4a22-a2e8-03021d4eed55@intel.com>
Date: Tue, 11 Nov 2025 09:40:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/pat: Add helper to query compression enable
 status
To: Xin Wang <x.wang@intel.com>, intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, nitin.r.gote@intel.com,
 sanjay.kumar.yadav@intel.com, matthew.d.roper@intel.com
References: <20251110221458.1864507-1-x.wang@intel.com>
 <20251110221458.1864507-2-x.wang@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251110221458.1864507-2-x.wang@intel.com>
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

On 10/11/2025 22:14, Xin Wang wrote:
> Add xe_pat_index_get_comp_en() helper function to check whether
> compression is enabled for a given PAT index by extracting the
> XE2_COMP_EN bit from the PAT table entry.

Just wondering if we should mention that multiple upcoming series are 
going to directly use this, in case someone wonders why we are adding a 
function with no user.

> 
> CC: Nitin Gote <nitin.r.gote@intel.com>
> CC: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pat.c |  6 ++++++
>   drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 68171cceea18..1b4d5d3def0f 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -196,6 +196,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>   	return xe->pat.table[pat_index].coh_mode;
>   }
>   
> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
> +{
> +	WARN_ON(pat_index >= xe->pat.n_entries);
> +	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
> +}
> +
>   static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>   			int n_entries)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 05dae03a5f54..b8559120989e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -58,4 +58,14 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>    */
>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>   
> +/**
> + * xe_pat_index_get_comp_en - Extract the compression enable flag for
> + * the given pat_index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: true if compression is enabled for this pat_index, false otherwise.
> + */
> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
> +
>   #endif

