Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3C2CA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 07:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00C310E3FB;
	Mon, 18 Aug 2025 07:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyBk7twa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C5110E40D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755503696; x=1787039696;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=n8qytCsNVXIYp5CO7JtWor6SHnK0x5ykgGmCvmhSZns=;
 b=YyBk7twaj2B3JnBCNvqVJvxMOfylYPlGkslgYR2epRPYjvBX4o203pAc
 zAzK1JF9XcqmtB56aq+07fsd8uBtB9ze2LDk+sv60Uuk7JMyngsphikQE
 OkUgHActbK5qUnpKROgNeLFtz9t25M6ze8zXWrkVgNFTfbv6G6AggilWj
 DjHlefUMS6pnv2NBfHppxtTE6J0Z332UwNK3hmCPzXxEI3MnEVAYaVaBA
 D0O37EzLZCBJnb94Y7bUrexAkUqkQ3lu2AMfgadIzJr9q4OrdyqSO3aOu
 b8RzVHKyD21Q6q79FkC/UhXVJ6vDUkk9+5MbmbRJco/6brj+onMLiTern A==;
X-CSE-ConnectionGUID: rMMv1bQmRAqYwh/AYNHNKw==
X-CSE-MsgGUID: YjweGIS/RSm9TcGV/cF2ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="83152642"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="83152642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 00:54:56 -0700
X-CSE-ConnectionGUID: wwYHt3V4Rc2w8deQBRHq6A==
X-CSE-MsgGUID: cMFcBMOxShOaQgTKW/s/Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167862135"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 00:54:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>, intel-xe@lists.freedesktop.org
Cc: Simon Richter <Simon.Richter@hogyros.de>
Subject: Re: [PATCH 1/1] Initialize stackdepot hash tables
In-Reply-To: <20250816135748.7700-2-Simon.Richter@hogyros.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250816135748.7700-1-Simon.Richter@hogyros.de>
 <20250816135748.7700-2-Simon.Richter@hogyros.de>
Date: Mon, 18 Aug 2025 10:54:51 +0300
Message-ID: <47edca91812af2273913fb34d88e950fc32337f7@intel.com>
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

On Sat, 16 Aug 2025, Simon Richter <Simon.Richter@hogyros.de> wrote:
> If the hash table is not initialized when the xe driver attempts to
> generate debug output, the kernel tries to dereference a NULL pointer.

Please be more specific where this happens and how. Is there a better
way? What are we supposed to do?

BR,
Jani.

> ---
>  drivers/gpu/drm/xe/Kconfig.debug | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 01735c6ece8b..70b7a817ed47 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -21,6 +21,7 @@ config DRM_XE_DEBUG
>  	depends on DRM_XE
>  	depends on EXPERT
>  	depends on !COMPILE_TEST
> +	select STACKDEPOT_ALWAYS_INIT if STACKTRACE_SUPPORT
>  	default n
>  	help
>  	  Choose this option to turn on extra driver debugging that may affect

-- 
Jani Nikula, Intel
