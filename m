Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13684C36018
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 19:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88D310E0BA;
	Wed,  2 Apr 2025 19:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdMXGu2q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879E310E0BA
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 19:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743622054; x=1775158054;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T9oaecO5j26VKoxREdUE9tWipWjRmxiUfv4st6gneoI=;
 b=FdMXGu2qOyYihBemAzptf6by+yVQ/dDEoKrCSoBzHIk9za/fgQOCwLKq
 stCzdWatDAP10rmfK8WcB5dIw3nGVFha17AHcSlKAjkHRoH0qX9a4Vzsw
 76kBO0JaUm7VVj7w8q4fUKLRgcGlR6yUMVzW73TDTVYWQUbB7taoyR0SU
 T7GaTi8ftN2eOriDQ12bZXxjYvgf5rG5YSC2zhUNUBD4QthnerNXSLhcI
 GNkYK214PQQPDXNIjhKPaRw+UBjj2/Y1dPRfCAHY6qHvlhcqh1WDKuYe6
 hxXrzNipM9J/iG82VObHKs9L1hA056u980M5IbPVJTp4pIZmVU3Bh67IJ A==;
X-CSE-ConnectionGUID: KlY5wxzySt2KSSNKWTo8xQ==
X-CSE-MsgGUID: vBpd/110RBaIvkwvdGL5YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45182175"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; d="scan'208";a="45182175"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 12:27:34 -0700
X-CSE-ConnectionGUID: YzbBz5BuQeCFNMYhzKYUTw==
X-CSE-MsgGUID: 3uwk9pO7TnSy4Z0peOxI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; d="scan'208";a="126689396"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 02 Apr 2025 12:27:33 -0700
Received: from [10.245.83.29] (unknown [10.245.83.29])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D637334EF5;
 Wed,  2 Apr 2025 20:27:31 +0100 (IST)
Message-ID: <ab19b061-4b80-4acb-82f1-0311da276d26@intel.com>
Date: Wed, 2 Apr 2025 21:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Don't expose privileged GT debugfs files
 if VF
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20250320210738.1733-1-michal.wajdeczko@intel.com>
 <20250320210738.1733-4-michal.wajdeczko@intel.com>
 <fvnsx2rcjljjlwdb2sjxqo3otzpffnfs666ueldgojsb5o5gqd@xxpmrvvmnisi>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <fvnsx2rcjljjlwdb2sjxqo3otzpffnfs666ueldgojsb5o5gqd@xxpmrvvmnisi>
Content-Type: text/plain; charset=UTF-8
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



On 21.03.2025 17:55, Lucas De Marchi wrote:
> On Thu, Mar 20, 2025 at 10:07:38PM +0100, Michal Wajdeczko wrote:

...

> 
> Another possible idea: would it make sense to add a flag in
> drm.driver_features to note if the driver if pf/vf? That way we may
> simplify other places and then here we could just do:
> 
>     { {"steering", .show = xe_gt_debugfs_simple_show, .data = steering,
>        .driver_features = DRIVER_SRIOV_PF },
>        ...
>     }
> 
> instead of splitting the array.

tempting idea, but I'm not sure how/when this could be accepted at drm
level, and whether our single static drm_driver instance will survive
both PF and VFs instances at the same time

> 
> pass by comment since I was involved in other threads related to default
> context in PTL... Are these default_lrc_* accurate from the VF point of
> view? Are they different from the ones for PF?

it should reflect what VF uses and it should be the same as on PF

