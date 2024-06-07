Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83D7C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 11:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C31F10EBE0;
	Fri,  7 Jun 2024 11:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSpuKpBK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B2610EBDF
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 11:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717758280; x=1749294280;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=i9BVZ0P1ots/XilOFT6sJ2pRGd+ZVyzNOFJTBcGTDs0=;
 b=WSpuKpBKz86VqdzjtOfkVDj4+xkY5bRqA1GkID3jaCTaStrI3PnvJ44G
 zKw0J/iJ5GpcWDkJDDPoUms/xbvTHIlJpLndFmxN4kU6wCo+Pboj86ekO
 zFe1Fs2wtNc5oWHXw6ULjk+Y7bGGxmuj6mfGQOEDiAkdYxLe1AGZfhn4v
 BvEis/5pQRqpCsAGWsPQJCx8JH33DCyISY2qwPsJmtzCYxNsaJB3kPysy
 J8QH3/uWCYqpBZ2He+t1LSEV03SW8aHuXJgS50ukf1eCHLXRVar+Tb2dL
 jdYKlgqZdDd/caoJ/s0sRW5Ieuq0oj5P0WfUHjv71ivcs3glX6cHIEBwf A==;
X-CSE-ConnectionGUID: gh/N9whCRfGs+HpttLaFtA==
X-CSE-MsgGUID: 6HtuybLKTlu2Kb5CPmp83Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18301069"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="18301069"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 04:04:39 -0700
X-CSE-ConnectionGUID: WXx/wQvwQVClS1yrOj2dnw==
X-CSE-MsgGUID: VN3wjEx7TtCcshTQB6GWKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38145991"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 07 Jun 2024 04:04:29 -0700
Received: from [10.94.248.185] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.185])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BC68827BBD;
 Fri,  7 Jun 2024 12:04:28 +0100 (IST)
Message-ID: <2dfb69a3-d74f-4988-8643-b9801b343161@intel.com>
Date: Fri, 7 Jun 2024 13:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] drm/xe: Add MI_COPY_MEM_MEM GPU instruction
 definitions
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240607065219.2264624-1-matthew.brost@intel.com>
 <20240607065219.2264624-3-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240607065219.2264624-3-matthew.brost@intel.com>
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



On 07.06.2024 08:52, Matthew Brost wrote:
> MI_COPY_MEM_MEM GPU instructions are used to copy ctx timestamp from a
> LRC registers to another location at the beginning of every jobs
> execution. Add MI_COPY_MEM_MEM GPU instruction definitions.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index c74ceb550dce..f3deabb18ce4 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -56,6 +56,10 @@
>  #define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_DW_LEN_DW, 5 - 2)
>  #define   MI_FLUSH_DW_USE_GTT		REG_BIT(2)
>  
> +#define MI_COPY_MEM_MEM			(__MI_INSTR(0x2e) | 3)

all instruction definitions shall be in the opcode order, so move this
one with 0x2e below 0x29

and maybe instead of plain "3" better to use magic XE_INSTR_NUM_DW(5) ?

btw, IMO this latter macro would be better if defined as:

#define XE_INSTR_DW_LEN(dw)	REG_FIELD_PREP(GENMASK(7, 0), (dw))
#define XE_INSTR_SIZE(size)	XE_INSTR_DW_LEN((size) - 2)

so for fixed instr length we could use XE_INSTR_DW_LEN(3) as in bspec

> +#define	  MI_COPY_MEM_MEM_SRC_GGTT	REG_BIT(22)
> +#define	  MI_COPY_MEM_MEM_DST_GGTT	REG_BIT(21)
> +

there should be just extra 2 spaces, not tab + spc + spc

>  #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
>  #define   MI_LRM_USE_GGTT		REG_BIT(22)
>  
