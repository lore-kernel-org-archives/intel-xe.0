Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B515C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 14:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E480A10E04D;
	Mon, 18 Sep 2023 14:22:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1588510E04D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695046921; x=1726582921;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Tzc7J7k299+y3iU1LrYKUb2x4+oZ1GA6bPdDmI/r6ls=;
 b=mNNovpJWnNxq4meTuJcxQiPc/BrRDxc4QFOgM4yi4h2ZMEkFzHDHxYRW
 LA79BbRY0qLREdv+77azwk0BeCicoOG5sEJhQh1rsJWKNgQpOy7oEndU/
 xqhQQRMwEAPLZHGHfKv/7yiSiUxfAQusqSxsVGuhLvgZZ5ulVJpgdjviL
 qZHrLcjQ3L3A2GloaXkODndRiVkDlp1mFybzVcyEkymEXTFaFRX2SBFzH
 urFy7iMMQr3jo3EDwYqWyV8Z1J8uc3pCP+kNVOWNXvyvk0eJmhiRbjzFR
 iPm9exCalcn6kesdpTEV/eJxGBRJlc3lHkdLnncMu/rRrmgbUamT6QX+C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359086632"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="359086632"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 07:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="919469246"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="919469246"
Received: from rkhurana-mobl.ger.corp.intel.com (HELO [10.252.38.10])
 ([10.252.38.10])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 07:17:41 -0700
Message-ID: <f7eeee26-03b4-f0b3-333d-111be65c76fa@linux.intel.com>
Date: Mon, 18 Sep 2023 16:17:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230915180610.39266-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230915180610.39266-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/display: Select some missing
 configs
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



On 2023-09-15 20:06, Thomas Hellström wrote:
> When selecting CONFIG_XE_DISPLAY, the following missing symbols can be
> seen unless something else has selected the corresponding configs.
> 
> ERROR: modpost: "cfb_copyarea" [drivers/gpu/drm/xe/xe.ko] undefined!
> ERROR: modpost: "cfb_fillrect" [drivers/gpu/drm/xe/xe.ko] undefined!
> ERROR: modpost: "cfb_imageblit" [drivers/gpu/drm/xe/xe.ko] undefined
> 
> Make sure these are included in the Xe Display build.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/Kconfig | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 096bd066afa8..ed2dd73f153b 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -45,6 +45,9 @@ config DRM_XE
>   config DRM_XE_DISPLAY
>   	bool "Enable display support"
>   	depends on DRM_XE && EXPERT
> +	select FB_CFB_COPYAREA
> +	select FB_CFB_FILLRECT
> +	select FB_CFB_IMAGEBLIT
>   	select I2C
>   	select I2C_ALGOBIT
>   	default y
Make that FB_IOMEM_HELPERS, and you can add my r-b. :-)

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
