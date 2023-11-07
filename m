Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF547C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 08:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A5A10E4D3;
	Tue,  7 Nov 2023 08:42:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AB710E4D3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699346529; x=1730882529;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qWDJlrKSkS1LmhNbcF2BMb1BMmUjiFG5QJPm/B+n5FE=;
 b=IRt27N2HsN446gMCf9FMJ7ShFjWW/nE5CKWtTixezkqwGueykAOUp0Qq
 HbydLVuAyuUU8MIO0FuDIn3DY90jRJBykC1wz4yBLX4vzC+j804Sz4kII
 zaCLLlxKSsadeOwLhbdq43hCQH0Es3OdMSZwE5btjRl1cL9sPS8JYMl+q
 OSL4ts4AYOHea2VPbmFWIEl+wOvnUjvRieXD1a+Ti8Ul3mhxCeHK74WHf
 1tG32bKkMJd6erDdtSHTF25rjC9zxLPSI/0xLFTznCWdwDFqMBTnhOVsB
 ycfwRHlWXG9xg9SId65gXmcH3Q6Afv5/IhM2CE/TVLuTQMq914GAlof9t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="8109870"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="8109870"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 00:42:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="3741126"
Received: from ezorina-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.183])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 00:41:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: kernel test robot <yujie.liu@intel.com>, Oak Zeng <oak.zeng@intel.com>
In-Reply-To: <202311070416.8nPv4n6G-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <202311070416.8nPv4n6G-lkp@intel.com>
Date: Tue, 07 Nov 2023 10:41:51 +0200
Message-ID: <87a5rqymy8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is
 included more than once.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 07 Nov 2023, kernel test robot <yujie.liu@intel.com> wrote:
> tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru

Why do we have this stale branch? I don't think developers should push
their branches to xe/kernel.git but their own repos instead.

BR,
Jani.


> head:   d1f59526925ae851c6abf77af8ae6f8c3cffeebd
> commit: 304baa8c20cfad330a6c7cad47d86043e968642c [2911/3055] FIXME: drm/i915: add a lot of includes in intel_display_power.h
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Closes: https://lore.kernel.org/r/202311070416.8nPv4n6G-lkp@intel.com/
>
> includecheck warnings: (new ones prefixed by >>)
>>> drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is included more than once.
>>> drivers/gpu/drm/i915/display/intel_display_power.h: linux/workqueue.h is included more than once.
>
> vim +9 drivers/gpu/drm/i915/display/intel_display_power.h
>
>      8	
>    > 9	#include <linux/mutex.h>
>     10	#include <linux/workqueue.h>
>     11	
>     12	#include "intel_wakeref.h"
>     13	#include <linux/types.h>
>     14	#include <linux/bitops.h>
>   > 15	#include <linux/mutex.h>
>     16	#include <linux/workqueue.h>
>     17	#include "intel_runtime_pm.h"
>     18	

-- 
Jani Nikula, Intel
