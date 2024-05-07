Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B38C25B5F
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 16:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C956D112507;
	Tue,  7 May 2024 16:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxdVRtEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D90112507
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715099327; x=1746635327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7Qf0564tVpS7VmGJxLKeMAhu/IISov+zdxvdld8L8uA=;
 b=DxdVRtEqK3HAmzSIgssC2xbJUUvp+T2dwRULYfLU5cqlsmbS0VP/2VOT
 xo7NCvUme4saEOvt0AsWKV6Ms33S90hmH3EmJZyrn/WMrli4LCSVYHok8
 dIgSpVQt5taVgYAcb+EtUcMwXOSliDgVpBUoZJBj9qKcOxOZ3EAAwyEwq
 d74PbgWPe+yeELXr412RXAnmi9W6+EroMxDa9mvoAOc/rwVNOGCduch7y
 wY3ZUdwwrzI9AcrrmI5YH9v4Irb67rfjekhlTnY8b6ZL3hqHzDItMZYj7
 ipcAGn/WQ7WIYIHA/UUmy48aMG2Jo8ZofVduT/YlVr2a9Dl/epun7q8Or w==;
X-CSE-ConnectionGUID: r+H9QNcLQw2NQiO5S2qj3w==
X-CSE-MsgGUID: U4rDBCvQQOyXndsu4kCtIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11033586"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="11033586"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 09:28:47 -0700
X-CSE-ConnectionGUID: y7yoXQ3DRjuoeSjxnv2Kjw==
X-CSE-MsgGUID: lxzGdOxCToyHZoWFIikkPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; d="scan'208";a="33260378"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 09:28:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s4NgJ-000000056il-2x4Z; Tue, 07 May 2024 19:28:43 +0300
Date: Tue, 7 May 2024 19:28:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Rename few xe_args.h macros
Message-ID: <ZjpWuy5inznQdNWl@smile.fi.intel.com>
References: <20240507152246.2791-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507152246.2791-1-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, May 07, 2024 at 05:22:46PM +0200, Michal Wajdeczko wrote:
> To minimize the risk of future name collisions, rename macros to
> always include the ARG or ARGS tag:
> 
>   DROP_FIRST to DROP_FIRST_ARG
>   PICK_FIRST to FIRST_ARG
>   PICK_LAST to LAST_ARG

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Seems I already gave a tag...

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


