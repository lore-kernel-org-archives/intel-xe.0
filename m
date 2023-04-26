Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A48C7618E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 16:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E37C10E123;
	Wed, 26 Apr 2023 16:47:36 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC8010E123
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 16:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682527654; x=1714063654;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6CYPj5IADtVrQPqPLVSUdHDY/KjpnqyziZ34IyopxFw=;
 b=WBWNM5GuvZdIkMUIHg70I61xxJYtqSikJ+nOp9FcdwgW72+p/cvstCjg
 vDjKoNFAtX6kw6jCDHsc4tf6UqYfCxZrjLftzDUALAaNmxQBtEonUHCc/
 96YMHleSauIWhmik1VoKqzbcf1oudjlfRctCSAnfuGtzWvwRl39Cam0my
 +QA8cfQKOc5ALvzjsR3aSM/u2j1qHBkv15yeI3Amr4FFrrFeTBUuM8nlZ
 liejZmBA8cktmgDGqt62hofisKJ5oTwNE7x10dsfOuNjCFq2ONZBW7R4L
 guDpI5Z5kdmWwKyIp92UkYkIjWdmb5ibAysj+s+Xf+X8xGkp1O5J8rB5R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="327491987"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="327491987"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 09:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="696705263"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="696705263"
Received: from spmccann-mobl.ger.corp.intel.com (HELO [10.252.16.175])
 ([10.252.16.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 09:47:27 -0700
Message-ID: <1f799822-5b40-15f7-d787-fb5eace041eb@intel.com>
Date: Wed, 26 Apr 2023 17:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230426164410.48171-1-jose.souza@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230426164410.48171-1-jose.souza@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Limit system memory size of half of
 system memory
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

On 26/04/2023 17:44, José Roberto de Souza wrote:
> ttm_global_init() imposes this limitation.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> index 5b0674bbb8ed0..3e1fa0c832cab 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -105,7 +105,10 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>   	u64 gtt_size;
>   
>   	si_meminfo(&si);
> -	gtt_size = (u64)si.totalram * si.mem_unit * 3/4;
> +	gtt_size = (u64)si.totalram * si.mem_unit;
> +	/* TTM limits allocation of all TTM devices by 50% of system memory */
> +	gtt_size /= 2;

Beat me to it. That indeed makes more sense,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
>   	man->use_tt = true;
>   	man->func = &xe_ttm_sys_mgr_func;
>   	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
