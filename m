Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8E5C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 12:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A052C10E1CD;
	Fri, 26 May 2023 12:40:11 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2265410E1CD
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 12:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685104809; x=1716640809;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=80HcS5nj/LT2YU9dP7t9Qqjjo/owFVY/qGPod1TOS2o=;
 b=ZBLnl5MG9qXw7FBgfJrtBlmNOXMArYsoyOI8wx0Te1P2FS7ZzG8RqU6n
 GCG3lxyeyuyl3ug49resepP0f5k8oBSvuI82nnPjGZrjXu/fLvLxu1LqE
 qoe3dSm0e1sFcfGsu41DLnOu1bLbj3upvst2ir4ibj9hZk3pjKVhLWC/z
 aFfTJpWoT1SHdxUzQYHrxWermM8hxi2HrBwhdrnqmxG1j2y+XCBPXqkMK
 WuOBFoBn2Z/iQMy0rxmZK2JVY9Vab/wjBLsSzH3qh1Nf3bu0P+IwPrlou
 32ivU9rrswabmsx68IWG2DAElV+pA2WoY46e7rrTMb06C/E2y6CLaQXMp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="334543823"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="334543823"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 05:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682705038"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="682705038"
Received: from binis42x-mobl.gar.corp.intel.com (HELO [10.249.254.65])
 ([10.249.254.65])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 05:40:07 -0700
Message-ID: <5caeb2d5-bd11-fe76-25f9-71a5ecbff9db@linux.intel.com>
Date: Fri, 26 May 2023 14:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
 <20230526121101.1619278-6-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230526121101.1619278-6-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 5/5] drm/xe: Return the correct error when
 dma_resv_wait_timeout fails
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


On 5/26/23 14:11, Maarten Lankhorst wrote:
> We call dma_resv_wait_timeout with MAX_SCHEDULE_TIMEOUT, so it can
> never return -ETIME. It will however fail if interrupted, so in that
> case return the error.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/239

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_bo.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8735facb1cf9..77ba8492bd90 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -611,8 +611,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   						     DMA_RESV_USAGE_BOOKKEEP,
>   						     true,
>   						     MAX_SCHEDULE_TIMEOUT);
> -		if (timeout <= 0) {
> -			ret = -ETIME;
> +		if (timeout < 0) {
> +			ret = timeout;
>   			goto out;
>   		}
>   		ttm_bo_move_null(ttm_bo, new_mem);
