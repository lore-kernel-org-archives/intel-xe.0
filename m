Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474FCC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 09:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F2C10F518;
	Mon, 18 Mar 2024 09:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9eMZdpa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CC910F518
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710755121; x=1742291121;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KCRTlX4ETpu+wEo09CkgQsb8f4n23fka5FwZBkvnZ6Y=;
 b=J9eMZdpaXZhFhDA/lLPdeRfL5tmB+R8nqtc+hJ8ywC6Vljii4OcfSst7
 6ja8oWe8fpkleI024EtxjdBSYxKKOa70rpT+HvA0bQ2flf43XGeFCBtl0
 +6zpCryN0CBf93EQ4jDkoaedDxxUbFUdQL5IgE17J8IQ8AwQeBNGBbmFu
 gmBex9qsvTtOjjvsiONN/Bnt24oUzKAxALkJAytH69fixblO5OAVpWFvU
 oy0eTkvSLHLg1un9ffhJ7aYJsO4SNxJd/1QyxQxtYi/Te4oXQamDwMEz9
 xKEhPVmlpxZkUvaakv9nJwhgNtJUDIoYUn1uV+ux9LCPk6+v+WAs9buB7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16278890"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16278890"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18127915"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.15])
 ([10.246.36.15])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:45:19 -0700
Message-ID: <5d49735b-e576-45e6-99e3-c60456b1e9d0@linux.intel.com>
Date: Mon, 18 Mar 2024 10:45:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/client: remove bogus rcu list usage
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
References: <20240318093431.21075-3-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240318093431.21075-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 3/18/2024 10:34 AM, Matthew Auld wrote:
> We use plain spinlock to protect readers and writers, so there is no
> actual RCU here. Rather use the more appropriate non-rcu list based API.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_client.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 87c10bd7958b..59b01d838229 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -78,7 +78,7 @@ void xe_drm_client_add_bo(struct xe_drm_client *client,
>   
>   	spin_lock(&client->bos_lock);
>   	bo->client = xe_drm_client_get(client);
> -	list_add_tail_rcu(&bo->client_link, &client->bos_list);
> +	list_add_tail(&bo->client_link, &client->bos_list);
>   	spin_unlock(&client->bos_lock);
>   }
>   
> @@ -96,7 +96,7 @@ void xe_drm_client_remove_bo(struct xe_bo *bo)
>   	struct xe_drm_client *client = bo->client;
>   
>   	spin_lock(&client->bos_lock);
> -	list_del_rcu(&bo->client_link);
> +	list_del(&bo->client_link);
>   	spin_unlock(&client->bos_lock);
>   
>   	xe_drm_client_put(client);
> @@ -154,7 +154,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>   
>   	/* Internal objects. */
>   	spin_lock(&client->bos_lock);
> -	list_for_each_entry_rcu(bo, &client->bos_list, client_link) {
> +	list_for_each_entry(bo, &client->bos_list, client_link) {
>   		if (!bo || !kref_get_unless_zero(&bo->ttm.base.refcount))
>   			continue;
>   		bo_meminfo(bo, stats);
