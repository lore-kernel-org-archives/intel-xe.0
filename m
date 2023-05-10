Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C809C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 13:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722DC10E494;
	Wed, 10 May 2023 13:09:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148B110E494
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683724157; x=1715260157;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3OoAevtIJ3uebY7+NgVvsJ0DfL+YgTENjyVVd6BKG/U=;
 b=RiA30Mc5jKBBDuKk6abijT5PbYf5kz4u/liNeVHI+8w2ThvKAVaI0nrj
 fqJ7ExxanwjEPO4Y7sGWpMxS29rQf7XV8Glwxx0TesO7E6EiBW+404RbT
 WjSbkITT+AuZpksYpfov2VM0x0TQn7qYTVxsw1pUrtH8VyycIo72brwdv
 uls0oihP9UHgbs1/YviFVUd11H8/Kh+NfpGXo9IL3BNwrWC9z2yJAarlD
 HEVCPxZA+DipdXEmA04+2//9+oPlGae4rZw1qI4guWYGAw41f1R5T+hbQ
 egcxliI9bQDGH4zt94XccWafE0TXLMMs3p/PbttG2PX133euOdAds1S2e A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="350242732"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="350242732"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 06:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="699294146"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="699294146"
Received: from azaki-mobl.amr.corp.intel.com (HELO localhost) ([10.252.63.3])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 06:09:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230510130004.28490-1-nirmoy.das@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230510130004.28490-1-nirmoy.das@intel.com>
Date: Wed, 10 May 2023 16:09:11 +0300
Message-ID: <87v8h0miyw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe: Unlink display before turning off irq
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 10 May 2023, Nirmoy Das <nirmoy.das@intel.com> wrote:
> Unlinking display will lead to guc tlb inval timeout for
> the fbdev vma as irqs are disabled.

fixup to display enabling?

BR,
Jani.

>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 32cc83c43b2a..430bd6eb4053 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -349,9 +349,9 @@ void xe_device_remove(struct xe_device *xe)
>  {
>  	xe_device_remove_display(xe);
>  
> -	xe_irq_shutdown(xe);
> -
>  	xe_display_unlink(xe);
> +
> +	xe_irq_shutdown(xe);
>  }
>  
>  void xe_device_shutdown(struct xe_device *xe)

-- 
Jani Nikula, Intel Open Source Graphics Center
