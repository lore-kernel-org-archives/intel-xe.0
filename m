Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD00C77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 09:13:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB5210E52E;
	Thu,  1 Jun 2023 09:13:17 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E495310E52E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 09:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685610794; x=1717146794;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=67XYpTdVVu3Jhthlx7bnpjgCfw2x9cerOJyQdOjoknY=;
 b=HvnZ5n9pwyJ+/rLXNZAgFxpARmfjsLVSCzl0Nf0ITU2MRnn+u9p/4IN8
 Rq9rM653FG9F7bR9dmSHD5mCY/yirjXeMrLLf2rAQGF7Hpne14dAQ8jA2
 DyXVO2e7e0JZWJ2AOOnTcp+lSJiec2bikPL7Ka2LAi78ldJ0C42n7umwv
 rMGMIDiyQLINwyBjtW9wM7yFxT0ETSFdHrtz2qgouTIVshPLI7THWUMSW
 /pqhiDFjKMXmMB3ENUJCne0W3e+88WgusmpSTt4hPZqr+ySMxPUocTmhp
 PAybQCiPTSWVMKYMO139pjlOj33K9ZJeXZkZLX9fMt0izsVNV9CbqjUUS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="335854087"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; d="scan'208";a="335854087"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 02:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="797070852"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; d="scan'208";a="797070852"
Received: from rbals-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.55.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 02:13:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230531151804.2017924-2-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230531151804.2017924-1-maarten.lankhorst@linux.intel.com>
 <20230531151804.2017924-2-maarten.lankhorst@linux.intel.com>
Date: Thu, 01 Jun 2023 12:13:11 +0300
Message-ID: <87r0qvfsuw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 1/2] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 31 May 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index da1e447c08c7..ecf37dded78d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -176,7 +176,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_dp_mst.o \
>  	i915-display/intel_dpll.o \
>  	i915-display/intel_dpll_mgr.o \
> -	i915-display/intel_dpt.o \

So, this should be a fixup to the commit that adds it, which is
different from "drm/i915/display: Remaining changes to make xe compile".

However, something has gone horribly wrong in drm-xe-next rebase,
because earlier it was added in "drm/xe/display: Implement display
support", but that has now been squashed into "drm/i915/irq: split out
hotplug irq handling" which is supposed to be just a cherry-pick from
upstream to help rebasing.

Uh-oh.

BR,
Jani.

>  	i915-display/intel_drrs.o \
>  	i915-display/intel_dsb.o \
>  	i915-display/intel_dsi.o \

-- 
Jani Nikula, Intel Open Source Graphics Center
