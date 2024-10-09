Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A0FCEDD88
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 11:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159C510E291;
	Wed,  9 Oct 2024 11:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3EWJ6kF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F0610E291
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728474966; x=1760010966;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gLQ7eu4d87VCZFxe/MGHGu/7FRjFPAUyV4c8Lpay5Zw=;
 b=Q3EWJ6kFyDXyDje8TsvQZQNi8Smbz6wLfZtI6kPC9bSod4I7RRnx7ZqQ
 Jhg+ix0MY8iD+yIHRNcedSL3bWVMfcZAnfwhWYxoOcnUjoaO0tCnJxbUg
 Bu83vscHkk84BZ7gmaAV27i0HoMrsAnat5wudTDvk4qeuTeGXQBYplcLk
 N7k3GtKzIVWgOMvYpho+CWqMGAWH+W8dsCnSqeQ5QJmXPKkJpqMBdZesW
 KWnTyV7FwyDryL4rIyZsIyCxTPFQCm+4OoqBIhjlGwDilZPKyrcxs544w
 LL8P/sUbw6thpjfVsJBDsyO2UFHrZ7o0LE0/xrmXm5BpZztW1G1zQjYpz g==;
X-CSE-ConnectionGUID: PMQlCmzXQuGQZ4daffLPeA==
X-CSE-MsgGUID: Tnd13E5qT5OIWsEdhE94NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27661939"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27661939"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:56:05 -0700
X-CSE-ConnectionGUID: n85tr6UbTUKSRS6oipRcXg==
X-CSE-MsgGUID: K4/80dPFRyGeZJTiu568jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76674051"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.80])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:56:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: matthew.d.roper@intel.com, Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: xe generated headers (was: Re: [PATCH] drm/xe/ptl: L3bank mask is
 not available on the media GT)
In-Reply-To: <20241004212037.1431184-2-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241004212037.1431184-2-matthew.d.roper@intel.com>
Date: Wed, 09 Oct 2024 14:55:59 +0300
Message-ID: <878quxa3sg.fsf@intel.com>
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

On Fri, 04 Oct 2024, Matt Roper <matthew.d.roper@intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 651ba53623e5..df2042db7ee6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_gt_topology.h"
>  
> +#include <generated/xe_wa_oob.h>

Hijacking the thread here a bit, sorry.

This use of system include path <> instead of "" for xe generated
headers keeps bugging me.

There's a global directory for generated headers, and that's what
<generated/...> usually means. See:

	git grep -h "#include <generated/" | sort | uniq

Or look at top level include/generated in the build directory.

Especially putting #include <generated/...> next to #include <linux/...>
implies we're referring to the system generated headers, but we're not.

I think we should be using #include "generated/xe_wa_oob.h" instead,
possibly with a completely different subdirectory name to not have the
name collision and confusion at all.

Another alternative is to do this in the Makefile:

	subdir-ccflags-y += -I$(obj)/generated -I$(src)

and just use #include "xe_wa_oob.h" directly. (FWIW this is what msm
does.)


BR,
Jani.


-- 
Jani Nikula, Intel
