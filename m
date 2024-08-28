Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FCCC54EE3
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 12:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C03710E021;
	Wed, 28 Aug 2024 12:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjPSbSbD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C4D10E021
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724846761; x=1756382761;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=01r6nx0JtPL+uVergswdI9GgfOiq2S+pXcHRUG2z+Qc=;
 b=PjPSbSbDfJu6K3VX/Y47Ihlu3apTL/IZraiRV5X521NDostiGCn16S7h
 2zR9pFiwtAkzLjePyUYH9aDJIWu+q/E4VKyqmkK9PasHUr7ZkBnCaG5qv
 jn6/ncWwJZGTRf9SRZmJeCFrr9p6VVk21QSliVMLxV3t6Q/a4I8rhXJVG
 GplAN8IA6YT6PEn1I2rFLDBvG83NLkOApFSqxRGMb2qu7kulGjJAYegST
 yyWcPQgDATu1Zg2Qyr1yDF8tyZAyk+9wPsBHSf5CWqE9MdKe2E41zEeC5
 TXE1cPrExNPch4CVM+Zvhrw+7fAidS8BGkdrHO04DxgcEkU96aSWfvEUn A==;
X-CSE-ConnectionGUID: nRGZvjZTSPGFRnVX6KzxeA==
X-CSE-MsgGUID: AfJBDqSWTZ2C5qKJS4e9ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23554982"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="23554982"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 05:06:01 -0700
X-CSE-ConnectionGUID: OVlvURmqTve74E5ZDogh1w==
X-CSE-MsgGUID: x7ovKmEcQ8SheFjVBFiePg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="68093091"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 05:06:00 -0700
Message-ID: <815e4cfa-ce2e-4de5-9a04-b1727d705602@linux.intel.com>
Date: Wed, 28 Aug 2024 14:05:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pat: sanity check compression and coh_mode
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240828092257.169063-2-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240828092257.169063-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 8/28/2024 11:22 AM, Matthew Auld wrote:
> There is an implicit assumption in the driver that compression and
> coh_1way+ are mutually exclusive. If this is ever not true then userptr
> and imported dma-buf from external device will have uncleared ccs state.
> Add a build bug for this so we don't forget.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pat.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 722278cc23fc..f92a1c61956d 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -100,6 +100,10 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
>    * Reserved entries should be programmed with the maximum caching, minimum
>    * coherency (which matches an all-0's encoding), so we can just omit them
>    * in the table.
> + *
> + * Note: There is an implicit assumption in the driver that compression and
> + * coh_1way+ are mutually exclusive. If this is ever not true then userptr
> + * and imported dma-buf from external device will have uncleared ccs state.
>    */
>   #define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
>   	{ \
> @@ -109,7 +113,8 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
>   			REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
>   			REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
>   			REG_FIELD_PREP(XE2_COH_MODE, __coh_mode), \
> -		.coh_mode = __coh_mode ? XE_COH_AT_LEAST_1WAY : XE_COH_NONE \
> +		.coh_mode = (BUILD_BUG_ON_ZERO(__coh_mode && comp_en) || __coh_mode) ? \
> +			XE_COH_AT_LEAST_1WAY : XE_COH_NONE \
>   	}
>   
>   static const struct xe_pat_table_entry xe2_pat_table[] = {
