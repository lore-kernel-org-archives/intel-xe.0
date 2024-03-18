Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB63BC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 09:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D6410F519;
	Mon, 18 Mar 2024 09:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTkp0rHh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63DF10F519
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710755129; x=1742291129;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mTGbovgNCFcuUtJu70m8+ksONe3s5yB4RPzJYCq4W2A=;
 b=hTkp0rHh9JNrxhyeAUgIrqVNJCwU0uF8mRZJTYPmgvftmULqZY6zTJvf
 CLzpumDChLI0DBMcy8Ml7h4nOumRGHFvJRb1pGUBiK+zuG5+jLmov9jaQ
 LJzp3HkHjhaqbMEKuBTeGc0dQKxdawL5Qbq2n4oeoCf/9V1IEeOOGRwYc
 zakoLESvgf6+rSI6DesnNwetqiGUpvwoZmduGdW5oYgwUxyp/sN6ixdo7
 9TfEpfuCMQLCo4c5yKxz3PFE9dNWQyMx1L9iYF7e+CdehZFInNF6H12LL
 Qat5aj7pCBpC+L1E6vUt/oLpCc4hlxChIaCzTbnNkpbFLkL8m7I29Lbgm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16278908"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16278908"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18127974"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.15])
 ([10.246.36.15])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 02:45:28 -0700
Message-ID: <242c0bac-bc43-4c16-be1b-0241f07cbfa8@linux.intel.com>
Date: Mon, 18 Mar 2024 10:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/client: drop bogus bo NULL check
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
References: <20240318093431.21075-3-matthew.auld@intel.com>
 <20240318093431.21075-4-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240318093431.21075-4-matthew.auld@intel.com>
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
> If we fished it out the list then it can't be null; the list entry is
> embedded in the bo.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_client.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 59b01d838229..08f0b7c95901 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -155,7 +155,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>   	/* Internal objects. */
>   	spin_lock(&client->bos_lock);
>   	list_for_each_entry(bo, &client->bos_list, client_link) {
> -		if (!bo || !kref_get_unless_zero(&bo->ttm.base.refcount))
> +		if (!kref_get_unless_zero(&bo->ttm.base.refcount))
>   			continue;
>   		bo_meminfo(bo, stats);
>   		xe_bo_put(bo);
