Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ABCC74A5B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 06:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C54010E327;
	Fri, 17 Mar 2023 06:08:51 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A74E10E327
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 06:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679033329; x=1710569329;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kpJE1vya/KCmxgWaw2O6MMjP7V9nyzKcuKQOKsjX5GM=;
 b=gDiA6Dn055w1iRSRVD/lM2Qh2Y4GiqTWdNCkcMPbeRIA9c03gpRRZnbi
 uhgqgt50MIUljqE+nImg2sUJqhKAc2EpizlIZSyGNCRQCNkWMkannoFnj
 E2EA9oZy0a7kcav6ZX1wmEy1ygLdlM+6CSZNEHw2HnhJQ0LPBx4SsyeqW
 nDRjGKMfTuWB+sGmiuZ4CUZ5a157m6mSRLM0clwMz655h5rhXqcfh/Pq7
 /kSWaUsCXXkJaSv3mtIuJahDtulYAe2JzHbJD115gXHRpQZlZpC6rjQHj
 TX8mVmyb0jUpFX8kcpnHMCIH7I1dYk7q8yVpLJ2B+4FmiPBVw89pvnv05 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="400770691"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="400770691"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 23:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="682568926"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="682568926"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 16 Mar 2023 23:08:46 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.25.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 05180580C4C;
 Thu, 16 Mar 2023 23:08:46 -0700 (PDT)
Received: from localhost ([127.0.0.1])
 by linux.intel.com with esmtp (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pd4Ci-004nZj-0x;
 Fri, 17 Mar 2023 07:08:43 +0100
Message-ID: <b3e461ce-e0b7-1f9b-106a-b01ce3251565@linux.intel.com>
Date: Fri, 17 Mar 2023 07:08:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230316182951.3441696-1-lucas.demarchi@intel.com>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20230316182951.3441696-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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
Cc: thomas.hellstrom@intel.com, mauro.chehab@intel.com,
 maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 3/16/23 19:29, Lucas De Marchi wrote:
> Introduced with the 6.2 rebase due to
> commit 000458b5966f ("drm: Only select I2C_ALGOBIT for drivers that
> actually need it"). Make a similar selection when CONFIG_DRM_XE_DISPLAY
> is enabled. Also, provide this as a fixup-only commit, to be squashed in
> the next rebase. With this, the following command works again:
>
> 	./tools/testing/kunit/kunit.py build \
> 		--kunitconfig drivers/gpu/drm/xe/.kunitconfig
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Yeah, selecting I2C and I2C_ALGOBIT is something that needs to be done 
on each driver.

Doing such kind of things subsystem-wide doesn't sound right. So, LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>   drivers/gpu/drm/xe/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4684e99549d3..aeaf3ce19c4f 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -44,6 +44,8 @@ config DRM_XE
>   config DRM_XE_DISPLAY
>   	bool "Enable display support"
>   	depends on DRM_XE && EXPERT
> +	select I2C
> +	select I2C_ALGOBIT
>   	default y
>   	help
>   	  Disable this option only if you want to compile out display support.
