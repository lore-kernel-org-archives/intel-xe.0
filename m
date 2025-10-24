Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A984CCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 06:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FA610E9D7;
	Fri, 24 Oct 2025 06:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8oaGcc5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E0710E9D7
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 06:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761286396; x=1792822396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=63PLcFaPFpOie8/khIUvIopjCGCvbiwWZUAfoSA3lG0=;
 b=j8oaGcc5w0WGpkY+PTk9ejlESEM/7jyjXdq6L2R7Z+N8kJLPr+c6CcWT
 1th+kqa7ink/Fw2Yu1tP5DelIjBn18+FRzMbzhC9N8pIryFMy9geYIsCy
 D7/Oa10EcbC6YYGbhN1VKjQTuVSQVUeGtRSFh+MmYygSf3Q6uhr2UvgDE
 GRLrnQGeymaSL63dXQV22DBnJB77rgS1nXcrBd0fAA3MzKJBG8rh5Pg1Z
 MgMVDveJ/KDKfLmq5hFfPeK71P3IXAF6H/BpELdotv0HsTJmLGA02drGZ
 Qq7ArzQMdgDuo8IaRKS7ncYJaIvgU5Iv8g0AzKLbl/SYkMkLXawQCHYrA Q==;
X-CSE-ConnectionGUID: UZF5VMDIS2KKt7C2uWQ+Bg==
X-CSE-MsgGUID: YMUK19TDQ4KltN7Lc3V95Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67300523"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67300523"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 23:13:16 -0700
X-CSE-ConnectionGUID: PEp2Ov3ZRSuUsM4lDyhQTQ==
X-CSE-MsgGUID: Ki+Do9jVTDyXT8CY+gLR4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="183577066"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 23:13:14 -0700
Date: Fri, 24 Oct 2025 08:13:11 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/xe/gt_throttle: Always read and mask
Message-ID: <aPsY9-0Uak8-g5Nk@black.igk.intel.com>
References: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
 <20251023-gt-throttle-cri-v1-3-9f36f3c8861c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-gt-throttle-cri-v1-3-9f36f3c8861c@intel.com>
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

On Thu, Oct 23, 2025 at 09:56:56AM -0700, Lucas De Marchi wrote:
> Use a single function to read and mask the value the callers will be
> interested in. This reduces the risk of a caller using a plain call to
> xe_gt_throttle_get_limit_reasons() without applying any mask, which can
> return unexpected bits for future platforms.
> 
> Select which reg and mask it's going to be used according to the
> platform and gt type and always use that one function.
> 
> There was an odd xe_gt_dbg() when reading the status, which is not done
> for any other throttle/* sysfs file, so just make the status be as
> special as everybody else.

This was to debug the rather controvercial design choice[1], but discussion
seems have died down and this is no longer needed.

[1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
