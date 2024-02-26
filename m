Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA41C48BF6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 12:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E79810E706;
	Mon, 26 Feb 2024 12:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAnpNEi7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C6C10E706
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708949449; x=1740485449;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=P0xiCgPdMmpnLAckbm3JtHGa/n2BNRvv3exXfRyuGs0=;
 b=KAnpNEi7yL510twwXcRLTlhnOMr/fM9dFxWxtlNMgfwVRPymt6yNVaFI
 4KL9GR6auSbOF6nLu1L2ZgttKBuJy2DyM2hTJuRJ+ymaY0g5uJLprNqnD
 W4K1SpY707gHnjtB6QUiMvylk6iud49ORbA4fpZoV06PQm2ytn8cDldFO
 0Xy+ku7MncdAKo4b1ugNrfRWquLjvpK4LIe7aeJBCmrsL2ULBjW9hk05L
 wGYDeBf4eJZo93PpjrXmYyUxKWh3w0KMFBrN+UtxzE09IyC6IBG6dpQRE
 JSu0E8T7VvsBaaAj6EGW/iKKrfrdfihL9Fk7R0YEcnXTffxPT7wPfHdYP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3346488"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3346488"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:10:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11317109"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.254])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:10:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build error in xe_ggtt.c
In-Reply-To: <20240225001448.81513-1-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240225001448.81513-1-matthew.brost@intel.com>
Date: Mon, 26 Feb 2024 14:10:46 +0200
Message-ID: <87v86bmnnd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sat, 24 Feb 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> Need to include io-64-nonatomic-lo-hi.h for writeq function.
>
> Fixes: 3121fed0c51b drm/xe: ("Cleanup some layering in GGTT")

The format should be:

Fixes: 3121fed0c51b ("drm/xe: Cleanup some layering in GGTT")

but is that really accurate? The commit does not start using writeq?

BR,
Jani.



> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202402241903.R5J8hKVI-lkp@intel.com/
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 5d46958e3144..717d0e76277a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_ggtt.h"
>  
> +#include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/sizes.h>
>  
>  #include <drm/drm_managed.h>

-- 
Jani Nikula, Intel
