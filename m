Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5422CC5320E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 08:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F9310E280;
	Tue, 27 Aug 2024 08:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Scvi4qQR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC8310E280
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 08:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724747328; x=1756283328;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=QXnwPpIBlUwnEs3rsroC6dqLXjKcjsmdNJQqFBwWs18=;
 b=Scvi4qQRAFIhTndb1H9V+a/14+UfbCiQG1TGQN/MB9a2iJHA7tuBGv0L
 0hvMoYvT+2/Um7LDZwp+1TIS6q9/3ck7EA4GtBl/TGcRMM9BsG5Y3eghy
 /AfB0byTYGdF87MmwHYm4Rnk3D7eZ5FlmDSYikXNTNGFE5KhsuuWmnnw8
 GRGkFZemBGSdz4xOtVeAGEmF9RBY51bB8c8EwFtEa0+fBbUPRP0I8PK99
 UcYTNN2va9feUlrENca8qG3PxqjO0ijDLN0F2UZ3gUMeeZKnigVNuyC49
 eJTazgNZJzJxQSdCopMNqZkzx2tR1KTw9Mq9RTD87efQZA9qgNbuSatce A==;
X-CSE-ConnectionGUID: 1WMfLEkSQjW8RUN+XNnvkA==
X-CSE-MsgGUID: I3OYoDZpQdqZqH0ScqQziQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33774506"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="33774506"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:28:48 -0700
X-CSE-ConnectionGUID: vjfMM7OlR7+iovs+D2WeeA==
X-CSE-MsgGUID: qedI6bNeS3iQ71n9FJaVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62774320"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.32])
 ([10.245.192.32])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:28:46 -0700
Message-ID: <f2a2e0d3-6756-4bf3-a4eb-4c063b01476c@linux.intel.com>
Date: Tue, 27 Aug 2024 10:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Remove unrequired NULL checks in
 xe_sync_entry_cleanup
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
 <20240820090230.3258128-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240820090230.3258128-2-himal.prasad.ghimiray@intel.com>
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


On 8/20/2024 11:02 AM, Himal Prasad Ghimiray wrote:
> dma_fence_put() and dma_fence_chain_free() can handle NULL input,
> there is no need for NULL check by caller.
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sync.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index a0675f57a398..436faff09bac 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -249,10 +249,8 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
>   {
>   	if (sync->syncobj)
>   		drm_syncobj_put(sync->syncobj);
> -	if (sync->fence)
> -		dma_fence_put(sync->fence);
> -	if (sync->chain_fence)
> -		dma_fence_chain_free(sync->chain_fence);
> +	dma_fence_put(sync->fence);
> +	dma_fence_chain_free(sync->chain_fence);
>   	if (sync->ufence)
>   		user_fence_put(sync->ufence);
>   }
