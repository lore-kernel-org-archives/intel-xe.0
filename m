Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445E5C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 09:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E160110E823;
	Fri,  1 Aug 2025 09:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dClAvEBH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5B310E823
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 09:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754040494; x=1785576494;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0jSj22Kk+VZ1ecSrTc1ZqlqsJ9PHfFHRDC0IjfmLWZY=;
 b=dClAvEBHPbXHCH6q+TQPicAgE32KzmdcGb5NDJ1x0dtu+8PvyLWOzSD9
 +tD8tTRUb/bqFdKmMpOwdZJB+Rf5H3peHx7JmO7/asPD8sL0+TeQdz6fS
 eM3W29nMroGVWlpiTBavfN3lRBtdq9WrRbUqXYPQrSYjU6oA/suNvwian
 tdP+uzVJ2l4qzmDweSRCGy/Bzx8sfBBkwQVTd7LaelY7EgbLqU15E62wI
 RrTfLkfeUXiox3dSWSEigcluIEssyARU0T4rM7h+p6Nbes+Kto5aRAya6
 R5jTxh2SvC0JzSozJ8SH5GOfVhSU01YrWtPY6hFqvRYyBQCdfpXrCLheq Q==;
X-CSE-ConnectionGUID: xWsqGd0YQ/Gmgjxu7FyM3A==
X-CSE-MsgGUID: bzl/jPnBQb2KyyqqWmPvMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55586030"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55586030"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 02:28:13 -0700
X-CSE-ConnectionGUID: OQRVqUZ/TMiaU2MDicGOog==
X-CSE-MsgGUID: yRjQN7UbQDq9p2E/lm3K7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194355316"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.164])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 02:28:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: fix stale comment about unordered_wq usage
In-Reply-To: <20250731111214.1130130-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250731111214.1130130-1-jani.nikula@intel.com>
Date: Fri, 01 Aug 2025 12:28:05 +0300
Message-ID: <133ec65ccd361b81193e7f5d8ef4d4854b0e89b1@intel.com>
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

On Thu, 31 Jul 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> Display has switched to its own workqueue, no longer using
> xe->unordered_wq.

Lucas, Rodrigo, the change was done in 7c377900772d ("drm/i915/display:
move unordered works to new private workqueue"), which is in drm-next
and Linus' upstream but not in drm-xe-next yet. It's a minor detail, but
do you care if this patch gets merged to xe before the backmerge with
that?

BR,
Jani.


>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 38c8329b4d2c..01e8fa0d2f9f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -427,7 +427,7 @@ struct xe_device {
>  	/** @ordered_wq: used to serialize compute mode resume */
>  	struct workqueue_struct *ordered_wq;
>  
> -	/** @unordered_wq: used to serialize unordered work, mostly display */
> +	/** @unordered_wq: used to serialize unordered work */
>  	struct workqueue_struct *unordered_wq;
>  
>  	/** @destroy_wq: used to serialize user destroy work, like queue */

-- 
Jani Nikula, Intel
