Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B867FC77B7A
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 10:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB8A89E9E;
	Mon, 29 May 2023 10:08:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F236C89E9E
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 10:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685354906; x=1716890906;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gkrnfegCc/QQxPDOWE1vwAI7bwhsju24kR+6aqJx0JU=;
 b=ly+NCxSfpmVlyueOw81EuQHgfwH8S1Dp1gaP1wkv3yws5hoz4XrCKZF3
 C0w/sl/DOZvMiY6l8lFyzRN4qo9BBUQLejj5hpn5D6iAwAGLOPpntII+L
 Pp5ojuBe9I2eNrrtSHD06JEADl733FGS/8zjPELzQ8+2vbLlAsjldatBg
 svTY7QFAgnBrzxG7oqP+uLKZ9fHgj2w2Da1QxS41uykMrbHhBROknkmIO
 Q6tWgoZWEQdLN5FlS+VIbSvu2oyiiXxr0WmwwFcxUI8CezEvaXnP4LP+Y
 sdHm8YY32/fa7ZXLcaLnByDl8twUlqGe/K5JfiF2iq0gVrx8ddx0RVdvO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="352176981"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="352176981"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 03:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="830345843"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="830345843"
Received: from iswiersz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.191])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 03:08:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230529082917.490986-1-balasubramani.vivekanandan@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230529082917.490986-1-balasubramani.vivekanandan@intel.com>
Date: Mon, 29 May 2023 13:08:21 +0300
Message-ID: <87ttvvh2lm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Add intel_cx0_phy.c to build
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 29 May 2023, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
> intel_cx0_phy.c added to Xe module build as there are upcoming changes
> to intel_cx0_phy.c required for Xe display support.

This should be a fixup! to the display enabling commit.

> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index da1e447c08c7..6a3d30b30dba 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -212,7 +212,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_wm.o \
>  	i915-display/skl_scaler.o \
>  	i915-display/skl_universal_plane.o \
> -	i915-display/skl_watermark.o
> +	i915-display/skl_watermark.o \
> +	i915-display/intel_cx0_phy.o

Comment near the top of the file:

# Please keep these build lists sorted!

>  
>  ifeq ($(CONFIG_ACPI),y)
>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \

-- 
Jani Nikula, Intel Open Source Graphics Center
