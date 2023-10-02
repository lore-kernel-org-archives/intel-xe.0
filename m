Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A34E7849A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 14:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2938810E05A;
	Mon,  2 Oct 2023 14:03:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB4A10E05A
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696255387; x=1727791387;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=rbPeUj5YasgMkQN1MR2lQmPBX+lufLtAOLDPxCmkJ88=;
 b=IuTnKmLViUWi3gaisuZGzebMER/U1OaizVdJ2M1BrfDtcuRo8GYeyQ/u
 ul1XgSHiuA+ECLd4Inz4bK7C93bqT0MXGy8uoYTJc3nzy18qez+tpXdQo
 +DhzBAYe0lUyhNqShIa/6WghCSWxPDejxPS3/z0Fn5fK7jhejyo8/rk/X
 FxZsRFrOvPpXKaYVLd2chLVtd+N3uJC6uqCQABiPm0HWftUD5Ijnu8+Ii
 zixIpdtSFW6j2U23N3/lTCWLXpxr/ybIQ8E8oJ/YJmPRUlz5tmmwEuLjZ
 lFYoI1Uic2stRW4cywZwpxUn0dVTmVRyRFarNj+mI2r8cPEcD0lbvgYqY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="4222727"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="4222727"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:03:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="744120477"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="744120477"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:03:05 -0700
Message-ID: <9809674a-0a6b-2118-50b9-fb68dd19336b@linux.intel.com>
Date: Mon, 2 Oct 2023 16:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230929204637.1202492-1-rodrigo.vivi@intel.com>
 <20230929204637.1202492-5-rodrigo.vivi@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230929204637.1202492-5-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 4/4] fixup! drm/xe: Rework xe_exec and the VM
 rebind worker to use the drm_exec helper
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


On 9/29/23 22:44, Rodrigo Vivi wrote:
> ---
>   drivers/gpu/drm/xe/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 97ed2a00f862..9b74b05475cf 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -34,6 +34,7 @@ config DRM_XE
>   	select VMAP_PFN
>   	select DRM_TTM
>   	select DRM_TTM_HELPER
> +	select DRM_EXEC
>   	select DRM_GPUVM
>   	select DRM_SCHED
>   	select MMU_NOTIFIER
