Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF423D132DC
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 15:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C36410E45A;
	Mon,  4 Nov 2024 15:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HaafQw9Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C1310E45A
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730732746; x=1762268746;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=AhT7ud/8rWPlWqM/atsFnm5kCaNZZMl3M8R2jYG5U9A=;
 b=HaafQw9ZFw2I6XAbxs408Kqfr7C1xoy27waIsWTGNBykIxd9f+0BdjHt
 R1RUhl2qX1gZwRiHjvlAUR/9b8AjfLZMfbN7ga9+K7oWy92z3iE3KZS3I
 KrT9cY1SI9gfO0Xn/xHhgtCuVcWBMxZmadhpNK//DuqF3pJtLR/XICmgP
 w3COpwi5FSr5e/oYzM0uUSvvMzJ4JEinjY/dPuMlQX3lGoIBThDbUZooj
 77tLsjqKSboyDg5WW4AwcZrZ38031W+Nxxb5gehR/ENb1KkORgx6Sl1pP
 7QY7TXqSHPh4EsBLOxeCwaGBCrjL09FjjaETcZAROW3E7Y8RLkGoj5Bvq g==;
X-CSE-ConnectionGUID: 3vtDiOy7TeeLanwBwQwYaA==
X-CSE-MsgGUID: wR/QZdAXQ4qk2fnOvt11/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34126165"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34126165"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 07:05:46 -0800
X-CSE-ConnectionGUID: JRf9osRPQH+cg+GD00utyw==
X-CSE-MsgGUID: jxxgWno/RFGowWrxHhaoxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="84121940"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 04 Nov 2024 07:05:45 -0800
Received: from [10.246.2.9] (mwajdecz-MOBL.ger.corp.intel.com [10.246.2.9])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D8AE0284FF;
 Mon,  4 Nov 2024 15:05:43 +0000 (GMT)
Message-ID: <2a9c8689-f953-4f2c-a66c-111b085b20c0@intel.com>
Date: Mon, 4 Nov 2024 16:05:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use lowercase for asserts
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20241104140813.1992885-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241104140813.1992885-1-lucas.demarchi@intel.com>
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



On 04.11.2024 15:08, Lucas De Marchi wrote:
> The rendered html documentation for "Xe ASSERTs" doesn't look nice with
> the mixed caps and gives the impression it was a typo. Just use
> lowercase to improve it.

some background: in initial version those assert macros were named
xe_ASSERT() to follow the drm_WARN() style, hence this leftover

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_assert.h              | 8 ++++----
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h | 2 +-
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h    | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
> index 04d6b95c6d878..831cb62107496 100644
> --- a/drivers/gpu/drm/xe/xe_assert.h
> +++ b/drivers/gpu/drm/xe/xe_assert.h
> @@ -14,7 +14,7 @@
>  #include "xe_step.h"
>  
>  /**
> - * DOC: Xe ASSERTs
> + * DOC: Xe asserts

nit: maybe this should follow Title Case Style, so this would be:

  * DOC: Xe Asserts

but up to you,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

