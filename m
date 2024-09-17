Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B35CAC59C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 20:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783D110E179;
	Tue, 17 Sep 2024 20:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8E9OL0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8B410E179
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 20:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726603681; x=1758139681;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wFcrZWftEEqn2oHf9pTzBMXQWKi9xrNnGEntA6S5kt4=;
 b=C8E9OL0kpmRjlu+VfxswSbjlK/LgXWzYfnVqEiCHx6uQEOstRpMrH9Za
 zUBb/4kpsZRjFv5B7blO+ypAG6brU1GE+JbFpsyBCukjZJmnTsG1rD6Zz
 pyXxiwPFHZImzi4CA2xx/aFlzr34zvixX0jg+YBsrvXR020+laa7vT9Tb
 TQK0vZe3IXk7g3IX0E0CwoODDamM8YWixfY+TgwWIaxKuMI8qxpPkN6NO
 4SH8rJE1iaFdgVeGSpC9dWghACdVsX8YyOCA1F+V95u0gZfaP7VP82KBI
 wPhEM+WfUSFyg0Qv1eokFIRiYX+wb1Aqg6kKM1Km89FKDa5BlUVmW5/d4 A==;
X-CSE-ConnectionGUID: wim5koHtS/iNWkNP2HEkQA==
X-CSE-MsgGUID: 32V1T+TVSj2YHdq4v2IeiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="43003577"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="43003577"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 13:08:01 -0700
X-CSE-ConnectionGUID: +moEEzdfTliqOUHOkvVKsw==
X-CSE-MsgGUID: XLamb/5KRA6c90AIcpNFQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="99993798"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 17 Sep 2024 13:07:59 -0700
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0100D312D7;
 Tue, 17 Sep 2024 21:07:56 +0100 (IST)
Message-ID: <9f9a1f77-4a36-4ee7-8cf3-4c3ec7a4b32b@intel.com>
Date: Tue, 17 Sep 2024 22:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/xe: Introduce dedicated config for memirq debug
To: Ilia Levi <illevi@habana.ai>, intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, jonathan.cavitt@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
References: <20240917112307.1242329-1-illevi@habana.ai>
 <20240917112307.1242329-2-illevi@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240917112307.1242329-2-illevi@habana.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 17.09.2024 13:23, Ilia Levi wrote:
> From: Ilia Levi <ilia.levi@intel.com>
> 
> Separate config for memory based interrupts (memirq) infrastructure.

s/for/for debugging

> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.debug | 12 ++++++++++++

maybe I wasn't clear but in addition to Kconfig change I was expecting
those small adjustments in memirq_debug() macro definition to be
included in this patch:

-#define memirq_debug(m, msg...)	xe_sriov_dbg_verbose(...)
+
+#define memirq_printk(m, _level, _fmt, ...)			\
+	drm_##_level(&memirq_to_xe(m)->drm, "MEMIRQ%u: " _fmt,	\
+		     memirq_to_tile(m)->id, ##__VA_ARGS__)
+
+#ifdef CONFIG_DRM_XE_DEBUG_MEMIRQ
+#define memirq_debug(m, _fmt, ...)	memirq_printk(m, dbg, _fmt,
##__VA_ARGS__)
+#else
+#define memirq_debug(...)
+#endif
+

>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index bc177368af6c..2de0de41b8dd 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -40,9 +40,21 @@ config DRM_XE_DEBUG_VM
>  
>  	  If in doubt, say "N".
>  
> +config DRM_XE_DEBUG_MEMIRQ
> +	bool "Enable extra memirq debugging"
> +	default n
> +	help
> +	  Choose this option to enable additional debugging info for
> +	  memory based interrupts.
> +
> +	  Recommended for driver developers only.
> +
> +	  If in doubt, say "N".
> +
>  config DRM_XE_DEBUG_SRIOV
>  	bool "Enable extra SR-IOV debugging"
>  	default n
> +	select DRM_XE_DEBUG_MEMIRQ
>  	help
>  	  Enable extra SR-IOV debugging info.
>  
