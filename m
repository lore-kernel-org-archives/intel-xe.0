Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD2FCD343F
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 07:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23AA10E425;
	Fri, 15 May 2026 07:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HjMAcyh1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD3710E425
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778831183; x=1810367183;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YO85Ohg/NYAmRelIokC1KO6bQKBF7F8aiIyRaJSvlIg=;
 b=HjMAcyh1O9FQ9jCdZ3l2l5Eg4g4Xkx92bVS+eVcPjDf5IsJOOKgqKOJB
 tb2tWagpErBtz7Ng8UIaQ/zTorsJIwJsjwrhXUXyV/EyfQ4K+EDsTdBbd
 jxrlg6CfpkRpc7A9rrROYj1Yfmq155+eG1dUc37t0XnwMsza1GbkXljj2
 Y6kKN7lbRE1Y8eg8Vu5suhpnxcgEoO16JgRp5eoprIf/cCYHz2c4Sct46
 hjacNyDpIsJm7RSH/H5tkI9ETzY0Z4mB11JRcCBjrk0ttghGwQV7I/opA
 qLASZP7Pkn8Yg8404vWed3QDvAshCJznNiss1aXMLKvK498DxEzA7ypkH A==;
X-CSE-ConnectionGUID: 6whL6ifcQmKwgDxggABQgg==
X-CSE-MsgGUID: RuQR46wOSXKIEVIg1nccwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79956900"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79956900"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:46:22 -0700
X-CSE-ConnectionGUID: /4JDWnyqR7W5ecYKGB24jQ==
X-CSE-MsgGUID: 5ytRUZM2R7KYVEkUUdOvLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="242620824"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 00:46:20 -0700
Date: Fri, 15 May 2026 09:46:16 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v5 02/14] drm/xe/xe_sysctrl: Make sysctrl flood limit
 reusable
Message-ID: <agbPSExZuoQ2-Oxs@black.igk.intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-18-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511172908.1122252-18-riana.tauro@intel.com>
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

On Mon, May 11, 2026 at 10:59:09PM +0530, Riana Tauro wrote:
> The sysctrl command flood limit was defined in an event specific header,
> restricting its usage to event handling. Move it to the shared header
> with a generic name so it can be re-used across all files
> using system controller commands.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_event.c         | 2 +-
>  drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 2 +-
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 3 +++
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index b4d17329af6c..faf6ba89ce98 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -16,7 +16,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>  {
>  	struct xe_sysctrl_event_response *response = command->data_out;
>  	struct xe_device *xe = sc_to_xe(sc);
> -	u32 count = XE_SYSCTRL_EVENT_FLOOD;
> +	u32 count = XE_SYSCTRL_FLOOD;
>  	size_t len;
>  	int ret;
>  
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> index c16c66b9fa7f..d236e22fe9dd 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> @@ -11,7 +11,7 @@
>  #define XE_SYSCTRL_EVENT_DATA_LEN		59
>  
>  /* Modify as needed */
> -#define XE_SYSCTRL_EVENT_FLOOD			16
> +#define XE_SYSCTRL_FLOOD			16
>  
>  /**
>   * enum xe_sysctrl_event - Events reported by System Controller
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 84d7c647e743..0fa786a9e8c8 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -48,6 +48,9 @@ struct xe_sysctrl_mailbox_command {
>  	size_t data_out_len;
>  };
>  
> +/* Modify as needed */
> +#define XE_SYSCTRL_FLOOD			16

Apart from obvious duplication, please consider that the scale is a bit
different for both (additional_errors and event) cases. A single event
can consist upto 16 errors as opposed to additional_errors, which in
itself signifies a single error.

I personally don't see any problem here regardless, but if you want this
to be reused, please make sure we only have a single definition.

Raag

>  #define XE_SYSCTRL_MB_FRAME_SIZE	16
>  #define XE_SYSCTRL_MB_MAX_FRAMES	64
>  #define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\
> -- 
> 2.47.1
> 
