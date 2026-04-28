Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21159FF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 11:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21EB10EB3C;
	Tue, 28 Apr 2026 11:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMjKrzFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA88110EB3E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777376772; x=1808912772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/zSfkhXVYNgK1N2FYIJFlAanyL7dQ8C0KP8giSW1wb0=;
 b=nMjKrzFkvU3KFo6KFcfhGHp+/LFBojuKNutbhBHhV38MQcQWPjuZ/DdK
 0vvEm3/NXVwWsGtGaudLztxzX9PED8TS9LFraPc4AH8GjUPVM+h7z9B38
 M3xWfy31ELq32iIkKTMCD6goIlzh6df0jwTz4RmceWsiPZ22Bs8ywqeEF
 /82SDxXeybwDbUlcrqM+PRMwqfki7qzBGxG2Y2EFS7RoVzckscD9iHfPS
 tmXhDGeC8micmWm4am7dQJiYYK4G+vGWW59qyfq12nW4rsROCxRPThIYg
 s/EFdeiKl7cq0q1CQBZVXDwEDBBAgHTtbQMgEYOYW8xyrMYGRla69R9Oj A==;
X-CSE-ConnectionGUID: E8BAt3fsT8yxhiPJM//xVA==
X-CSE-MsgGUID: GtDdsEeYQhymDs5907BugA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82146754"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="82146754"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:46:12 -0700
X-CSE-ConnectionGUID: N9hPVdWNSmq87UgXNJ9KQg==
X-CSE-MsgGUID: ave5AjNBTsGBfEPsdkuUjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="233078113"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:46:08 -0700
Date: Tue, 28 Apr 2026 13:46:06 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Anoop Vijay <anoop.c.vijay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v4 12/13] drm/xe/xe_ras: Query errors from system
 controller on probe
Message-ID: <afCd_v3fPXpyufAD@black.igk.intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-27-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417085812.4013309-27-riana.tauro@intel.com>
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

On Fri, Apr 17, 2026 at 02:28:24PM +0530, Riana Tauro wrote:
> Reorder soc remapper and system controller initialization to
> early probe to allow querying errors on module load.

...

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 42ec27c05e9a..7598eeb796f0 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -479,4 +479,11 @@ void xe_ras_init(struct xe_device *xe)
>  	/* Get any pages that need to be offlined from firmware and reserve them */
>  	get_offlined_list(xe);
>  	get_queued_pages(xe);

I know it's yet to be merged but should we also add get_pending_event()?

> +	/*
> +	 * On init, process and log any errors detected by firmware before driver init.
> +	 * Critical errors are handled in xe_pcode_probe_early(), which enters survivability mode
> +	 * if required.
> +	 */
> +	xe_ras_process_errors(xe);

What about wedging? Should we continue driver load after declaring wedged?

Raag

>  }
> -- 
> 2.47.1
> 
