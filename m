Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C557C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 12:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A8F10E15C;
	Thu, 25 May 2023 12:07:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CECF10E15C
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 12:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685016466; x=1716552466;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UCXIPPfFBIqLq/K5VNVgvNNGu/cbuukX1Dpmm6ZhbCQ=;
 b=FuXX20+UGLuUesJtnRasZlyXvNZjelrSVYV786Kb4KX0KSuNPj0uqOMs
 PUboMQdIKyRgJ54Q+Y/gGJNCGUE8jXcXQ4sKLJZ2SyJTNOkjv17jDTVPS
 WiPhqdid8SYzk3OMqIAFDILB+/r9jXQKnhB6MG7KUX6w/SZigXwKedq5Y
 8daN28COSq/q011zXu18NokoX0jg+NAPf2omz2B76HUgZQbSor/lj8ynH
 yP04xDhEmiAOYR5QPT8s59yOs79/aCpQGKdY8hURwAMdLLtP3jQA0yHrm
 GUABg3aMH4wyLbKGK905igw7Nx317ndAjbUFQ6XA5GSt1cw4K3cwCYywI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="351376402"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="351376402"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 05:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="682292180"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="682292180"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.45.12])
 ([10.252.45.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 05:07:43 -0700
Message-ID: <7f40b848-3eef-81db-05d8-7cfc9ceb4568@linux.intel.com>
Date: Thu, 25 May 2023 14:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230525114543.400106-1-matthew.auld@intel.com>
 <20230525114543.400106-2-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230525114543.400106-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/migrate: retain CCS aux state for
 vram -> vram
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/25/2023 1:45 PM, Matthew Auld wrote:
> There is no mention that migrate_copy() will skip copying the CCS aux
> state for all types of vram -> vram transfers.  Currently we don't need
> such a facility but might be surprising if we ever do.
>
> v2: (Lucas):
>    - s/lmem/vram/ in the commit message
>    - Tidy up the code a bit; use one emit_copy_ccs()
> v3:
>    - Reword the commit message
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f40f47ccb76f..4b4339f1b2d2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -552,11 +552,19 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>   
>   	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_vram) {
>   		/*
> -		 * If the bo doesn't have any CCS metadata attached, we still
> -		 * need to clear it for security reasons.
> +		 * If the src is already in vram, then it should already
> +		 * have been cleared by us, or has been populated by the
> +		 * user. Make sure we copy the CCS aux state as-is.
> +		 *
> +		 * Otherwise if the bo doesn't have any CCS metadata attached,
> +		 * we still need to clear it for security reasons.
>   		 */
> -		emit_copy_ccs(gt, bb, dst_ofs, true, m->cleared_vram_ofs, false,
> -			      dst_size);
> +		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_vram_ofs;
> +
> +		emit_copy_ccs(gt, bb,
> +			      dst_ofs, true,
> +			      ccs_src_ofs, src_is_vram, dst_size);
> +
>   		flush_flags = MI_FLUSH_DW_CCS;
>   	} else if (copy_ccs) {
>   		if (!src_is_vram)
