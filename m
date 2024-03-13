Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FDFC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 08:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C969710E869;
	Wed, 13 Mar 2024 08:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZoFj1TQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2771010E869
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710318711; x=1741854711;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9oN0PvkqnbszWoWDLoP6xtlPsnvx1jn3SMaVQGsLV7o=;
 b=KZoFj1TQcqJptpTMwWPgvdQ5aI9+AJ5++lCdPAkyyYhcGLpv5a94B5Ui
 CY/+32+R5djPQUWZAjPCIdRE0saz56NOyt7ds0QNieQBixq1sosWrALyO
 gMkxgfb18G4O27R41vVTgy4LNb0nTG4xXo47JnDUy3WNjpFY/8Psj2wFc
 DMH4PqFTeJv5hnydUQJaZqw/kvjhzT2xA+CxqXsxk9VK8e2w4H2d1gWg+
 qP/Pwt6RAIOFS5sM5FblSAOs0yg6bSAT4M623nQh9udExntS1TBZbWcQc
 RgUNJfR/eHzY+EUUva0arvciKcAZZoD+JMkEeLOScnsYJxW8d4G6cSHPJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5191345"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5191345"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 01:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16559592"
Received: from jbakowsk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.28])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 01:31:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe: Always check force_wake_get return code
In-Reply-To: <20240312194256.965685-1-daniele.ceraolospurio@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240312194256.965685-1-daniele.ceraolospurio@intel.com>
Date: Wed, 13 Mar 2024 10:31:44 +0200
Message-ID: <87h6hasfbj.fsf@intel.com>
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

On Tue, 12 Mar 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index d9aa815a5bc2..902c52d95a8a 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -287,7 +287,7 @@ static void gsc_work(struct work_struct *work)
>  	spin_unlock_irq(&gsc->lock);
>  
>  	xe_pm_runtime_get(xe);
> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));

Up to the xe maintainers to decide, but I'm really not a fan of hiding
functionality inside warn ons. My approach usually is, would it work if
all the warns were removed? If yes, it's good. If not, maybe reconsider.

BR,
Jani.


-- 
Jani Nikula, Intel
