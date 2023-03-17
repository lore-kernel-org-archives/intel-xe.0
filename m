Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DBEC74A5B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 15:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E58310E264;
	Fri, 17 Mar 2023 15:04:54 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897D210E264
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 15:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679065491; x=1710601491;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=44dqgvNTXgoMWFHy8tjlR9wb9hFtKaOUd5GXMIDZKK0=;
 b=ia+G41yr74+UdZ9NJoWXUkvtvvJs+MG3ca2qPHTToFLHNNlNRUBF09+h
 3nmIpaGxWSJDyMD9sGx6UDpXscshbc1F7MC9eBYC2hDWw1gvVnIBRCPgT
 lWbRFajzSafBTSsKN5yBx4aL6UEYHxu/ReiEpVFY7kGHrTb0xPcU4e7gi
 h9sglY/zsRqYfh+GUI+XIiAURQCZ9ldMfO6wyluRpLqEi/dj2wTbe8Kqx
 jYgBubBZXwEBvuswdsciqIRL6yZdIU72xp0XgpaYath2As/oQxaSWnmcQ
 KqQDb2gZnOwYEykwItaEVxco1/nrTV5AcB2tg3mY0fIBF/ANXLgdKd8HD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="400856496"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="400856496"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 08:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="749277886"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="749277886"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2023 08:04:48 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.25.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7E765580AFF;
 Fri, 17 Mar 2023 08:04:46 -0700 (PDT)
Date: Fri, 17 Mar 2023 16:04:43 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230317160443.492d0768@maurocar-mobl2>
In-Reply-To: <20230316210341.3547058-2-lucas.demarchi@intel.com>
References: <20230316210341.3547058-1-lucas.demarchi@intel.com>
 <20230316210341.3547058-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 1/3] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
Cc: Matt Roper <matthew.d.roper@intel.com>, thomas.hellstrom@intel.com,
 mauro.chehab@intel.com, intel-xe@lists.freedesktop.org,
 maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 16 Mar 2023 14:03:39 -0700
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

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
>  drivers/gpu/drm/xe/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4684e99549d3..aeaf3ce19c4f 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -44,6 +44,8 @@ config DRM_XE
>  config DRM_XE_DISPLAY
>  	bool "Enable display support"
>  	depends on DRM_XE && EXPERT
> +	select I2C
> +	select I2C_ALGOBIT
>  	default y
>  	help
>  	  Disable this option only if you want to compile out display support.
