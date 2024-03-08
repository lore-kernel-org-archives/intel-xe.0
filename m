Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CF8C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 15:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D6010E6FE;
	Fri,  8 Mar 2024 15:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ptwmd4WO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C94510E6FE
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709910281; x=1741446281;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=o3lw2M/5Nh/W3nPecvtZTTMJXKWut9km7ze0j1I+mGA=;
 b=Ptwmd4WOy1D4Yq0Wgrm3PKNLfrZHzvhUKPiU2uUSxDLT4JSsmUZ5y0/+
 yDVnpeCpv3EVqDWGEfffFo9rypr8lqeEQMe1c1l1F7YQDQu50fyitGGZ+
 Lh49pFf4zHaU8citm/rcrmiImyrHuJ9rz7wd+Y2O1a4J2R754P91XKW9K
 B3c0GZNmPT7pxkltzWT2YIMig/GIhMNqHKjaTToeuLVPLio4SkT9+DAEM
 yWq8u7iU8afZGe54vaTx6QGCEuWlNWUKZL+btzb7nTUWE80EsRAuAaIvO
 CQMf6JeUioPkd7eILMaOuBu9j7Dnp8ZFJ/0XHmVktbjj/TB3wBGSTpVMP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="16039525"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="16039525"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 07:04:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10928530"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 07:04:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/xe/hdcp: Fix condition for hdcp gsc cs requirement
In-Reply-To: <20240308134817.1940638-2-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240308134817.1940638-2-suraj.kandpal@intel.com>
Date: Fri, 08 Mar 2024 17:04:33 +0200
Message-ID: <87zfv8u5mm.fsf@intel.com>
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

On Fri, 08 Mar 2024, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Add condition for check of hdcp gsc cs requirement rather than
> assuming gsc cs to always be required when xe is loaded. It is not
> required for Gen pre-MTL
>
> Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index dcde1d0ac1f8..25c73602ef55 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -32,7 +32,7 @@ struct intel_hdcp_gsc_message {
>  
>  bool intel_hdcp_gsc_cs_required(struct xe_device *xe)
>  {
> -	return true;
> +	return DISPLAY_VER(xe) >= 14;
>  }
>  
>  bool intel_hdcp_gsc_check_status(struct xe_device *xe)

-- 
Jani Nikula, Intel
