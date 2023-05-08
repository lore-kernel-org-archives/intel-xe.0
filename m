Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1F3C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 12:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2930710E27E;
	Mon,  8 May 2023 12:41:50 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E877410E27E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 12:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683549708; x=1715085708;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=zF95qgWr+nXT/1dPRNCCTsmTI/vNQKmf+pGbD8oUIjQ=;
 b=XCB47nls5QFyylYVBQZ9UxlteFiRmrgZJP3/sqHdiK2IQRB5SAySisO2
 Nzfwz27G0D/lpOA9979PpzsVSOIAomuOQW2OciDKjY48w81Koy81wjG/F
 6hiGyIRXWtFUVtiXCbsDpmrGUL4k+7WwHKHeLjEmIImSSQZD3nnXxi6vf
 BdEk8wozJVQRtkvvhIzSuzkny5hJVYzW2L+61P6S2q7dGHVNDxQ7QXOXG
 VcfaxP8omnamJxYBt7uHw1nU2utvfeTvt56EwrRnnjqzs76Zrj9ww1rWD
 K1wpu/W4HI/9Hnpcs74b1DyuvZhtD2jttcMfAlXNH/a/iwdBS8Dg7rxd+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="347097757"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="347097757"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 05:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="698514393"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="698514393"
Received: from igorhaza-mobl1.ger.corp.intel.com (HELO [10.249.254.232])
 ([10.249.254.232])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 05:41:47 -0700
Message-ID: <5288da6d-97cd-f765-3e4f-aa9211b2eed8@linux.intel.com>
Date: Mon, 8 May 2023 14:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-5-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 04/31] drm/xe: Use
 DRM_SCHED_POLICY_SINGLE_ENTITY mode
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


On 5/2/23 02:17, Matthew Brost wrote:
> We create 1 GPU scheduler per entity in Xe, use
> DRM_SCHED_POLICY_SINGLE_ENTITY scheduling which is designed for that
> paradigm.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_execlist.c   | 3 ++-
>   drivers/gpu/drm/xe/xe_guc_submit.c | 3 +--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 48060d14547a..79fb951c2965 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -339,7 +339,8 @@ static int execlist_engine_init(struct xe_engine *e)
>   	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
>   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>   			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
> -			     NULL, NULL, e->hwe->name, DRM_SCHED_POLICY_DEFAULT,
> +			     NULL, NULL, e->hwe->name,
> +			     DRM_SCHED_POLICY_SINGLE_ENTITY,
>   			     gt_to_xe(e->gt)->drm.dev);
>   	if (err)
>   		goto err_free;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9d3fadca43be..68d09e7a4cc0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1084,7 +1084,7 @@ static int guc_engine_init(struct xe_engine *e)
>   	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
>   			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>   			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> -			     e->name, DRM_SCHED_POLICY_DEFAULT,
> +			     e->name, DRM_SCHED_POLICY_SINGLE_ENTITY,
>   			     gt_to_xe(e->gt)->drm.dev);
>   	if (err)
>   		goto err_free;
> @@ -1185,7 +1185,6 @@ static int guc_engine_set_priority(struct xe_engine *e,
>   	if (!msg)
>   		return -ENOMEM;
>   
> -	drm_sched_entity_set_priority(e->entity, priority);
>   	guc_engine_add_msg(e, msg, SET_SCHED_PROPS);
>   
>   	return 0;

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


