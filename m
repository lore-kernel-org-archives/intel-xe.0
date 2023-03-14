Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347F9C6FD1C
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 09:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC1C10E15A;
	Tue, 14 Mar 2023 09:47:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D380B10E15A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678787247; x=1710323247;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2nbNEoQ7LVizHDJXe1sYLjzm9l19qy5b+xntQ5qw7Zw=;
 b=khOUg6yD8iSLvnU+nQyCB8Zd1HdsXIzOGJ0On43IqfdLGNk6axSpWQRZ
 yyKGAy4pknZNJKVqGaxgXjJSa+cSsuIpsh1q+ZFyUFsazfyxUpy/CPMxt
 8twdYuKz/l1N3jilTNgwa813UAJa4fSP5gBVPHxWHvkDcms3r86gf4h1c
 MD6EcPaKaQpnLCLGEvO1FWGkrTd6FVkhnB2QwTuTcJMpZZWLk2I4bhNn2
 cQQVclxMFZDz1MqbPcdPS+t3IIvWw/ZbrVBVmTIMKpXUwOaXZyrVSbAwU
 jZr1IiDUQsL/V8ZpZjAwBi4674cH2K65zUEA3EQy6EoPuTPa8cj5DyrB0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="423648525"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="423648525"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 02:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="628988483"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="628988483"
Received: from fathuddx-mobl.gar.corp.intel.com (HELO [10.249.254.202])
 ([10.249.254.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 02:47:24 -0700
Message-ID: <362159c5-5975-67e6-6411-1b4994061aaf@linux.intel.com>
Date: Tue, 14 Mar 2023 10:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230314085842.134239-1-matthew.auld@intel.com>
 <20230314085842.134239-2-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230314085842.134239-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4 1/6] drm/xe: one more s/lmem/vram/
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


On 3/14/23 09:58, Matthew Auld wrote:
> Looks to have been introduced in some very recent changes, in-between
> merging the driver wide s/lmem/vram/.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 1116e217ebc2..27cc31f022a5 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -90,9 +90,9 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>   
>   	/*
>   	 * There may be few KB of platform dependent reserved memory at the end
> -	 * of lmem which is not part of the DSM. Such reserved memory portion is
> +	 * of vram which is not part of the DSM. Such reserved memory portion is
>   	 * always less then DSM granularity so align down the stolen_size to DSM
> -	 * granularity to accommodate such reserve lmem portion.
> +	 * granularity to accommodate such reserve vram portion.
>   	 */
>   	return ALIGN_DOWN(stolen_size, SZ_1M);
>   }
