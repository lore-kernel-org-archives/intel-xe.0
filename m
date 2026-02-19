Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA0DE9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 08:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF83110E07F;
	Thu, 19 Feb 2026 08:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCogAVmK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCC710E07F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771490170; x=1803026170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x5Gw+hOI/O+eN+56BpcAMU2Am7inRouazP24BU8LnhM=;
 b=HCogAVmKgWglg0h6l6/IsEnsD5On4A9DTo3wnsR7Hvw7uF2+G22AKoJ4
 F+0DQ5gfbLNjPivBJstPkVuyGr18BSgb4cnfqV7Sva5SlEc5cbMSO5fNF
 rQtSU6EaPpjV84+FS3bKEeyAXJSITWIi81r7PBkPQUf10plKbjw20uhX8
 NCM9WKOtMVHqQ9wOpv44fQPAnAiMWjwgSU35BLdKfS+fdsPAbUVO6k1WU
 iTxNEkZFwFP7NyjkG4pNhrUcbmg+0M+7IV0M1kdBUguYg9jsmlLS6WuYp
 x5OyvTIHmo6gpUcS2mSKpCqUVHGAYDqRDJAdSec/i4ZaqA/7FFHpviS3d w==;
X-CSE-ConnectionGUID: 3uZLalGWQ5yAvhsDvnZPbQ==
X-CSE-MsgGUID: u0ph6XePS4mEJowphUBvIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76406100"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="76406100"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 00:36:10 -0800
X-CSE-ConnectionGUID: d5g6Q2ZWRwi0TdsEVlAjlQ==
X-CSE-MsgGUID: CfmrXN7lSf6LEqTPAaKYjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="218232208"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 00:36:07 -0800
Date: Thu, 19 Feb 2026 09:36:04 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, umesh.nerlige.ramappa@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v1 1/3] drm/xe/cri: Setup hardware error routing
Message-ID: <aZbLdKls0XRHIOOo@black.igk.intel.com>
References: <20260217114656.2546878-1-raag.jadav@intel.com>
 <20260217114656.2546878-2-raag.jadav@intel.com>
 <20260217214751.GE52346@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217214751.GE52346@mdroper-desk1.amr.corp.intel.com>
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

On Tue, Feb 17, 2026 at 01:47:51PM -0800, Matt Roper wrote:
> On Tue, Feb 17, 2026 at 05:16:31PM +0530, Raag Jadav wrote:
> > Setup hardware error routing based on XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET

...

> > +	if (xe->info.platform == XE_CRESCENTISLAND)
> > +		xe_hw_error_irq_route(xe);
> 
> What makes this CRI-only?  The DEV_ERR_ROUTING_CTRL register exists on
> every platform supported by the Xe driver so there doesn't appear to be
> any specific hardware dependency here.
> 
> Even if there was a hardware dependency, we generally don't want to tie
> behavior to platforms; better to set a feature flag in the device
> descriptor that indicates which platforms can/can't support it.

This will be replaced with if (xe->info.has_sysctrl) once the original
series lands.

[1] https://patchwork.freedesktop.org/series/159554/

Raag
